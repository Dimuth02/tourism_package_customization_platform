package com.example.TPCP.controller;

import com.example.TPCP.model.Booking;
import com.example.TPCP.model.TourPackage;
import com.example.TPCP.util.JsonDbUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Controller
public class BookingController {

    @Autowired
    private JsonDbUtil jsonDbUtil;

    @GetMapping("/checkout")
    public String checkout(@RequestParam String packageId, @RequestParam double totalPrice, Model model) {
        List<TourPackage> packages = jsonDbUtil.readList("packages.json", TourPackage.class);
        TourPackage selectedPackage = packages.stream()
                .filter(p -> p.getId().equals(packageId))
                .findFirst()
                .orElse(null);

        model.addAttribute("pkg", selectedPackage);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("content", "checkout :: content");
        return "layout";
    }

    @PostMapping("/book")
    public String book(@RequestParam String packageId, 
                       @RequestParam String packageName,
                       @RequestParam String userName, 
                       @RequestParam String userEmail, 
                       @RequestParam double totalPrice) {
        
        List<Booking> bookings = jsonDbUtil.readList("bookings.json", Booking.class);
        
        Booking newBooking = new Booking(
            UUID.randomUUID().toString(),
            packageId,
            packageName,
            userName,
            userEmail,
            totalPrice,
            LocalDateTime.now().toString()
        );
        
        bookings.add(newBooking);
        jsonDbUtil.writeList("bookings.json", bookings);
        
        return "redirect:/dashboard?email=" + userEmail;
    }
}
