package com.sam.shoppingonline.controller;

import com.sam.shoppingonline.entity.Banner;
import com.sam.shoppingonline.entity.Category;
import com.sam.shoppingonline.entity.Product;
import com.sam.shoppingonline.repository.BannerRepository;
import com.sam.shoppingonline.repository.CategoryRepository;
import com.sam.shoppingonline.repository.ProductRepository;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/home")
public class HomeController {

    private static final Logger LOGGER = Logger.getLogger(HomeController.class.getName());
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private BannerRepository bannerRepository;
    @Autowired
    private CategoryRepository categoryRepository;

    private void getCateList(ModelMap model) {
        List<Category> list = categoryRepository.findAll();
        model.put("listCate", list);
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public ModelAndView show(@RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "cateId", required = false) int cateID,
            ModelMap model) {
        LOGGER.log(Level.INFO, "info:{0}");

        int pagingNumber = 9;

        if (page == null) {
            page = 0;
        }
        model.put("page", page);
        Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name"));
        Pageable pageable = new PageRequest(page, pagingNumber, sort);

        List<Product> listProduct = productRepository.findByCate(cateID, pageable);
        int size = productRepository.countByCate(cateID);
        if (size == 0) {
            model.put("SearchError", "Can't found any result!");
        }
        int pageNumber = (size / pagingNumber);
        if (size % pagingNumber != 0) {
            pageNumber += 1;
        }
        model.put("pageNumber", pageNumber);
        model.put("titile", categoryRepository.findOne(cateID).getName());
        model.put("cateId", cateID);
        getCateList(model);
        return new ModelAndView("/home/show", "listProduct", listProduct);
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(@RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "keyword", required = false) String keyword,
            ModelMap model) {
        LOGGER.log(Level.INFO, "info:{0}");

        int pagingNumber = 6;

        if (page == null) {
            page = 0;
        }
        if (keyword == null) {
            keyword = "";
        }

        Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name"));
        Pageable pageable = new PageRequest(page, pagingNumber, sort);
        model.put("page", page);
        model.put("keyword", keyword);
        List<Product> listProduct = productRepository.findAndPaging(keyword, pageable);
        int size = productRepository.countByName(keyword);
        if (size == 0) {
            model.put("SearchError", "Can't found any result!");
        }
        int pageNumber = (size / pagingNumber);
        if (size % pagingNumber != 0) {
            pageNumber += 1;
        }
        model.put("pageNumber", pageNumber);
        List<Banner> banner = bannerRepository.findAll(new Sort(Sort.Direction.DESC, "id"));
        model.put("firstBanner", banner.get(0));
        banner.remove(0);
        model.put("banner", banner);
        getCateList(model);
        return new ModelAndView("/home/index", "listProduct", listProduct);
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(@RequestParam(value = "id", required = false) int id,
            ModelMap model) throws SQLException {
        getCateList(model);
        return new ModelAndView("/home/details", "product", productRepository.findOne(id));
    }
}
