% Homework on Method of Weighted Variables %

%% Problem 1 %%

syms c1 c2

% Solve for System of Equations after integrated residual equations

eq1 = (c1 + c2)/7 - c2/6 + (4*c1 + 5*c2)/5 - c2/4 - (5*c1 + 6*c2)/3 + 2*c2/2 + 2/3 - 2/5 == 0;
eq2 = (c1 + c2)/6 - (c1 + 2*c2)/5 + (5*c1 + 7*c2)/4 - (5*c1 + 8*c2)/3 + 2*c2/c2 -2/4 + 2/3 == 0;
S = solve([eq1,eq2],[c1,c2]);
C1 = double(S.c1)
C2 = double(S.c2)
C3 = -(C1 + C2)

%% Problem 2 %%

syms c1 c2 c3 c4 c5 L

dN1 = (1 - L^6);
dN2 = (2*L - L^6);
dN3 = (3*L^2 - L^6);
dN4 = (4*L^3 - L^6);
dN5 = (5*L^4 - L^6);
dTDL = c1*dN1 + c2*dN2 + c3*dN3 + c4*dN5 + c5*dN5;
k = 64;
Ax = k*pi - 2*k*pi*L + k*pi*L^2;

eq1 = (L - L^6)*Ax*dTDL;
eq2 = (L^2 - L^6)*Ax*dTDL;
eq3 = (L^3 - L^6)*Ax*dTDL;
eq4 = (L^4 - L^6)*Ax*dTDL;
eq5 = (L^5 - L^6)*Ax*dTDL;

eqn1 = int(eq1, L, 0, 1);
eqn2 = int(eq2, L, 0, 1);
eqn3 = int(eq3, L, 0, 1);
eqn4 = int(eq4, L, 0, 1);
eqn5 = int(eq5, L, 0, 1);

eqn1 = eqn1 == 0
eqn2 = eqn2 == 0
eqn3 = eqn3 == 0
eqn4 = eqn4 == 0
eqn5 = eqn5 == 0

S = solve([eqn1,eqn2,eqn3,eqn4,eqn5],[c1,c2,c3,c4,c5]);
C1 = double(S.c1)
C2 = double(S.c2)
C3 = double(S.c3)
C4 = double(S.c4)
C5 = double(S.c5)
C6 = -(132 + C1 + C2 + C3 + C4 + C5)