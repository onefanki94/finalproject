package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalesListDTO {
    private String orderDate;
    private int orderCount;
    private int totalSales;
    private String aniTitle;
    private int category;
}
