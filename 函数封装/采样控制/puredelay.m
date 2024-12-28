%% 纯滞后非线性环节
function [x,U1]=puredelay(u,m,U1)
    x=U1(m+1,1);
    U1=[u;U1(1:m)];
end
