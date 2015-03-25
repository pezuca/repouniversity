package com.repouniversity.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "datos_personas")
public class DatosPersona {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_usuario")
	private Integer id;

	@OneToOne
	@JoinColumn(name = "id_persona")
	private Persona persona;

	@Column(name = "rol")
	private String rol;

	@Column(name = "id_alu_doc")
	private Integer idAluDoc;

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

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public Integer getIdAluDoc() {
		return idAluDoc;
	}

	public void setIdAluDoc(Integer idAluDoc) {
		this.idAluDoc = idAluDoc;
	}
}
