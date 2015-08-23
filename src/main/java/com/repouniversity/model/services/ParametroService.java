package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.ParametroDAO;
import com.repouniversity.model.entity.Parametro;

@Service
public class ParametroService {

    @Autowired
    private ParametroDAO parametroDAO;

    @Autowired
    private PersonaService personaService;

    @Autowired
    private AlumnoService alumnoService;

    @Autowired
    private DocenteService docenteService;

    @Autowired
    private UsuarioRolService usuarioRolService;

    

    public Parametro getParametroById(Long parametroId) {
    	Parametro parametro = parametroDAO.findById(parametroId);

        return parametro;
    }

    public List<Parametro> getParametrosByRole(Long roleId) {
    	List<Parametro> parametros = parametroDAO.findParametrosByRole(roleId);

        return parametros;
    }

    public List<Parametro> getAll() {

        return parametroDAO.findAll();
    }

    private void delete(Long parametroId) {
        Parametro parametro = parametroDAO.findById(parametroId);
        parametroDAO.delete(parametro);
    }

    
}
