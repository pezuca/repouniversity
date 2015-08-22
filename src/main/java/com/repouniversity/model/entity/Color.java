package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class Color implements IdentifiedObject {

    private static final long serialVersionUID = 3355104975694628742L;
    private Long id;
    private String color;
    private boolean activo;

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

    public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
}
