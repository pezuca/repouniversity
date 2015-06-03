package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.CarreraMateriaDAO;
import com.repouniversity.model.entity.CarreraMateria;

@Service
public class CarreraMateriaService {

    @Autowired
    private CarreraMateriaDAO carreraMateriaDao;
    
    @Autowired
    private MateriaService materiaService;


    public void save(List<Long> idsMateria, Long idCarrera) {
        
        for (Long materia : idsMateria) {
            CarreraMateria carreraMateria = new CarreraMateria();
            carreraMateria.setIdCarrera(idCarrera);
            carreraMateria.setIdMateria(materia);
            
            carreraMateriaDao.insert(carreraMateria);
        }
    }
    
    public void delete(Long carreraId, List<Long> materiaIds) {
        
        for (Long materiaId : materiaIds) {
            CarreraMateria carreraMateria = new CarreraMateria();
            
            carreraMateria.setIdCarrera(carreraId);
            carreraMateria.setIdMateria(materiaId);
            
            carreraMateriaDao.delete(carreraMateria);
        }
    }
}
