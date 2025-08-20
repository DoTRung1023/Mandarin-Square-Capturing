function [boxList, citizenList, bluePoint, redPoint, winner] = playerRedTurn(boxList, citizenList, bluePoint, redPoint, winner)
% initialise variable
loopOfMoving = 10;

% get input
[redBox, redDirection] = getPlayerRedMove(boxList, citizenList);
[boxList, citizenList, endSquare] = computeMove(boxList, citizenList, redBox, redDirection, redBox);
% next box
nextRedBox = boxList(endSquare, :);
% continue distributing
if nextRedBox(1) ~= 'k'
    if citizenList(endSquare) > 0
        zeroCitizen = false;
    else
        zeroCitizen = true;
    end
    while zeroCitizen == false
        for i = 1:loopOfMoving
            % compute move                        
            [boxList, citizenList, endSquare] = computeMove(boxList, citizenList, nextRedBox, redDirection, redBox);                
            % next box
            nextRedBox = boxList(endSquare, :);
            if nextRedBox(1) == 'k'
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
[boxList, citizenList, pointInTurn] = checkCapturing(boxList, citizenList, endSquare, nextRedBox, redDirection, redBox);
redPoint = redPoint + pointInTurn;
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