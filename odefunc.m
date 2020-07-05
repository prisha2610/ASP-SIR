function dy = odefunc(t,y)

load('data.mat','N','beta','gamma');
dy=zeros(2,1);

dy(1)=-(beta/N)*y(1)*y(2);
dy(2)=(beta/N)*y(1)*y(2)-gamma*y(2);

end