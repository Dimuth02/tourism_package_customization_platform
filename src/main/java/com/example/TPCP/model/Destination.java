package com.example.TPCP.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Destination {
    private String id;
    private String name;
    private String description;
    private String imageUrl;
    private String region;
}
