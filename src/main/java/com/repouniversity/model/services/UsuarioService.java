package com.repouniversity.model.services;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.UsuarioDAO;
import com.repouniversity.model.entity.Persona;
import com.repouniversity.model.entity.Usuario;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioDAO usuarioDAO;
    
    @Autowired
    private PersonaService personaService;

    @Transactional
    public Usuario updateUser(Long id, String nombre, String apellido, String mail, String newPassword, String repeatPassword) {

        Usuario usuario = usuarioDAO.findById(id);

        if (checkChangePassword(newPassword, repeatPassword)) {
            usuario.setPass(newPassword);
        }

        Persona persona = personaService.findById(usuario.getIdPersona());
        
        persona.setNombre(nombre);
        persona.setApellido(apellido);
        persona.setMail(mail);

        personaService.update(persona);
        usuarioDAO.update(usuario);

        return usuario;
    }

    private boolean checkChangePassword(String newPassword, String repeatPassword) {

        if (StringUtils.isNotBlank(newPassword) && StringUtils.isNotBlank(repeatPassword) && StringUtils.equals(newPassword, repeatPassword)) {
            return true;
        }

        return false;
    }

    public Usuario getUserById(Long usuarioId) {
        return usuarioDAO.findById(usuarioId);
    }
}
