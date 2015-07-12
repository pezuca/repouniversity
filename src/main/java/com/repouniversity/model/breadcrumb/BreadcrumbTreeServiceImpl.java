package com.repouniversity.model.breadcrumb;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

//@Service
public class BreadcrumbTreeServiceImpl implements BreadcrumbTreeService {
    
    public void addNode(String nodeName, int level, HttpServletRequest request) {
        String referrer = request.getHeader("referer");
        Node node = new Node(nodeName, referrer, level);
        BreadcrumbTree tree = (BreadcrumbTree) request.getSession().getAttribute("breadcrumb");
        if (tree == null) {
            tree = new BreadcrumbTree();
            request.getSession().setAttribute("breadcrumb", tree);
        }
        tree.addNode(node);
    }
}
