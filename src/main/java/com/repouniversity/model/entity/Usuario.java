package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class Usuario implements IdentifiedObject {

    private static final long serialVersionUID = 3355104975694628742L;
    private Long id;
    private String user;
    private String pass;
    private boolean activo;
    private Long idPersona;
    private Date fechasys;
    private Long role;
    private Long idPermiso;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
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

    public Long getIdPersona() {
        return idPersona;
    }

    public void setPersona(Long idPersona) {
        this.idPersona = idPersona;
    }

	public Long getRole() {
		return role;
	}

	public void setRole(Long role) {
		this.role = role;
	}

	public Long getIdPermiso() {
		return idPermiso;
	}

	public void setIdPermiso(Long idPermiso) {
		this.idPermiso = idPermiso;
	}
}
