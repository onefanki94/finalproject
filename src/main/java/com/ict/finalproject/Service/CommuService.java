package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.CommuDAO;
import com.ict.finalproject.vo.CommuVO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface CommuService {



    //글작성
    CommuVO writeBoard(CommuVO board);

    //게시글 가져오기
    List<CommuVO> List(String commtype);

    CommuVO Detail(int idx);


}
