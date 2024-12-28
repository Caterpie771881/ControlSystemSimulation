%% 使用系统特征值判定系统稳定性的封装
% A: 系统状态空间的 A 参数
function JudgeByEigenvalue(A)
    P=poly(A);
    r=roots(P)
    ii=find(real(r)>0);
    n=length(ii);
    if(n>0);
        disp('System is Unstable');
    else
        disp('System is Stable');
    end
end
