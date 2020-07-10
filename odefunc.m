function dy = odefunc(t,y)  %typical function setting the DEs

load('data.mat','N','beta','gamma');   % use pre-stored values
dy=zeros(2,1);  %vector [dS;dI]

dy(1)=-(beta/N)*y(1)*y(2);  %dS=-(beta/N)*s*i
dy(2)=(beta/N)*y(1)*y(2)-gamma*y(2);    %dI=(beta/N)*s*i-gamma*i

end