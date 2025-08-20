function [] = gameInstruction(gameMode)
% initialise array
boxList = [];
citizenList = [];
bluePoint = 0;
redPoint = 0;

% print game instruction
switch gameMode 
    case "1"
        fprintf("This is the instruction of Mandarin Square Capturing.\n\n")
        onePlayerMode = fileread('1 player mode.txt');
        fprintf("%s\n", onePlayerMode)
        % create board
        [boxList, citizenList] = restartCitizen();
        plotCitizen(boxList, citizenList, bluePoint, redPoint)
        % plot text
        text(250, 340, "Read the instruction", 'Rotation', 0, 'FontSize', 30, 'Color','k', ...
            'HorizontalAlignment','Center', 'VerticalAlignment','Middle')
        text(250, 290, "in the command window.", 'Rotation', 0, 'FontSize', 30, 'Color','k', ...
            'HorizontalAlignment','Center', 'VerticalAlignment','Middle')
    case "2"
        fprintf("This is the instruction of Mandarin Square Capturing.\n\n")
        twoPlayerMode = fileread('2 player mode.txt');
        fprintf("%s\n", twoPlayerMode)
        % create board
        [boxList, citizenList] = restartCitizen();
        plotCitizen(boxList, citizenList, bluePoint, redPoint)
        % plot text
        text(250, 300, "Read the instruction", 'Rotation', 0, 'FontSize', 30, 'Color','k', ...
            'HorizontalAlignment','Center', 'VerticalAlignment','Middle')
        text(250, 250, "in the command window.", 'Rotation', 0, 'FontSize', 30, 'Color','k', ...
            'HorizontalAlignment','Center', 'VerticalAlignment','Middle')
end
if gameMode == "1" || gameMode == "2"
    fprintf('\n')
    answer = input("Continue. ", "s"); % hold on
    fprintf('\n')
    instruction = fileread("instruction.txt");
    fprintf("%s\n", instruction)
    fprintf('\n')
    answer = input("Start. ", "s"); % hold on
end

end