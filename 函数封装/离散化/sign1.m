%% 继电器非线性环节
function x=sign1(u,s)
    if (u>0) x = s; end
    if (u<0) x=- s; end
end