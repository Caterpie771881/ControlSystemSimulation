%% 对梯形法的封装
% num, den: 传递函数系数矩阵
% r: 系统输入
% 注意, 这里使用 tf2ss 的方式求系统微分方程, 可能有误差
function [t, y]=Trapezoid(num, den, r)
    [A, b, C, d]=tf2ss(num, den);
    y=[0];
    x=0;
    h=0.1;
    % 迭代四次
    for t=h:h:10
        x1=x+h*(A*x + b*r);
        x2=x+(h/2)*((A*x + b*r) + (A*x1 + b*r));
        x3=x+(h/2)*((A*x + b*r) + (A*x2 + b*r));
        x4=x+(h/2)*((A*x + b*r) + (A*x3 + b*r));
        x=x4;
        y=[y,x];
    end
    t=0:h:10;
end
