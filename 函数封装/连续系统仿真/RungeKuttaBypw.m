%% 对四阶龙格库塔法的封装 (基于结构图)
% P: 系统系数矩阵
% W: 系统连接矩阵
% W0: 输入权重矩阵
% Wc: 输出权重矩阵
% r: 系统输入
% 注意, 该函数依赖 pw2ab.m
function [t, y, Xs]=RungeKuttaBypw(P, W, W0, Wc, r)
    Tf=input('仿真时间Tf=');
    h=input('计算步长h=');
    Xs=[zeros(length(Wc),1)];
    [A, B]=pw2ab(P, W, W0, Wc);
    x=[zeros(length(A),1)];
    y=[zeros(length(Wc(:,1)),1)];
    t=0;
    for i=1:Tf/h
        K1=A*x+B*r;
        K2=A*(x+h*K1/2)+B*r;
        K3=A*(x+h*K2/2)+B*r;
        K4=A*(x+h*K3)+B*r;
        x=x+h*(K1+2*K2+2*K3+K4)/6;
        y=[y, Wc*x];
        Xs=[Xs, x];
        t=[t,t(i)+h];
    end
end
