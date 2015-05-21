package com.repouniversity.model.entity.to;

import java.util.List;

import com.repouniversity.model.entity.Materia;

public class CarreraTO {

	private Long id;
	private String nombre;
	private List<Materia> materias;

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

	public List<Materia> getMaterias() {
		return materias;
	}

	public void setMaterias(List<Materia> materias) {
		this.materias = materias;
	}
}
