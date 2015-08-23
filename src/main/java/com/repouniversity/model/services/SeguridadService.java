package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.SeguridadDAO;
import com.repouniversity.model.entity.Role;
import com.repouniversity.model.entity.Seguridad;
import com.repouniversity.model.entity.UsuarioParametro;
import com.repouniversity.model.entity.to.UsuarioParametroTO;

@Service
public class SeguridadService {

    @Autowired
    private SeguridadDAO seguridadDAO;

    public List<Seguridad> getAll() {
        return seguridadDAO.findAll();
    }

   
    public Seguridad findById(Long id) {
        return seguridadDAO.findById(id);
    }


	public Seguridad editarSeguridadPass(Long seguridadId, Long mayusculas,
			Long minusculas, Long especiales, Long numeros, Long longMinima) {
		
		Seguridad seguridad = seguridadDAO.findById(seguridadId);
		seguridad.setMayusculas(mayusculas);
		seguridad.setMinusculas(minusculas);
		seguridad.setEspeciales(especiales);
		seguridad.setLongMinima(longMinima);
		seguridad.setNumeros(numeros);
		
		seguridadDAO.update(seguridad);
		
		return seguridadDAO.findById(seguridadId);
	}
	


}
