clcclearmore offprintHeader(mfilename);#### ZQmax(S) # Quelle## ZT(S,UK) # Trafo## ZsNYYc(A)* (l/1000) # Leitung## ZASMs(Pmech,cosp,eta) # MotorZQ1= ZQmax(500e6)ZT1= ZT(315e3,0.04)Zl1312 = ZsNYYc(150)*(80/1000);Zl11 = ZsNYYc(150)*(50/1000);Zl2122 = ZsNYYc(70)*(85/1000);Zl232425 = ZsNYYc(70)*(110/1000);Zl3 = ZsNYYc(50)*(40/1000);Zl4 = ZsNYYc(16)*(35/1000);ZM4 = ZASMs(30e3,0.84,0.923);ZM1 = ZASMs(30e3,0.84,0.923);Zkmax = par(Zl1312+ par(ZM1,(ZQ1+ZT1+Zl11)),(par(Zl2122,Zl232425) + Zl3+Zl4+ZM4))Ikmax = (1.1 * 400) / (sqrt(3.0) * Zkmax)Ik1 = (1.1 *400) / (sqrt(3.0) * Zkmax)IkF1 = Ik1*(ZM1/(ZM1 + ZQ1+ZT1+Zl11))Ik2 = Ikmax - Ik1IkF22 = Ik2 * (Zl2122/ (Zl2122 + Zl232425))IkF21 = Ik2  - IkF22