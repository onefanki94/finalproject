package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.MasterDAO;
import com.ict.finalproject.vo.MasterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MasterServiceImpl implements MasterService {
    @Autowired
    MasterDAO dao;

    @Override
    // 관리자페이지 공지사항 추가
    public int createNotice(MasterVO vo) {
        /**
         * 관리자 페이지에서 공지사항을 추가하는 메서드입니다.
         *
         * @param vo 공지사항의 정보를 담고 있는 MasterVO 객체 (제목, 내용, 작성자 정보 포함)
         * @return 데이터베이스에 공지사항을 성공적으로 추가한 경우 1, 실패한 경우 0 반환
         */
        return dao.createNotice(vo);
    }
}
