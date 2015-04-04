package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.AlumnoDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.to.AlumnoTO;

@Service
@Transactional
public class AlumnoService {

    @Autowired
    private PersonaService personaService;

    @Autowired
    private AlumnoDAO alumnoDao;

//    public List<Curso> getCursosForAlumno(Long personaId) {
//        Alumno alumno = alumnoDao.findAlumnoByPersonaId(personaId);
//        return new ArrayList<Curso>(alumno.getCursos());
//    }
//
//    public List<CursoMateria> getCursosMateriasForDocente(Integer personaId) {
//        Persona persona = personaService.getById(personaId);
//
//        Docente docente = alumnoDao.findDocenteByPersonaId(persona.getId());
//        return new ArrayList<CursoMateria>(docente.getCursosMaterias());
//    }

    public AlumnoTO getAlumnoById(Long alumnoId) {
        Alumno alumno = alumnoDao.findById(alumnoId);

        return buildAlumno(alumno);
    }

    private AlumnoTO buildAlumno(Alumno alumno) {
        AlumnoTO alumnoTo = new AlumnoTO();
        alumnoTo.setId(alumno.getId());
        alumnoTo.setActivo(alumno.isActivo());
        alumnoTo.setFechasys(alumno.getFechasys());
        alumnoTo.setIdCarrera(alumno.getIdCarrera());
        alumnoTo.setPersona(personaService.findById(alumno.getIdPersona()));
        return alumnoTo;
    }

    public void save(Alumno alumno) {
        alumnoDao.insert(alumno);
    }

    public List<AlumnoTO> getAlumnosByIds(Long[] listaAlumnoId) {
        List<AlumnoTO> alumnoToList = new ArrayList<AlumnoTO>();
        List<Alumno> alumnoList = alumnoDao.findByIds(listaAlumnoId);
        
        for (Alumno alumno : alumnoList) {
            alumnoToList.add(buildAlumno(alumno));
        }
        
        return alumnoToList;
    }

    public List<AlumnoTO> getAlumnosForGrupo(Long grupoId) {
        List<AlumnoTO> alumnoToList = new ArrayList<AlumnoTO>();
        List<Alumno> alumnoList = alumnoDao.findAlumnoForGrupo(grupoId);
        
        for (Alumno alumno : alumnoList) {
            alumnoToList.add(buildAlumno(alumno));
        }
        
        return alumnoToList;
    }

    public List<AlumnoTO> getAlumnosForCurso(Long cursoId) {
        List<AlumnoTO> alumnoToList = new ArrayList<AlumnoTO>();
        List<Alumno> alumnoList = alumnoDao.findAlumnoForCurso(cursoId);
        
        for (Alumno alumno : alumnoList) {
            alumnoToList.add(buildAlumno(alumno));
        }
        
        return alumnoToList;
    }

    public List<AlumnoTO> getAll() {
        List<AlumnoTO> alumnoToList = new ArrayList<AlumnoTO>();
        List<Alumno> alumnoList = alumnoDao.findAll();
        
        for (Alumno alumno : alumnoList) {
            alumnoToList.add(buildAlumno(alumno));
        }
        
        return alumnoToList;
    }
}
