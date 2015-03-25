package com.repouniversity.model.entity;

import java.util.Date;
import java.util.List;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "curso")
public class Curso implements Comparable<Curso> {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_curso")
	private Integer id;

	@Column(name = "nombre")
	private String nombre;

	@Column(name = "codigo")
	private String codigo;

	@Column(name = "descripcion")
	private String descripcion;

	@Column(name = "activo")
	private boolean activo;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "fecsys")
	private Date fechasys;

	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "cursos", cascade = CascadeType.ALL)
	private Set<Alumno> alumnos;

	// @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	// @JoinTable(name = "alumno_curso", joinColumns = { @JoinColumn(name =
	// "alumno_id_alumno", nullable = false, updatable = false) },
	// inverseJoinColumns = { @JoinColumn(name = "curso_id_curso", nullable =
	// false, updatable = false) })
	// private Set<Alumno> alumnos;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "curso")
	private Set<CursoMateria> cursosMaterias;

	// @OneToMany(fetch = FetchType.EAGER, mappedBy = "curso")
	@Transient
	private List<Notificacion> notificaciones;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "alumno_curso", joinColumns = { @JoinColumn(name = "alumno_id_alumno", nullable = false, updatable = true) }, inverseJoinColumns = { @JoinColumn(name = "grupo_id_grupo", nullable = false, updatable = true) })
	private Set<Grupo> grupos;

	public Set<Grupo> getGrupos() {
		return grupos;
	}

	public void setGrupos(Set<Grupo> grupos) {
		this.grupos = grupos;
	}

	public Set<Alumno> getAlumnos() {
		return alumnos;
	}

	public void setAlumnos(Set<Alumno> alumnos) {
		this.alumnos = alumnos;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public Set<CursoMateria> getCursosMaterias() {
		return cursosMaterias;
	}

	public void setCursosMaterias(Set<CursoMateria> cursosMaterias) {
		this.cursosMaterias = cursosMaterias;
	}

	public List<Notificacion> getNotificaciones() {
		return notificaciones;
	}

	public void setNotificaciones(List<Notificacion> notificaciones) {
		this.notificaciones = notificaciones;
	}

	@Override
	public int compareTo(Curso o) {
		return this.id.compareTo(o.id);
	}
}
