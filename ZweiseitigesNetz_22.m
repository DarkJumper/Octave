clearclcmore offprintHeader(mfilename)##UN = 400Upro = 400/100dUmax = 20## Verbraucher DatenPX2 = 30e3;cpX2= 0.88;PX3 = 15e3;cpX3=0.93;PX4 = 45e3;cpX4= 0.85;PX6 = 15e3;cpX6 = 0.88;PX7= 12.5e3;cpX7 = 0.9;## Leitungslängenl11=50;l12=30;l13=30;l14=40;l15=70;l2=40;l3=50;l4=50;l5=30;l6=20;l7=25;## Netzte Definierennet2=[l2,PX2,cpX2];net3=[l3,PX3,cpX3];net4=[l4,PX4,cpX4];net6=[l6,PX6,cpX6];net7=[l7,PX7,cpX7];[PX67,cpX67]=Pges([net6;net7]);net5=[l5,PX67,cpX67];net11=[l11,PX2,cpX2;              l12,PX67,cpX67;              l13,PX3,cpX3;              l14,PX4,cpX4;              l15,0,0];net13 = [l11,PX2,cpX2;                   l12,PX67,cpX67;                   l13,PX3,cpX3;                   l14,PX4,cpX4];## SpannungsfalldU1max = [1*Upro,1.3*Upro,1.6*Upro,1.9*Upro];dU2max = dUmax - dU1max(1);dU5max = dUmax -  dU1max(2)  - 2.4*Upro;dU67max = dUmax - dU5max - dU1max(2);dU3max =  dUmax - dU1max(3);dU4max = dUmax - dU1max(4);##Leitungsauslegungw7 = wire(0,1,5,net7,dU67max);w6 = wire(0,1,5,net6,dU67max);w67next = {"w6","w7"}; w5 = wire(w67next,1,5,net5,dU5max);w4 = wire(0,1,5,net4,dU4max);w3 = wire(0,1,5,net3,dU3max);w2 = wire(0,1,5,net2,dU2max);w234567next = {"w2","w3","w4","w5"};w11=wire(w234567next,1,5,net11,dU1max);w11.UA = UN + (0.5*Upro); w11.UB = UN-(0.5*Upro);w12=wire(w234567next,1,5,net11,dU1max);w12.UA = UN-(0.5*Upro);w12.UB = UN + (0.5*Upro); w13=wire(w234567next,1,5,net13,dU1max);## Leitung Dimensionierenw7 = dimWireNYY(w7);w6 = dimWireNYY(w6);w5 = dimWireNYY(w5);w4 = dimWireNYY(w4);w3 = dimWireNYY(w3);w2 = dimWireNYY(w2);w11 = dimWireNYY(w11);w12 = dimWireNYY(w12);w13 = dimWireNYY(w13);## AusgabeprintWire(w7)printWire(w6)printWire(w5)printWire(w4)printWire(w3)printWire(w2)printWire(w11)printWire(w12)printWire(w13)## Gesammt SpannunsfalldUV2 = (max([abs(w11.dU(1)),abs(w12.dU(1)),abs(w13.dU(1))])+w2.dU)/UprodUV3 = (max([abs(w11.dU(3)),abs(w12.dU(3)),abs(w13.dU(3))])+w3.dU)/UprodUV4 = (max([abs(w11.dU(4)),abs(w12.dU(4)),abs(w13.dU(4))])+w4.dU)/UprodUV5 = (max([abs(w11.dU(2)),abs(w12.dU(2)),abs(w13.dU(2))])+w5.dU)/UprodUV6 = (max([abs(w11.dU(2)),abs(w12.dU(2)),abs(w13.dU(2))]) +w5.dU+ w6.dU)/UprodUV7 = (max([abs(w11.dU(2)),abs(w12.dU(2)),abs(w13.dU(2))]) +w5.dU+ w7.dU)/Upro