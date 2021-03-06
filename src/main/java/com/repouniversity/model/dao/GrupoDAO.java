package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Grupo;

public interface GrupoDAO extends GenericDAO<Grupo> {

    Alumno findAlumnoByGrupoId(Integer grupoId);

    List<Grupo> findGruposByCurso(Long idGrupo);

	long findIdCursoForGrupo(long idGrupo);

	List<Grupo> findGrupoByCursoAlumno(Long idCurso, Long idAlumno);

	List<Grupo> findGruposDeAlumno(long idAlumno);

	void eliminarAlumnosGrupo(long grupoId);
}
