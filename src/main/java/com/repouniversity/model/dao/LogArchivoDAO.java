package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.LogArchivo;
import com.repouniversity.model.entity.VwLogArchivo;

public interface LogArchivoDAO extends GenericDAO<LogArchivo> {

	public List<VwLogArchivo> findMisArchivosBajados(final Long personaId) ;
	public List<LogArchivo> findLogArchivoForArchivoId(final Long archivoId) ;
	
	
}
