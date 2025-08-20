function [] = gameIntro()
% initialise variables
numberOfDash = 65;
dash = '';
asterisk = '';

% make dash
for i = 1:numberOfDash
    dash = [dash '-'];
end
% make asterisk
for i = 1:(numberOfDash-25)/2
    asterisk = [asterisk '*'];
end

% print in command window
fprintf("%s\n", dash);
fprintf("%sMANDARIN SQUARE CAPTURING%s\n", asterisk, asterisk);
fprintf("%s\n", dash);

% plot
figure('Color', 'black')
text(0.5, 0.5, "MANDARIN SQUARE CAPTURING", 'Rotation', 0, 'FontSize', 32, 'Color','w', ...
    'HorizontalAlignment','Center', 'VerticalAlignment','Middle')
axis off

end