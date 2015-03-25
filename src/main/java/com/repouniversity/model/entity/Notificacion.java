package com.repouniversity.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "notificacion")
public class Notificacion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idnotificacion")
	private Integer id;

	@OneToOne
	@JoinColumn(name = "tiponotificacion")
	private TipoNotificacion tipo;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idcurso", nullable = false)
	private Curso curso;
	
//	@Column(name = "idcurso")
//	private Integer curso;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idalumno", nullable = true)
	private Alumno alumno;
	
//	@Column(name = "idalumno")
//	private Integer alumno;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "iddocente", nullable = true)
	private Docente docente;

	public Alumno getAlumno() {
		return alumno;
	}

	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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
