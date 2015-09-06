package com.repouniversity.model.services;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.UsuarioDAO;
import com.repouniversity.model.dao.UsuarioRolDAO;
import com.repouniversity.model.entity.Seguridad;
import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.web.enums.UrlsApplicationEmun;
import com.repouniversity.web.exceptions.LoginFailException;
import com.repouniversity.web.utils.HTTPSessionManagerUtil;

/**
 * @author federico triay
 */
@Service
public class LoginService {

    @Autowired
    private UsuarioDAO userDao;

    @Autowired
    private UsuarioRolDAO usuarioRolDao;

    @Autowired
    private UsuarioRolService usuarioRolService;

    @Autowired
    private UsuarioService usuarioService;
    
    @Autowired
    public SeguridadService seguridadService;
    /**
     * Attempts to perform user login with username and password given, setting
     * up session if successful
     * @param username
     * @param pass
     * @param request
     * @return Redirect url for login
     */
    public String login(String username, String pass, HttpServletRequest request) {

        String result = UrlsApplicationEmun.DASHBOARD.getUrl();
        Usuario userToCheck = usuarioService.findByUserName(username);

        if (userToCheck == null) {
            throw new LoginFailException("User or password are not correct.");
        }

        Long userId = userToCheck.getIdPersona();
        Usuario user = this.userDao.getUserByUsernameAndPass(username, userId + pass);
        
        if (user == null) {
            throw new LoginFailException("User or password are not correct.");
        }
      
        List<Seguridad> lista = seguridadService.getAll();
        Long vigencia = lista.get(0).getVigencia();
        
        Calendar fechaModificacion = Calendar.getInstance();
        fechaModificacion.setTime(user.getFechasys());
        fechaModificacion.add(Calendar.DATE, vigencia.intValue());
        
        Calendar hoy = Calendar.getInstance();
               

       
        if (fechaModificacion.after(hoy)) {
            UsuarioRol usuarioRol = usuarioRolService.getUsuarioById(user.getId());
            HTTPSessionManagerUtil.setSessionAttribute(request, HTTPSessionManagerUtil.ATTR_LOGIN, usuarioRol);
            return result;
        }else{
        	 return "cambiarPass?userId=" + user.getId();
        }
        
        
        
        	
        	

       
    }

    /**
     * Reacts to user logout, removing user data/session
     * @param request
     */
    public void logout(HttpServletRequest request) {
        HTTPSessionManagerUtil.removeSessionAttribute(request, HTTPSessionManagerUtil.ATTR_LOGIN);
    }

    public void loginAnonimo(HttpServletRequest request) {
        // TODO Auto-generated method stub

        UsuarioRol usuarioRol = new UsuarioRol();
        usuarioRol.setId(-1L);
        usuarioRol.setIdAluDoc(-1L);
        usuarioRol.setIdPersona(-1L);
        usuarioRol.setNombreUsuario("anonimo");
        usuarioRol.setRol("anonimo");

        HTTPSessionManagerUtil.setSessionAttribute(request, HTTPSessionManagerUtil.ATTR_LOGIN, usuarioRol);

    }
}
