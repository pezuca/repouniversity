package com.repouniversity.model.init;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import com.repouniversity.model.cache.CacheManager;
import com.repouniversity.model.entity.to.ArchivoTO;
import com.repouniversity.model.entity.to.CursoTO;
import com.repouniversity.model.entity.to.UsuarioTO;
import com.repouniversity.model.services.ArchivoService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.UsuarioService;

/**
 * Web application listener
 */
@Service
public class CacheManagerInitializer implements ApplicationListener<ContextRefreshedEvent> {
    
    @Autowired
    private CacheManager cache;
    
    @Autowired
    private UsuarioService usuarioService;
    
    @Autowired
    private ArchivoService archivoService;
    
    @Autowired
    private CursoService cursoService;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        cache.setUsuarioMap(new HashMap<Long, UsuarioTO>());
        cache.setArchivoMap(new HashMap<Long, ArchivoTO>());
        cache.setCursoMap(new HashMap<Long, CursoTO>());
        
        for (UsuarioTO usuario : usuarioService.getAll()) {
            cache.getUsuarioMap().put(usuario.getId(), usuario);
        }
        
        for (ArchivoTO archivo : archivoService.getAll()) {
            cache.getArchivoMap().put(archivo.getId(), archivo);
        }
        
        for (CursoTO curso : cursoService.getAll()) {
            cache.getCursoMap().put(curso.getId(), curso);
        }
    }
}
