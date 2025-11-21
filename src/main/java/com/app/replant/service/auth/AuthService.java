package com.app.replant.service.auth;


import com.app.replant.controller.dto.*;
import com.app.replant.entity.Member;

import java.util.Optional;

public interface AuthService {

    Optional<Member> getMemberById(String email);

    LoginResponseDto login(String memberId, String password);

    LoginResponseDto join(JoinDto joinDto);
    
    Boolean checkId(String memberId);

    TokenDto reissue(TokenRequestDto tokenRequestDto);

    Member findMemberByMemberNameAndPhone(MemberSearchIdDto memberSearchIdDto);

    void logout(String memberId);
    
    void resetPassword(ResetPasswordDto resetPasswordDto);
    
    void changePassword(ChangePasswordDto changePasswordDto);

}