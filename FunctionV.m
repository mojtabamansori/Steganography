function cover_sub = FunctionV(C_Rez_V,responseP1,c)
cover_sub(:,:,1) = C_Rez_V(1:end-5,:)+c*responseP1(1);
cover_sub(:,:,2) = C_Rez_V(2:end-4,:)+c*responseP1(2);
cover_sub(:,:,3) = C_Rez_V(3:end-3,:)+c*responseP1(3);
cover_sub(:,:,4) = C_Rez_V(4:end-2,:)+c*responseP1(4);
cover_sub(:,:,5) = C_Rez_V(5:end-1,:)+c*responseP1(5);
cover_sub(:,:,6) = C_Rez_V(6:end-0,:)+c*responseP1(6);