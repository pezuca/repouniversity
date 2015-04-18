package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.repouniversity.model.dao.DocenteDAO;
import com.repouniversity.model.entity.Docente;

@Service
@Transactional
public class DocenteService {

    @Autowired
    private DocenteDAO docenteDao;

    public List<Docente> getAll() {
        return docenteDao.findAll();
    }

    public Docente getById(Long idAluDoc) {
        return docenteDao.findById(idAluDoc);
    }

    public Docente getByCursoMateriaId(Long id) {
        return docenteDao.getByCursoMateriaId(id);
    }
    
    public Docente save(Docente docente) {
        return docenteDao.insert(docente);
    }

    public void delete(Long docenteId) {
        Docente docente = docenteDao.findById(docenteId);
        docenteDao.delete(docente);
    }
}
