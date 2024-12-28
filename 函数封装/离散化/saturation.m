%% 饱和非线性环节
function x=saturation(u,s)
    if (abs(u)>=s)
        if (u>0)
            x= s; 
        else
            x=-s;
        end
    else
        x= u;
    end
end
