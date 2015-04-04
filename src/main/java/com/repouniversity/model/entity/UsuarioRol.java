package com.repouniversity.model.entity;

import com.repouniversity.model.dao.IdentifiedObject;

public class UsuarioRol implements IdentifiedObject {
    private static final long serialVersionUID = -7615397803103201578L;
    private Long id;
    private Long idPersona;
    private String nombreUsuario;
    private String rol;
    private Long idAluDoc;

    public Long getIdAluDoc() {
        return idAluDoc;
    }

    public void setIdAluDoc(Long idAluDoc) {
        this.idAluDoc = idAluDoc;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(Long persona) {
        this.idPersona = persona;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

}
