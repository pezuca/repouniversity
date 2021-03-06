package com.repouniversity.model.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.PersonaDAO;
import com.repouniversity.model.entity.Persona;

@Service
public class PersonaService {

    @Autowired
    private PersonaDAO personaDao;

    public Persona findById(Long personaId) {
        return personaDao.findById(personaId);
    }

    public void update(Persona persona) {
        personaDao.update(persona);
    }
    
    public Persona save(Persona persona) {
        return personaDao.insert(persona);
    }

    public void delete(Long personaId) {
        Persona persona = personaDao.findById(personaId);
        personaDao.delete(persona);
    }
}
