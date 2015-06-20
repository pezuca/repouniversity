package com.repouniversity.model.services;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.repouniversity.model.dao.ArchivoDAO;
import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.ArchivoTO;

@Service
public class ArchivoService {
    
//  @Value("${system.fileUpload.location}")
  private String UPLOAD_PATH = "/home/federico/Documents/repouniversity/archivos";

    @Autowired
    private ArchivoDAO archivoDao;

    public List<Archivo> subirArchivo(List<Archivo> listaArchivos) {
        for (Archivo archivo : listaArchivos) {
            archivoDao.insert(archivo);
        }
        
        return listaArchivos;
    }

    public ArchivoTO getArchivoById(Long archivoId) {
        Archivo archivo = archivoDao.findById(archivoId);

        ArchivoTO archivoTo = buildArchivo(archivo);

        return archivoTo;
    }

    private ArchivoTO buildArchivo(Archivo archivo) {
        ArchivoTO archivoTo = new ArchivoTO();

        archivoTo.setId(archivo.getId());
        archivoTo.setNombre(archivo.getNombre());
        archivoTo.setDescripcion(archivo.getDescripcion());
        archivoTo.setFechaDespublicacion(archivo.getFechaDespublicacion());
        archivoTo.setFechaPublicacion(archivo.getFechaPublicacion());
        archivoTo.setArchivoTipo(archivo.getArchivoTipo());
        archivoTo.setActivo(archivo.isActivo());
        archivoTo.setFechasys(archivo.getFechasys());

        archivoTo.setEstado(archivo.getEstado());
        archivoTo.setPath(archivo.getPath());
        archivoTo.setCurso(archivo.getCurso());
        archivoTo.setPersona(archivo.getPersona());
        archivoTo.setTags(archivo.getTags());
        // archivoTo.setGrupo(archivo.getGrupo());

        return archivoTo;
    }

    public List<Archivo> getAll() {
        return archivoDao.findAll();
    }

    public List<Archivo> parseArchivo(CommonsMultipartFile[] file, String[] tags, String descripcion, Long cursoId, Long grupoId, UsuarioRol usuario) throws IOException {
        StringBuffer etiqueta = new StringBuffer();

        // AGREGO LAS ETIQUETAS AL CAMPO ETIQUETAS PARA LUEGO SUBIR A LA BASE
        // ASOCIADAS AL ARCHIVO

        if (tags != null) {
            for (int i = 0; i < tags.length; i++) {
                if(StringUtils.isNoneBlank(tags[i])) {
                    etiqueta.append(tags[i] + ";");
                }
            }
        }

        List<Archivo> listaArchivos = new ArrayList<Archivo>();
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

                listaArchivos.add(nuevoArchivo);
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
        
        return listaArchivos;
    }
}
