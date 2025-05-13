function RH_criterion(a)
n = length(a); m = ceil(n/2);
r = zeros(n, m); r(1,:) = a(1:2:end); r(2,1:length(a(2:2:end))) = a(2:2:end);

for i = 3:n
    if r(i-1,1)==0, r(i-1,1)=1e-6; end
    for j = 1:m-1
        r(i,j) = (-1/r(i-1,1)) * det([r(i-2,1), r(i-2,j+1); r(i-1,1), r(i-1,j+1)]);
    end
end

disp('Routh Table:'); disp(r)
s = sum(diff(sign(r(:,1))) ~= 0);
if any(isnan(r(:))) || any(isinf(r(:)))
    disp('System Stability: Unstable (Special Case)');
elseif s == 0
    disp('System Stability: Stable');
else
    disp(['System Stability: Unstable (Sign changes = ', num2str(s), ')']);
end
disp(['Right Half-Plane Poles: ', num2str(s)]);
disp(['Left Half-Plane Poles: ', num2str(n - s)]);
end