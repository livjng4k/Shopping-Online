package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.FileModel;
import com.sam.shoppingonline.entity.Product;
import com.sam.shoppingonline.repository.CategoryRepository;
import com.sam.shoppingonline.repository.ProductRepository;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

    private static final Logger LOGGER = Logger.getLogger(ProductController.class.getName());
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ServletContext context;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/product/index", "listProduct", productRepository.findAll());
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create(ModelMap model) throws SQLException {
        model.put("listCate", categoryRepository.findAll());
        return new ModelAndView("/product/create", "product", new Product());
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("product") Product product,
            @Validated FileModel file,
            BindingResult result, ModelMap model) throws SQLException, IOException {
        if (result.hasErrors()) {
            return "error";
        }
        if (product.getName().equals("")) {
            return "error";
        }
        if (file.getFile().isEmpty()) {
            return "error";
        }
        //upload image
        MultipartFile multipartFile = file.getFile();
        String uploadPath = context.getRealPath("") + File.separator + "hinhanh" + File.separator;
        System.out.println("upload Path: " + uploadPath);
        FileCopyUtils.copy(file.getFile().getBytes(), new File(uploadPath + file.getFile().getOriginalFilename()));
        String fileName = multipartFile.getOriginalFilename();

        //set thumnbil file
        product.setThumnail(fileName);

        //save product
        productRepository.save(product);
        return "redirect:index";
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(@RequestParam(value = "id", required = false) int id) throws SQLException {
        return new ModelAndView("/product/details", "product", productRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id", required = false) int id,
            ModelMap model) throws SQLException {
        model.put("listCate", categoryRepository.findAll());
        return new ModelAndView("/product/edit", "product", productRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@Valid @ModelAttribute("product") Product product,
            @Validated FileModel file,
            BindingResult result,
            ModelMap model) throws SQLException, IOException {
        if (result.hasErrors()) {
            return "error";
        }
        MultipartFile multipartFile = file.getFile();
        String uploadPath = context.getRealPath("") + File.separator + "hinhanh" + File.separator;
        System.out.println("upload Path: " + uploadPath);
        if (!file.getFile().isEmpty()) {
            FileCopyUtils.copy(file.getFile().getBytes(), new File(uploadPath + file.getFile().getOriginalFilename()));
        }
        String fileName = multipartFile.getOriginalFilename();

        //set thumnbil file
        product.setThumnail(fileName);

        //save product
        productRepository.save(product);
        return "redirect:index";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = false) int id) throws SQLException {
        productRepository.delete(id);
        return "redirect:index";
    }

}
