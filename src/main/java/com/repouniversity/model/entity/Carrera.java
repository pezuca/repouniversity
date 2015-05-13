package com.repouniversity.model.entity;

import com.repouniversity.model.dao.IdentifiedObject;

public class Carrera implements IdentifiedObject {
    private static final long serialVersionUID = -6010775373119987330L;
    
    private Long id;
    private String nombre;
    private boolean activo;

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
}
