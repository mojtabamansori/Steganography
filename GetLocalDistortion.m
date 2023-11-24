function D = GetLocalDistortion(C_resVect, S_resVect, params)
%     C = [C_resVect(1:3) C_resVect(2:4) C_resVect(3:5) C_resVect(4:6)];
%     S = [S_resVect(1:3) S_resVect(2:4) S_resVect(3:5) S_resVect(4:6)];
%     c_w = (params.sigma + sqrt(sum(C.^2))).^(-params.gamma);
%     s_w = (params.sigma + sqrt(sum(S.^2))).^(-params.gamma);
%     D = sum(c_w + s_w);
    D = 0;
    % C_resVect and S_resVect must have size of 6x1   
    D = D + GetLocalPotential(C_resVect(1:3), S_resVect(1:3), params);
    D = D + GetLocalPotential(C_resVect(2:4), S_resVect(2:4), params);
    D = D + GetLocalPotential(C_resVect(3:5), S_resVect(3:5), params);
    D = D + GetLocalPotential(C_resVect(4:6), S_resVect(4:6), params);
end

