package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.MateriaDAO;
import com.repouniversity.model.entity.Materia;

@Service
public class MateriaService {

    @Autowired
    private MateriaDAO materiaDao;
    
    @Autowired
    private CarreraService carreraService;

    public List<Materia> getAll() {
        return materiaDao.findAll();
    }

    public Materia getById(Long idAluDoc) {
        return materiaDao.findById(idAluDoc);
    }

    public Materia save(String nombre, String descripcion) {
        Materia materia = new Materia();
        materia.setNombre(nombre);
        materia.setDescripcion(descripcion);
        
        return materiaDao.insert(materia);
    }

    public Materia update(Long materiaId, String nombre, String descripcion) {
        Materia materia = materiaDao.findById(materiaId);
        
        materia.setNombre(nombre);
        materia.setDescripcion(descripcion);
        
        materiaDao.update(materia);
        
        return materia;
    }
    
    public void delete(Long materiaId) {
        Materia materia = materiaDao.findById(materiaId);
        materiaDao.delete(materia);
    }
}
