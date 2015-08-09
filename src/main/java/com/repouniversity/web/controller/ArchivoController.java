package com.repouniversity.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.Materia;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.VwArchivo;
import com.repouniversity.model.entity.to.DocenteTO;
import com.repouniversity.model.entity.to.ErrorArchivoTO;
import com.repouniversity.model.services.ArchivoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.ErrorArchivoService;
import com.repouniversity.model.services.MateriaService;
import com.repouniversity.model.services.PersonaService;
import com.repouniversity.web.exceptions.SubirArchivoException;

@Controller
@SessionAttributes("login")
public class ArchivoController {

    @Autowired
    private ArchivoService archivoService;
    @Autowired
    private DocenteService docenteService;
    @Autowired
    private MateriaService materiaService;
    
    @Autowired
    private ErrorArchivoService errorArchivoService;

    @Autowired
    private PersonaService personaService;

    private SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

    /**
     * @param request
     * @return Model and View for loginAnonimo
     */
    @RequestMapping(value = "/subirArchivo", method = {RequestMethod.GET})
    public ModelAndView subirArchivo(HttpServletRequest request, @RequestParam(value = "cursoID", required = true, defaultValue = "1") String cursoId,
            @RequestParam(value = "personaID", required = true, defaultValue = "1") String personaId,
            @RequestParam(value = "grupoID", required = false, defaultValue = "1") String grupoId) {
        return new ModelAndView("subirArchivo").addObject(cursoId, cursoId).addObject(personaId, personaId).addObject(grupoId, grupoId);
    }

    @RequestMapping(value = "/subirArchivo", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public List<Archivo> guardaFichero(HttpServletRequest request, @RequestParam(value = "file") CommonsMultipartFile[] file,
            @RequestParam(value = "tags", required = false) String[] tags, @RequestParam(value = "descripcion", required = false) String descripcion,
            @RequestParam(value = "cursoId", required = true) Long cursoId,
            @RequestParam(value = "grupoId", required = false, defaultValue = "1") Long grupoId,
            @RequestParam(value = "estado", required = false) Boolean estado, @ModelAttribute("login") UsuarioRol usuario) {

        try {

            List<Archivo> nuevoArchivo = archivoService.parseArchivo(file, tags, descripcion, cursoId, grupoId, estado, usuario);

            return archivoService.subirArchivo(nuevoArchivo);
        } catch (Exception e) {
            throw new SubirArchivoException("Ha ocurrido un error al intentar subir el archivo.", e);
        }
    }

    @RequestMapping(value = "/bajarArchivo", method = {RequestMethod.POST, RequestMethod.GET})
    public void bajarAchivo(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "archivoId") Long archivoId,
            @ModelAttribute("login") UsuarioRol usuario) {
        try {

            archivoService.bajarArchivo(archivoId, response, request);

        } catch (Exception e) {
            throw new SubirArchivoException("Ha ocurrido un error al intentar subir el archivo.", e);
        }
    }

    @RequestMapping(value = "/verArchivos", method = {RequestMethod.GET})
    public ModelAndView verArchivos(@ModelAttribute("login") UsuarioRol usuario) {
        List<VwArchivo> archivos = archivoService.getArchivosDePersona(usuario.getIdPersona());
        return new ModelAndView("verArchivos").addObject("archivos", archivos);
    }
    
    @RequestMapping(value = "/buscarArchivoAnonimo", method = {RequestMethod.POST})
    public ModelAndView buscarFicheroAnonimo(HttpServletRequest request, @RequestParam(value = "search") String parametro, @ModelAttribute("login") UsuarioRol usuario) {
        List<Archivo> listaResultados = new ArrayList<Archivo>();
        listaResultados = buscarFicheroLocal(parametro, usuario);
        return new ModelAndView("resultListAnonimo").addObject("listaResultados", listaResultados).addObject("parametroBusqueda", parametro);
    }

    @RequestMapping(value = "/buscarArchivo", method = {RequestMethod.POST})
    public ModelAndView buscarFichero(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario,
    	@RequestParam(value = "top-search") String parametro) {
        List<Archivo> listaResultados = new ArrayList<Archivo>();
        listaResultados = buscarFicheroLocal(parametro, usuario);
        return new ModelAndView("resultList").addObject("listaResultados", listaResultados).addObject("parametroBusqueda", parametro);
    }

