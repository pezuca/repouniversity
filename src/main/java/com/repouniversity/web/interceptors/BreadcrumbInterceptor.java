package com.repouniversity.web.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.repouniversity.model.breadcrumb.BreadcrumbTree;
import com.repouniversity.model.breadcrumb.Node;
import com.repouniversity.web.utils.HTTPSessionManagerUtil;

public class BreadcrumbInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            String[] nameLevel =  ((String)request.getParameter("bread")).split("-");
            
            this.addNode(nameLevel[0], Integer.parseInt(nameLevel[1]), request);
        } catch (Exception e) {
            return true;
        }
        return true;
    }
    
    public void addNode(String nodeName, int level, HttpServletRequest request) {
        if(request.getServletPath().equalsIgnoreCase("/logout")) {
            this.clean(request);
        }
        
        String referrer = request.getRequestURL() + "?" + request.getQueryString();
        Node node = new Node(nodeName, referrer, level);
        BreadcrumbTree tree = (BreadcrumbTree) HTTPSessionManagerUtil.getSessionAttribute(request, "breadcrumbTree");
        if (tree == null) {
            tree = new BreadcrumbTree();
            HTTPSessionManagerUtil.setSessionAttribute(request, "breadcrumbTree", tree);
        }
        tree.addNode(node);
    }

    private void clean(HttpServletRequest request) {
        HTTPSessionManagerUtil.removeSessionAttribute(request, "breadcrumbTree");
    }
}
