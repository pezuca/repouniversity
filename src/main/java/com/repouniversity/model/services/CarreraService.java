package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.CarreraDAO;
import com.repouniversity.model.entity.Carrera;
import com.repouniversity.model.entity.Materia;
import com.repouniversity.model.entity.to.CarreraTO;

@Service
public class CarreraService {

    @Autowired
    private CarreraDAO carreraDao;
    
    @Autowired
    private MateriaService materiaService;


    public Carrera save(String nombre) {
    	Carrera carrera = new Carrera();
    	carrera.setNombre(nombre);
    	
        return carreraDao.insert(carrera);
    }
    
	public Carrera update(Long carreraId, String nombre) {
		Carrera carrera = carreraDao.findById(carreraId);
		carrera.setNombre(nombre);

		carreraDao.update(carrera);
		
		return carrera;
	}

    public void delete(Long carreraId) {
        Carrera carrera = carreraDao.findById(carreraId);
        carreraDao.delete(carrera);
    }

    public List<Carrera> getAll() {
        return carreraDao.findAll();
    }

    public List<Carrera> findByMateriaId(Long materiaId) {
        return carreraDao.findByMateriaId(materiaId);
    }
    
    public List<Long> getMateriaIds(Long carreraId) {
        return carreraDao.getMateriaIds(carreraId);
    }

	public void asociarMateriasCarreras(Long carreraId, List<Long> listaMaterias) {
		carreraDao.asociaciarMaterias(carreraId, listaMaterias);
	}
	
	public void removerAsociacionesMaterias(Long carreraId) {
		List<Long> materiasIds = getMateriaIds(carreraId);
		
		carreraDao.removerAsociacionesMaterias(carreraId, materiasIds);
	}

	public CarreraTO buildCarrera(Carrera carrera) {
		// TODO Auto-generated method stub
		List<Materia> materias = materiaService.findByIds(getMateriaIds(carrera.getId()));
		
		CarreraTO carreraTo = new CarreraTO();
		carreraTo.setId(carrera.getId());
		carreraTo.setNombre(carrera.getNombre());
		carreraTo.setMaterias(materias);
		
		return carreraTo;
	}
}
