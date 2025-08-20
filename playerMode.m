function [] = playerMode()
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
    
    % prompt user for turn
    while ~validTurn
        firstMove = input("Choose red or blue to go first: ", 's');
        firstMove = lower(firstMove);
        if strcmp(firstMove, "red")
            firstMove = "r";
        elseif strcmp(firstMove, "blue")
            firstMove = "b";
        end
        if strcmp(firstMove, "b") || strcmp(firstMove, "r")
            validTurn = true;
        else
            fprintf("Please enter a valid colour.\n")
        end
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
    
    % prompt user input
    if strcmp(firstMove, "r")% first move is red
        while winner == ' '
            % player red turn
            [boxList, citizenList, bluePoint, redPoint, winner] = playerRedTurn(boxList, citizenList, bluePoint, redPoint, winner);
            if winner == ' '
                % player blue turn
                [boxList, citizenList, bluePoint, redPoint, winner] = playerBlueTurn(boxList, citizenList, bluePoint, redPoint, winner);
            end
        end
    else % first move is blue
        while winner == ' '
            % player blue turn
            [boxList, citizenList, bluePoint, redPoint, winner] = playerBlueTurn(boxList, citizenList, bluePoint, redPoint, winner);
            if winner == ' '
                % player red turn
                [boxList, citizenList, bluePoint, redPoint, winner] = playerRedTurn(boxList, citizenList, bluePoint, redPoint, winner);
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