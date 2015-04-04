package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class Docente implements IdentifiedObject {
    private static final long serialVersionUID = 2211075012496640918L;

    private Long id;
    private Persona persona;
    private boolean activo;
    private Date fechasys;

    // private Set<CursoMateria> cursosMaterias;
    // private Set<Notificacion> notificaciones;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
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