function [SD1,SD2] = ComponentDiagonal(C_Rez_D,S_Rez_D,responseP1,params)
cover_sub = FunctionD(C_Rez_D,responseP1,0);
stego_sub_P1 = FunctionD(S_Rez_D,responseP1,1);
stego_sub_M1 = FunctionD(S_Rez_D,responseP1,-1);
SD1 = 0;
SD2 = 0;
for i=1:4
    term1 = cover_sub(:,:,i:i+2);
    term2 = stego_sub_P1(:,:,i:i+2);
    term3 = stego_sub_M1(:,:,i:i+2);
    SD1   = SD1+function2(term1,term2,params);
    SD2   = SD2+function2(term1,term3,params);
end