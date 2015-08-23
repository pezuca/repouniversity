package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.UsuarioParametro;
import com.repouniversity.model.entity.to.UsuarioParametroTO;

/**
 * @author Federico Paradela
 */
public interface UsuarioParametroDAO extends GenericDAO<UsuarioParametro> {

	List<UsuarioParametro> findUsuarioParametroforUsuario(Long usuarioId);

	List<UsuarioParametro> findUsuarioParametroActivoforUsuario(Long usuarioId);
  
    
}
