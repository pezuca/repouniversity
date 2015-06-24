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
    //private List<Curso> cursos;
    private Long idCurso;
    private List<TpGrupoTO> tpGrupo;
    private List<AlumnoTO> alumnosSinGrupo;
    
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

    public long getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(long idCurso) {
        this.idCurso = idCurso;
    }
    
    public List<TpGrupoTO> getTpGrupo() {
        return tpGrupo;
    }

    public void setTpGrupo(List<TpGrupoTO> tpGrupo) {
        this.tpGrupo = tpGrupo;
    }

    public void setAlumnosSinGrupo(List<AlumnoTO> alumnosSinGrupo) {
        this.alumnosSinGrupo = alumnosSinGrupo;
        
    }
    
    public List<AlumnoTO> getAlumnosSinGrupo() {
        return alumnosSinGrupo;
    }
}
