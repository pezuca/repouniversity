package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.ComentarioDAO;
import com.repouniversity.model.dao.ErrorArchivoDAO;
import com.repouniversity.model.dao.GrupoDAO;
import com.repouniversity.model.dao.TpGrupoDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.Comentario;
import com.repouniversity.model.entity.ErrorArchivo;
import com.repouniversity.model.entity.TpEntrega;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.ComentarioTO;
import com.repouniversity.model.entity.to.ErrorArchivoTO;

@Service
public class ErrorArchivoService {

    @Autowired
    private GrupoDAO grupoDao;
    @Autowired
    private TpGrupoDAO tpGrupoDao;

    @Autowired
    private ErrorArchivoDAO errorArchivoDao;

    @Autowired
    private AlumnoService alumnoService;
    @Autowired
    private PersonaService personaService;
    @Autowired
    private GrupoService grupoService;
    @Autowired
    private TpEntregaService tpEntregaService;

    @Autowired
    private ArchivoService archivoService;


    private ErrorArchivoTO buildErrorArchivo(ErrorArchivo errorArchivo) {
    	ErrorArchivoTO errorArchivoTO = new ErrorArchivoTO();

    	errorArchivoTO.setId(errorArchivo.getId());
    	errorArchivoTO.setDescripcion(errorArchivo.getDescripcion());
    	errorArchivoTO.setActivo(errorArchivo.isActivo());
    	errorArchivoTO.setFechasys(errorArchivo.getFechasys());
        errorArchivoTO.setPersona(personaService.findById(errorArchivo.getIdPersona()));
    	if (errorArchivo.getIdArchivo() != null && errorArchivo.getIdArchivo() != 0)
    	{	
    		errorArchivoTO.setArchivo(archivoService.getArchivoById(errorArchivo.getIdArchivo()));
    	}
        return errorArchivoTO;
    }

    public List<ErrorArchivoTO> getErroresForArchivo(long idArchivo) {

        List<ErrorArchivoTO> errorArchivoTOList = new ArrayList<ErrorArchivoTO>();
        List<ErrorArchivo> errorArchivoList = errorArchivoDao.findErroresForAchivo(idArchivo);

        for (ErrorArchivo errorArchivo : errorArchivoList) {
        	errorArchivoTOList.add(buildErrorArchivo(errorArchivo));
        }

        return errorArchivoTOList;
    }
    
    public List<ErrorArchivoTO> getErrores() {

        List<ErrorArchivoTO> errorArchivoTOList = new ArrayList<ErrorArchivoTO>();
        List<ErrorArchivo> errorArchivoList = errorArchivoDao.findErrores();

        for (ErrorArchivo errorArchivo : errorArchivoList) {
        	errorArchivoTOList.add(buildErrorArchivo(errorArchivo));
        }

        return errorArchivoTOList;
    }
    public ErrorArchivo save(ErrorArchivo errorArchivo) {
        return errorArchivoDao.insert(errorArchivo);
    }
    
	public void eliminarError(long errorArchivoId) {
		ErrorArchivo errorArchivo = errorArchivoDao.findById(errorArchivoId);
		errorArchivoDao.delete(errorArchivo);
			
	}

	public ErrorArchivoTO reportarError(Long archivoId, String descripcion, UsuarioRol usuario) {
		 	
		ErrorArchivo errorArchivo = new ErrorArchivo();
		errorArchivo.setIdArchivo(archivoId);
		errorArchivo.setDescripcion(descripcion);
		errorArchivo.setIdPersona(usuario.getIdPersona());
		errorArchivo.setActivo(true);
	    	
		errorArchivo = save(errorArchivo);
	      
	    	return buildErrorArchivo(errorArchivo);
	} 
  
}
