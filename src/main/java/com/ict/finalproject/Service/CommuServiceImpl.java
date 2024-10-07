package com.ict.finalproject.Service;

import com.ict.finalproject.DAO.CommuDAO;
import com.ict.finalproject.vo.CommuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommuServiceImpl implements CommuService {

    @Autowired
    private CommuDAO commuDAO;

    @Override
    public CommuVO writeBoard(CommuVO board) {
        // 게시글 등록
        int result = commuDAO.insertBoard(board);
        return result > 0 ? board : null;
    }

    @Override
    public List<CommuVO> List(String commtype) {
        return commuDAO.List(commtype);
    }

    @Override
    public CommuVO Detail(int idx) {
        return commuDAO.Detail(idx);
    }

    @Override
    public void HitCount(int idx) {
        commuDAO.HitCount(idx);
    }

    @Override
    public CommuVO PreviousPost(int idx) {
        return commuDAO.PreviousPost(idx);
    }

    @Override
    public CommuVO NextPost(int idx) {
        return commuDAO.NextPost(idx);
    }


}
