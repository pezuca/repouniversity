package com.repouniversity.web.exceptions;

public abstract class EntityException extends BusinessException {

    private static final long serialVersionUID = 2384555628874778492L;

    public EntityException(String messageKey, String message, Throwable cause) {
        super(messageKey, message, cause);
    }

    public EntityException(String message, Throwable cause) {
        super(message, cause);
    }

    public EntityException(String message) {
        super(message);
    }
}
