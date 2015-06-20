package com.repouniversity.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.services.ArchivoService;
import com.repouniversity.model.services.PersonaService;
import com.repouniversity.web.exceptions.SubirArchivoException;

@Controller
@SessionAttributes("login")
public class ArchivoController {

    @Autowired
    private ArchivoService archivoService;

    @Autowired
    private PersonaService personaService;

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
            @RequestParam(value = "grupoId", required = false, defaultValue = "1") Long grupoId, @ModelAttribute("login") UsuarioRol usuario) {

        try {
            
            List<Archivo> nuevoArchivo = archivoService.parseArchivo(file, tags, descripcion, cursoId, grupoId, usuario);
            
            return archivoService.subirArchivo(nuevoArchivo);
        } catch (Exception e) {
            throw new SubirArchivoException("Ha ocurrido un error al intentar subir el archivo.", e);
        }
    }

    // @RequestMapping(value = "/buscarArchivo", method = { RequestMethod.POST })
    // @ResponseBody
    // @ResponseStatus(value = HttpStatus.OK)
    // public ModelAndView buscarFichero(
    // HttpServletRequest request,
    // @RequestParam(value = "parametroDeBusqueda") String parametro) {
    // buscarFicheroLocal(parametro);
    //
    // }

    private ArrayList buscarFicheroLocal(String archivo) {
        ArrayList archivosEncontrados;
        archivosEncontrados = new ArrayList();
        return archivosEncontrados;

    }
}
