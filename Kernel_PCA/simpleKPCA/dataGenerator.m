%% Data Generator Function
% Function to generate a circular dataset with some added gaussian noise
function [Data] = dataGenerator(draw, sampleSize)
    %% Declare constants
    % Generate circular data of three different radii
    % r = 1, 10, 100
    Data2 = zeros(sampleSize,2);
    Data5 = zeros(sampleSize,2);
    Data8 = zeros(sampleSize,2);
    r1 = 0;
    r2 = 3;
    r3 = 6;
    
    %% Generate data
    % Generate 200 points each by uniformly drawing theta values
    for i = 1:sampleSize
        ang1 = 2*pi*rand();
        rad1 = r1 + randn()/5;
        Data2(i,1) = rad1*cos(ang1);
        Data2(i,2) = rad1*sin(ang1);

        ang2 = 2*pi*rand();
        rad2 = r2 + randn()/5;
        Data5(i,1) = rad2*cos(ang2);
        Data5(i,2) = rad2*sin(ang2);

        ang3 = 2*pi*rand();
        rad3 = r3 + randn()/5;
        Data8(i,1) = rad3*cos(ang3);
        Data8(i,2) = rad3*sin(ang3);
    end
    
    %% Plot the data
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
    
    %% Return the data values
    X = [Data2(:,1); Data5(:,1); Data8(:, 1)];
    Y = [Data2(:,2); Data5(:,2); Data8(:, 2)];
    Data = [X Y];
end