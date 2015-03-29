package com.repouniversity.web.exceptions;

public class EntityAlreadyExistsException extends EntityException {

    public static final String DEFAULT_ENTITY_EXISTS = "system.entity.alreadyExists";

    private static final long serialVersionUID = 2384555628874778492L;

    public EntityAlreadyExistsException() {
        super("Entity already exists");
        setMessageKey(DEFAULT_ENTITY_EXISTS);
    }

    public EntityAlreadyExistsException(String messageKey, String message, Throwable cause) {
        super(messageKey, message, cause);
    }

    public EntityAlreadyExistsException(String message, Throwable cause) {
        super(message, cause);
        setMessageKey(DEFAULT_ENTITY_EXISTS);
    }

    public EntityAlreadyExistsException(String message) {
        super(message);
        setMessageKey(DEFAULT_ENTITY_EXISTS);
    }
}
