
package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.Category;
import com.sam.shoppingonline.repository.CategoryRepository;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/cate")
public class CategoryController {
    
    private static final Logger LOGGER = Logger.getLogger(CategoryController.class.getName());
    @Autowired
    private CategoryRepository categoryRepository;
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(){
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/cate/index", "listCate", categoryRepository.findAll());
    }
    
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create() throws SQLException{
        return new ModelAndView("/cate/create", "category", new Category());
    }
    
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("category") Category category, 
            BindingResult result, ModelMap model) throws SQLException{
        if(result.hasErrors()){
            return "error";
        } 
        categoryRepository.save(category);
        return "redirect:index";
    }
    
    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(@RequestParam(value = "id", required = false) int id) throws SQLException{
        return new ModelAndView("/cate/details", "category", categoryRepository.findOne(id));
    }
    
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id", required = false) int id) throws SQLException{
        return new ModelAndView("/cate/edit", "category", categoryRepository.findOne(id));
    }
    
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@Valid @ModelAttribute("category") Category category, BindingResult result, 
           ModelMap model) throws SQLException{
        if(result.hasErrors()){
            return "error";
        }
        categoryRepository.save(category);
        return "redirect:index";
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = false) int id) throws SQLException{
        categoryRepository.delete(id);
        return "redirect:index";
    }
    
}
