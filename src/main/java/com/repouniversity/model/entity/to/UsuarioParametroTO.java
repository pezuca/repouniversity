package com.repouniversity.model.entity.to;

import java.util.Date;

import com.repouniversity.model.entity.Color;
import com.repouniversity.model.entity.Parametro;

public class UsuarioParametroTO {
	
    private Long id;
    private Long idUsuario;
    private Parametro parametro;
    private Long orden;
    private Color color;
    private boolean activo;
    private Date fechasys;

    
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

    public Date getFechasys() {
        return fechasys;
    }

    public void setFechasys(Date fechasys) {
        this.fechasys = fechasys;
    }

	public Long getUsuario() {
		return idUsuario;
	}

	public void setUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Parametro getParametro() {
		return parametro;
	}

	public void setParametro(Parametro parametro) {
		this.parametro = parametro;
	}

	public Long getOrden() {
		return orden;
	}

	public void setOrden(Long orden) {
		this.orden = orden;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}
}
