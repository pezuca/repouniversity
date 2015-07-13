package com.repouniversity.model.breadcrumb;

import java.util.ArrayList;
import java.util.List;

public class BreadcrumbTree {

    private List<Node> breadCrumb;

    private Node findNode(Node node) {
        for (Node n : breadCrumb) {
            if (n.getLevel() == node.getLevel()) {
                return n;
            }
        }
        return null;
    }

    /**
     * Constructor
     */
    public BreadcrumbTree() {
        breadCrumb = new ArrayList<>();
    }

    /**
     * Add node in the breadcrumb
     * @param node
     */
    public void addNode(Node node) {
        Node c = findNode(node);
        if (c != null) {
            int position = breadCrumb.indexOf(c);
            for (int i = breadCrumb.size() - 1; i >= position; i--) {
                breadCrumb.remove(i);
            }
        } else {
//            if (breadCrumb.size() > 0) {
//                breadCrumb.get(breadCrumb.size() - 1).setUrl(node.getUrl());
//            }
        }
        breadCrumb.add(node);

        List<Node> nodeToRemove = new ArrayList<>();
        for (int i = 0; i < breadCrumb.size() - 1; i++) {
            if (breadCrumb.get(i).getLevel() >= breadCrumb.get(breadCrumb.size() - 1).getLevel()) {
                nodeToRemove.add(breadCrumb.get(i));
            }
        }

        for (Node remove : nodeToRemove) {
            breadCrumb.remove(remove);
        }
    }

    /**
     * Return the entire breadcrumb
     * @return
     */
    public List<Node> getTree() {
        return breadCrumb;
    }
}
