package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.DocenteDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Docente;
import com.repouniversity.model.entity.to.AlumnoTO;
import com.repouniversity.model.entity.to.DocenteTO;

@Service
public class DocenteService {

    @Autowired
    private DocenteDAO docenteDao;
    
    @Autowired
    private PersonaService personaService;

    public List<DocenteTO> getAll() {
        List<Docente> docentes = docenteDao.findAll();
        List<DocenteTO> docentesTo = buildDocentes(docentes);
        
        return docentesTo;
    }

    private List<DocenteTO> buildDocentes(List<Docente> docentes) {
        List<DocenteTO> docentesTo = new ArrayList<DocenteTO>();
        
        for (Docente docente : docentes) {
            DocenteTO docenteTo = new DocenteTO();
            
            docenteTo.setId(docente.getId());
            docenteTo.setActivo(docente.isActivo());
            docenteTo.setFechasys(docente.getFechasys());
            docenteTo.setPersona(personaService.findById(docente.getPersonaId()));
            
            docentesTo.add(docenteTo);
        }
        return docentesTo;
    }

    public Docente getById(Long idAluDoc) {
        return docenteDao.findById(idAluDoc);
    }
    
    public DocenteTO getCompleteById(Long idAluDoc) {
        Docente docente = docenteDao.findById(idAluDoc);
        DocenteTO docenteTo = new DocenteTO();
        
        docenteTo.setId(docente.getId());
        docenteTo.setFechasys(docente.getFechasys());
        docenteTo.setActivo(docente.isActivo());
        docenteTo.setPersona(personaService.findById(docente.getPersonaId()));
        
        
        return docenteTo;
    }
    public DocenteTO getDocenteById(Long idAluDoc) {
        return buildDocente(docenteDao.findById(idAluDoc));
    }

    public DocenteTO getByCursoMateriaId(Long id) {
    //    return docenteDao.getByCursoMateriaId(id);
        return buildDocente(docenteDao.getByCursoMateriaId(id));
    }
    
    public Docente save(Docente docente) {
        return docenteDao.insert(docente);
    }

    public void delete(Long docenteId) {
        Docente docente = docenteDao.findById(docenteId);
        docenteDao.delete(docente);
    }
    

    private DocenteTO buildDocente(Docente docente) {
      
        DocenteTO docenteTo = new DocenteTO();
        docenteTo.setId(docente.getId());
        docenteTo.setFechasys(docente.getFechasys());
        docenteTo.setActivo(docente.isActivo());
        docenteTo.setPersona(personaService.findById(docente.getPersonaId()));
        
        return docenteTo;
    }
    
    public Long getAlumnosAcargoForDocente(long docenteId) {

        return docenteDao.findAlumnosAcargoForDocente(docenteId);
    } 
    
    
}
