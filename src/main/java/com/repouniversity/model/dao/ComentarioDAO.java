package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Comentario;
import com.repouniversity.model.entity.TpGrupo;

public interface ComentarioDAO extends GenericDAO<Comentario> {

	List<Comentario> findComentariosForTpGrupo(Long tpGrupoId);

	void saveComentarioTp(long comentarioId, long tpGrupoId);

}
