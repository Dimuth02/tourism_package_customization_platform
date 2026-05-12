package com.example.TPCP.controller;

import com.example.TPCP.model.TourPackage;
import com.example.TPCP.util.JsonDbUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class PackageController {

    @Autowired
    private JsonDbUtil jsonDbUtil;

    @GetMapping("/packages")
    public String listPackages(Model model) {
        List<TourPackage> packages = jsonDbUtil.readList("packages.json", TourPackage.class);
        model.addAttribute("packages", packages);
        return "packages";
    }
}
