package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Curso;

public interface CursoDAO extends GenericDAO<Curso>{

    List<Curso> findCursosForAlumnoId(Long idAluDoc);
}
