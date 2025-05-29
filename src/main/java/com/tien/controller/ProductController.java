package com.tien.controller;

import com.tien.model.Product;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {

    @GetMapping("product_form")
    public String productForm(Model model) {
        Product product = new Product();
        model.addAttribute("product", product);
        return "product_form";
    }

    @PostMapping("product_save")
    public String productSave(@ModelAttribute Product product, HttpServletResponse response, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        int productCount = 0;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().startsWith("product_") && cookie.getName().endsWith("_id")) {
                    productCount++;
                }
            }
        }

        String id = product.getId() != null ? product.getId().replaceAll("\\s+", "") : "";
        String name = product.getName() != null ? product.getName().replaceAll("\\s+", "") : "";
        String price = product.getPrice() != null ? product.getPrice().replaceAll("\\s+", "") : "";

        Cookie idCookie = new Cookie("product_" + productCount + "_id", id);
        idCookie.setMaxAge(24 * 60 * 60); // 1 ngày
        idCookie.setPath("/");
        response.addCookie(idCookie);

        Cookie nameCookie = new Cookie("product_" + productCount + "_name", name);
        nameCookie.setMaxAge(24 * 60 * 60);
        nameCookie.setPath("/");
        response.addCookie(nameCookie);

        Cookie priceCookie = new Cookie("product_" + productCount + "_price", price);
        priceCookie.setMaxAge(24 * 60 * 60);
        priceCookie.setPath("/");
        response.addCookie(priceCookie);

        return "redirect:/product_list";
    }

    @GetMapping("product_list")
    public String productList(Model model, HttpServletRequest request) {
        List<Product> products = new ArrayList<>();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < 100; i++) {
                String id = null, name = null, price = null;
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("product_" + i + "_id")) {
                        id = cookie.getValue();
                    } else if (cookie.getName().equals("product_" + i + "_name")) {
                        name = cookie.getValue();
                    } else if (cookie.getName().equals("product_" + i + "_price")) {
                        price = cookie.getValue();
                    }
                }
                if (id != null && name != null && price != null) {
                    products.add(new Product(id, name, price));
                } else {
                    break;
                }
            }
        }
        model.addAttribute("products", products);
        return "product_list";
    }

    @PostMapping("product_delete")
    public String productDelete(@RequestParam("index") int index, HttpServletResponse response, HttpServletRequest request) {
        // Lấy danh sách cookie
        Cookie[] cookies = request.getCookies();
        List<Product> products = new ArrayList<>();
        if (cookies != null) {
            for (int i = 0; i < 100; i++) {
                String id = null, name = null, price = null;
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("product_" + i + "_id")) {
                        id = cookie.getValue();
                    } else if (cookie.getName().equals("product_" + i + "_name")) {
                        name = cookie.getValue();
                    } else if (cookie.getName().equals("product_" + i + "_price")) {
                        price = cookie.getValue();
                    }
                }
                if (id != null && name != null && price != null) {
                    products.add(new Product(id, name, price));
                } else {
                    break;
                }
            }
        }

        if (index >= 0 && index < products.size()) {
            Cookie idCookie = new Cookie("product_" + index + "_id", "");
            idCookie.setMaxAge(0); // Xóa cookie
            idCookie.setPath("/");
            response.addCookie(idCookie);

            Cookie nameCookie = new Cookie("product_" + index + "_name", "");
            nameCookie.setMaxAge(0);
            nameCookie.setPath("/");
            response.addCookie(nameCookie);

            Cookie priceCookie = new Cookie("product_" + index + "_price", "");
            priceCookie.setMaxAge(0);
            priceCookie.setPath("/");
            response.addCookie(priceCookie);

            for (int i = index + 1; i < products.size(); i++) {
                Product p = products.get(i);
                Cookie newIdCookie = new Cookie("product_" + (i - 1) + "_id", p.getId());
                newIdCookie.setMaxAge(24 * 60 * 60);
                newIdCookie.setPath("/");
                response.addCookie(newIdCookie);

                Cookie newNameCookie = new Cookie("product_" + (i - 1) + "_name", p.getName());
                newNameCookie.setMaxAge(24 * 60 * 60);
                newNameCookie.setPath("/");
                response.addCookie(newNameCookie);

                Cookie newPriceCookie = new Cookie("product_" + (i - 1) + "_price", p.getPrice());
                newPriceCookie.setMaxAge(24 * 60 * 60);
                newPriceCookie.setPath("/");
                response.addCookie(newPriceCookie);
            }

            if (!products.isEmpty()) {
                int lastIndex = products.size() - 1;
                Cookie lastIdCookie = new Cookie("product_" + lastIndex + "_id", "");
                lastIdCookie.setMaxAge(0);
                lastIdCookie.setPath("/");
                response.addCookie(lastIdCookie);

                Cookie lastNameCookie = new Cookie("product_" + lastIndex + "_name", "");
                lastNameCookie.setMaxAge(0);
                lastNameCookie.setPath("/");
                response.addCookie(lastNameCookie);

                Cookie lastPriceCookie = new Cookie("product_" + lastIndex + "_price", "");
                lastPriceCookie.setMaxAge(0);
                lastPriceCookie.setPath("/");
                response.addCookie(lastPriceCookie);
            }
        }

        return "redirect:/product_list";
    }
}