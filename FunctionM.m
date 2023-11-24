function cover_sub = FunctionM(C_Rez_M,responseP1,c)
cover_sub(:,:,1) = C_Rez_M(1:end-5,6:end-0)+c*responseP1(1);
cover_sub(:,:,2) = C_Rez_M(2:end-4,5:end-1)+c*responseP1(2);
cover_sub(:,:,3) = C_Rez_M(3:end-3,4:end-2)+c*responseP1(3);
cover_sub(:,:,4) = C_Rez_M(4:end-2,3:end-3)+c*responseP1(4);
cover_sub(:,:,5) = C_Rez_M(5:end-1,2:end-4)+c*responseP1(5);
cover_sub(:,:,6) = C_Rez_M(6:end-0,1:end-5)+c*responseP1(6);