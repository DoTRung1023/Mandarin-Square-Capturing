clear;
clc;
close all;
% game instruction
gameIntro()
gameMode = gameMode(); % choose game mode
gameInstruction(gameMode) 

% launch game
if gameMode == "1"
    computerMode()
elseif gameMode == "2"
    playerMode()
end

% say "Thank you"
fprintf("Thanks for playing!\n")
close all;
figure('Color', 'black')
text(0.5, 0.5, "Thanks for playing!", 'Rotation', 0, 'FontSize',50, 'Color','w', ...
    'HorizontalAlignment','Center', 'VerticalAlignment','Middle')
axis off


