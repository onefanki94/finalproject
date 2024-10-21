package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportDTO {
    private int idx;
    private int comment_idx;
    private int review_idx;
    private int report_type;
    private String reason;
    private LocalDateTime reportDT;
    private int useridx;
    private int handleState;
    private LocalDateTime handleDT;
    private int comunity_idx;

}
