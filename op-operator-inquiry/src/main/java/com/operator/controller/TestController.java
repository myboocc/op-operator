package com.operator.controller;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class TestController {

    @RequestMapping(value = "date1.do")
    @ResponseBody
    public String date1(Date date1){
        return date1.toString();
    }

    @InitBinder("date1")
    public void initDate1(WebDataBinder binder){
        binder.registerCustomEditor(Date.class,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
    }

    @RequestMapping(value = "date2.do")
    @ResponseBody
     public String date2(Date date2, double num){
        return date2.toString() + num;
    }



    @RequestMapping(value = "/book",method = RequestMethod.GET)
    @ResponseBody
    public String book(HttpServletRequest request){
        String contentType = request.getContentType();
        if(contentType == null){
            return "book.default";
        }else if(contentType.equals("txt")){
            return "book.txt";
        }else if(contentType.equals("html")){
            return "book.html";
        }
        return "book.default";
    }

    @RequestMapping(value = "/subject/{subjectId}",method = RequestMethod.GET)
    @ResponseBody
    public String subjectGet(@PathVariable("subjectId") String subjectId){
        return "this is a get method,subjectId:"+subjectId;
    }

    @RequestMapping(value = "/subject/{subjectId}",method = RequestMethod.POST)
    @ResponseBody
    public String subjectPost(@PathVariable("subjectId") String subjectId){
        return "this is a post method,subjectId:"+subjectId;
    }

    @RequestMapping(value = "/subject/{subjectId}",method = RequestMethod.DELETE)
    @ResponseBody
    public String subjectDelete(@PathVariable("subjectId") String subjectId){
        return "this is a delete method,subjectId:"+subjectId;
    }

    @RequestMapping(value = "/subject/{subjectId}",method = RequestMethod.PUT)
    @ResponseBody
    public String subjectPut(@PathVariable("subjectId") String subjectId){
        return "this is a put method,subjectId:"+subjectId;
    }













    @RequestMapping(value = "converter.do")
    @ResponseBody
    public String converter(Boolean bool){
        return bool.toString();
    }


}
