package com.ict.finalproject.Service;

import com.ict.finalproject.vo.MasterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.finalproject.DAO.ProlikeDAO;
import com.ict.finalproject.vo.ProLikeVO;

import java.util.List;

@Service
public class ProlikeServiceimpl implements ProlikeService{
    
    @Autowired
    private ProlikeDAO dao;


      @Override
    public void addLike(ProLikeVO likeVO) {
       dao.insertLike(likeVO);  // 좋아요 추가
    }

   
    public void removeLike(ProLikeVO likeVO) {
       dao.deleteLike(likeVO);  // 좋아요 취소
    }

  
    public boolean isLiked(int pro_idx, int useridx) {
        ProLikeVO likeStatus = dao.selectLikeStatus(pro_idx, useridx);
       return likeStatus != null && likeStatus.isLiked();// 좋아요 상태 확인
    }

    @Override
    public int getLikeCount(int pro_idx) {
        return dao.getLikeCount(pro_idx);
    }
}
