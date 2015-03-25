package com.repouniversity.web.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Federico Tray
 */
public class HTTPSessionManagerUtil {

    public static String ATTR_LOGIN = "login";

    private HTTPSessionManagerUtil() {} // Utility class


    /**
     * Gets an attribute from the request session
     * @param request HTTP request
     * @param attr name of the attribute to get
     * @return the attribute value or null if not found
     */
    public static Object getSessionAttribute(HttpServletRequest request, String attr) {
        return request.getSession().getAttribute(attr);
    }

    /**
     * Gets the string value of an attribute from the request session
     * @param request HTTP request
     * @param attr name of the attribute to get as string
     * @return the attribute string value or null if not found
     */
    public static String getSessionAttributeAsString(HttpServletRequest request, String attr) {
        return (String) request.getSession().getAttribute(attr);
    }

    /**
     * Sets an attribute into the request session
     * @param request HTTP request
     * @param attr name of the attribute to be set
     * @param value value of the attribute to be set
     */
    public static void setSessionAttribute(HttpServletRequest request, String attr, Object value) {
        request.getSession().setAttribute(attr, value);
    }
    
    /**
     * Removes an attribute into the request session
     * @param request HTTP request
     * @param attr name of the attribute to be set
     */
    public static void removeSessionAttribute(HttpServletRequest request, String attr) {
        request.getSession().removeAttribute(attr);
    }

}
