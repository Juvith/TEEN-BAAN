filepath = fullfile(matlabroot,'examples','robotics','imageMap.png');
image = imread(filepath);
grayimage = rgb2gray(image);
bwimage = grayimage < 0.5;
grid = robotics.BinaryOccupancyGrid(bwimage);
show(grid)