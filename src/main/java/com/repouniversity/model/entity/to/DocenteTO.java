package com.repouniversity.model.entity.to;

import java.util.Date;

import com.repouniversity.model.entity.Persona;

public class DocenteTO {

    private Long id;
    private Persona persona;
    private boolean activo;
    private Date fechasys;

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
