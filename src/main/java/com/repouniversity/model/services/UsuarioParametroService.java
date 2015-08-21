package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.UsuarioParametroDAO;
import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioParametro;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.UsuarioParametroTO;
import com.repouniversity.model.entity.to.UsuarioTO;

@Service
public class UsuarioParametroService {

    @Autowired
    private UsuarioParametroDAO usuarioParametroDAO;

    @Autowired
    private PersonaService personaService;

    @Autowired
    private AlumnoService alumnoService;

    @Autowired
    private DocenteService docenteService;

    @Autowired
    private UsuarioRolService usuarioRolService;

    

    public UsuarioParametroTO getUsuarioParametroById(Long usuarioParametroId) {
    	UsuarioParametro usuarioParametro = usuarioParametroDAO.findById(usuarioParametroId);

        return buildUsuarioParametro(usuarioParametro);
    }

    private UsuarioParametroTO buildUsuarioParametro(UsuarioParametro usuarioParametroId) {
       

        return null;
    }

    public List<UsuarioTO> getAll() {
        List<UsuarioTO> usuarioList = new ArrayList<UsuarioTO>();

     /*   for (Usuario usuario : usuarioDAO.findAll()) {
            usuarioList.add(buildUsuario(usuario));
        }

       */ return usuarioList;
    }

    private void delete(Long userParamId) {
      /*
    	Usuario usuario = usuarioDAO.findById(userId);
        usuarioDAO.delete(usuario);
        */
    }

    
}
