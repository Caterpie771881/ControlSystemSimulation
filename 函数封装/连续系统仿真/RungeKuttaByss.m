%% 对四阶龙格库塔法的封装 (基于系统传递函数)
% A, b, C, d: 系统状态空间
% r: 系统输入
function [t, y]=RungeKuttaByss(A, b, C, d, r)
    Tf = input('仿真时间Tf='); 
    h = input('仿真步长h=');
    x = [zeros(length(A), 1)]; 
    y = 0;
    t = 0;
    for i = 1:Tf/h
        K1 = A*x + b*r;
        K2 = A*(x + h*K1/2) + b*r;
        K3 = A*(x + h*K2/2) + b*r;
        K4 = A*(x + h*K3) + b*r;
        x = x + h*(K1 + 2*K2 + 2*K3 + K4)/6;
        y = [y; C*x];
        t = [t; t(i) + h];
    end
end
