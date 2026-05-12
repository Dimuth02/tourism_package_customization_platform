package com.example.TPCP.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TourPackage {
    private String id;
    private String name;
    private String tagLine;
    private String description;
    private double basePrice;
    private int durationDays;
    private String imageUrl;
    private List<String> highlights;
}
