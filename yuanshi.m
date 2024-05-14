% 设置参数
D = 1; % 扩散系数
num_trajs = 100; % 轨迹数
num_steps = 1000; % 时间步数
dt = 1; % 时间步长

% 生成布朗运动轨迹
trajs = zeros(num_trajs, num_steps+1);
for i = 1:num_trajs
    steps = sqrt(2*D*dt)*randn(1, num_steps);
    trajs(i, :) = [0 cumsum(steps)];
end

% 计算平均位移的平方
mean_square_displacement = mean(trajs.^2, 1);

% 拟合直线
t = dt*(0:num_steps);
p = polyfit(t, mean_square_displacement, 1);

% 绘图
plot(t, mean_square_displacement, 'o', t, p(1)*t + p(2), '-');
xlabel('时间');
ylabel('平均位移的平方');
legend('布朗运动', '拟合直线');
