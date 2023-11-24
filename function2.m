function S = function2(term1,term2,param)
sigma = param.sigma;
gamma = param.gamma;
c_w = (sigma+sqrt(sum(term1.^2,3))).^(-gamma);
s_w = (sigma+sqrt(sum(term2.^2,3))).^(-gamma);
S = c_w+s_w;

