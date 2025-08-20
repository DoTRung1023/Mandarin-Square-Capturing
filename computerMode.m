function [] = computerMode()
% initiallise
stopPlay = false;

% while loop to start again
while ~stopPlay
    % game intro
    close all;
    fprintf("\nLet's play Mandarin Square Capturing!\n")
    figure('Color', 'black', 'Menu','none')
    text(0.5, 0.5, "Let's play Mandarin Square Capturing!", 'Rotation', 0, 'FontSize',30, 'Color','w', ...
        'HorizontalAlignment','Center', 'VerticalAlignment','Middle')
    axis off
    % initialise variable
    winner = ' ';
    answer = "";
    validTurn = false;
    playerColourValid = false;
    
    % prompt user for turn
    while ~validTurn
        firstPlayer = input("Do you want to go first?[y/n] ", 's');
        firstPlayer = lower(firstPlayer);
        if strcmp(firstPlayer, "yes")
            firstPlayer = "y";
        elseif strcmp(firstPlayer, "no")
            firstPlayer = "n";
        end
        if strcmp(firstPlayer, "y") || strcmp(firstPlayer, "n")
            validTurn = true;
        else
            fprintf("Please enter y(yes) or n(no).\n")
        end
    end
    while ~playerColourValid
        playerColour = input("You're red or blue: ", 's');
        playerColour = lower(playerColour);
        if strcmp(playerColour, "red")
            playerColour = "r";
        elseif strcmp(playerColour, "blue")
            playerColour = "b";
        end
        if strcmp(playerColour, "b") || strcmp(playerColour, "r")
            playerColourValid = true;
        else
            fprintf("Please enter a valid colour.\n")
        end
    end
    if  strcmp(firstPlayer, "y") && strcmp(playerColour, "b") ...
     || strcmp(firstPlayer, "n") && strcmp(playerColour, "r")
        firstMove = "b";
    else
        firstMove = "r";
    end

    % reset player points
    redPoint = 0;
    bluePoint = 0;
    
    % initialise array
    boxList = [];
    citizenList = [];
    
    % create board
    [boxList, citizenList] = restartCitizen();
    plotCitizen(boxList, citizenList, bluePoint, redPoint)
    
    % computer first & first move is red
    if strcmp(firstMove, "r") && strcmp(firstPlayer, "n")
        while winner == ' '
            % computer red turn
            [boxList, citizenList, bluePoint, redPoint, winner] = computerRedTurn(boxList, citizenList, bluePoint, redPoint, winner);
            if winner == ' '
                % player blue turn
                [boxList, citizenList, bluePoint, redPoint, winner] = playerBlueTurn(boxList, citizenList, bluePoint, redPoint, winner);
            end
        end
    elseif strcmp(firstMove, "b") && strcmp(firstPlayer, "n") % computer first & first move is blue
        while winner == ' '
            % computer blue turn
            [boxList, citizenList, bluePoint, redPoint, winner] = computerBlueTurn(boxList, citizenList, bluePoint, redPoint, winner);
            if winner == ' '
                % player red turn
                [boxList, citizenList, bluePoint, redPoint, winner] = playerRedTurn(boxList, citizenList, bluePoint, redPoint, winner);
            end
        end
    elseif strcmp(firstMove, "r") && strcmp(firstPlayer, "y") % player first & first move is red
        while winner == ' '
            % player red turn
            [boxList, citizenList, bluePoint, redPoint, winner] = playerRedTurn(boxList, citizenList, bluePoint, redPoint, winner);
            if winner == ' '
                % computer blue turn
                [boxList, citizenList, bluePoint, redPoint, winner] = computerBlueTurn(boxList, citizenList, bluePoint, redPoint, winner);
            end
        end
    else % player first & first move is blue
        while winner == ' '
            % player blue turn
            [boxList, citizenList, bluePoint, redPoint, winner] = playerBlueTurn(boxList, citizenList, bluePoint, redPoint, winner);
            if winner == ' '
                % computer red turn
                [boxList, citizenList, bluePoint, redPoint, winner] = computerRedTurn(boxList, citizenList, bluePoint, redPoint, winner);
            end
        end
    end
    % show winner
    scoreBoard(winner, bluePoint, redPoint)
    % ask user to play again
    while answer ~= "n" && answer ~= "y" && answer ~= "yes" && answer ~= "no"
        answer = input("Do you want to play again?[y/n] ", 's');
        answer = lower(answer);
        if strcmp(answer, "y") || strcmp(answer, "yes")
            stopPlay = false;
        elseif strcmp(answer, "n") || strcmp(answer, "no")
            stopPlay = true;
        else
            fprintf("Enter y(yes) or n(no).\n")
        end
    end
end

end







