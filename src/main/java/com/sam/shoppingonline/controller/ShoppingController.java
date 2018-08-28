package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.Cart;
import com.sam.shoppingonline.entity.Product;
import com.sam.shoppingonline.repository.ProductRepository;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/shop")
public class ShoppingController {

    private static final Logger LOGGER = Logger.getLogger(ShoppingController.class.getName());
    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public String payment(HttpSession session, ModelMap model) {
        session.removeAttribute("cart");
        model.put("total", 0);
        model.put("msg", "Thanh toán thành công");
        return "/shop/index";
    }

    private List<Cart> getMyCart(HttpSession session) {
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        List<Cart> myCart = new ArrayList<>();
        if (cart != null) {
            for (Cart c : cart) {
                Product c1 = productRepository.findOne(c.getProduct().getId());
                if (c1 != null) {
                    myCart.add(new Cart(c1, c.getQuantity()));
                }
            }
        }
        return myCart;
    }

    //Check if an item already exist in shopping cart
    private int isExistItem(int id, List<Cart> myCart) {
        for (int i = 0; i < myCart.size(); i++) {
            if (myCart.get(i).getProduct().getId() == id) {
                return i;
            }
        }
        return -1;
    }

    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String order(@RequestParam(value = "id", required = false) int id,
            @RequestParam(value = "quantity", required = false) int quantity,
            HttpSession session) {
        List<Cart> myCart = (List<Cart>) session.getAttribute("cart");
        if (myCart == null) {
            myCart = new ArrayList<>();
            myCart.add(new Cart(productRepository.findOne(id), quantity));
        } else {
            int index = isExistItem(id, myCart);
            if (index == -1) {
                myCart.add(new Cart(productRepository.findOne(id), quantity));
            } else {
                int amount = myCart.get(index).getQuantity();
                myCart.get(index).setQuantity(quantity + amount);
                if (myCart.get(index).getQuantity() == 0) {
                    remove(id, session);
                }
            }
        }
        session.setAttribute("cart", myCart);
//        return "redirect:../product/index";
        return "redirect:index";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public String remove(@RequestParam(value = "id", required = false) int id, HttpSession session) {
        List<Cart> myCart = (List<Cart>) session.getAttribute("cart");
        myCart.remove(isExistItem(id, myCart));
        session.setAttribute("cart", myCart);
        return "redirect:index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(HttpSession session, ModelMap model) {
        LOGGER.log(Level.INFO, "info:{0}");
        List<Cart> myCart = getMyCart(session);
        double total = 0;
        if (myCart.size() > 0) {
            Collections.sort(myCart, new Comparator<Cart>() {
                @Override
                public int compare(Cart o1, Cart o2) {
                    return Integer.compare(o1.getProduct().getId(), o2.getProduct().getId());
                }
            });
            total = calTotal(myCart);
        }
        model.put("total", total);
        return new ModelAndView("/shop/index", "myCart", myCart);
    }

    private double calTotal(List<Cart> myCart) {
        double result = 0.0;
        if (myCart != null) {
            for (Cart item : myCart) {
                result = result + item.getQuantity() * item.getProduct().getPrice();
            }
        }
        return result;
    }
}
