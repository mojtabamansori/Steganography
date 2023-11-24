clc
clear
folderPath = 'C:\Users\ns\Desktop\paksersht\dataset\easy_data';
imageDatastoreObj = imageDatastore(folderPath, 'ReadFcn', @readFunction);


imds  = imageDatastoreObj;
T1    = 3;
T2    = 4;
params.p     = -1;               % parameter of WOW
params.gamma = 1;                % gamma of HOGU
params.sigma = 1;                % gamma of sigma
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N            = 15000;           % Number of Images
payload      = 0.4;              % payload 0.1 and 0.2 and 0.3 and 0.4
for n = 1:N
    disp(((N * 0.3) - (n * .3))/60)
    cover    = readimage(imds,n);
    cover = double(cover);
    stego1   = uint8(LSBmatching(cover,payload));
    stego2   = uint8(WOW(cover,payload,params));
    stego3   = uint8(HUGO_like1(cover,payload,params));
    stego4   = uint8(S_UNIWARD2(cover,payload));
    cover = uint8(cover);
    imwrite(cover,['cover\',num2str(payload),'\cover_',num2str(n), '.tif'])
    imwrite(stego1,['LSB\',num2str(payload),'\LSB_',num2str(n), '.tif'])
    imwrite(stego2,['WOW\',num2str(payload),'\WOW_',num2str(payload),num2str(n), '.tif'])
    imwrite(stego3,['HUGO\',num2str(payload),'\HUGO_',num2str(payload),num2str(n), '.tif'])
    imwrite(stego4,['UNIWARD\',num2str(payload),'\UNIWARD_',num2str(payload),num2str(n), '.tif'])
    
end

function img = readFunction(filename)
    img = imread(filename);
end
