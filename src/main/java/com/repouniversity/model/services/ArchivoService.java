package com.repouniversity.model.services;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
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

    public Archivo update(Long archivoId, String descripcion, String tags) {
        Archivo archivo = archivoDao.findById(archivoId);

        archivo.setDescripcion(descripcion);
        archivo.setTags(tags);

        archivoDao.update(archivo);

        return archivo;
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

    public List<Archivo> parseArchivo(CommonsMultipartFile[] file, String[] tags, String descripcion, Long cursoId, Long grupoId, UsuarioRol usuario)
            throws IOException {
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
                nuevoArchivo.setEstado(null);
                nuevoArchivo.setPath(localFile.getName());
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

    public Archivo bajarArchivo(Long archivoId, HttpServletResponse response) throws IOException {
        Archivo archivo = archivoDao.findById(archivoId);

        File file = new File(systemFileUploadLocation + archivo.getPath());
        FileInputStream fileIn = new FileInputStream(file);
        ServletOutputStream out = response.getOutputStream();

        byte[] outputByte = new byte[4096];
        // copy binary contect to output stream
        while (fileIn.read(outputByte, 0, 4096) != -1) {
            out.write(outputByte, 0, 4096);
        }

        fileIn.close();
        out.flush();
        out.close();

        response.setContentType("application/download");
        response.setContentLength((int) file.length());
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + archivo.getPath().split(SEPARATOR)[1] + "\"");

        // response.setHeader("Content-Type", "application/octet-stream");
        // response.setHeader("Content-Description", "File Transfer");
        // response.setHeader("Expires", "0");
        // response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
        // response.setHeader("Pragma", "public");

        return archivo;
    }

    public VwArchivo getVwArchivo(Long archivoId) {
        return archivoDao.findVwArchivo(archivoId);
    }

    public List<Archivo> requestArchivos(String parametro) {
        return archivoDao.requestArchivos(parametro);

    }

    public List<Archivo> busquedaAvanzada(String materia, String nbreDocente, String apeDocente, String carrera, Date fechaDde, Date fechaHta) {
        return archivoDao.busquedaAvanzada(materia, nbreDocente, apeDocente, carrera, fechaDde, fechaHta);
    }

	public VwArchivo modificarArchivo(Long archivoId, String tagsArchivo,
			String desArchivo, Long estadoArchivo) {
		
		Archivo archi = archivoDao.findById(archivoId);
		archi.setTags(tagsArchivo);
		archi.setDescripcion(desArchivo);
		archi.setEstado(estadoArchivo);
		archivoDao.update(archi);
		
		return archivoDao.findVwArchivo(archivoId);
	}
}
