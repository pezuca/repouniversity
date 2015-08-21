package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class UsuarioParametro implements IdentifiedObject {

    private static final long serialVersionUID = 3355104975694628742L;
    private Long id;
    private Long idUsuario;
    private Long idParametro;
    private Long orden;
    private Long color;
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

	public Long getUsuario() {
		return idUsuario;
	}

	public void setUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Long getParametro() {
		return idParametro;
	}

	public void setParametro(Long idParametro) {
		this.idParametro = idParametro;
	}

	public Long getOrden() {
		return orden;
	}

	public void setOrden(Long orden) {
		this.orden = orden;
	}

	public Long getColor() {
		return color;
	}

	public void setColor(Long color) {
		this.color = color;
	}

    
}
