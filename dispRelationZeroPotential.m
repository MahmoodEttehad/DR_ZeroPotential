clc
clear
close all

% This code plots dipestion relation for zero potensial, see Figure 5 in:
% M. Ettehad and B. Hatinoglu, On the Spectra of Periodic Elastic Beam Lattices: Single-Layer Graph, submitted, 2021.


% choice of Brillouin zone, 
% Bid = 0 correspond Figure 5(left)
% Bid = 1 correspond Figure 5(right)
Bid = 0;

N = 300;
n = 2;
t1 = linspace(-2*pi,2*pi,N);
t2 = linspace(-2*pi,2*pi,N);

[T1,T2] = meshgrid(t1,t2);
X1 = (sqrt(3)*T1+T2)/2;
X2 = (sqrt(3)*T1-T2)/2;
if (Bid == 0)
    F = 1 + exp(i*T1) + exp(i*T2);
else
    X1 = (sqrt(3)*T1+T2)/2;
    X2 = (sqrt(3)*T1-T2)/2;
    F = 1 + exp(i*X1) + exp(i*X2);
end
Fs = abs(F);

L1 = acos(+Fs/3);
LP = zeros(N,N,n);
for k = 1:n
    LP(:,:,k) = (L1 + (k-1)*pi).^4;
end
L2 = acos(-Fs/3);
LN = zeros(N,N,n);
for k = 1:n
    LN(:,:,k) = (L2 + (k-1)*pi).^4;
end
figure
for k = 1:n-1
    mesh(T1,T2,(LP(:,:,k)).^(1/2));
%     mesh(T1,T2,(LP(:,:,k)));
    hold on
end
for k = 1:n-1
    hold on
    mesh(T1,T2,(LN(:,:,k)).^(1/2));
%     mesh(T1,T2,(LN(:,:,k)));
end
xlabel('\theta_1','FontSize',24)
ylabel('\theta_2','FontSize',24)
zlabel('\lambda^{1/2}','FontSize',24)
set(gca,'XTick',-pi:pi:pi) 
set(gca,'YTick',-pi:pi:pi) 
set(gca,'XTickLabel',{'-\pi','0','\pi'},'FontSize',18)
set(gca,'YTickLabel',{'-\pi','0','\pi'},'FontSize',18)
grid on
grid minor
xlim([-pi-pi/2,pi+pi/2])
ylim([-pi-pi/2,pi+pi/2])
colormap(jet)
set(gcf,'color','w');
width=1200;
height=900;
set(gcf,'position',[200,200,width,height]);
set(gcf,'color','w');
view([-60 -60 8])
