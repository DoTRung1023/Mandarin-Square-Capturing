function [boxPosition, direction] = getComputerRedMove(boxList, citizenList)
% print intro
fprintf("Red turn.\n")
% plot
text(250, 300, "Red turn", 'Rotation', 0, 'FontSize', 25, 'Color','r', ...
    'HorizontalAlignment','Center')

% initialise variables
validBox = false;
validDirection = false;
direction = "";

% get valid boxPosition
fprintf('Enter a red square: ');
% random
while ~validBox
    randomNumber = randi([2, 6]);
    boxPosition = boxList(randomNumber, :);
    if citizenList(randomNumber, 1) > 0
        fprintf("%s\n", boxPosition)
        validBox = true;
        break;
    end
end
% get direction
fprintf('Choose a direction left/right: ');
while ~validDirection
    randomNumber = randi([1, 2]);
    if randomNumber == 1
        direction = "r";
        printDirection = "right";
    else
        direction = "l";
        printDirection = "left";
    end
    if strcmp(direction, "l") || strcmp(direction, "r")

        fprintf("%s\n", printDirection)
        validDirection = true;
    end
end
% hold on
answer = input("Continue. ", "s");


end
