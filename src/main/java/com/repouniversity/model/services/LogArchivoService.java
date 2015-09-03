package com.repouniversity.model.services;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.LogArchivoDAO;
import com.repouniversity.model.entity.LogArchivo;
import com.repouniversity.model.entity.TpEntrega;
import com.repouniversity.model.entity.VwLogArchivo;
import com.repouniversity.model.entity.to.LogArchivoTO;
import com.repouniversity.model.entity.to.TpEntregaTO;

@Service
public class LogArchivoService {

    @Autowired
    private LogArchivoDAO logArchivoDAO;
    @Autowired
    private PersonaService personaService;

    
    public LogArchivo save(LogArchivo logArchivo) {
        return logArchivoDAO.insert(logArchivo);
    }

    public void nuevoLog(Long idArchivo, Long idCreador, Long idPersona) throws IOException {
        
    	LogArchivo logArchivo = new LogArchivo();
    	logArchivo.setIdArchivo(idArchivo);
    	logArchivo.setIdCreador(idCreador);
    	logArchivo.setIdPersona(idPersona);
    	logArchivo.setActivo(true);
    	
    	logArchivo = save(logArchivo);
    	
    	//return buildTpEntrega(tpEntrega);

    }

    public List<VwLogArchivo> getMisArchivosBajados(Long personaId) {
        return logArchivoDAO.findMisArchivosBajados(personaId);
    }
    
    public List<LogArchivoTO> getLogArchivoForArchivoId(Long archivoId) {
    	
        List<LogArchivoTO> LogArchivoToList = new ArrayList<LogArchivoTO>();
        List<LogArchivo> LogArchivoList = logArchivoDAO.findLogArchivoForArchivoId(archivoId);
        
        for (LogArchivo LogArchivo : LogArchivoList) {
        	LogArchivoToList.add(buildLogArchivo(LogArchivo));
        }
        
        return LogArchivoToList;
    }

    private LogArchivoTO buildLogArchivo(LogArchivo logArchivo) {
    	LogArchivoTO logArchivoTo = new LogArchivoTO();

              
    	logArchivoTo.setId(logArchivo.getId());
    	logArchivoTo.setCreador(personaService.findById(logArchivo.getIdCreador()));
    	logArchivoTo.setPersona(personaService.findById(logArchivo.getIdPersona()));
    	logArchivoTo.setIdArchivo(logArchivo.getIdArchivo());
    	logArchivoTo.setActivo(logArchivo.isActivo());
    	logArchivoTo.setFechasys(logArchivo.getFechasys());
        
        return logArchivoTo;
    }
    
    public List<LogArchivo> getAll() {
        return logArchivoDAO.findAll();
    }

     
    public LogArchivo findById(Long id) {
        return logArchivoDAO.findById(id);
    }
}
