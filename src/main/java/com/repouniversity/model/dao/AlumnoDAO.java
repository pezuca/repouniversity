package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Docente;

public interface AlumnoDAO extends GenericDAO<Alumno>{

    Alumno findAlumnoByPersonaId(Long personaId);

    Docente findDocenteByPersonaId(Integer personaId);

    List<Alumno> findAlumnoForGrupo(Long grupoId);

    List<Alumno> findAlumnoForCurso(Long grupoId);
    
    List<Alumno> findAlumnosForCursoSinGrupo(final Long cursoId);
    
    Alumno findByPersonaId(Long personaId, Boolean activo);
}
