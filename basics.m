clc;
close all;
clear all;

fm = 10;
fm2 = 25;
fm_gnss = 15;

fs= 100;
t= 0:1/fs : (10/fm) - (1/fs);
amp_aa= 7;
amp_aa2= 9;
amp_aa3= 4;
aa_aa_local = 1;
aa = amp_aa*exp(1i*2*pi*fm*t) + amp_aa2*exp(1i*2*pi*fm2*t)...
    + amp_aa3*exp(1i*2*pi*fm_gnss*t);
aa_local = exp(1i*2*pi*(-fm)*t);

mixer = aa_local.*aa;

mean_mixer = mean(mixer);

subtrct = mixer  - mean_mixer;
fprintf("mixer1 Mean= %d" ,mean_mixer)

% df = -fs/2:fs/length(aa):(fs/2) - (fs/length(aa));
% figure('name','incoming');
% subplot(211);
% plot(aa);
% subplot(212);
% stem(df,fftshift(abs(fft(aa))));


% figure('name','mixer1');
% subplot(211);
% plot(real(mixer));hold on;
% plot(imag(mixer),'r');
% legend('real','imag')
% subplot(212);
% stem(df,fftshift(abs(fft(mixer))));  


% figure('name','subtract1');
% subplot(211);
% plot(real(subtrct));hold on;
% plot(imag(subtrct),'r');
% legend('real','imag')
% subplot(212);
% stem(df,fftshift(abs(fft(subtrct))));



% %Mitigation2 :
% fm2_local = (fm2-fm);
% aa_local2 = exp(1i*2*pi*(-fm2_local)*t);
% mixer2 = aa_local2.*subtrct;
% mean_mixer2 = mean(mixer2);

% subtrct2 = mixer2  - mean_mixer2;
% fprintf("\nmixer2 Mean= %d" ,mean_mixer2)


% figure('name','mixer2');
% subplot(211);
% plot(real(mixer2));hold on;
% plot(imag(mixer2),'r');
% legend('real','imag')
% subplot(212);
% stem(df,fftshift(abs(fft(mixer2)))); 

% figure('name','subtract2');
% subplot(211);
% plot(real(subtrct2));hold on;
% plot(imag(subtrct2),'r');
% legend('real','imag')
% subplot(212);
% stem(df,fftshift(abs(fft(subtrct2))));
