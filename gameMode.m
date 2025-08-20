function [gameMode] = gameMode()
validMode = false;
fprintf("Enter a number to choose game mode.\n1-Player vs COM\n2-Player vs player\n3-Quit game\n")
while ~validMode
    gameMode = input("Game mode: ", "s");
    if strcmp(gameMode, "1") || strcmp(gameMode, "2") || strcmp(gameMode, "3")
        validMode = true;
    else
        fprintf("Enter a number from 1 to 3.\n")
    end
end

end

