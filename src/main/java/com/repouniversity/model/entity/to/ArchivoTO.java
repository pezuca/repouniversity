package com.repouniversity.model.entity.to;

import java.util.Date;

import com.repouniversity.model.entity.ArchivoTipo;

public class ArchivoTO {

    private Long id;
    private String nombre;
    private String descripcion;
    private Date fechaDespublicacion;
    private Date fechaPublicacion;
    private ArchivoTipo archivoTipo;
    private Date fechasys;
    private boolean activo;
    private Long estado;
    private String path;
    private Long curso;
    private Long persona;
    private String tags;
    private Long grupo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaDespublicacion() {
        return fechaDespublicacion;
    }

    public void setFechaDespublicacion(Date fechaDespublicacion) {
        this.fechaDespublicacion = fechaDespublicacion;
    }

    public Date getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(Date fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }

    public ArchivoTipo getArchivoTipo() {
        return archivoTipo;
    }

    public void setArchivoTipo(ArchivoTipo archivoTipo) {
        this.archivoTipo = archivoTipo;
    }

    public Date getFechasys() {
        return fechasys;
    }

    public void setFechasys(Date fechasys) {
        this.fechasys = fechasys;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public Long getEstado() {
        return estado;
    }

    public void setEstado(Long estado) {
        this.estado = estado;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Long getCurso() {
        return curso;
    }

    public void setCurso(Long curso) {
        this.curso = curso;
    }

    public Long getPersona() {
        return persona;
    }

    public void setPersona(Long persona) {
        this.persona = persona;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String etiqueta) {
        this.tags = etiqueta;

    }

    public Long getGrupo() {
        return grupo;

    }

    public void setGrupo(Long grupoId) {
        this.grupo = grupoId;

    }
}
