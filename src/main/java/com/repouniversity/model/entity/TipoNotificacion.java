package com.repouniversity.model.entity;

import com.repouniversity.model.dao.IdentifiedObject;

public class TipoNotificacion implements IdentifiedObject {

    private static final long serialVersionUID = -3544861412467290103L;
    
    private Long id;
    private String descripcion;
    
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


}
