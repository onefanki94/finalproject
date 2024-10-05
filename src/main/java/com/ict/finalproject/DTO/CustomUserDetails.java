package com.ict.finalproject.DTO;


import com.ict.finalproject.vo.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CustomUserDetails implements UserDetails {

    private MemberVO memberVO;

    public CustomUserDetails(MemberVO memberVO) {

        this.memberVO = memberVO;
    }


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // 권한을 SimpleGrantedAuthority로 설정하고, 권한 목록 반환
        List<GrantedAuthority> authorities = new ArrayList<>();

        // 권한을 설정할 때 반드시 ROLE_ 접두어가 포함되었는지 확인
        String role = memberVO.getRole();
        if (role != null && !role.startsWith("ROLE_")) {
            role = "ROLE_" + role;  // "ROLE_" 접두어를 추가하여 Spring Security가 인식할 수 있도록 변경
        }

        authorities.add(new SimpleGrantedAuthority(role));  // SimpleGrantedAuthority로 권한 추가
        return authorities;
    }

    @Override
    public String getPassword() {

        return memberVO.getUserpwd();
    }

    @Override
    public String getUsername() {

        return memberVO.getUserid();
    }

    @Override
    public boolean isAccountNonExpired() {

        return true;
    }

    @Override
    public boolean isAccountNonLocked() {

        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {

        return true;
    }

    @Override
    public boolean isEnabled() {

        return true;
    }
}
