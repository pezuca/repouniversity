package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class VwLogArchivo implements IdentifiedObject {

    private static final long serialVersionUID = 3355104975694628742L;
    private Long id;
    private Long idCreador;
    private Long cantidadDownload;
    private String nombre;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    
	public Long getIdCreador() {
		return idCreador;
	}

	public void setIdCreador(Long idCreador) {
		this.idCreador = idCreador;
	}

	public Long getCantidadDownload() {
		return cantidadDownload;
	}

	public void setCantidadDownload(Long cantidadDownload) {
		this.cantidadDownload = cantidadDownload;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	
    }
