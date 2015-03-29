package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class Alumno implements Comparable<Alumno>, IdentifiedObject {
    private static final long serialVersionUID = -8493468785914549814L;
    private Long id;
    private Long idPersona;
    private Long idCarrera;
    private boolean activo;
    private Date fechasys;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(Long idPerdona) {
        this.idPersona = idPerdona;
    }

    public Long getIdCarrera() {
        return idCarrera;
    }

    public void setIdCarrera(Long idCarrera) {
        this.idCarrera = idCarrera;
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

    @Override
    public int compareTo(Alumno o) {
        return this.id.compareTo(o.id);
    }
}
