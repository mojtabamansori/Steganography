function [SH1,SH2] = ComponentHorizontal(C_Rez_H,S_Rez_H,responseP1,params)
C_Rez_H = C_Rez_H(4:end-3,:);
S_Rez_H = S_Rez_H(4:end-3,:);
cover_sub = FunctionH(C_Rez_H,responseP1,0);
stego_sub_P1 = FunctionH(S_Rez_H,responseP1,1);
stego_sub_M1 = FunctionH(S_Rez_H,responseP1,-1);
SH1 = 0;
SH2 = 0;
for i=1:4
    term1 = cover_sub(:,:,i:i+2);
    term2 = stego_sub_P1(:,:,i:i+2);
    term3 = stego_sub_M1(:,:,i:i+2);
    SH1   = SH1+function2(term1,term2,params);
    SH2   = SH2+function2(term1,term3,params);
end