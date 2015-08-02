package com.repouniversity.model.dao;

import com.repouniversity.model.entity.Docente;

public interface DocenteDAO extends GenericDAO<Docente> {

    Docente getByCursoMateriaId(Long id);
    
   long findAlumnosAcargoForDocente(long docenteId);
    

}
