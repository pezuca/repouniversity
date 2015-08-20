package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class Role implements IdentifiedObject {

    private static final long serialVersionUID = 3355104975694628742L;
    private Long id;
    private String role;
    
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

    public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
