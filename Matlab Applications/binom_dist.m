% Binomial distribution

clear all;

k=0:20;
y=binopdf(k,20,0.5);
figure(1);
stem(k,y)

xlabel('k')
ylabel('Binomial df')

% More explicit way:

p=0.5;
n=20;

y2 = zeros(20,1);
for k=1:20
	y2(k)=factorial(n)/(factorial(k)*factorial(n-k))*p^k*(1-p)^(n-k);
end

figure(2);
stem(y2)

k = 1:20;
figure(3);
plot(k, y2)