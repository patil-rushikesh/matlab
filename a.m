function root_locus_plot(num, den)
    sys = tf(num, den);
    rlocus(sys);
    grid on;
    title('Root Locus Plot');
    [k, poles] = rlocfind(sys);
    fprintf('Gain K = %.4f\n', k);
    disp('Poles at selected K:');
    disp(poles);
    rlocusplot(sys);
end