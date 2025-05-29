package com.tien.controller;

import com.tien.model.UserB7;
import com.tien.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Locale;

@Controller
@RequestMapping("/register")
public class RegisterController {


    @Autowired
    private UserService userService;

    private final MessageSource messageSource;

    public RegisterController(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @GetMapping
    public String showForm(Model model) {
        model.addAttribute("user", new UserB7());
        return "register";
    }

    @PostMapping
    public String processForm(@ModelAttribute("user") UserB7 user,
                              Model model,
                              HttpServletRequest request,
                              Locale locale) {

        boolean hasError = false;

        if (user.getUsername() == null || user.getUsername().isEmpty()) {
            model.addAttribute("usernameError", messageSource.getMessage("error.username.empty", null, locale));
            hasError = true;
        }

        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            model.addAttribute("passwordError", messageSource.getMessage("error.password.empty", null, locale));
            hasError = true;
        }

        if (!user.getPassword().equals(user.getConfirmPassword())) {
            model.addAttribute("confirmError", messageSource.getMessage("error.confirmPassword.mismatch", null, locale));
            hasError = true;
        }

        if (user.getEmail() == null || !user.getEmail().matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,6}$")) {
            model.addAttribute("emailError", messageSource.getMessage("error.email.invalid", null, locale));
            hasError = true;
        }

        if (hasError) {
            return "register";
        }
        userService.register(user);


        model.addAttribute("successMessage", messageSource.getMessage("success.register", null, locale));
        return "register";
    }
}
