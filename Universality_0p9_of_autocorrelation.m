
function Universality_0p9_of_autocorrelation

clear
format short
dim = 2048;

ti = 0;
tf = 20;
tnum = 200;
tarray = linspace(ti,tf,tnum);
dt = tarray(2);


disp(['db[n=1]/b[n=1] = ',num2str(9/10)]);

bn1 = 1 + 9*(1:dim);
bn1 = bn1./10;
H1 = diag(-bn1,1) + diag(bn1,-1);

bn2 = (1:dim).^(9/10);
H2 = diag(-bn2,1) + diag(bn2,-1);

bn3 = sqrt(1 + 9*(1:dim).^2);
bn3 = bn3/sqrt(10);
H3 = diag(-bn3,1) + diag(bn3,-1);


phi0 = zeros(dim + 1,1);
phi0(1) = 1;

fidC = fopen(['Universality_0p9_of_autocorrelation_dim_',num2str(dim),'.txt'],'wt');
fidK = fopen(['Universality_0p9_of_Krylov_dim_',num2str(dim),'.txt'],'wt');

for n = 0:tnum - 1
    disp(['n=',num2str(n)]);
    t = n*dt;
    phi = expm(H1*t)*phi0;
    Cres1 = phi(1);
    Kres1 = sum((1:dim + 1)'.*(phi.^2));

    phi = expm(H2*t)*phi0;
    Cres2 = phi(1);
    Kres2 = sum((1:dim + 1)'.*(phi.^2));

    phi = expm(H3*t)*phi0;
    Cres3 = phi(1);
    Kres3 = sum((1:dim + 1)'.*(phi.^2));

    fprintf(fidC,'%1.6f %1.6f %1.6f %1.6f\n',t,Cres1,Cres2,Cres3);
    fprintf(fidK,'%1.6f %1.6f %1.6f %1.6f\n',t,Kres1,Kres2,Kres3);

end

end



