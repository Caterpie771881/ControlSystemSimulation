%% 对连续系统环节离散化仿真的封装
% P: 系统系数矩阵
% W: 系统连接矩阵
% W0: 输入权重矩阵
% Wc: 输出权重矩阵
% R: 系统输入
% 注意, 该函数依赖 sign1.m / saturation.m / deadzone.m / backlash.m
function [t, y]=DiscretizationSimulation(P, W, W0, Wc, R)
    Tf = input('仿真时间Tf=');
    T = input('采样时间T=');
    A=P(:,1);
    B=P(:,2);
    C=P(:,3);
    D=P(:,4);
    FZ=P(:,5);
    S=P(:,6);
    n=length(A);
    
    % 计算离散时间系统的参数
    for i=1:n
        if(A(i)~=0)
            if(B(i)==0)
                E(i)=0;F(i)=0;G(i)=0;H(i)=0;
                L(i)=(C(i)+D(i)/T)/A(i);Q(i)=-D(i)/(A(i)*T);
            else
                E(i)=exp(-A(i)*T/B(i));
                F(i)=(D(i)/B(i)-C(i)/A(i))*((1-E(i))*B(i)/(A(i)*T)-1);
                G(i)=(D(i)/B(i)-C(i)/A(i))*(1+(E(i)-1)*(1+B(i)/(A(i)*T)));
                H(i)=1;L(i)=D(i)/B(i);Q(i)=0;
            end
        else
            if(B(i)~=0)
                E(i)=1; F(i)=0.5*C(i)*T/B(i); G(i)=F(i);
                H(i)=1;L(i)=D(i)/B(i);Q(i)=0;
            else
                disp('A(i)=B(i)=0');
            end
        end
    end
    
    x=[zeros(length(A),1)]; x0=x; z=x;
    u=[zeros(length(A),1)]; u0=u;
    y=[zeros(length(Wc(:,1)), 1)];t=0;
    
    % 仿真主循环
    for j=1:Tf/T
        u1=u;
        u=W*x+W0*R;
        for i=1:n
            if(FZ(i)~=0)
                if(FZ(i)==1) 
                    u(i)=saturation(u(i),S(i));
                end
                if(FZ(i)==2) 
                    u(i)=deadzone(u(i),S(i));
                end
                if(FZ(i)==3)
                    [u(i),u0(i)]=backlash(u0(i),u(i),u1(i),S(i));
                end
                if(FZ(i)==4)
                    u(i)=sign1(u(i),S(i));
                end
            end
        end
        x1=x;
        for i=1:n
            z(i)=E(i)*z(i)+F(i)*u(i)+G(i)*u1(i); 
            x(i)=H(i)*z(i)+L(i)*u(i)+Q(i)*u1(i);
        end
        for i=1:n
            if(FZ(i)~=0)
                if(FZ(i)==5) 
                    x(i)=saturation(x(i),S(i));
                end
                if(FZ(i)==6)
                    x(i)=deadzone(x(i),S(i));
                end
                if(FZ(i)==7)
                    [x(i),x0(i)]=backlash(x0(i),x(i));
                end
                if(FZ(i)==8)
                    x(i)=signl(x(i),S(i));
                end
            end
        end
        y=[y,Wc*x];
        t=[t,t(j)+T];
    end

end
