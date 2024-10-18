package com.ict.finalproject.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageResponse<T> {
    private List<T> content;  // 현재 페이지의 데이터 목록
    private int page;         // 현재 페이지 번호
    private int size;         // 한 페이지에 포함될 데이터 개수
    private long totalElements; // 전체 데이터 개수
    private int totalPages;
}
