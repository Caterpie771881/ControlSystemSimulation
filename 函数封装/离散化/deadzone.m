%% 死区非线性环节
function x=deadzone(u,s)
    if (abs(u)>=s)
       if (u>0)
           x=u-s;
       else
           x= u+s;
       end
    else
        x=0; 
    end
end
