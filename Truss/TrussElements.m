%% Truss Homework Problem 2 %%

%% Point 1 %%
A = (1.75 * 3.5); E = 2 * (10^6);
x1 = 0; y1 = 0;
x2 = 96; y2 = 96;

length = trussLength(x1,y1,x2,y2)
cos = trussCos(x1,x2,length)
sin = trussSin(y1,y2,length)

ke = [cos^2, cos*sin, -(cos^2), -(cos*sin);
    cos*sin, sin^2, -(cos*sin), -(sin^2);
    -(cos^2), -(cos*sin), cos^2, cos*sin;
    -(cos*sin), -(sin^2), cos*sin, sin^2;];

Ke = ke * (A*E/length)

%% Point 2 %%
A = (1.75 * 3.5); E = 2 * (10^6);
x1 = 0; y1 = 96;
x2 = 96; y2 = 96;

length = trussLength(x1,y1,x2,y2)
cos = trussCos(x1,x2,length)
sin = trussSin(y1,y2,length)

ke = [cos^2, cos*sin, -(cos^2), -(cos*sin);
    cos*sin, sin^2, -(cos*sin), -(sin^2);
    -(cos^2), -(cos*sin), cos^2, cos*sin;
    -(cos*sin), -(sin^2), cos*sin, sin^2;];

Ke = ke * (A*E/length)

%% Point 3 %%
A = (1.75 * 3.5); E = 2 * (10^6);
x1 = 96; y1 = 96;
x2 = 192; y2 = 96;

length = trussLength(x1,y1,x2,y2)
cos = trussCos(x1,x2,length)
sin = trussSin(y1,y2,length)

ke = [cos^2, cos*sin, -(cos^2), -(cos*sin);
    cos*sin, sin^2, -(cos*sin), -(sin^2);
    -(cos^2), -(cos*sin), cos^2, cos*sin;
    -(cos*sin), -(sin^2), cos*sin, sin^2;];

Ke = ke * (A*E/length)

%% Point 4 %%
A = (1.75 * 3.5); E = 2 * (10^6);
x1 = 0; y1 = 96;
x2 = 96; y2 = 151.4;

length = trussLength(x1,y1,x2,y2)
cos = trussCos(x1,x2,length)
sin = trussSin(y1,y2,length)

ke = [cos^2, cos*sin, -(cos^2), -(cos*sin);
    cos*sin, sin^2, -(cos*sin), -(sin^2);
    -(cos^2), -(cos*sin), cos^2, cos*sin;
    -(cos*sin), -(sin^2), cos*sin, sin^2;];

Ke = ke * (A*E/length)

%% Point 5 %%
A = (1.75 * 3.5); E = 2 * (10^6);
x1 = 96; y1 = 151.4;
x2 = 192; y2 = 96;

length = trussLength(x1,y1,x2,y2)
cos = trussCos(x1,x2,length)
sin = trussSin(y1,y2,length)

ke = [cos^2, cos*sin, -(cos^2), -(cos*sin);
    cos*sin, sin^2, -(cos*sin), -(sin^2);
    -(cos^2), -(cos*sin), cos^2, cos*sin;
    -(cos*sin), -(sin^2), cos*sin, sin^2;];

Ke = ke * (A*E/length)

%% System of Equations for Q %%

syms q5 q6 q7 q8 q9 q10

eq1 = 10000*(25.52*q5 - 1.2760*q9) == 0;
eq2 = 10000*(165.82*q7 + 82.910*q9 - 47.846*q10) == 0;
eq3 = 10000*(52.22*q8 - 47.846*q9 - 27.611*q10) == 0;
eq4 = 10000*(-1.276*q5 - 87.910*q7 + 47.846*q8 + 95.67*q9 - 47.846*q10) == 0;
eq5 = 10000*(47.846*q7 - 2.7611*q8 - 47.846*q9 + 27.611*q10) == -500.0;

sol = solve([eq1, eq2, eq3, eq4, eq5], [q5, q6, q7, q8, q9, q10]);
sol.q5
sol.q6
sol.q7
sol.q8
sol.q9
sol.q10

Q5 = -1296525612045875/40785773265732109882.0
Q6 = 0
Q7 = -7836970392916875/20392886632866054941.0
Q8 = -38119487794972000/20392886632866054941.0
Q9 = -12965256120458750/20392886632866054941.0
Q10 = -49627467614862500/20392886632866054941.0