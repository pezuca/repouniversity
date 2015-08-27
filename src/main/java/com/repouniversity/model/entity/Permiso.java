package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class Permiso implements IdentifiedObject {

    private static final long serialVersionUID = 3355104975694628742L;
    private Long id;
    private String permiso;
    
    private boolean activo;
    private Date fechasys;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

	public String getPermiso() {
		return permiso;
	}

	public void setPermiso(String permiso) {
		this.permiso = permiso;
	}
}
