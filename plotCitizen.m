function [] = plotCitizen(boxList, citizenList, bluePoint, redPoint)
close all;
createBoard()
for i = 1:size(boxList, 1)
    fillCitizen(boxList(i, :), citizenList(i, :))
end
% add subtitle with score
subTitle = sprintf("Blue: %d - %d :Red", bluePoint, redPoint);
title("MANDARIN SQUARE CAPTURING", subTitle, 'Color', 'k', 'FontSize', 22, 'FontWeight','bold')
axis equal
end