function [SM1,SM2] = ComponentMinor(C_Rez_M,S_Rez_M,responseP1,params)
cover_sub = FunctionM(C_Rez_M,responseP1,0);
stego_sub_P1 = FunctionM(S_Rez_M,responseP1,1);
stego_sub_M1 = FunctionM(S_Rez_M,responseP1,-1);
SM1 = 0;
SM2 = 0;
for i=1:4
    term1 = cover_sub(:,:,i:i+2);
    term2 = stego_sub_P1(:,:,i:i+2);
    term3 = stego_sub_M1(:,:,i:i+2);
    SM1   = SM1+function2(term1,term2,params);
    SM2   = SM2+function2(term1,term3,params);
end