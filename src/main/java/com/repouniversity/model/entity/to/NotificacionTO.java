package com.repouniversity.model.entity.to;

import com.repouniversity.model.dao.IdentifiedObject;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.Docente;
import com.repouniversity.model.entity.TipoNotificacion;


public class NotificacionTO implements IdentifiedObject {
    private static final long serialVersionUID = 3077206151936980423L;
    
    private Long id;
    private TipoNotificacion tipo;
    private Curso curso;
    private AlumnoTO alumno;
    private Docente docente;

    public AlumnoTO getAlumno() {
        return alumno;
    }

    public void setAlumno(AlumnoTO alumno) {
        this.alumno = alumno;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public TipoNotificacion getTipo() {
        return tipo;
    }

    public void setTipo(TipoNotificacion tipo) {
        this.tipo = tipo;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public Docente getDocente() {
        return docente;
    }

    public void setDocente(Docente docente) {
        this.docente = docente;
    }
}
