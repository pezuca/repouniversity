package com.repouniversity.web.exceptions;

public class EntityRemovedException extends EntityException {

    public static final String DEFAULT_ENTITY_REMOVED_MESSAGE = "system.entity.removed";

    private static final long serialVersionUID = 2384555628874778492L;

    public EntityRemovedException() {
        super(DEFAULT_ENTITY_REMOVED_MESSAGE);
        setMessageKey(DEFAULT_ENTITY_REMOVED_MESSAGE);
    }

    public EntityRemovedException(String message, Throwable cause) {
        super(message, cause);
        setMessageKey(DEFAULT_ENTITY_REMOVED_MESSAGE);
    }

    public EntityRemovedException(String message) {
        super(message);
        setMessageKey(DEFAULT_ENTITY_REMOVED_MESSAGE);
    }
}
