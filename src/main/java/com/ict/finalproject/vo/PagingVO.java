package com.ict.finalproject.vo;

public class PagingVO {
    private int nowPage;        // 현재 페이지
    private int totalPage;      // 전체 페이지 수
    private int totalElements;  // 전체 항목 수
    private int size;           // 한 페이지에 보여줄 항목 수
    private int offset; // 추가: LIMIT 쿼리에 사용할 오프셋
    private int startPage;      // 페이지네이션에서 시작하는 페이지 번호
    private int endPage;        // 페이지네이션에서 끝나는 페이지 번호
    private boolean hasPrevious;  // 이전 페이지가 있는지 여부
    private boolean hasNext;      // 다음 페이지가 있는지 여부

    //공지사항 필드
    private String keyword;     // 검색어

    //커뮤 필드
    private String commtype;       // 커뮤니티 타입
    private String orderBy;        // 정렬 조건
    private String searchCategory; // 검색 카테고리
    private String searchKeyword;  // 검색어

    // 기본 생성자
    public PagingVO() {}
    // 모든 매개변수를 받는 생성자
    // 생성자: 필요한 필드만 설정하는 방식으로
    public PagingVO(int nowPage, int totalElements, int size) {
        this.nowPage = nowPage;
        this.totalElements = totalElements;
        this.size = size;
        this.offset = (nowPage - 1) * size;

        // 전체 페이지 수 계산
        this.totalPage = (int) Math.ceil((double) totalElements / size);

        // 이전/다음 페이지가 있는지 여부 설정
        this.hasPrevious = nowPage > 1;
        this.hasNext = nowPage < totalPage;

        // 페이지 네비게이션 계산 (현재 페이지 기준으로 5개씩 보여주기)
        this.startPage = ((nowPage - 1) / 5) * 5 + 1;
        this.endPage = Math.min(startPage + 4, totalPage);
    }

    // 필드 사용 여부에 따라 설정하는 메서드
    public void setForCommunity(String commtype, String orderBy, String searchCategory, String searchKeyword) {
        this.commtype = commtype;
        this.orderBy = orderBy;
        this.searchCategory = searchCategory;
        this.searchKeyword = searchKeyword;
    }

    // 공지사항 설정 메서드
    public void setForNotice(String keyword) {
        this.keyword = keyword;

    }


    // Getter/Setter
    public int getNowPage() { return nowPage; }
    public void setNowPage(int nowPage) { this.nowPage = nowPage; }
    public int getTotalPage() { return totalPage; }
    public void setTotalPage(int totalPage) { this.totalPage = totalPage; }
    public int getTotalElements() { return totalElements; }
    public void setTotalElements(int totalElements) { this.totalElements = totalElements; }
    public int getSize() { return size; }
    public void setSize(int size) { this.size = size; }
    public int getStartPage() { return startPage; }
    public void setStartPage(int startPage) { this.startPage = startPage; }
    public int getEndPage() { return endPage; }
    public void setEndPage(int endPage) { this.endPage = endPage; }
    public boolean isHasPrevious() { return hasPrevious; }
    public void setHasPrevious(boolean hasPrevious) { this.hasPrevious = hasPrevious; }
    public boolean isHasNext() { return hasNext; }
    public void setHasNext(boolean hasNext) { this.hasNext = hasNext; }
    public String getKeyword() { return keyword; }
    public void setKeyword(String keyword) { this.keyword = keyword; }

    public String getCommtype() {return commtype; }
    public void setCommtype(String commtype) {this.commtype = commtype; }
    public String getOrderBy() {return  orderBy; }
    public void setOrderBy(String orderBy) {this.orderBy = orderBy; }
    public String getSearchCategory() {return searchCategory; }
    public void setSearchCategory(String searchCategory) {this.searchCategory = searchCategory; }
    public String getSearchKeyword() {return searchKeyword; }
    public void setSearchKeyword(String searchKeyword) {this.searchKeyword = searchKeyword; }
}
