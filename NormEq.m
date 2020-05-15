function [theta]=NormEq(S,I,R)
X=[-S.*I I];
theta=pinv(X'*X)*X'*[d_dt(S) d_dt(R)];
end
