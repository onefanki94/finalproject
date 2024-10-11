package com.ict.finalproject.Service;

import org.springframework.stereotype.Service;

import com.ict.finalproject.vo.ProLikeVO;

@Service
public interface ProlikeService {

    public void addLike(ProLikeVO likeVO);  // 좋아요 추가
    public void removeLike(ProLikeVO likeVO);  // 좋아요 취소
    public boolean isLiked(int proidx, int userIdx);  // 좋아요 상태 확


}
