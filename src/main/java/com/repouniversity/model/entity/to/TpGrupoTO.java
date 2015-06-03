package com.repouniversity.model.entity.to;

import java.util.Date;
import java.util.List;

import com.repouniversity.model.entity.Curso;

public class TpGrupoTO {
    private Long id;
    private String descripcion;
    private boolean activo;
    private Date fechasys;
    //private GrupoTO grupo;
    private long grupo;
    private long archivo;
    private long nota;

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

    public long getGrupo() {
        return grupo;
    }

    public void setGrupo(long grupo) {
        this.grupo = grupo;
    }

    public Long getArchivo() {
        return archivo;
    }

    public void setArchivo(Long archivo) {
        this.archivo = archivo;
    }
    
    public Long getNota() {
        return nota;
    }

    public void setNota(Long nota) {
        this.nota = nota;
    }
   
}
