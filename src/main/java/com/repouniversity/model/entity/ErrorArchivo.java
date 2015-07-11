package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class ErrorArchivo implements IdentifiedObject {
    private static final long serialVersionUID = -3439720520984277716L;
    
    private Long id;
    private String descripcion;
    private Long idArchivo;
    private Long idpersona;
    private boolean activo;
    private Date fechasys;

   
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
   
    public Long getIdPersona() {
        return idpersona;
    }

    public void setIdPersona(Long idpersona) {
        this.idpersona = idpersona;
    }
    
    public Long getIdArchivo() {
        return idArchivo;
    }

    public void setIdArchivo(Long idArchivo) {
        this.idArchivo = idArchivo;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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
