package com.unknown.pilipili.controller;

import com.unknown.pilipili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/3 15:44
 */

@Controller
@RequestMapping("/myInf")
public class MyInfoController {
    @Autowired
    private UserService userService;
    @RequestMapping("")
    public String show(Model model, ServletRequest request){
        return "/myInf";
    }
}