package com.repouniversity.model.entity.to;

import java.util.Date;
import java.util.List;

public class TpGrupoTO {
    private Long id;
    private String descripcion;
    private Boolean activo;
    private Date fechasys;
    // private GrupoTO grupo;
    private Long grupo;
    private String grupoNombre;
    private Long archivo;
    private String archivoNombre;
    private String archivoDescripcion;
    private String archivoPath;
    private Long nota;
    private List<TpEntregaTO> tpEntrega;
    private List<ComentarioTO> comentario;
   
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<ComentarioTO> getComentario() {
        return comentario;
    }

    public void setComentario(List<ComentarioTO> comentario) {
        this.comentario = comentario;
    }

    public String getGrupoNombre() {
        return grupoNombre;
    }

    public void setGrupoNombre(String grupoNombre) {
        this.grupoNombre = grupoNombre;
    }

    public String getArchivoNombre() {
        return archivoNombre;
    }

    public void setArchivoNombre(String archivoNombre) {
        this.archivoNombre = archivoNombre;
    }

    public String getArchivoDescripcion() {
        return archivoDescripcion;
    }

    public void setArchivoDescripcion(String archivoDescripcion) {
        this.archivoDescripcion = archivoDescripcion;
    }

    public String getArchivoPath() {
        return archivoPath;
    }

    public void setArchivoPath(String archivoPath) {
        this.archivoPath = archivoPath;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Boolean isActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Date getFechasys() {
        return fechasys;
    }

    public void setFechasys(Date fechasys) {
        this.fechasys = fechasys;
    }

    public Long getGrupo() {
        return grupo;
    }

    public void setGrupo(Long grupo) {
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

    public List<TpEntregaTO> getTpEntrega() {
        return tpEntrega;
    }

    public void setTpEntrega(List<TpEntregaTO> tpEntrega) {
        this.tpEntrega = tpEntrega;
    }

}
