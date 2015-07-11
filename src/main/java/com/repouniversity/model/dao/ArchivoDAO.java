package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.VwArchivo;

public interface ArchivoDAO extends GenericDAO<Archivo> {


    List<Archivo> findArchivoByEtiqueta(String etiqueta);

    List<Archivo> findArchivoByMateria(String materia);

    List<Archivo> findArchivoByDocente(String string);

    List<VwArchivo> findArchivosDePersona(long idPersona);

    VwArchivo findVwArchivo(Long archivoId);

	List<Archivo> requestArchivos(String parametro);
	
	List<String> quitarNoiseWords (String parametro);
	
	List <String> agregarEquivalencias (List<String> parametro);

	List<Archivo> generarBusqueda(List<String> parametrosBusqueda);

}
