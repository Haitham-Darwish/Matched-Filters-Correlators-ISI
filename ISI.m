% We have two roll-off factor [0 1]
R=[0 1];
% We have two delays [2 8]
DELAY=[2 8];
% Generte random bit 
Data_1 = randi([0,1],1,100); 
% Map the data from [0  1] to [A -A]
Data_mapping_1=((2*Data_1)-1)*1; 
% Introduce more data(zeros) to upsample the data to higher Fs
Data_sampling_1=upsample(Data_mapping_1,5);
 
% Loop over the roll-off factor
for r=R
    % Loop over the delays
    for delay=DELAY
        % Get the num and den of rcosine tf
        [NUM, DEN]=rcosine(1,5,'sqrt',r,delay);
        % Use num and den and mul by the data
        y_tx=filter(NUM, DEN,Data_sampling_1);
        % Plot the eyepattern at tx
        eyediagram(y_tx,5)
        figure;
        % Plot the rcosine
        plot(rcosine(1,5,'sqrt', r, delay))
        % set title
        str = sprintf('Relation between Rasied cosine of roll-off factor %.5f and delay %d',r, delay);
        title(str)
        % set x, y labels
        xlabel("Time")
        ylabel("Raised cosine")
        % Get the num and den of rcosine tf
        [NUM, DEN]=rcosine(1,5,'sqrt',r,delay);
        % Use num and den and mul by the data
        y_rx=filter(NUM, DEN,y_tx);
        % Plot the eyepattern at rx
        eyediagram(y_rx,5)
        figure;
        % Plot  Matched filter
        plot(rcosine(1,5,'sqrt', r, delay).*rcosine(1,5,'sqrt', r, delay))
        % set title
        str = sprintf('Relation between Matched filter of roll-off factor %.5f and delay %d',r, delay);
        title(str)
        % set x, y labels
        xlabel("Time")
        ylabel("Matched filter(Sinc)")
        n=-length(y_tx)/2:length(y_tx)/2-1;
        plot(n, fftshift(abs(fft(y_tx, length(y_tx)))))
        figure;
        % set title
        str = sprintf('Relation between rect at Tx of roll-off factor %.5f and delay %d',r, delay);
title(str)
        % set x, y labels
        xlabel("frequency")
        ylabel("Amplitude")
        n=-length(y_rx)/2:length(y_rx)/2-1;
        plot(n, fftshift(abs(fft(y_rx, length(y_rx)))))
        figure;
        str = sprintf('Relation between rect at Rx of roll-off factor %.5f and delay %d',r, delay);
        title(str)
         % set x, y labels
        xlabel("frequency")
        ylabel("Amplitude")
    end     
end
