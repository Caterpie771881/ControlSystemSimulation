%% 对包含符号函数的环节进行反馈连接
% G: 环节前向通道传递函数之积
% H: 环节反向通道传递函数之积
% sign: 反馈极性
function GB=feedbacksym(G, H, sign)
    if nargin==2
        sign=-1;
    end
    GB=G/(sym(1)-sign*G*H);
    GB=simplify(GB);
end
