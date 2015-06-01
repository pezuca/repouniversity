package com.repouniversity.model.entity;

import com.repouniversity.model.dao.IdentifiedObject;

public class CarreraMateria implements IdentifiedObject {
    
    private static final long serialVersionUID = 1L;
    
    private Long idMateria;
    private Long idCarrera;

    public Long getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(Long idMateria) {
        this.idMateria = idMateria;
    }

    public Long getIdCarrera() {
        return idCarrera;
    }

    public void setIdCarrera(Long idCarrera) {
        this.idCarrera = idCarrera;
    }

    public Long getId() {
        return null;
    }

    public void setId(Long t) {
    }
}
