package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.entity.TpGrupo;

public interface TpGrupoDAO extends GenericDAO<TpGrupo> {

	List<TpGrupo> findTpGrupoForGrupo(Long grupoid);


}
