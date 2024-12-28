%% 滞环非线性环节
function [x,u1]=backlash(u1,u,x1,s)
    if (u>u1)
        if ((u-s)>=x1)
           x=u-s;
        else
           x=x1;
        end
    else
        if (u<u1)
           if ((u+s)<=x1)
               x=u+s;
           else
               x=x1;
           end
        else
            x=x1; 
        end
    end
    u1=u;
end
