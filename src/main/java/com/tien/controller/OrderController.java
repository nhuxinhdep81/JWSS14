package com.tien.controller;

import com.tien.model.ProductB5;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @GetMapping
    public String showOrders(HttpSession session, Model model) {
        if (session.getAttribute("user") == null) return "redirect:/login_form";

        List<ProductB5> orders = getOrderList(session);
        model.addAttribute("orders", orders);
        return "orders";
    }


    @PostMapping("/add")
    public String addOrder(@ModelAttribute ProductB5 product, HttpSession session) {
        List<ProductB5> orders = getOrderList(session);
        orders.add(product);
        session.setAttribute("orders", orders);
        return "redirect:/orders";
    }

    @GetMapping("/edit")
    public String showEditForm(@RequestParam String orderId, HttpSession session, Model model) {
        List<ProductB5> orders = getOrderList(session);
        for (ProductB5 p : orders) {
            if (p.getOrderId().equals(orderId)) {
                model.addAttribute("product", p);
                break;
            }
        }
        return "edit_order";
    }

    @PostMapping("/update")
    public String updateOrder(@ModelAttribute ProductB5 updatedProduct, HttpSession session) {
        List<ProductB5> orders = getOrderList(session);
        for (ProductB5 p : orders) {
            if (p.getOrderId().equals(updatedProduct.getOrderId())) {
                p.setProductName(updatedProduct.getProductName());
                p.setQuantity(updatedProduct.getQuantity());
                break;
            }
        }
        session.setAttribute("orders", orders);
        return "redirect:/orders";
    }

    @GetMapping("/delete")
    public String deleteOrder(@RequestParam String orderId, HttpSession session) {
        List<ProductB5> orders = getOrderList(session);
        orders.removeIf(p -> p.getOrderId().equals(orderId));
        return "redirect:/orders";
    }

    private List<ProductB5> getOrderList(HttpSession session) {
        List<ProductB5> orders = (List<ProductB5>) session.getAttribute("orders");
        return (orders != null) ? orders : new ArrayList<>();
    }
}
