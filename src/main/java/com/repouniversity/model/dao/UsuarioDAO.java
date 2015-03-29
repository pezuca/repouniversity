package com.repouniversity.model.dao;

import com.repouniversity.model.entity.Usuario;


/**
 * @author Federico Tray
 */
public interface UsuarioDAO extends GenericDAO<Usuario> {

    /**
     * Retrieve user based on username and password
     * 
     * @param username
     * @param password
     * @return User TO object
     */
    Usuario getUserByUsernameAndPass(String username, String password);
}
