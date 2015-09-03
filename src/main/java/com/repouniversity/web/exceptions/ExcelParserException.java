package com.repouniversity.web.exceptions;

public class ExcelParserException extends BusinessException {

    private static final long serialVersionUID = 2384555628874778492L;

    public ExcelParserException(String messageKey, String message, Throwable cause) {
        super(messageKey, message, cause);
    }

    public ExcelParserException(String message, Throwable cause) {
        super(message, cause);
    }

    public ExcelParserException(String message) {
        super(message);
    }
}
