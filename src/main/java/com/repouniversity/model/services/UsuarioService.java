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
import com.repouniversity.model.entity.Role;
import com.repouniversity.model.entity.Seguridad;
import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.UsuarioTO;
import com.repouniversity.web.exceptions.StrongPasswordException;

@Service
public class UsuarioService {

    public static final String STRONG_PASS_REGEX = "(?=.*[0-9]){%d%}(?=.*[a-z]){%s%}(?=.*[A-Z]){%S%}(?=.*[@#$%^&+=]){%c%}(?=\\S+$).{%min%,}";

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

    @Autowired
    private RoleService roleService;

    @Autowired
    private UsuarioParametroService usuarioParametroService;

    @Autowired
    public SeguridadService seguridadService;

    @Transactional
    public Usuario updateUser(Long id, String nombre, String apellido, String mail, String user, String newPassword, String repeatPassword, Long carreraId) {

        Usuario usuario = usuarioDAO.findById(id);

        Usuario userToUpdate = new Usuario();
        userToUpdate.setId(usuario.getId());
        userToUpdate.setUser(usuario.getUser());
        userToUpdate.setFechasys(usuario.getFechasys());
        userToUpdate.setActivo(usuario.isActivo());
        userToUpdate.setRole(usuario.getRole());
        userToUpdate.setPersona(usuario.getIdPersona());

        if (StringUtils.isNotBlank(user)) {
            userToUpdate.setUser(user);
        }

        Persona persona = personaService.findById(userToUpdate.getIdPersona());

        persona.setNombre(nombre);
        persona.setApellido(apellido);
        persona.setMail(mail);

        personaService.update(persona);

        if (newPassword != null && checkChangePassword(newPassword, repeatPassword)) {
            checkStrongPassword(newPassword);
            userToUpdate.setPass(persona.getId() + newPassword);
            usuarioDAO.update(userToUpdate);
        } else {
            usuarioDAO.updateUserWithoutPass(userToUpdate);
        }

        UsuarioRol usuarioRol = usuarioRolService.getUsuarioById(id);
        if (usuarioRol.getRol().equals("alumno") && carreraId != null) {
            Alumno alumno = alumnoService.getAlumnoByIdDao(usuarioRol.getIdAluDoc());
            alumno.setIdCarrera(carreraId);

            alumnoService.update(alumno);
        }

        return userToUpdate;
    }

    @Transactional
    public Usuario saveUser(String nombre, String apellido, String mail, String user, String password, String rol, Long carreraId) {

        checkStrongPassword(password);

        Persona persona = new Persona();
        persona.setNombre(nombre);
        persona.setApellido(apellido);
        persona.setMail(mail);
        persona.setActivo(Boolean.TRUE);
        persona = personaService.save(persona);

        Usuario usuario = new Usuario();
        usuario.setUser(user);
        usuario.setPass(persona.getId() + password);
        usuario.setPersona(persona.getId());
        usuario.setRole(roleService.findByRoleName(rol).getId());

        usuarioDAO.insert(usuario);

        if (rol.equalsIgnoreCase("alumno")) {
            Alumno alumno = new Alumno();
            alumno.setIdPersona(persona.getId());
            alumno.setIdCarrera(carreraId);
            alumnoService.save(alumno);

        } else if (rol.equalsIgnoreCase("docente")) {
            Docente docente = new Docente();
            docente.setPersonaId(persona.getId());
            docenteService.save(docente);
        }

        usuarioParametroService.crearParametro(usuario.getId(), usuario.getRole());

        return usuario;
    }

