# Matched-Filters-Correlators-ISI
With a team of four, we have made a MATLAB code that proves that Matched filter is the best filter, and the same as correlators at sampling time(Ts) and investigated the ISI

The PAM signals can be viewed as a result of convolution between impulses located 
every Ts and a pulse shaping function p(t), where Ts is the symbol duration, the 
symbol rate is Rs=1/Ts.

![impulse](https://user-images.githubusercontent.com/68920161/166459864-2b3b9965-5862-410f-b714-2fd2f82c660e.png)

For binary polar signaling, the impulses take one of two values : +1, -1
The resultant waveform is transmitted over an AWGN channel. Noise is added at the 
receiver front end, the PSD of the noise is No/2. At the receiver, it is required to use a 
filter that maximizes the SNR at the sampling instants. It can be proved that the 
matched filter h(t)=p(Ts-t) is the optimum filter

![Matched filter](https://user-images.githubusercontent.com/68920161/166460008-372b9571-0811-42dc-a148-1a0321e817ee.png)

The correlator can also be used instead of the matched filter, the correlator block 
diagram is as follows:

![Correlator](https://user-images.githubusercontent.com/68920161/166460175-3c5750c5-7bce-4d2f-be57-89e6dfce66c8.png)

# ISI
<p align="center">
<img src="https://user-images.githubusercontent.com/68920161/166462071-05ff7533-9a90-4fd8-aac6-3efbd5561e2e.png">
</p>
* <b>At the TX</b> we have square root of the sinc (raised cosine) at time domain

![rcosine](https://user-images.githubusercontent.com/68920161/166461844-9928cdf5-50b0-41fd-b9fb-1c6e1867b866.png)

* <b>At the RX</b> we have square root of the sinc (raised cosine) at time domain then when multiplying them (square root of the sinc at Tx and Rx) we will get the Matched filter (sinc) at Rx.
![Matched filter](https://user-images.githubusercontent.com/68920161/166462258-1156bc0d-23f3-479d-ad77-7f0d3739432a.png)

* <b>Increasing the delay</b> shifts the signal to left with same width in time domain and same BW in frequency domain, we try to make it causal as sinc from -∞:∞ which can't be implemented, so instead of sending the max. at zero we shift at to be more as sinc.
* <b>Increasing the roll-off factor</b> increase the BW in frequency domain. Therefore, the width of the sinc decreases in time domain the decrease faster to zero i.e., become sharper which we expect to see less distortion due to ISI.

At frequency domain we expect to see rect.
![rect](https://user-images.githubusercontent.com/68920161/166462714-486aba5c-65ed-4a45-9851-5020d7e86abb.png)
![rect](https://user-images.githubusercontent.com/68920161/166464325-8c3a66bf-91a6-4de5-be95-c4f140e1efb6.png)

*	For all the rect at the Rx is more rect than in Tx as Tx is raised cosine not sinc and at Rx is sinc
*	As we increase the delay it tends to be more rect as it tends to be more sinc in time domain
*	As we increase roll-off factor the BW increases, and it tends to be more rect for smaller roll-off factor.
*	Here, we have a trade off between BW and ISI, as BW increases ISI decreases as the sinc reaches zero faster and doesn't interfere with any other signals, but for small BW we will have lager data to be send by using FDM, but ISI will increase.

*	<b>Eye diagram:</b> a graphical display of a serial data signal with respect to time that shows a pattern that resembles an eye.i.e., it is the pattern of all waveform overreach other   For the time domain we put all the sinc overreach overs at Rx. And we put all the raised cosine over each other in the Tx. 
If we send rect then the eye diagram should be more to rect as when distortion decreases the slope increases all the wave will be on each other when we send sinc when there is no distortion all sinc will be exactly over each other.

Roll off factor=0, Delay=2
<p>@Tx</p>

![eyediagram_02_Tx](https://user-images.githubusercontent.com/68920161/166465502-66f97d4b-ab78-4727-9269-ee7b2b3ce730.png)
<p>@Rx</p>

![eyediagram_02_rx](https://user-images.githubusercontent.com/68920161/166465506-75260585-e13a-47c9-a8b0-4297b02ffe81.png)

* The height of Rx is larger than the eye height of Tx which indicates that the receiver has higher SNR than the transmitter as the eye height is direct proportional to the SNR.
* Since R=0 so bandwidth = Nyquist rate →BW=Nyquist Rate(1+R)

Roll off factor=0, Delay=8

Rx

![eyediagram_08_rx](https://user-images.githubusercontent.com/68920161/166466471-b79bce9c-11a2-47ab-87b8-097e1dd43529.png)

Tx

![eyediagram_08_Tx](https://user-images.githubusercontent.com/68920161/166466472-90b01316-099d-4dad-8403-c3ccc2389d3b.png)

* The receiver has higher SNR than the transmitter as the eye height at Rx is higher than the eye height at Tx.
* Higher delay increases the eye height than the case which D=2 as the higher delay gives more accuracy and increases SNR.
* Since R=0 so bandwidth = Nyquist rate →BW=Nyquist Rate(1+R)

Roll off factor=1, Delay=2

Tx

![eyediagram_12_Tx](https://user-images.githubusercontent.com/68920161/166467346-6b5b2ecd-be19-41c3-bc7a-36c9686af2d2.png)

Rx

![eyediagram_12_rx](https://user-images.githubusercontent.com/68920161/166467350-3827fd65-f78a-4f4a-918f-12cc656898c0.png)

* The receiver has higher SNR than the transmitter as the eye height at Rx is higher than the eye height at Tx.
* Increasing roll off factor leads to higher bandwidth as bandwidth is direct proportional to eye opening width,
* Since R=1 so bandwidth = 2×Nyquist rate →BW=Nyquist Rate(1+R)
* Higher roll off factor decreases inter symbol interference as number of unique paths in the diagram decrease

Roll off factor=1, Delay=8

Rx

![eyediagram_18_rx](https://user-images.githubusercontent.com/68920161/166468081-7dd9e192-3d86-4ea6-84a2-5f196956ab2e.png)

Tx

![eyediagram_18_Tx](https://user-images.githubusercontent.com/68920161/166468089-bc778284-02de-42fb-9561-7066f44731d5.png)

* The receiver has higher SNR than the transmitter as the eye height at Rx is higher than the eye height at Tx.
* Increasing roll off factor leads to higher bandwidth as bandwidth is direct proportional to eye opening width,
* Since R=1 so bandwidth = 2×Nyquist rate →BW=Nyquist Rate(1+R)
* Higher roll off factor decreases inter symbol interference as number of unique paths in the diagram decrease
* Higher delay increases the eye height as the higher delay gives more accuracy and increases SNR.


Note: For all the eye diagram we have some shift in the left only because we have delay.

