package com.tien.controller;

import com.tien.model.OrderB8;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class OrderControllerB8 {

    @GetMapping("/order_form")
    public String showOrderForm() {
        return "order";
    }

    @PostMapping("/order_save")
    public String saveOrder(
            @RequestParam("customerName") String customerName,
            @RequestParam("product") String product,
            @RequestParam("quantity") int quantity,
            HttpSession session,
            Model model
    ) {
        OrderB8 order = new OrderB8(customerName, product, quantity);
        session.setAttribute("order", order);
        model.addAttribute("message", "Đặt hàng thành công!");
        return "order";
    }

    @GetMapping("/order_view")
    public String viewOrder(HttpSession session, Model model) {
        OrderB8 order = (OrderB8) session.getAttribute("order");
        if (order != null) {
            model.addAttribute("order", order);
        } else {
            model.addAttribute("message", "Chưa có đơn hàng nào.");
        }
        return "order_view";
    }
}
