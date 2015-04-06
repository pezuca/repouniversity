package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.CursoMateria;

public interface CursoDAO extends GenericDAO<Curso>{

    List<Curso> findCursosForAlumnoId(Long idAluDoc);

    List<CursoMateria> findCursosMateriaDisponiblesParaAlumno(Long alumnoId);

    List<CursoMateria> findCursosForDocenteId(Long docenteId);

    void saveAlumnoCursoGrupo(Long grupoId, Long cursoId, Long alumnoId);
}
