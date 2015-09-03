package com.repouniversity.model.services;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.repouniversity.model.dao.ArchivoDAO;
import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.VwArchivo;
import com.repouniversity.model.entity.to.ArchivoTO;
import com.repouniversity.web.enums.MappingArchivoTipoEnum;

@Service
public class ArchivoService {

    @Autowired
    public String systemFileUploadLocation;

    @Autowired
    public String systemFilePreviewTomcatLocation;

    @Autowired
    public String systemFilePreviewLocation;

    public static final String SEPARATOR = "-aa-";

    @Autowired
    private ArchivoDAO archivoDao;

    @Autowired
    private ArchivoTipoService archivoTipoService;

    public List<Archivo> subirArchivo(List<Archivo> listaArchivos) {
        for (Archivo archivo : listaArchivos) {
            archivoDao.insert(archivo);
        }

        return listaArchivos;
    }

    public List<VwArchivo> getArchivosDePersona(long idPersona) {

        return archivoDao.findArchivosDePersona(idPersona);

    }

    public List<VwArchivo> getArchivosDelCurso(long idCurso) {

        return archivoDao.findArchivosDelCurso(idCurso);

    }

    public ArchivoTO getArchivoById(Long archivoId) {
        Archivo archivo = archivoDao.findById(archivoId);

        ArchivoTO archivoTo = buildArchivo(archivo);

        return archivoTo;
    }

    public List<ArchivoTO> buildArchivos(List<Archivo> archivos) {
        List<ArchivoTO> listaArchivos = new ArrayList<ArchivoTO>();

        for (Archivo archivo : archivos) {
            listaArchivos.add(buildArchivo(archivo));
        }

        return listaArchivos;
    }

    public void delete(Long archivoId) {
        archivoDao.delete(archivoDao.findById(archivoId));
    }

    public ArchivoTO buildArchivo(Archivo archivo) {
        ArchivoTO archivoTo = new ArchivoTO();

        archivoTo.setId(archivo.getId());
        archivoTo.setNombre(archivo.getNombre());
        archivoTo.setDescripcion(archivo.getDescripcion());
        archivoTo.setFechaDespublicacion(archivo.getFechaDespublicacion());
        archivoTo.setFechaPublicacion(archivo.getFechaPublicacion());
        archivoTo.setArchivoTipo(archivoTipoService.findById(archivo.getArchivoTipo()));
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

    public List<ArchivoTO> getAll() {
        List<Archivo> archivoList = archivoDao.findAll();
        List<ArchivoTO> archivoToList = new ArrayList<ArchivoTO>();

        for (Archivo archivo : archivoList) {
            archivoToList.add(buildArchivo(archivo));
        }

        return archivoToList;
    }

    public List<Archivo> parseArchivo(CommonsMultipartFile[] file, String[] tags, String descripcion, Long cursoId, Long grupoId, Boolean estado,
            UsuarioRol usuario) throws IOException {
        StringBuffer etiqueta = new StringBuffer();

        // AGREGO LAS ETIQUETAS AL CAMPO ETIQUETAS PARA LUEGO SUBIR A LA BASE
        // ASOCIADAS AL ARCHIVO

        if (tags != null) {
            for (int i = 0; i < tags.length; i++) {
                if (StringUtils.isNoneBlank(tags[i])) {
                    etiqueta.append(tags[i] + ";");
                }
            }
        }

        List<Archivo> listaArchivos = new ArrayList<Archivo>();
        // AGREGO LOS ARCHIVOS Y LOS SUBO A LA CARPETA DEL SERVER.
        for (int i = 0; i < file.length; i++) {
            String fileName = (new Date()).getTime() + SEPARATOR + file[i].getOriginalFilename();

            File localFile = new File(systemFileUploadLocation + fileName);
            FileOutputStream os = null;

            // GUARDO LOS ARCHIVOS EN LA CARPETA
            os = new FileOutputStream(localFile);
            os.write(file[i].getBytes());

            File previewTomcatFile = new File(systemFilePreviewTomcatLocation + fileName);
            FileOutputStream previewTomcatOs = null;

            // GUARDO LOS ARCHIVOS EN LA CARPETA DE PREVIEW
            previewTomcatOs = new FileOutputStream(previewTomcatFile);
            previewTomcatOs.write(file[i].getBytes());

            File previewFile = new File(systemFilePreviewLocation + fileName);
            FileOutputStream previewOs = null;

            // GUARDO LOS ARCHIVOS EN LA CARPETA DE PREVIEW
            previewOs = new FileOutputStream(previewFile);
            previewOs.write(file[i].getBytes());

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
                
                if(estado) {
                    nuevoArchivo.setEstado(1L);
                } else {
                    nuevoArchivo.setEstado(2L);
                }
                
                nuevoArchivo.setPath(localFile.getName());
                nuevoArchivo.setPersona(usuario.getIdPersona());
                nuevoArchivo.setTags(etiqueta.toString());
                nuevoArchivo.setCurso(cursoId);
                nuevoArchivo.setArchivoTipo(MappingArchivoTipoEnum.getByExtension(fileName.split("\\.")[1]).getTipoId());
                nuevoArchivo.setBinario(new FileInputStream(localFile));

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

    public Archivo bajarArchivo(Long archivoId, HttpServletResponse response, HttpServletRequest request) throws IOException {
        Archivo archivo = archivoDao.findById(archivoId);

        File downloadFile = new File(systemFileUploadLocation + archivo.getPath());
        FileInputStream inputStream = new FileInputStream(downloadFile);
//        InputStream inputStream = archivo.getBinario();

        ServletContext context = request.getServletContext();
        String mimeType = context.getMimeType(systemFileUploadLocation + archivo.getPath());
        if (mimeType == null) {
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }
        response.setContentType(mimeType);
        response.setContentLength((int) downloadFile.length());

        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
        response.setHeader(headerKey, headerValue);

        OutputStream outStream = response.getOutputStream();

        byte[] buffer = new byte[4096];
        int bytesRead = -1;

        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }

        inputStream.close();
        outStream.close();

        return archivo;
    }

    public VwArchivo getVwArchivo(Long archivoId) {
        return archivoDao.findVwArchivo(archivoId);
    }

    public List<Archivo> requestArchivos(String parametro, UsuarioRol usuario) {
        return archivoDao.requestArchivos(parametro, usuario);

    }

    public List<Archivo> busquedaAvanzada(String materia, String docente, String descripcion, Date fechaDde,
            Date fechaHta, UsuarioRol usuario) {
        return archivoDao.busquedaAvanzada(materia, docente, descripcion, fechaDde, fechaHta, usuario);
    }

    public VwArchivo modificarArchivo(Long archivoId, String tagsArchivo, String desArchivo, Long estadoArchivo) {

        Archivo archi = archivoDao.findById(archivoId);
        archi.setTags(tagsArchivo);
        archi.setDescripcion(desArchivo);
        archi.setEstado(estadoArchivo);
        archivoDao.update(archi);

        return archivoDao.findVwArchivo(archivoId);
    }
}
