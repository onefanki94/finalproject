package com.ict.finalproject.Service;

public interface TAdminService {
    boolean existsByAdminId(String adminid);
    /**
     * adminid를 사용하여 t_admin 테이블의 idx 값을 조회합니다.
     *
     * @param adminid 관리자 아이디
     * @return 관리자 idx 값
     */
    Integer getAdminIdxByAdminId(String adminid);

}
