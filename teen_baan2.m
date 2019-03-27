load exampleMaps.mat
whos *Map*
map = robotics.BinaryOccupancyGrid(simpleMap,2);
figure(1)
show(map)
robotRadius = 0.2;
mapInflated = copy(map);
inflate(mapInflated,robotRadius);
figure(2)
show(mapInflated)
prm = robotics.PRM;
prm.Map = mapInflated;
prm.NumNodes = 50;
prm.ConnectionDistance = 5;
startLocation = [2 1];
endLocation = [12 10];
path = findpath(prm, startLocation, endLocation);
figure(3)
show(prm)
map = robotics.BinaryOccupancyGrid(complexMap,1);
show(map)
mapInflated = copy(map);
inflate(mapInflated, robotRadius);
figure(4)
show(mapInflated)
prm.Map = mapInflated;
prm.NumNodes = 20;
prm.ConnectionDistance = 15;
figure(5)
show(prm)
startLocation = [3 3];
endLocation = [45 35];
path = findpath(prm, startLocation, endLocation);
while isempty(path)
    % No feasible path found yet, increase the number of nodes
    prm.NumNodes = prm.NumNodes + 10;
    
    % Use the |update| function to re-create the PRM roadmap with the changed
    % attribute
    update(prm);
    
    % Search for a feasible path with the updated PRM
    path = findpath(prm, startLocation, endLocation);
end
path
figure(5)
show(prm)
map = robotics.OccupancyGrid(ternaryMap,20);
figure(6)
show(map)
mapInflated = copy(map);
inflate(mapInflated, robotRadius);
figure(7)
show(mapInflated)
prm.Map = mapInflated;
prm.NumNodes = 60;
prm.ConnectionDistance = 5;
figure(8)
show(prm)
startLocation = [7 22];
endLocation = [15 5];
path = findpath(prm, startLocation, endLocation);
while isempty(path)
    prm.NumNodes = prm.NumNodes + 10;
    update(prm);
    path = findpath(prm, startLocation, endLocation);
end
path
figure(8)
show(prm)