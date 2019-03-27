clc
clear all
close all
map = robotics.BinaryOccupancyGrid(10,10,3);
xy = [4 5; 4.7 3.4; 6 5.3; 3 5.6];
setOccupancy(map,xy,1);
show(map);
hold on
plot(xy(:,1),xy(:,2),'xr','MarkerSize', 10)
set(gca,'XTick',0:0.3:10,'YTick',0:0.2:10)
xlim([2 6])
ylim([2 6])