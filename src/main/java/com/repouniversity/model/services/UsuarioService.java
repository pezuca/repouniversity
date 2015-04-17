package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.repouniversity.model.dao.UsuarioDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Docente;
import com.repouniversity.model.entity.Persona;
import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.UsuarioTO;

@Service
@Transactional
public class UsuarioService {

    @Autowired
    private UsuarioDAO usuarioDAO;

    @Autowired
    private PersonaService personaService;

    @Autowired
    private AlumnoService alumnoService;

    @Autowired
    private DocenteService docenteService;

    @Autowired
    private UsuarioRolService usuarioRolService;

    @Transactional
    public Usuario updateUser(Long id, String nombre, String apellido, String mail, String user, String newPassword, String repeatPassword, Boolean activo) {

        Usuario usuario = usuarioDAO.findById(id);

        if (newPassword != null && checkChangePassword(newPassword, repeatPassword)) {
            usuario.setPass(newPassword);
        }
        usuario.setUser(user);
        usuario.setActivo(activo);
        
        Persona persona = personaService.findById(usuario.getIdPersona());

        persona.setNombre(nombre);
        persona.setApellido(apellido);
        persona.setMail(mail);
        
        personaService.update(persona);
        usuarioDAO.update(usuario);

        return usuario;
    }

    @Transactional
    public Usuario saveUser(String nombre, String apellido, String mail, String user, String password, Boolean activo, String rol) {

        Persona persona = new Persona();
        persona.setNombre(nombre);
        persona.setApellido(apellido);
        persona.setMail(mail);
        persona.setActivo(activo);
        persona = personaService.save(persona);

        Usuario usuario = new Usuario();
        usuario.setUser(user);
        usuario.setPass(password);
        usuario.setActivo(activo);
        usuario.setPersona(persona.getId());
        usuarioDAO.insert(usuario);

        if (rol.equalsIgnoreCase("alumno")) {
            Alumno alumno = new Alumno();
            alumno.setActivo(activo);
            alumno.setIdPersona(persona.getId());
            alumnoService.save(alumno);

        } else if (rol.equalsIgnoreCase("docente")) {
            Docente docente = new Docente();
            docente.setActivo(activo);
            docente.setPersona(persona);
            docenteService.save(docente);
        }

        return usuario;
    }

    private boolean checkChangePassword(String newPassword, String repeatPassword) {

        if (StringUtils.isNotBlank(newPassword) && StringUtils.isNotBlank(repeatPassword) && StringUtils.equals(newPassword, repeatPassword)) {
            return true;
        }

        return false;
    }

    public UsuarioTO getUserById(Long usuarioId) {
        Usuario usuario = usuarioDAO.findById(usuarioId);

        return buildUsuario(usuario);
    }

    private UsuarioTO buildUsuario(Usuario usuario) {
        UsuarioTO usuarioTo = new UsuarioTO();
        UsuarioRol usuarioRol = usuarioRolService.getUsuarioById(usuario.getId());

        usuarioTo.setId(usuario.getId());
        usuarioTo.setUser(usuario.getUser());
        usuarioTo.setFechasys(usuario.getFechasys());
        usuarioTo.setActivo(usuario.isActivo());
        usuarioTo.setPersona(personaService.findById(usuarioRol.getIdPersona()));
        usuarioTo.setRol(usuarioRol.getRol());

        return usuarioTo;
    }

    public List<UsuarioTO> getAll() {
        List<UsuarioTO> usuarioList = new ArrayList<UsuarioTO>();

        for (Usuario usuario : usuarioDAO.findAll()) {
            usuarioList.add(buildUsuario(usuario));
        }

        return usuarioList;
    }

    public void delete(Long userId) {
        Usuario usuario = usuarioDAO.findById(userId);
        usuarioDAO.delete(usuario);
    }

    public void completelyDeleteUsuario(UsuarioRol usuarioRol) {
        if (usuarioRol.getRol().equalsIgnoreCase("alumno")) {
            alumnoService.delete(usuarioRol.getIdAluDoc());
        } else if (usuarioRol.getRol().equalsIgnoreCase("docente")) {
            docenteService.delete(usuarioRol.getIdAluDoc());
        }

        delete(usuarioRol.getId());

        personaService.delete(usuarioRol.getIdPersona());
    }
}
