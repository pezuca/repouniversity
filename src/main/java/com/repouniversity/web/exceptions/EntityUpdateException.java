package com.repouniversity.web.exceptions;

public class EntityUpdateException extends EntityException {

    public static final String DEFAULT_ENTITY_UPDATE_MESSAGE = "system.entity.update";

    private static final long serialVersionUID = 2384555628874778492L;

    public EntityUpdateException() {
        super(DEFAULT_ENTITY_UPDATE_MESSAGE);
        setMessageKey(DEFAULT_ENTITY_UPDATE_MESSAGE);
    }

    public EntityUpdateException(String message, Throwable cause) {
        super(message, cause);
        setMessageKey(DEFAULT_ENTITY_UPDATE_MESSAGE);
    }

    public EntityUpdateException(String message) {
        super(message);
        setMessageKey(DEFAULT_ENTITY_UPDATE_MESSAGE);
    }
}
