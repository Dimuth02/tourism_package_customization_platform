package com.example.TPCP.controller;

import com.example.TPCP.model.TourPackage;
import com.example.TPCP.util.JsonDbUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CustomisationController {

    @Autowired
    private JsonDbUtil jsonDbUtil;

    @GetMapping("/customise")
    public String customise(@RequestParam String packageId, Model model) {
        List<TourPackage> packages = jsonDbUtil.readList("packages.json", TourPackage.class);
        TourPackage selectedPackage = packages.stream()
                .filter(p -> p.getId().equals(packageId))
                .findFirst()
                .orElse(null);

        if (selectedPackage == null) {
            return "redirect:/packages";
        }

        model.addAttribute("pkg", selectedPackage);
        return "customise";
    }
}
