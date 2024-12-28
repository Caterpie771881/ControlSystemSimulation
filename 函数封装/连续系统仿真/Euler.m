%% 对欧拉法的封装
% num, den: 传递函数系数矩阵
% r: 系统输入
% 注意, 这里使用 tf2ss 的方式求系统微分方程, 可能有误差
function [t, y]=Euler(num, den, r)
    [A, b, C, d]=tf2ss(num, den);
    h=input('仿真步长h=');
    y=[0];
    x=0;
    for t=h:h:10
        x = x+h*(A*x + b*r);
        y = [y,x];
    end
    t=0:h:10;
end
