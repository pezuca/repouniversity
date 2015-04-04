package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Grupo;

public interface GrupoDAO extends GenericDAO<Grupo> {

    Alumno findAlumnoByGrupoId(Integer grupoId);

    List<Grupo> findGruposByCurso(Long cursoId);
}
