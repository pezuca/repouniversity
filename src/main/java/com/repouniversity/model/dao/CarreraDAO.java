package com.repouniversity.model.dao;

import java.util.List;

import com.repouniversity.model.entity.Carrera;

public interface CarreraDAO extends GenericDAO<Carrera> {

    List<Carrera> findByMateriaId(Long cursoId);

    List<Long> getMateriaIds(Long carreraId);

    void removerAsociacionesMaterias(Long carreraId, List<Long> materiasIds);

//    void asociaciarMaterias(Long carreraId, List<Long> listaMaterias);
}