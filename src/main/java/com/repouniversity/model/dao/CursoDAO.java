package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.CursoMateria;
import com.repouniversity.model.entity.to.AlumnoTO;

public interface CursoDAO extends GenericDAO<Curso>{

    List<Curso> findCursosForAlumnoId(Long idAluDoc);

    List<CursoMateria> findCursosMateriaDisponiblesParaAlumno(Long alumnoId);

    List<CursoMateria> findCursosForDocenteId(Long docenteId);

    void saveAlumnoCursoGrupo(Long grupoId, Long cursoId, Long alumnoId);
    void insertAlumnoCursoGrupo(Long grupoId, Long cursoId, Long alumnoId);
    
	List<Long> ObtenerAlumnosSinGrupo(Long idCurso);

	void bajaCursoAlumno(Long cursoId, Long idAluDoc);
}
