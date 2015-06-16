package com.repouniversity.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

    @Value("${system.fileUpload.location}")
    private String UPLOAD_PATH;

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
    public Archivo guardaFichero(HttpServletRequest request, @RequestParam(value = "file") CommonsMultipartFile[] file,
            @RequestParam(value = "tags", required = false) String[] tags, @RequestParam(value = "descripcion", required = false) String descripcion,
            @RequestParam(value = "cursoId", required = true) Long cursoId,
            @RequestParam(value = "grupoId", required = false, defaultValue = "1") Long grupoId, @ModelAttribute("login") UsuarioRol usuario) {

        try {
            return grabarFicheroALocal(file, tags, descripcion, cursoId, grupoId, usuario);
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

    private Archivo grabarFicheroALocal(CommonsMultipartFile[] file, String[] tags, String descripcion, Long cursoId, Long grupoId, UsuarioRol usuario)
            throws IOException {
        StringBuffer etiqueta = new StringBuffer();
        Archivo archivoUpdated = null;

        // AGREGO LAS ETIQUETAS AL CAMPO ETIQUETAS PARA LUEGO SUBIR A LA BASE
        // ASOCIADAS AL ARCHIVO

        if (tags != null) {
            for (int i = 0; i < tags.length; i++) {
                if(StringUtils.isNoneBlank(tags[i])) {
                    etiqueta.append(tags[i] + ";");
                }
            }
        }

        // AGREGO LOS ARCHIVOS Y LOS SUBO A LA CARPETA DEL SERVER.
        for (int i = 0; i < file.length; i++) {
            File localFile = new File(UPLOAD_PATH + (new Date()).getTime() + file[i].getOriginalFilename());
            FileOutputStream os = null;
            // GUARDO LOS ARCHIVOS EN LA CARPETA
            os = new FileOutputStream(localFile);
            os.write(file[i].getBytes());
            try {

                // AGEGO LAS ETIQUETAS AL ARCHIVO Y GUARDO EN LA BASE EL NOMBRE
                // DEL ARCHIVO
                Archivo nuevoArchivo = new Archivo();
                nuevoArchivo.setNombre(file[i].getOriginalFilename());
                nuevoArchivo.setDescripcion(descripcion);
                nuevoArchivo.setFechaDespublicacion(null);
                nuevoArchivo.setFechaPublicacion(null);
                nuevoArchivo.setId(null);
                nuevoArchivo.setFechasys(null);
                nuevoArchivo.setEstado(null);
                nuevoArchivo.setPath(localFile.getAbsolutePath());
                nuevoArchivo.setPersona(usuario.getIdPersona());
                nuevoArchivo.setTags(etiqueta.toString());
                nuevoArchivo.setCurso(cursoId);
                nuevoArchivo.getCurso();

                archivoUpdated = archivoService.subirArchivo(nuevoArchivo);

                // if(grupoId != Integer.parseInt("1")){
                // tpGrupoService.agregarArchivoTp(grupoId, archivoUpdated.getId);
                // }
            } finally {
                if (os != null) {
                    try {
                        os.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        
        return archivoUpdated;

    }

}
