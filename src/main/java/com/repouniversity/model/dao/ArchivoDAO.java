package com.repouniversity.model.dao;

import java.util.Date;
import java.util.List;

import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.VwArchivo;

public interface ArchivoDAO extends GenericDAO<Archivo> {

    List<Archivo> findArchivoByEtiqueta(String etiqueta);

    List<Archivo> findArchivoByMateria(String materia);

    List<Archivo> findArchivoByDocente(String string);

    List<VwArchivo> findArchivosDePersona(long idPersona);

    VwArchivo findVwArchivo(Long archivoId);

    List<Archivo> requestArchivos(String parametro, UsuarioRol usuario);

    List<String> quitarNoiseWords(String parametro);

    List<String> agregarEquivalencias(List<String> parametro);

    List<Archivo> generarBusqueda(List<String> parametrosBusqueda, UsuarioRol usuario);

    List<Archivo> busquedaAvanzada(String materia, String docente, String descripcion, Date fechaDde, Date fechaHta, UsuarioRol usuario);

	List<VwArchivo> findArchivosDelCurso(long idCurso);

}
