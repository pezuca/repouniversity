package com.repouniversity.web.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Throws when there is no enough permission to do a modification
 * 
 * @author federico triay
 * 
 */

@ResponseStatus(value = HttpStatus.CONFLICT)
public class StrongPasswordException extends RuntimeException {

	private static final long serialVersionUID = 7645557427982607694L;

	public StrongPasswordException(String message) {
		super(message);
	}

	public StrongPasswordException(String message, Throwable cause) {
		super(message, cause);
	}

}
