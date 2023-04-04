package org.example.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.example.model.Todo;
import org.example.service.TodoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {

    @Autowired
    private TodoService service;

    private static final Logger log = LoggerFactory.getLogger(MainController.class);

    @RequestMapping(method = RequestMethod.GET, value = "/",produces = MediaType.TEXT_HTML_VALUE)
    public String getMain(Model model) {
//        model.addAttribute("data", "Hello World");
//        model.addAttribute("name","오범수");
//        return "index";
//    }
//
//
//    @RequestMapping(method=RequestMethod.GET,value="/",produces = MediaType.APPLICATION_JSON_VALUE)
//    public String findAll(Model model){
        List<Todo> list = service.findAll();
        model.addAttribute("list",list);
        return "list";
    }

    @RequestMapping(method=RequestMethod.GET,value="/id/{id}")
    @ResponseBody
    public Todo findOne(@PathVariable int id){
        return service.findById(id);
    }

    @RequestMapping(method=RequestMethod.GET,value="/id/{id}",produces = MediaType.TEXT_HTML_VALUE)
    public String findOne(){
        return "detail";
    }

    @RequestMapping(method=RequestMethod.GET,value="/put/{id}",produces = MediaType.TEXT_HTML_VALUE)
    public String putOne(){
        return "put-save";
    }

//    @RequestMapping(method = RequestMethod.PUT,value="/put/save",consumes = MediaType.APPLICATION_JSON_VALUE)
//    @ResponseStatus(HttpStatus.CREATED)
//    public void putOne(@RequestBody Todo todo){
//        service.update(todo);
//    }
    @RequestMapping(method = RequestMethod.PUT, value = "/id/{id}")
    @ResponseBody
    public void update(@PathVariable int id, @RequestBody Todo todo) {
        todo.setId(id);
        service.update(todo);
    }

    @RequestMapping(method = RequestMethod.POST,value="/posts/save",consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.CREATED)
    public void save(@RequestBody Todo todo){
        service.save(todo);
    }
    @RequestMapping(method = RequestMethod.GET,value="/posts/save",produces = MediaType.TEXT_HTML_VALUE)
    public String save(){
        return "posts-save";
    }


    @RequestMapping(method = RequestMethod.DELETE, value="/delete/{id}")
    @ResponseBody
    public void del(@PathVariable int id) {
        service.delete(id);
    }
}

