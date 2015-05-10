package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class Archivo implements IdentifiedObject {
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String nombre;
	private String descripcion;
	private Date fechaDespublicacion;
	private Date fechaPublicacion;
	private ArchivoTipo archivoTipo;
	private Date fechasys;
	private boolean activo;
	private Estado estado;
	private String path;
	private Curso curso;
	private Persona persona;
	private String tags;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Date getFechaDespublicacion() {
		return fechaDespublicacion;
	}

	public void setFechaDespublicacion(Date fechaDespublicacion) {
		this.fechaDespublicacion = fechaDespublicacion;
	}

	public Date getFechaPublicacion() {
		return fechaPublicacion;
	}

	public void setFechaPublicacion(Date fechaPublicacion) {
		this.fechaPublicacion = fechaPublicacion;
	}

	public ArchivoTipo getArchivoTipo() {
		return archivoTipo;
	}

	public void setArchivoTipo(ArchivoTipo archivoTipo) {
		this.archivoTipo = archivoTipo;
	}

	public Date getFechasys() {
		return fechasys;
	}

	public void setFechasys(Date fechasys) {
		this.fechasys = fechasys;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public Persona getPersona() {
		return persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String etiqueta) {
		this.tags = etiqueta;

	}
}
