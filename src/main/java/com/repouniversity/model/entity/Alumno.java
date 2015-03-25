package com.repouniversity.model.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "alumno")
public class Alumno implements Comparable<Alumno> {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_alumno")
	private Integer id;

	@OneToOne
	@JoinColumn(name = "id_persona")
	private Persona persona;

	@Column(name = "activo")
	private boolean activo;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "fecsys")
	private Date fechasys;

//	@OneToMany(fetch = FetchType.EAGER, mappedBy = "alumno")
//	private Set<Notificacion> notificaciones;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "alumno_curso", joinColumns = { @JoinColumn(name = "alumno_id_alumno", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "curso_id_curso", nullable = false, updatable = false) })
	public Set<Curso> cursos;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "alumno_curso", joinColumns = { @JoinColumn(name = "alumno_id_alumno", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "grupo_id_grupo", nullable = false, updatable = false) })
	private Set<Grupo> grupos;
	

//	public Set<Notificacion> getNotificaciones() {
//		return notificaciones;
//	}
//
//	public void setNotificaciones(Set<Notificacion> notificaciones) {
//		this.notificaciones = notificaciones;
//	}

	public Set<Grupo> getGrupos() {
		return grupos;
	}

	public void setGrupos(Set<Grupo> grupos) {
		this.grupos = grupos;
	}

	public Set<Curso> getCursos() {
		return cursos;
	}

	public void setCursos(Set<Curso> cursos) {
		this.cursos = cursos;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Persona getPersona() {
		return persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
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
	public int compareTo(Alumno o) {
		return this.id.compareTo(o.id);
	}
}
