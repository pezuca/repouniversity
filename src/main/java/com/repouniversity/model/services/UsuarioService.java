package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.repouniversity.model.cache.CacheManager;
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

    public static final String STRONG_PASS_REGEX = "(?=.*[0-9]){%d%}(?=.*[a-z]){%s%}(?=.*[A-Z]){%S%}(?=.*[@#$\"\\\\!\\?%^&+=]){%c%}(?=\\S+$).{%min%,}";

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
    
    @Autowired
    public PermisoService permisoService;
    
    @Autowired
    public CacheManager cache;
    
    @Transactional
    public Usuario updatePass(Long id, String newPassword, String repeatPassword) {
    	
    	Usuario usuario = usuarioDAO.findById(id);

        Usuario userToUpdate = new Usuario();
        userToUpdate.setId(usuario.getId());
        userToUpdate.setUser(usuario.getUser());
        userToUpdate.setFechasys(usuario.getFechasys());
        userToUpdate.setActivo(usuario.isActivo());
        userToUpdate.setRole(usuario.getRole());
        userToUpdate.setPersona(usuario.getIdPersona());
        userToUpdate.setIdPermiso(usuario.getIdPermiso());
    	
       // Persona persona = personaService.findById(userToUpdate.getIdPersona());
        
    	 if (newPassword != null && checkChangePassword(newPassword, repeatPassword)) {
             checkStrongPassword(newPassword);
             cambioDePassword(newPassword, userToUpdate.getUser(), userToUpdate.getIdPersona());
             userToUpdate.setPass(userToUpdate.getIdPersona() + newPassword);
             usuarioDAO.update(userToUpdate);
         } 
    	 
    	cache.getUsuarioMap().remove(userToUpdate.getId());
    	 
    	return userToUpdate;
    }


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
        userToUpdate.setIdPermiso(usuario.getIdPermiso());

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
        
        cache.getUsuarioMap().remove(userToUpdate.getId());

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
        //se le asigna el maximo permiso.
        usuario.setIdPermiso(1L);
        
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
        cache.getUsuarioMap().put(usuario.getId(), buildUsuario(usuario));

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
           throw new StrongPasswordException("La contrseña no cumple con los criterios de cantidad minimas de numeros (" + seguridad.getNumeros() 
                   + "), cantidad minima de mayusculas (" + seguridad.getMayusculas() + "), cantidad minima de minusculas (" + seguridad.getMayusculas()
                   + "), cantidad minima de caracteres especiales (" + seguridad.getEspeciales()
                   + "), cantidad minima de caracteres (" + seguridad.getLongMinima() + ")."); 
        }
    }

    private void cambioDePassword(String password, String username, Long idPersona) {
    	 
    	Usuario user = this.usuarioDAO.getUserByUsernameAndPass(username, idPersona + password);
           
           if (user != null) {
               throw new StrongPasswordException("Es necesario ingresar una nueva Password distinta a la que tenia");
           }
    
    }
    private boolean checkChangePassword(String newPassword, String repeatPassword) {

        if (StringUtils.isNotBlank(newPassword) && StringUtils.isNotBlank(repeatPassword) && StringUtils.equals(newPassword, repeatPassword)) {
            return true;
        }

        return false;
    }

    public UsuarioTO getUserById(Long usuarioId) {
        Usuario usuario = null;
        UsuarioTO usuarioTO = cache.getUsuarioMap().get(usuarioId);
        
        if(usuarioTO == null) {
            usuario = usuarioDAO.findById(usuarioId);
            usuarioTO = buildUsuario(usuario);
        } 
        
        return usuarioTO;
    }

    private UsuarioTO buildUsuario(Usuario usuario) {
        UsuarioTO usuarioTo = new UsuarioTO();

        usuarioTo.setId(usuario.getId());
        usuarioTo.setUser(usuario.getUser());
        usuarioTo.setFechasys(usuario.getFechasys());
        usuarioTo.setActivo(usuario.isActivo());
        usuarioTo.setPersona(personaService.findById(usuario.getIdPersona()));
        usuarioTo.setRol(roleService.findById(usuario.getRole()).getRole());
        usuarioTo.setPermiso(permisoService.findById(usuario.getIdPermiso()));
        
        if (roleService.findById(usuario.getRole()).getRole().equals("alumno")) {
            usuarioTo.setAlumno(alumnoService.getAlumnoByPersonaId(usuario.getIdPersona()));
        }

        return usuarioTo;
    }

    public List<UsuarioTO> getAll() {
        List<UsuarioTO> usuarioList = new ArrayList<UsuarioTO>();
        List<Long> usuarioIdsTofind = new ArrayList<Long>();
        
        for (Long usuarioId : usuarioDAO.findAllIds()) {
            UsuarioTO usuarioTO = cache.getUsuarioMap().get(usuarioId);
            
            if(usuarioTO == null) {
                usuarioIdsTofind.add(usuarioId);
            } else {
                usuarioList.add(usuarioTO);
            }
        }

        for (Usuario usuario : usuarioDAO.findByIds((Long[]) usuarioIdsTofind.toArray(new Long[0]))) {
            usuarioList.add(buildUsuario(usuario));
        }

        return usuarioList;
    }

    private void delete(Long userId) {
        Usuario usuario = usuarioDAO.findById(userId);
        usuarioDAO.delete(usuario);
        
        cache.getArchivoMap().remove(userId);
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

    public Usuario updateRol(Long userId, String rol, Long permiso) {
        Role role = roleService.findByRoleName(rol);
        Usuario user = usuarioDAO.findById(userId);
        
        if (role.getId() != user.getRole()){
	
	
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
	}
        user.setIdPermiso(permiso);
        
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
