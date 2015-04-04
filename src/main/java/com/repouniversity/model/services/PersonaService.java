package com.repouniversity.model.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.PersonaDAO;
import com.repouniversity.model.entity.Persona;

@Service
@Transactional
public class PersonaService {

    @Autowired
    private PersonaDAO personaDao;

    public Persona findById(Long personaId) {
        return personaDao.findById(personaId);
    }

    @Transactional
    public void update(Persona persona) {
        personaDao.update(persona);
    }
}
