function [SV1,SV2] = ComponentVertical(C_Rez_V,S_Rez_V,responseP1,params)
C_Rez_V = C_Rez_V(:,4:end-3);
S_Rez_V = S_Rez_V(:,4:end-3);
cover_sub = FunctionV(C_Rez_V,responseP1,0);
stego_sub_P1 = FunctionV(S_Rez_V,responseP1,1);
stego_sub_M1 = FunctionV(S_Rez_V,responseP1,-1);
SV1 = 0;
SV2 = 0;
for i=1:4
    term1 = cover_sub(:,:,i:i+2);
    term2 = stego_sub_P1(:,:,i:i+2);
    term3 = stego_sub_M1(:,:,i:i+2);
    SV1   = SV1+function2(term1,term2,params);
    SV2   = SV2+function2(term1,term3,params);
end