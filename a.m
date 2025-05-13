function dominant_poles_plot(num, den)
    sys = tf(num, den);
    figure;
    rlocus(sys);
    grid on;
    title('Root Locus Plot');
    K = input('Enter the value of gain K: ');
    sys_cl = feedback(K*sys, 1);
    poles = pole(sys_cl);
    disp('Poles of the closed-loop system:');
    disp(poles);
    [~, idx] = max(real(poles));
    dominant_pole = poles(idx);
    fprintf('Dominant pole: %.4f%+.4fj\n', real(dominant_pole), imag(dominant_pole));
    hold on;
    plot(real(dominant_pole), imag(dominant_pole), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    legend('Root Locus', 'Dominant Pole');
end
