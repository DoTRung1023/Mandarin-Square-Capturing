function [boxPosition, direction] = getPlayerBlueMove(boxList, citizenList)
% print intro
fprintf("Blue turn.\n")
% plot
text(250, -100, "Blue turn", 'Rotation', 0, 'FontSize', 25, 'Color','b', ...
    'HorizontalAlignment','Center')

% initialise variables
validBox = false;
validDirection = false;
direction = "";

% get valid boxPosition
while ~validBox
    boxPosition = input('Enter a blue square: ', 's');
    if length(boxPosition) == 2
        for i = 1:length(boxList)
            if boxPosition == boxList(i, :)
                if boxPosition(1) == 'b'
                    if citizenList(i, 1) > 0
                        validBox = true;
                        break;
                    else
                        fprintf("Please enter a valid blue square with at least one citizen!\n")                
                    end
                    break;
                end
            end
            if i == length(boxList)
                fprintf("Please enter a valid blue square!\n")                
            end
        end
    else
        fprintf("Please enter a valid blue square!\n")
    end
end

% get valid direction
while ~validDirection
    direction = input('Choose a direction l(left)/r(right): ', 's');
    direction = lower(direction);
    if strcmp(direction, "right")
        direction = "r";
    elseif strcmp(direction, "left")
        direction = "l";
    end
    if strcmp(direction, "l") || strcmp(direction, "r")
        validDirection = true;
    else
        fprintf("Please enter a valid direction.\n")
    end
end

end
