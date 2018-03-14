[fname, fpath] = uigetfile('*.txt', 'Open EKG file...');
fid = fopen(strcat(fpath, fname), 'r');
s = fscan(fid, '%f', inf);
fclose(fid);

s = s - mean(s);
s = -s;

fs = 200;
lens = length(s)
t = [1:lens]/fs;
figure(1); subplot(311); plot(t, s); grid; axis tight; title('Semnal intrare');

N = 900; %minim 2-3 T
Cxx = zeros(1, N);
for k = 0 : N - 1
	Cxx(k + 1)=0;
	for n = 1 : N - k
		Cxx(k) = Cxx(k) + s(n) * s(n+k);
	end
end
figure(1); subplot(312); plot(Cxx); title('Functie corelatie');



		

