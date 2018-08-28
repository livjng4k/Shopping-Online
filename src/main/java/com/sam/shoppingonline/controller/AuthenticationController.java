package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.Role;
import com.sam.shoppingonline.entity.User;
import com.sam.shoppingonline.repository.RoleRepository;
import com.sam.shoppingonline.repository.UserRepository;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
@RequestMapping(value = "/auth")
public class AuthenticationController {
    
    private static final Logger LOGGER = Logger.getLogger(AuthenticationController.class.getName());
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private UserRepository userRepository;
    private final String DEFAUT_ROLE = "ROLE_USER";
    
    @RequestMapping("/login")
    public ModelAndView getLoginForm(
    @RequestParam(required = false) String authfailed, String logout, String denied){
        LOGGER.log(Level.INFO, "info:{0}");
        String message = "";
        if(authfailed != null){
            message = "Invalid username or password, try again";
        }else if (logout != null){
            message = "Logged Out successfully, login and continue";
        }else if(denied != null){
            message = "Access denied for this user !";
        }
        return new ModelAndView("/auth/login", "message", message);
    }
    
    @RequestMapping("/403page")
    public String ge403denied() {
        LOGGER.log(Level.INFO, "info:{0}");
        return "redirect:/auth/login?denied";
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(){
        LOGGER.log(Level.INFO, "info:{0}");
        return "/auth/register";
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@RequestParam(value = "username", required = false)String username,
            @RequestParam(value = "password",required = false)String password){
        LOGGER.log(Level.INFO, "info:{0}");
        User user = new User(username, password);
        if(userRepository.exists(username)){
            HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
            request.setAttribute("message", "Invalid: Username already existed !!!");
            return "/auth/register";
        }
        userRepository.save(user);
        Role role = new Role(DEFAUT_ROLE, user);
        roleRepository.save(role);
        return "redirect:../home/index";
    }
}
