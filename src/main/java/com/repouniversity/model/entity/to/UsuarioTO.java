package com.repouniversity.model.entity.to;

import java.util.Date;

import com.repouniversity.model.entity.Permiso;
import com.repouniversity.model.entity.Persona;

public class UsuarioTO {

    private Long id;
    private String user;
    private String pass;
    private boolean activo;
    private Persona Persona;
    private Date fechasys;
    private String rol;
    private AlumnoTO alumno;
    private Permiso permiso;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public Persona getPersona() {
        return Persona;
    }

    public void setPersona(Persona persona) {
        Persona = persona;
    }

    public Date getFechasys() {
        return fechasys;
    }

    public void setFechasys(Date fechasys) {
        this.fechasys = fechasys;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public AlumnoTO getAlumno() {
        return alumno;
    }

    public void setAlumno(AlumnoTO alumno) {
        this.alumno = alumno;
    }

	public Permiso getPermiso() {
		return permiso;
	}

	public void setPermiso(Permiso permiso) {
		this.permiso = permiso;
	}
}
