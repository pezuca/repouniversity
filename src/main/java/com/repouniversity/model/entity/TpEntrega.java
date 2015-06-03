package com.repouniversity.model.entity;

import java.util.Date;

import com.repouniversity.model.dao.IdentifiedObject;

public class TpEntrega implements IdentifiedObject {
    private static final long serialVersionUID = -3439720520984277716L;
    
    private Long id;
    private Long idtpgrupo;
    private Long idarchivo;
    private String descripcion;
    private boolean activo;
    private Date fechasys;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
   
    public Long getIdTpGrupo() {
        return idtpgrupo;
    }

    public void setIdTpGrupo(Long idtpgrupo) {
        this.idtpgrupo = idtpgrupo;
    }
    
    public Long getIdArchivo() {
        return idarchivo;
    }

    public void setIdArchivo(Long idarchivo) {
        this.idarchivo = idarchivo;
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
