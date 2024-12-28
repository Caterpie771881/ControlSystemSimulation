%% 使用系统系数矩阵、连接矩阵计算AB阵
% P: 系统系数数矩阵
% W: 系统连接矩阵
% W0: 系统输入矩阵
% Wc: 系统输出矩阵
function [A, B]=pw2ab(P, W, W0, Wc)
    A1 = diag(P(:,1));
    B1 = diag(P(:,2));
    C1 = diag(P(:,3));
    D1 = diag(P(:,4));
    H = B1 - D1 * W;
    Q = C1 * W - A1;
    A = inv(H) * Q;
    B = inv(H) * C1 * W0;
end
