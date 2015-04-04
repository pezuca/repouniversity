package com.repouniversity.model.entity;

import com.repouniversity.model.dao.IdentifiedObject;

public class CursoMateria implements IdentifiedObject {
    private static final long serialVersionUID = -634119785139383757L;
    
    private Long id;
    private boolean activo;
    private Docente docente;
    private Long idCurso;
    private String codigoCurso;
    private String descripcionCurso;
    private Long idMateria;
    private String nombreMateria;
    private Long tipoNotificacion;

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

    public Docente getDocente() {
        return docente;
    }

    public void setDocente(Docente docente) {
        this.docente = docente;
    }

    public Long getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Long idCurso) {
        this.idCurso = idCurso;
    }

    public String getCodigoCurso() {
        return codigoCurso;
    }

    public void setCodigoCurso(String codigoCurso) {
        this.codigoCurso = codigoCurso;
    }

    public String getDescripcionCurso() {
        return descripcionCurso;
    }

    public void setDescripcionCurso(String descripcionCurso) {
        this.descripcionCurso = descripcionCurso;
    }

    public Long getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(Long idMateria) {
        this.idMateria = idMateria;
    }

    public String getNombreMateria() {
        return nombreMateria;
    }

    public void setNombreMateria(String nombreMateria) {
        this.nombreMateria = nombreMateria;
    }

    public Long getTipoNotificacion() {
        return tipoNotificacion;
    }

    public void setTipoNotificacion(Long tipoNotificacion) {
        this.tipoNotificacion = tipoNotificacion;
    }
}
