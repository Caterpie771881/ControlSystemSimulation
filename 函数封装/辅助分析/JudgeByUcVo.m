%% 求能控性矩阵、可观测性矩阵并判断系统是否能控与可观测
% A, b, C, d: 系统状态空间参数
function [Uc, Vo]=JudgeByUcVo(A, b, C, d)
    Uc=ctrb(A, b);
    Vo=obsv(A, C);
    if(A^(rank(Uc)-1)*b==Uc(end));
        disp('System can Control');
    else
        disp('System can not Control');
    end
    if(A^(rank(Vo)-1)*C==Vo(end));
        disp('System is Observable');
    else
        disp('System is Unobservable');
    end
end
