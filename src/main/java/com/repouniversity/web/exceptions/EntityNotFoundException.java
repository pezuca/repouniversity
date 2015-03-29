package com.repouniversity.web.exceptions;

public class EntityNotFoundException extends EntityException {

    public static final String DEFAULT_NOT_FOUND_EXCEPTION = "system.entity.notFound";

    private static final long serialVersionUID = 2384555628874778492L;

    public EntityNotFoundException() {
        super("The requested entity was not found");
        setMessageKey(DEFAULT_NOT_FOUND_EXCEPTION);
    }

    public EntityNotFoundException(String messageKey, String message, Throwable cause) {
        super(messageKey, message, cause);
    }

    public EntityNotFoundException(String message, Throwable cause) {
        super(message, cause);
        setMessageKey(DEFAULT_NOT_FOUND_EXCEPTION);
    }

    public EntityNotFoundException(String message) {
        super(message);
        setMessageKey(DEFAULT_NOT_FOUND_EXCEPTION);
    }
}
