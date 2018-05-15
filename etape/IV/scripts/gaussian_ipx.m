[fname, fpath] = uigetfile('*.txt', 'Open EKG, EMG file...');
fid = fopen(strcat(fpath, fname), 'r');
s = fscanf(fid, '%f', inf);
fclose(fid);

s = s - mean(s);

fs=200;

lens = length(s);
t = (1:lens)/fs;
figure(1); subplot(311); plot(s); grid; axis tight; title('Semnal intrare');

for i = 1 : 5
    disp(i);
    putere_zgomot_db = i * 1.5;
    szg = awgn(s, putere_zgomot_db,'measured')-1; %Adaugare de zgomot Gauss.
    figure(2); subplot(311); plot(szg); grid; axis tight; title('Semnal cu zgomot Gaussian');

    figure(2); subplot(312); plot(hist(szg, 100)); grid; axis tight; title('Histograma zgomot Gaussian');
    w = waitforbuttonpress;
end
