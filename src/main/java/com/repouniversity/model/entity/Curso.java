package com.repouniversity.model.entity;

import java.util.Date;
import java.util.List;

import com.repouniversity.model.dao.IdentifiedObject;
import com.repouniversity.model.entity.to.AlumnoTO;
import com.repouniversity.model.entity.to.GrupoTO;
import com.repouniversity.model.entity.to.NotificacionTO;

public class Curso implements Comparable<Curso>, IdentifiedObject {

    private static final long serialVersionUID = 7521064031034129065L;

    private Long id;
    private String nombre;
    private String codigo;
    private String descripcion;
    private boolean activo;
    private Date fechasys;
    private List<NotificacionTO> notificaciones;
    private List<Grupo> grupos;
    private List<AlumnoTO> alumnos;
    private Long materiaId;
    private Long docenteId;
    private List<AlumnoTO> alumnosSinGrupo;
    private GrupoTO grupoAlumno;
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

    @Override
    public int compareTo(Curso o) {
        return this.id.compareTo(o.id);
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

    public Long getMateriaId() {
        return materiaId;
    }

    public void setMateriaId(Long materiaId) {
        this.materiaId = materiaId;
    }

    public Long getDocenteId() {
        return docenteId;
    }

    public void setDocenteId(Long docenteId) {
        this.docenteId = docenteId;
    }

    public void setAlumnosSinGrupo(List<AlumnoTO> alumnosSinGrupo) {
        this.alumnosSinGrupo = alumnosSinGrupo;
        
    }
    
    public List<AlumnoTO> getAlumnosSinGrupo() {
        return alumnosSinGrupo;
    }
  
    public void setGrupoAlumno(GrupoTO grupoAlumno) {
        this.grupoAlumno = grupoAlumno;
        
    }
    
    public GrupoTO getGrupoAlumno() {
        return grupoAlumno;
    }
}
