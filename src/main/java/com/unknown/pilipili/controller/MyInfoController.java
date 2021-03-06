package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Dict;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.DictService;
import com.unknown.pilipili.service.UserService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/3 15:44
 */

@Controller
@RequestMapping("/myInf")
public class MyInfoController {
    @Autowired
    private UserService userService;
    @Autowired
    private DictService dictService;
    @RequestMapping("")
    public String show(Model model, ServletRequest request){
        return "/myInf";
    }
    @PostMapping("editGender")
    public String editGender(Model model, ServletRequest request, HttpSession session){
        String genderName = request.getParameter("gender");
        Dict gender = dictService.findDictByTypeAndName("性别",genderName);
        User u = (User) session.getAttribute("user");
        u.setGender(gender);
        userService.save(u);
        session.setAttribute("user",u);
        return "redirect:/myInf";
    }
    @PostMapping("editEducation")
    public String editEducation(Model model, ServletRequest request, HttpSession session){
        String educationName = request.getParameter("education");
        Dict education = dictService.findDictByTypeAndName("学历",educationName);
        User u = (User) session.getAttribute("user");
        u.setEducation(education);
        userService.save(u);
        session.setAttribute("user",u);
        return "redirect:/myInf";
    }
    @RequestMapping("upload")
    public String upload(@RequestParam("uploadfile") CommonsMultipartFile file,
                         HttpServletRequest request, HttpSession session){
        if (!file.isEmpty()) {
            String originalFilename = file.getOriginalFilename();
            String type = originalFilename.substring(originalFilename.lastIndexOf("."));
            String filename = System.currentTimeMillis() + type;
            String path = request.getSession().getServletContext().getRealPath("/upload/" + filename);
            File destFile = new File(path);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), destFile);
                User user = (User)session.getAttribute("user");
                user.setAvatar(filename);
                userService.save(user);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "redirect:/myInf";
        } else {
            return "redirect:/error";
        }
    }
}
