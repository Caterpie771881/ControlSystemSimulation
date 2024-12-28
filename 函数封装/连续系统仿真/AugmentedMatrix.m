%% 对增广矩阵法的封装
% A, b, C, d: 系统状态空间
% r: 系统输入
function [t, y]=AugmentedMatrix(A, b, C, d, r)
    Tf = input('仿真时间Tf=');
    h = input('仿真步长h=');
    x = [zeros(length(A),1)];
    y = 0;
    t = 0;
    A = [A,b;zeros(1,length(A)),0];
    C =[C,0];
    x =[x;r];
    eAt=eye(size(A))...
        +A*h...
        +A^2*h^2/factorial(2)...
        +A^3*h^3/factorial(3)...
        +A^4*h^4/factorial(4);
    for i = 1:Tf/h
        x = eAt*x;
        y = [y;C* x];  
        t = [t;t(i)+h];
    end
end
