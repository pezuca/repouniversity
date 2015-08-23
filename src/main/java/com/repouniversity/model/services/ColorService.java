package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.ColorDAO;
import com.repouniversity.model.entity.Color;

@Service
public class ColorService {

    @Autowired
    private ColorDAO colorDAO;
   

    public Color getColorById(Long colorId) {
    	Color color = colorDAO.findById(colorId);

        return color;
    }


    public List<Color> getAll() {

        return colorDAO.findAll();
    }

    /*private void delete(Long parametroId) {
        Parametro parametro = parametroDAO.findById(parametroId);
        parametroDAO.delete(parametro);
    }*/

    
}
