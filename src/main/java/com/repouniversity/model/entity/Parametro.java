package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class Parametro implements IdentifiedObject {

    private static final long serialVersionUID = 3355104975694628742L;
    private Long id;
    private Long idRole;
    private String descricpion;
    private String variable;
    private String parametro;
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

	public Long getRole() {
		return idRole;
	}

	public void setRole(Long idRole) {
		this.idRole = idRole;
	}

	public String getDescricpion() {
		return descricpion;
	}

	public void setDescricpion(String descricpion) {
		this.descricpion = descricpion;
	}

	public String getVariable() {
		return variable;
	}

	public void setVariable(String variable) {
		this.variable = variable;
	}

	public String getParametro() {
		return parametro;
	}

	public void setParametro(String parametro) {
		this.parametro = parametro;
	}

	
    
}
