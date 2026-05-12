package com.example.TPCP.controller;

import com.example.TPCP.model.Booking;
import com.example.TPCP.util.JsonDbUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class DashboardController {

    @Autowired
    private JsonDbUtil jsonDbUtil;

    @GetMapping("/dashboard")
    public String dashboard(@RequestParam(required = false) String email, Model model) {
        List<Booking> allBookings = jsonDbUtil.readList("bookings.json", Booking.class);
        
        List<Booking> userBookings;
        if (email != null && !email.isEmpty()) {
            userBookings = allBookings.stream()
                    .filter(b -> b.getUserEmail().equalsIgnoreCase(email))
                    .collect(Collectors.toList());
            model.addAttribute("email", email);
        } else {
            userBookings = allBookings; // In a real app, this would be filtered by logged-in user
        }
        
        model.addAttribute("bookings", userBookings);
        return "dashboard";
    }
}
