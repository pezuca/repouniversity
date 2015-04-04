package com.repouniversity.model.entity;

import com.repouniversity.model.dao.IdentifiedObject;

public class Notificacion implements IdentifiedObject {
    private static final long serialVersionUID = 3077206151936980423L;

    private Long id;
    private Long tipoId;
    private Long cursoId;
    private Long alumnoId;
    private Long docenteId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTipoId() {
        return tipoId;
    }

    public void setTipoId(Long tipoId) {
        this.tipoId = tipoId;
    }

    public Long getCursoId() {
        return cursoId;
    }

    public void setCursoId(Long cursoId) {
        this.cursoId = cursoId;
    }

    public Long getAlumnoId() {
        return alumnoId;
    }

    public void setAlumnoId(Long alumnoId) {
        this.alumnoId = alumnoId;
    }

    public Long getDocenteId() {
        return docenteId;
    }

    public void setDocenteId(Long docenteId) {
        this.docenteId = docenteId;
    }
}
