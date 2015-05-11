package com.repouniversity.model.entity;

import com.repouniversity.model.dao.IdentifiedObject;

public class Carrera implements IdentifiedObject {
    private static final long serialVersionUID = -8733897774779597605L;

    private Long id;
    private String nombre;

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
}
