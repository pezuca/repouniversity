package com.repouniversity.model.entity.to;

import java.util.Date;
import java.util.List;

import com.repouniversity.model.entity.Persona;

public class ComentarioTO {
    private Long id;
    private String descripcion;
    private Boolean activo;
    private Date fechasys;
    // private GrupoTO grupo;
    private Persona persona;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Date getFechasys() {
        return fechasys;
    }

    public void setFechasys(Date fechasys) {
        this.fechasys = fechasys;
    }

	public Persona getPersona() {
		return persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

  
}
