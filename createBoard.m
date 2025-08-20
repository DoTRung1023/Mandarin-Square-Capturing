function [] = createBoard()

close all; % delete the old board

for i = 0:1:4
    % draw blue boxes
    rectangle("Position", [100*i, 0, 100, 100], "LineWidth", 2, "EdgeColor", 'b')
    % draw red boxes
    rectangle("Position", [100*i, 100, 100, 100], "LineWidth", 2, "EdgeColor", 'r')
    % print blue box numbers
    boxNumber = sprintf('%s%d', 'b', i+1);
    text(75+100*i, 10, boxNumber, "FontSize", 11, "Color", 'b')
    % print red box numbers
    boxNumber = sprintf('%s%d', 'r', i+1);
    text(75+100*i, 110, boxNumber, "FontSize", 11, "Color", 'r')
end
% draw two Mandarin squares (the left and right-most squares)
for i = 0:1
    rectangle("Position", [-150+650*i, 0, 150, 200], "LineWidth", 2, "EdgeColor", 'k')
    % print box number
    boxNumber = sprintf('%s%d', 'k', i+1);
    text(-25+650*i, 10, boxNumber, "FontSize", 11, "Color", 'k')
end
% create title
title("MANDARIN SQUARE CAPTURING", 'Color', 'k', 'FontSize', 22, 'FontWeight','bold')
axis off
end



