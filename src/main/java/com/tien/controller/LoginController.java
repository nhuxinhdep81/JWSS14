package com.tien.controller;

import com.tien.model.User;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    private final User user = new User("tien", "123456");

    @GetMapping("/login_form")
    public String loginForm(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String username = "";
        String password = "";

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    username = cookie.getValue();
                } else if ("password".equals(cookie.getName())) {
                    password = cookie.getValue();
                }
            }
        }

        request.setAttribute("username", username);
        request.setAttribute("password", password);

        return "login";
    }

    @PostMapping("/login_save")
    public String loginSave(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam(value = "remember", required = false) String remember,
            HttpSession session,
            HttpServletResponse response
    ) {
        if (username.equals(user.getUsername()) && password.equals(user.getPassword())) {
            session.setAttribute("username", username);

            if (remember != null) {
                Cookie cookieUsername = new Cookie("username", username);
                Cookie cookiePassword = new Cookie("password", password);
                cookieUsername.setMaxAge(60 * 60 );
                cookiePassword.setMaxAge(60 * 60 );
                response.addCookie(cookieUsername);
                response.addCookie(cookiePassword);
            } else {
                Cookie cookieUsername = new Cookie("username", null);
                cookieUsername.setMaxAge(0);
                Cookie cookiePassword = new Cookie("password", null);
                cookiePassword.setMaxAge(0);
                response.addCookie(cookieUsername);
                response.addCookie(cookiePassword);
            }

            return "redirect:/home";
        }

        return "redirect:/login_form";
    }

    @GetMapping("/home")
    public String home(HttpSession session) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login_form";
        }
        return "home";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login_form";
    }
}
