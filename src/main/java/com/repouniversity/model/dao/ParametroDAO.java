package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Parametro;

/**
 * @author Federico Paradela
 */
public interface ParametroDAO extends GenericDAO<Parametro> {

	List<Parametro> findParametrosByRole(Long roleId);


}
