clcclearmore offprintHeader(mfilename)#### ZQmax(S) # Quelle## ZT(S,UK) # Trafo## ZsNYYc(A)* (l/1000) # Leitung## ZASMs(Pmech,cosp,eta) # MotorUN = 400;UK = 0.04;SN = 500e6;ST = 400e3;A1 = 120;l1 = 100;A3 = 35;l3 = 30;P3mech = 30e3;cp3 = 0.84;eta3 = 0.9;Z1= ZQmax(SN) + ZT(ST,UK)+(ZsNYYc(A1)*(l1/1000))Z3 = (ZsNYYc(A3)*(l3/1000)) + ZASMs(P3mech,cp3,eta3)Zges = par(Z1,Z3)Ikmax = (1.1 * UN) / (sqrt(3.0) * Zges)printpol(Ikmax)Ikf1 = (1.1 * UN)/(sqrt(3.0)*Z1)printpol(Ikf1)