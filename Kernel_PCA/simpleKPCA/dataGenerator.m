function [X, Y] = dataGenerator(draw)
    % Generate circular data of three different radii
    % r = 2, 5, 8
    Data2 = zeros(500,2);
    Data5 = zeros(500,2);
    Data8 = zeros(500,2);
    % generate 500 points each
    for i = 1:500
        ang1 = 2*pi*rand();
        rad1 = 2 + randn()/2;
        Data2(i,1) = rad1*cos(ang1);
        Data2(i,2) = rad1*sin(ang1);

        ang2 = 2*pi*rand();
        rad2 = 5 + randn()/2;
        Data5(i,1) = rad2*cos(ang2);
        Data5(i,2) = rad2*sin(ang2);

        ang3 = 2*pi*rand();
        rad3 = 8 + randn()/2;
        Data8(i,1) = rad3*cos(ang3);
        Data8(i,2) = rad3*sin(ang3);
    end
    if draw
        figure(1);
        scatter(Data2(:,1), Data2(:,2), 'r');
        hold on;
        scatter(Data5(:,1), Data5(:,2), 'g');
        hold on;
        scatter(Data8(:,1), Data8(:,2), 'b');
        hold on;
        xlabel('X coordinate');
        ylabel('Y coordinate');
        title('Initial Data');
        hold off;
    end
    
    X = [Data2(:,1); Data5(:,1); Data8(:, 1)];
    Y = [Data2(:,2); Data5(:,2); Data8(:, 2)];
end