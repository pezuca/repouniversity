package com.repouniversity.web.exceptions;

/**
 * The main business layer exception. It encapsulates a messageKey and parameters so controller layer would display user friendly error messages.
 */
public class BusinessException extends RuntimeException {

    private static final long serialVersionUID = 511555982503689420L;

    private String messageKey = null;

    private Object[] params;

    public BusinessException(String messageKey, String message, Throwable cause) {
        super(message, cause);
        setMessageKey(messageKey);
    }

    public BusinessException(String message, Throwable cause) {
        super(message, cause);
    }

    public BusinessException(String message) {
        super(message);
    }

    public String getMessageKey() {
        return messageKey;
    }

    public void setMessageKey(String messageKey) {
        this.messageKey = messageKey;
    }

    public Object[] getParams() {
        return params;
    }

    public void setParams(Object... params) {
        this.params = params;
    }
}
