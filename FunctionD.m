function cover_sub = FunctionD(C_Rez_D,responseP1,c)
cover_sub(:,:,1) = C_Rez_D(1:end-5,1:end-5)+c*responseP1(1);
cover_sub(:,:,2) = C_Rez_D(2:end-4,2:end-4)+c*responseP1(2);
cover_sub(:,:,3) = C_Rez_D(3:end-3,3:end-3)+c*responseP1(3);
cover_sub(:,:,4) = C_Rez_D(4:end-2,4:end-2)+c*responseP1(4);
cover_sub(:,:,5) = C_Rez_D(5:end-1,5:end-1)+c*responseP1(5);
cover_sub(:,:,6) = C_Rez_D(6:end-0,6:end-0)+c*responseP1(6);