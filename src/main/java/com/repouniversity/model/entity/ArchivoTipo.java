package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class ArchivoTipo implements IdentifiedObject {

    private static final long serialVersionUID = 3480925180506192059L;

    private Long id;
	private String nombre;
	private Boolean activo;
	private Date fechasys;

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

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public Date getFechasys() {
		return fechasys;
	}

	public void setFechasys(Date fechasys) {
		this.fechasys = fechasys;
	}
}
