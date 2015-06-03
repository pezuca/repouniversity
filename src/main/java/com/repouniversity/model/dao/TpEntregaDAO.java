package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.entity.TpEntrega;
import com.repouniversity.model.entity.TpGrupo;

public interface TpEntregaDAO extends GenericDAO<TpEntrega> {

	List<TpEntrega> findTpEntregaForTpGrupo(Long tpgrupoid);


}
