package com.repouniversity.model.dao;

import java.util.List;

/**
 * Main Interface for Dao Object
 * @author Federico Tray
 * @param <E> Entity
 * @param <I> Id Object
 */
public interface GenericDAO<E> {

    void update(E e);
    
    E insert(E e);

    boolean delete(E e);

    boolean unDelete(E t);

    E findById(Long id);
    
    List<E> findByIds(final Long... keys);

    /**
     * Retrieve all records from the data base. Like a "SELECT * FROM"
     */
    List<E> findAll();
}
