package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDelReasonDTO {
    private int useridx;
    private int delReason;
    private String delReasonDetail;
}
