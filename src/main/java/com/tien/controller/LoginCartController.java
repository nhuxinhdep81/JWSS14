package com.tien.controller;

import com.tien.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginCartController {

    private final User user = new User("tien", "123456");

    @GetMapping("/login_form_cart")
    public String loginForm() {
        return "login_cart";
    }

    @PostMapping("/login_save_cart")
    public String loginSave(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session
    ) {
        if (username.equals(user.getUsername()) && password.equals(user.getPassword())) {
            session.setAttribute("user", user);
            return "redirect:/home_cart";
        }
        return "redirect:/login_form_cart";
    }

    @GetMapping("/home_cart")
    public String home(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login_form_cart";
        }
        return "home_cart";
    }

    @GetMapping("/logout_cart")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login_form_cart";
    }
}
