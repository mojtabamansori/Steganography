function stego = HUGO_like1(cover, payload, params)

cover = double(cover);
wetCost = 10^8;
responseP1 = [0; 0; -1; +1; 0; 0];

% create mirror padded cover image
padSize = 3;
coverPadded = padarray(cover, [padSize padSize], 'symmetric');

% create residuals
C_Rez_H = coverPadded(:, 1:end-1) - coverPadded(:, 2:end);
C_Rez_V = coverPadded(1:end-1, :) - coverPadded(2:end, :);
C_Rez_Diag = coverPadded(1:end-1, 1:end-1) - coverPadded(2:end, 2:end);
C_Rez_MDiag = coverPadded(1:end-1, 2:end) - coverPadded(2:end, 1:end-1);
stegoPadded = coverPadded;        
% create residuals
S_Rez_H = stegoPadded(:, 1:end-1) - stegoPadded(:, 2:end);
S_Rez_V = stegoPadded(1:end-1, :) - stegoPadded(2:end, :);
S_Rez_Diag = stegoPadded(1:end-1, 1:end-1) - stegoPadded(2:end, 2:end);
S_Rez_MDiag = stegoPadded(1:end-1, 2:end) - stegoPadded(2:end, 1:end-1);
%% Iterate over elements in the sublattice
% cover subimage & % stego subimage
[SH1,SH2] = ComponentHorizontal(C_Rez_H,S_Rez_H,responseP1,params);
[SV1,SV2] = ComponentVertical(C_Rez_V,S_Rez_V,responseP1,params);
[SD1,SD2] = ComponentDiagonal(C_Rez_Diag,S_Rez_Diag,responseP1,params);
[SM1,SM2] = ComponentMinor(C_Rez_MDiag,S_Rez_MDiag,responseP1,params);
RhoP1 = SH1+SV1+SD1+SM1;
RhoM1 = SH2+SV2+SD2+SM2;
% truncation of the costs
RhoM1(RhoM1>wetCost) = wetCost;
RhoP1(RhoP1>wetCost) = wetCost;       
RhoP1(cover == 255) = wetCost;
RhoM1(cover == 0) = wetCost;
%% Embedding   
% embedding simulator - params.qarity \in {2,3}
stego = EmbeddingSimulator(cover, RhoP1, RhoM1, round(numel(cover)*payload), 0);