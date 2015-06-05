package com.repouniversity.model.entity.to;

import java.util.Date;
import java.util.List;

import com.repouniversity.model.entity.Curso;

public class GrupoTO {
    private Long id;
    private String nombre;
    private boolean activo;
    private Date fechasys;
    private List<AlumnoTO> alumnos;
    private List<Curso> cursos;
    private List<TpGrupoTO> tpGrupo;
    
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

    public List<AlumnoTO> getAlumnos() {
        return alumnos;
    }

    public void setAlumnos(List<AlumnoTO> alumnos) {
        this.alumnos = alumnos;
    }

    public List<Curso> getCursos() {
        return cursos;
    }

    public void setCursos(List<Curso> cursos) {
        this.cursos = cursos;
    }
    
    public List<TpGrupoTO> getTpGrupo() {
        return tpGrupo;
    }

    public void setTpGrupo(List<TpGrupoTO> tpGrupo) {
        this.tpGrupo = tpGrupo;
    }
}
