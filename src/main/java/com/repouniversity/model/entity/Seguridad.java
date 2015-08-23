package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class Seguridad implements IdentifiedObject {

    private static final long serialVersionUID = 3355104975694628742L;
    private Long id;
    private Long mayusculas;
    private Long minusculas;
    private Long especiales;
    private Long longMinima;
    private Long numeros;
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

	public Long getMayusculas() {
		return mayusculas;
	}

	public void setMayusculas(Long mayusculas) {
		this.mayusculas = mayusculas;
	}

	public Long getMinusculas() {
		return minusculas;
	}

	public void setMinusculas(Long minusculas) {
		this.minusculas = minusculas;
	}

	public Long getEspeciales() {
		return especiales;
	}

	public void setEspeciales(Long especiales) {
		this.especiales = especiales;
	}

	public Long getLongMinima() {
		return longMinima;
	}

	public void setLongMinima(Long longMinima) {
		this.longMinima = longMinima;
	}

	public Date getFechasys() {
		return fechasys;
	}

	public void setFechasys(Date fechasys) {
		this.fechasys = fechasys;
	}

	public Long getNumeros() {
		return numeros;
	}

	public void setNumeros(Long numeros) {
		this.numeros = numeros;
	}


}
