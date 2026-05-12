package com.example.TPCP.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Booking {
    private String id;
    private String packageId;
    private String packageName;
    private String userName;
    private String userEmail;
    private double totalPrice;
    private String bookingDate;
}
