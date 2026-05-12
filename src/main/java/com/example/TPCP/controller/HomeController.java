package com.example.TPCP.controller;

import com.example.TPCP.model.Destination;
import com.example.TPCP.util.JsonDbUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private JsonDbUtil jsonDbUtil;

    @GetMapping("/")
    public String index(Model model) {
        List<Destination> destinations = jsonDbUtil.readList("destinations.json", Destination.class);
        model.addAttribute("destinations", destinations);
        model.addAttribute("content", "index :: content");
        return "layout";
    }
}
