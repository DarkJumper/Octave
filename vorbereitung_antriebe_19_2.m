clcclearmore offprintHeader(mfilename)##Qpm=300;Qp= 3* Qpm;rho= 1000;lambda= 0.02;lr= 80;dr=0.3;g= 9.81;Hmin= 29;Hmax = 60;printLine();v= 4*(Qp/3600)/(pi*dr^2)pdyn= 0.5 * rho*(v^2)*(1+lambda*(lr/dr))Hdyn= pdyn/(rho*g)Hpmax = Hdyn + HmaxHpmin = Hdyn + Hminfunction ret = Ppump(Q,rho,g,Hp)  ret = (Q/3600)* rho*g*Hp;endfunctionPpmax = Ppump(Qp,rho,g,Hpmax)Ppmin = Ppump(Qp,rho,g,Hpmin)Pmotmax = Ppmax/0.77Pmotmin = Ppmin/0.77kA = 8*(1+lambda*(lr/dr))/(pi^2*dr^4*g)function ret=Ha(Hstat,kA,Q)  ret = Hstat+kA*(Q/3600)^2;endfunctionHamax = Ha(Hmax,kA,Qpm)Hamin = Ha(Hmin,kA,Qpm)     PN = 285e3     MN = 1831     NN = PN/(2*pi*MN)*60     ETAN = 0.96     CPN = 0.82     IN = 305     UN = 690     MAMN = 1.7     IAIN = 7.2     MKMN = 2.6     NAME = "1LH1203-3AB14-2"MOT = ASM ( PN, NN, MN, ETAN, CPN, IN, UN, MAMN, IAIN, MKMN, NAME );ASM_SOK(MOT)ASM_SOK(MOT,689.99)##rho = 0.7*1000d = 750/1000eta=1;nmin = 190/60nmax = 210/60re = rho*nmin*d^2/etare = rho*nmax*d^2/etaPm= 3.5 * rho*nmin^3*d^5Pm= 3.5 * rho*nmax^3*d^5