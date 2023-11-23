function t = threads_example(N)

matrix = rand(N);

t0 = tic;
fft(matrix);
t = toc(t0);

end
