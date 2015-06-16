package com.repouniversity.model.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.ArchivoDAO;
import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.to.ArchivoTO;

@Service
public class ArchivoService {

	@Autowired
	private ArchivoDAO archivoDao;

	public Archivo subirArchivo(Archivo nuevoArchivo) {
		return archivoDao.subirArchivo(nuevoArchivo);
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
    //	archivoTo.setGrupo(archivo.getGrupo());
    	
        return archivoTo;
    }

}
