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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "docente")
public class Docente {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_docente")
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
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "docente_curso_materia", joinColumns = { @JoinColumn(name = "id_docente", nullable = false, updatable = true) }, inverseJoinColumns = { @JoinColumn(name = "id_curso_materia", nullable = false, updatable = true) })
	private Set<CursoMateria> cursosMaterias;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "docente")
	private Set<Notificacion> notificaciones;
	
	public Set<Notificacion> getNotificaciones() {
		return notificaciones;
	}

	public void setNotificaciones(Set<Notificacion> notificaciones) {
		this.notificaciones = notificaciones;
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

	public Set<CursoMateria> getCursosMaterias() {
		return cursosMaterias;
	}

	public void setCursosMaterias(Set<CursoMateria> cursosMaterias) {
		this.cursosMaterias = cursosMaterias;
	}
}