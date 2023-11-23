function mandelbrot_example

maxNumCompThreads(40);

% Run on CPU
[cpu_x,cpu_y,cpu_count,cpu_t] = calc_mandelbrot('CPU');

% Run on GPU
[gpu_x,gpu_y,gpu_count,gpu_t] = calc_mandelbrot('GPU');

figure
subplot(1,2,1)
imagesc(cpu_x,cpu_y,cpu_count)
colormap([jet; flipud(jet); 0 0 0]);
axis off

subplot(1,2,2)
imagesc(gpu_x,gpu_y,gpu_count)
colormap([jet; flipud(jet); 0 0 0]);
axis off

fprintf('CPU time: %0.2f\n',cpu_t)
fprintf('GPU time: %0.2f\n',gpu_t)

end