    private void checkStrongPassword(String password) {
        String regexOrg = new String(STRONG_PASS_REGEX);

        Seguridad seguridad = seguridadService.getAll().get(0);

        regexOrg = regexOrg.replaceAll("%d%", seguridad.getNumeros().toString());
        regexOrg = regexOrg.replaceAll("%s%", seguridad.getMinusculas().toString());
        regexOrg = regexOrg.replaceAll("%S%", seguridad.getMayusculas().toString());
        regexOrg = regexOrg.replaceAll("%c%", seguridad.getEspeciales().toString());
        regexOrg = regexOrg.replaceAll("%min%", seguridad.getLongMinima().toString());

        if(!password.matches(regexOrg)) {
           throw new StrongPasswordException("La contrseña no cumple con: \nContidad de numeros: " + seguridad.getNumeros() 
                   + "\nCantidad de mayusculas: " + seguridad.getMinusculas() + "\nCantidad de minusculas: "
                   + "\nCantidad de caracteres especiales: " + seguridad.getEspeciales()
                   + "\nCantidad minima de caracteres: " + seguridad.getLongMinima()); 
        }
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

        if (usuarioRol.getRol().equals("alumno")) {
            usuarioTo.setAlumno(alumnoService.getAlumnoById(usuarioRol.getIdAluDoc()));
        }

        return usuarioTo;
    }

    public List<UsuarioTO> getAll() {
        List<UsuarioTO> usuarioList = new ArrayList<UsuarioTO>();

        for (Usuario usuario : usuarioDAO.findAll()) {
            usuarioList.add(buildUsuario(usuario));
        }

        return usuarioList;
    }

    private void delete(Long userId) {
        Usuario usuario = usuarioDAO.findById(userId);
        usuarioDAO.delete(usuario);
    }

    @Transactional
    public void completelyDeleteUsuario(UsuarioRol usuarioRol) {
        if (usuarioRol.getRol().equalsIgnoreCase("alumno")) {
            alumnoService.delete(usuarioRol.getIdAluDoc());
        } else if (usuarioRol.getRol().equalsIgnoreCase("docente")) {
            docenteService.delete(usuarioRol.getIdAluDoc());
        }

        delete(usuarioRol.getId());

        personaService.delete(usuarioRol.getIdPersona());
    }

    public Usuario updateRol(Long userId, String rol) {
        Role role = roleService.findByRoleName(rol);
        Usuario user = usuarioDAO.findById(userId);

        if (user.getRole() == 2L || ((user.getRole() == 4L || user.getRole() == 1L) && role.getId() == 3L)) {
            docenteService.delete(usuarioRolService.getUsuarioById(userId).getIdAluDoc());

            if (role.getId() == 3L) {
                Alumno alumno = alumnoService.findByPersonaId(user.getIdPersona(), Boolean.FALSE);

                if (alumno != null) {
                    alumnoService.unDelete(alumno.getId());
                } else {
                    alumno = new Alumno();
                    alumno.setIdPersona(user.getIdPersona());
                    alumnoService.save(alumno);
                }
            }
        }

        if (user.getRole() == 3L || ((user.getRole() == 4L || user.getRole() == 1L) && role.getId() == 2L)) {
            alumnoService.delete(usuarioRolService.getUsuarioById(userId).getIdAluDoc());

            if (role.getId() == 2L) {
                Docente docente = docenteService.findByPersonaId(user.getIdPersona(), Boolean.FALSE);

                if (docente != null) {
                    docenteService.unDelete(docente.getId());
                } else {
                    docente = new Docente();
                    docente.setPersonaId(user.getIdPersona());
                    docenteService.save(docente);
                }
            }
        }

        user.setRole(role.getId());
        usuarioDAO.updateUserWithoutPass(user);

        usuarioParametroService.eliminarParametro(user.getId());
        usuarioParametroService.crearParametro(user.getId(), role.getId());

        return user;
    }

    public List<UsuarioTO> getAllForSeguridad(UsuarioRol usuario) {
        List<UsuarioTO> listaUsuariosSeguridad = new ArrayList<UsuarioTO>();

        for (UsuarioTO usuarioTO : getAll()) {
            if (usuarioTO.getId() != usuario.getId()) {
                listaUsuariosSeguridad.add(usuarioTO);
            }
        }

        return listaUsuariosSeguridad;
    }

    public Usuario findByUserName(String user) {
        return usuarioDAO.findByUserName(user);
    }
}
