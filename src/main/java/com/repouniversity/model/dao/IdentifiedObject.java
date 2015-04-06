package com.repouniversity.model.dao;

import java.io.Serializable;

public interface IdentifiedObject extends Serializable {

    public Long getId();

    public void setId(Long t);
}
