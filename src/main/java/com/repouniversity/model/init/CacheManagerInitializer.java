package com.repouniversity.model.init;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import com.repouniversity.model.cache.CacheManager;
import com.repouniversity.model.entity.to.UsuarioTO;
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

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        cache.setUsuarioMap(new HashMap<Long, UsuarioTO>());
        
        for (UsuarioTO usuario : usuarioService.getAll()) {
            cache.getUsuarioMap().put(usuario.getId(), usuario);
        }
    }
}
