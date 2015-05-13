package com.repouniversity.model.entity.to;

import java.util.Date;
import java.util.List;

import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.entity.Materia;

public class CursoTO {

    private Long id;
    private String nombre;
    private String codigo;
    private String descripcion;
    private boolean activo;
    private Date fechasys;
    private List<NotificacionTO> notificaciones;
    private List<Grupo> grupos;
    private List<AlumnoTO> alumnos;
    private Materia materia;
    private DocenteTO docente;

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

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
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

    public List<NotificacionTO> getNotificaciones() {
        return notificaciones;
    }

    public void setNotificaciones(List<NotificacionTO> notificaciones) {
        this.notificaciones = notificaciones;
    }

    public List<Grupo> getGrupos() {
        return grupos;
    }

    public void setGrupos(List<Grupo> grupos) {
        this.grupos = grupos;
    }

    public List<AlumnoTO> getAlumnos() {
        return alumnos;
    }

    public void setAlumnos(List<AlumnoTO> alumnos) {
        this.alumnos = alumnos;
    }

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

    public DocenteTO getDocente() {
        return docente;
    }

    public void setDocente(DocenteTO docente) {
        this.docente = docente;
    }
}
