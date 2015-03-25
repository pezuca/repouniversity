package com.repouniversity.model.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "curso_materia")
public class CursoMateria {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_curso_materia")
	private Integer id;
	
	@Column(name = "activo")
	private boolean activo;
	
	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "cursosMaterias")
	private Set<Docente> docente;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_curso", nullable = false)
	private Curso curso;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_materia", nullable = false)
	private Materia materia;
	
	public Materia getMateria() {
		return materia;
	}

	public void setMateria(Materia materia) {
		this.materia = materia;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public Set<Docente> getDocente() {
		return docente;
	}

	public void setDocente(Set<Docente> docente) {
		this.docente = docente;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}
//
//	public Materia getMateria() {
//		return materia;
//	}
//
//	public void setMateria(Materia materia) {
//		this.materia = materia;
//	}
}
