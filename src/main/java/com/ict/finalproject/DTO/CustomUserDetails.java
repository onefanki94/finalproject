package com.ict.finalproject.DTO;

import com.ict.finalproject.vo.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Collections;

public class CustomUserDetails implements UserDetails {

    private final MemberVO memberVO;

    // Constructor to initialize memberVO
    public CustomUserDetails(MemberVO memberVO) {
        this.memberVO = memberVO;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // 권한을 사용하지 않으므로 빈 리스트 반환
        return Collections.emptyList(); // 비어있는 권한 리스트 반환
    }

    @Override
    public String getPassword() {
        return memberVO.getUserpwd(); // MemberVO에서 비밀번호 반환
    }

    @Override
    public String getUsername() {
        return memberVO.getUserid(); // MemberVO에서 사용자 ID 반환
    }


    // 추가된 메서드: idx 반환
    public int getIdx() {
        return memberVO.getIdx(); // MemberVO에서 idx 반환
    }

    @Override
    public boolean isAccountNonExpired() {
        return true; // 계정 만료 여부
    }

    @Override
    public boolean isAccountNonLocked() {
        return true; // 계정 잠금 여부
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true; // 자격 증명 만료 여부
    }

    @Override
    public boolean isEnabled() {
        return true; // 계정 활성화 여부
    }
}
