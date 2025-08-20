function [] = fillCitizen(boxPosition, citizenNumber)
% convert string to array of characters
boxPosition = char(boxPosition);
% convert the 2nd character in boxPosition to integer
boxNumber = str2num(boxPosition(2));
columnIndex = boxNumber-1; % initialise variable for column position

if boxPosition(1) == 'b' || boxPosition(1) == 'r' % blue and red boxes
    % initialise variable for red & blue row
    if boxPosition(1) == 'b' 
        rowIndex = 0;
    else 
        rowIndex = 1;
    end
    numberText = sprintf("%d", citizenNumber);
    text(45+100*columnIndex, 55+100*rowIndex, numberText, "Color", boxPosition(1), 'FontSize', 18)
else % black rectangle
    % print text
    numberText = sprintf("%d", citizenNumber);
    text(-95+650*columnIndex, 100, numberText, "Color", 'k', "FontSize", 20)
end
    
end








