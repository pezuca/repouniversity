package com.repouniversity.model.entity.to;

import java.util.Date;
import java.util.List;

import com.repouniversity.model.entity.Curso;

public class TpEntregaTO {
    private Long id;
    private String descripcion;
    private boolean activo;
    private Date fechasys;
    private long tpgrupo;
    private long archivo;
    private String archivoNombre;
    private String archivoDescripcion;
    private String archivoPath;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public long getTpGrupo() {
        return tpgrupo;
    }

    public void setTpGrupo(long tpgrupo) {
        this.tpgrupo = tpgrupo;
    }

    public Long getArchivo() {
        return archivo;
    }

    public void setArchivo(Long archivo) {
        this.archivo = archivo;
    }

	public String getArchivoNombre() {
		return archivoNombre;
	}

	public void setArchivoNombre(String archivoNombre) {
		this.archivoNombre = archivoNombre;
	}

	public String getArchivoDescripcion() {
		return archivoDescripcion;
	}

	public void setArchivoDescripcion(String archivoDescripcion) {
		this.archivoDescripcion = archivoDescripcion;
	}

	public String getArchivoPath() {
		return archivoPath;
	}

	public void setArchivoPath(String archivoPath) {
		this.archivoPath = archivoPath;
	}
    
   
}
