package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Comentario;
import com.repouniversity.model.entity.ErrorArchivo;

public interface ErrorArchivoDAO extends GenericDAO<ErrorArchivo> {

	List<ErrorArchivo> findErroresForAchivo(long idArchivo);

	List<ErrorArchivo> findErrores();

}
