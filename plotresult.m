function F = plotresult(A,B,C)

subplot(1,2,1)
hold on
if B==1
stairs(A,C,'y-','Linewidth',2);
end
if B==2
stairs(A,C,'b-','Linewidth',2);
end
if B==3
stairs(A,C,'g-','Linewidth',2);
end
if B==4
stairs(A,C,'r-','Linewidth',2);
end
if B==5
stairs(A,C,'m-','Linewidth',2);
end

subplot(1,2,2)
hold on
if B==1
stairs(A,log(C),'y-','Linewidth',2);
end
if B==2
stairs(A,log(C),'b-','Linewidth',2);
end
if B==3
stairs(A,log(C),'g-','Linewidth',2);
end
if B==4
stairs(A,log(C),'r-','Linewidth',2);
end
if B==5
stairs(A,log(C),'m-','Linewidth',2);
end