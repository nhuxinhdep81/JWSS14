package com.tien.controller;

import com.tien.model.ProductB4;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.net.URLEncoder;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Controller
@RequestMapping("/cart")
public class CartController {

    @GetMapping
    public String showCart(HttpSession session, Model model, HttpServletRequest request) {
        List<ProductB4> cart = (List<ProductB4>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();
        model.addAttribute("cart", cart);

        List<String> productNames = new ArrayList<>();
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().startsWith("product_")) {
                    productNames.add(URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8));
                }
            }
        }
        model.addAttribute("productNames", productNames);
        return "cart";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam String name,
                            @RequestParam int quantity,
                            HttpSession session,
                            HttpServletResponse response) {

        // Thêm vào session
        List<ProductB4> cart = (List<ProductB4>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();

        Optional<ProductB4> existing = cart.stream()
                .filter(p -> p.getName().equalsIgnoreCase(name))
                .findFirst();

        if (existing.isPresent()) {
            existing.get().setQuantity(existing.get().getQuantity() + quantity);
        } else {
            cart.add(new ProductB4(name, quantity));
        }

        session.setAttribute("cart", cart);

        String encodedName = URLEncoder.encode(name, StandardCharsets.UTF_8);
        Cookie productCookie = new Cookie("product_" + UUID.randomUUID(), encodedName);
        productCookie.setMaxAge(60 * 60 );
        response.addCookie(productCookie);

        return "redirect:/cart";
    }

    @GetMapping("/delete")
    public String deleteItem(@RequestParam String name, HttpSession session) {
        List<ProductB4> cart = (List<ProductB4>) session.getAttribute("cart");
        if (cart != null) {
            cart.removeIf(p -> p.getName().equalsIgnoreCase(name));
        }
        return "redirect:/cart";
    }
}
