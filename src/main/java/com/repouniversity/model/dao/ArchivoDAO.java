package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Archivo;

public interface ArchivoDAO extends GenericDAO<Archivo> {

    List<Archivo> findArchivoByEtiqueta(String etiqueta);

    List<Archivo> findArchivoByMateria(String materia);

    List<Archivo> findArchivoByDocente(String string);
}
