package com.repouniversity.model.dao;

import java.io.Serializable;
import java.util.List;

/**
 * Main Interface for Dao Object
 * @author Federico Tray
 * @param <E> Entity
 * @param <I> Id Object
 */
public interface GenericDAO<E, I extends Serializable> {

    void saveOrUpdate(E e);

    void delete(E e);

    E findById(I id);

    E findByIdSafe(I id);

    /**
     * Retrieve all records from the data base. Like a "SELECT * FROM"
     */
    List<E> getAll();
    
    List<E> getByIds(List<Integer> ids);
}
