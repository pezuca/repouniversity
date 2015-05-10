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

    public List<Materia> getAll() {
        return materiaDao.findAll();
    }

    public Materia getById(Long idAluDoc) {
        return materiaDao.findById(idAluDoc);
    }

    public Materia save(Materia materia) {
        return materiaDao.insert(materia);
    }

    public void delete(Long materiaId) {
        Materia materia = materiaDao.findById(materiaId);
        materiaDao.delete(materia);
    }
}
