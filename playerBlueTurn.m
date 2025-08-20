function [boxList, citizenList, bluePoint, redPoint, winner] = playerBlueTurn(boxList, citizenList, bluePoint, redPoint, winner)
% initialise variable
loopOfMoving = 10;

% get input
[blueBox, blueDirection] = getPlayerBlueMove(boxList, citizenList);
[boxList, citizenList, endSquare] = computeMove(boxList, citizenList, blueBox, blueDirection, blueBox);
% next box
nextBlueBox = boxList(endSquare, :);
% continue distributing
if nextBlueBox(1) ~= 'k'
    if citizenList(endSquare) > 0
        zeroCitizen = false;
    else
        zeroCitizen = true;
    end
    while zeroCitizen == false
        for i = 1:loopOfMoving
            % compute move                            
            [boxList, citizenList, endSquare] = computeMove(boxList, citizenList, nextBlueBox, blueDirection, blueBox);                
            % next box
            nextBlueBox = boxList(endSquare, :);
            if nextBlueBox(1) == 'k'
                zeroCitizen = true;
                break;                            
            elseif citizenList(endSquare) == 0
                zeroCitizen = true;
                break;
            end
        end
    end
end
plotCitizen(boxList, citizenList, bluePoint, redPoint)
[boxList, citizenList, pointInTurn] = checkCapturing(boxList, citizenList, endSquare, nextBlueBox, blueDirection, blueBox);
bluePoint = bluePoint + pointInTurn;
plotCitizen(boxList, citizenList, bluePoint, redPoint)
[citizenList, bluePoint, redPoint, winner] = checkWinner(boxList, citizenList, bluePoint, redPoint, winner);
if winner == ' ' && citizenList(2) == 0
    % check if a row is all zero
    [citizenList, redPoint] = dispatching(citizenList, redPoint);
elseif winner == ' ' && citizenList(12) == 0
    [citizenList, bluePoint] = dispatching(citizenList, bluePoint);
end
plotCitizen(boxList, citizenList, bluePoint, redPoint)
end