package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.CarreraDAO;
import com.repouniversity.model.entity.Carrera;

@Service
public class CarreraService {

    @Autowired
    private CarreraDAO carreraDao;

    public void save(Carrera carrera) {
        carreraDao.insert(carrera);
    }

    public void delete(Long carreraId) {
        Carrera carrera = carreraDao.findById(carreraId);
        carreraDao.delete(carrera);
    }

    public List<Carrera> getAll() {
        return carreraDao.findAll();
    }
}
