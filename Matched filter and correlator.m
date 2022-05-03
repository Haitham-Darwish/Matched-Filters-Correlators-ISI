%genenrate random data
A=1;
NumberofBits = 10;
timeAxis = 0.2: 0.2: 0.2*NumberofBits*5;
Data_Size=[1,10];
%a)Generate an array consisting of 10 bits
Data=randi([0,1],Data_Size);
%b)Convert the bit stream to +1's, -1's
Data_mapped=((2*Data)-1)*A;
%c)Generate a signal consisting of impulses every Ts
%sampling the signal every Ts
Data_sampled=upsample(Data_mapped,5);
%_________
%pulse shaping
p=[5 4 3 2 1]/sqrt(55);
%d)Convolve the sequence with the discrete pulse shaping function to
y=conv(p,Data_sampled);
%e)generate 2 filters
%first filter MF
matchedFilter=fliplr(p);
matchedFilter_Output=conv(matchedFilter,y);
%second filter Rect
rectFilter=[1 1 1 1 1]/sqrt(5);
rectFilter_Output=conv(rectFilter,y);
%Add delay to shift the output
k=[p p(2:end) p(1) p(3:end) p(1:2) p(4:end) p(1:3) p(5:end) p(1:4)];
f=reshape(y(:,1:50), 5, 10);
k1=[p(1) zeros(1, 4) p(1:2) zeros(1, 3)  p(1:3) zeros(1, 2) p(1:4) zeros(1, 1) p(1:end)];
k3=reshape(k1, 5, 5);

correlator =(k3'*f)(:);
figure;
plot(matchedFilter_Output);
hold on;
plot(correlator);
legend('MF. Output', 'Corr. Output');
xlabel('time');
ylabel('Amplitude');
hold off;
figure;
subplot(1,2,1);
plot(matchedFilter_Output(1:NumberofBits*5), 'r');
title('Matched Filter Output');
xlabel('time');
ylabel('Amplitude');
subplot(1,2,2);
plot(rectFilter_Output(1:NumberofBits*5), 'b');
title('Rect. Filter Output');
xlabel('time');
ylabel('Amplitude');