    @RequestMapping(value = "/busquedaAvanzada", method = {RequestMethod.POST})
    public ModelAndView busquedaAvanzada(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario,
    		@RequestParam(value = "materia", required = false) String materia,
            @RequestParam(value = "docente", required = false) String docente,
            @RequestParam(value = "descripcion", required = false) String descripcion,
            @RequestParam(value = "fechaDde", required = false) String fechaDde,
            @RequestParam(value = "fechaHta", required = false) String fechaHta)
            throws ParseException
    		{
        
    	Date desde = dateFormat.parse("01/01/1900");
    	Date hasta = dateFormat.parse("31/12/9999");
    	if (!fechaDde.equals("")){
    		desde = dateFormat.parse(fechaDde);
    	}
    	if (!fechaHta.equals("")){
    		hasta = dateFormat.parse(fechaHta);
    	}
         


        List<Archivo> listaResultados = new ArrayList<Archivo>();
        listaResultados = busquedaAvanzada(materia, docente, descripcion, desde, hasta, usuario);
        return new ModelAndView("resultList").addObject("listaResultados", listaResultados);
    }

    @RequestMapping(value = "/busquedaAvanzada", method = {RequestMethod.GET})
    public ModelAndView busquedaAvanzada() {
        return new ModelAndView("busquedaAvanzada");
    }

    @RequestMapping(value = "/busquedaAvanzadaAnonimo", method = {RequestMethod.POST})
    public ModelAndView busquedaAvanzadaAnonimo(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario,
    		@RequestParam(value = "materia", required = false) String materia,
            @RequestParam(value = "docente", required = false) String docente,
            @RequestParam(value = "descripcion", required = false) String descripcion,
            @RequestParam(value = "fechaDde", required = false) String fechaDde,
            @RequestParam(value = "fechaHta", required = false) String fechaHta)
            throws ParseException
    		{
        
    	Date desde = dateFormat.parse("01/01/1900");
    	Date hasta = dateFormat.parse("31/12/9999");
    	if (!fechaDde.equals("")){
    		desde = dateFormat.parse(fechaDde);
    	}
    	if (!fechaHta.equals("")){
    		hasta = dateFormat.parse(fechaHta);
    	}
         


        List<Archivo> listaResultados = new ArrayList<Archivo>();
        listaResultados = busquedaAvanzada(materia, docente, "a", descripcion, desde, hasta, usuario);
        return new ModelAndView("resultListBusquedaAnonimo").addObject("listaResultados", listaResultados);
    }
    
    @RequestMapping(value = "/busquedaAvanzadaAnononimo", method = {RequestMethod.GET})
    public ModelAndView busquedaAvanzadaAnonimo() {
        List<DocenteTO> docentes = docenteService.getAll();
        List<Materia> materias = materiaService.getAll();
        
        return new ModelAndView("busquedaAvanzadaAnonimo").addObject("docentes", docentes).addObject("materias", materias);
    }

    private List<Archivo> buscarFicheroLocal(String parametro, UsuarioRol usuario) {
        List<Archivo> archivosEncontrados = new ArrayList<Archivo>();
        archivosEncontrados = archivoService.requestArchivos(parametro, usuario);
        return archivosEncontrados;

    }


    private List<Archivo> busquedaAvanzada(String materia, String nbreDocente, String apeDocente, String descripcion, Date fechaDde, Date fechaHta, UsuarioRol usuario) {
        List<Archivo> archivosEncontrados = new ArrayList<Archivo>();
        archivosEncontrados = archivoService.busquedaAvanzada(materia, nbreDocente, apeDocente, descripcion, fechaDde, fechaHta, usuario);
        return archivosEncontrados;

    }

    @RequestMapping(value = "/vistaPrevia", method = {RequestMethod.GET})
    public ModelAndView vistaPrevia(@RequestParam(value = "archivoId") Long archivoId) {
        VwArchivo archivo = archivoService.getVwArchivo(archivoId);
        List<ErrorArchivoTO> errorArchivo = errorArchivoService.getErroresForArchivo(archivoId);

        return new ModelAndView("vistaPrevia").addObject("archivo", archivo).addObject("errorArchivo", errorArchivo);
    }

    @RequestMapping(value = "/vistaPreviaAnonimo", method = {RequestMethod.GET})
    public ModelAndView vistaPreviaAnonimo(@RequestParam(value = "archivoId") Long archivoId) {
        VwArchivo archivo = archivoService.getVwArchivo(archivoId);
      
        return new ModelAndView("vistaPreviaAnonimo").addObject("archivo", archivo);
    }
    
    @RequestMapping(value = "/modificarArchivo", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public VwArchivo modificarArchivo(HttpServletRequest request, @RequestParam(value = "archivoId", required = true) Long archivoId,
            @RequestParam(value = "tags", required = true) String tagsArchivo, @RequestParam(value = "descripcion", required = true) String desArchivo,
            @RequestParam(value = "estadoArchivo", required = true) Long estadoArchivo) {

        return archivoService.modificarArchivo(archivoId, tagsArchivo, desArchivo, estadoArchivo);
    }

    @RequestMapping(value = "/eliminarArchivo", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public void eliminarArchivo(HttpServletRequest request, @RequestParam(value = "archivoId", required = true) Long archivoId) {

        archivoService.delete(archivoId);
    }
}
