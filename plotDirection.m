function [] = plotDirection (boxList, endSquare, direction)
% make box position
boxPosition = boxList(endSquare, :);
% convert string to array of characters
boxPosition = char(boxPosition);
% convert the 2nd character in boxPosition to integer
boxNumber = str2num(boxPosition(2));
columnIndex = boxNumber-1; % initialise variable for column position

if boxPosition(1) == 'b' || boxPosition(1) == 'r' % blue and red boxes
    % plot direction
    if boxPosition(1) == 'b' 
        if direction == "l"
            text(30+100*columnIndex, -15, "v ->", 'Rotation', 180, "Color", boxPosition(1), 'FontSize', 15, 'HorizontalAlignment','center')
        else
            text(70+100*columnIndex, -15, "<- v", 'Rotation', 180, "Color", boxPosition(1), 'FontSize', 15, 'HorizontalAlignment','center')
        end
    else 
        if direction == "l"
            text(65+100*columnIndex, 215, "<- v", "Color", boxPosition(1), 'FontSize', 15, 'HorizontalAlignment','right')
        else
            text(45+100*columnIndex, 215, "v ->", "Color", boxPosition(1), 'FontSize', 15, 'HorizontalAlignment','left')
        end
    end
else % black rectangle
    if boxPosition == "k1"
        text(-175, 100, ">", "Color", boxPosition(1), 'FontSize', 15, 'FontWeight','bold')
    else
        text(665, 100, "<", "Color", boxPosition(1), 'FontSize', 15, 'FontWeight','bold')
    end
end
    
end