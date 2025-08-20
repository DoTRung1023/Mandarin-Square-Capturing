function [citizenList, bluePoint, redPoint, winner] = checkWinner(boxList, citizenList, bluePoint, redPoint, winner)

% initialise variable
citizenNumber = 0;

% count how many citizens left
for i = 1:length(citizenList)
    citizenNumber = citizenNumber + citizenList(i);
end
% game end when all Mandarin pieces are captured 
if citizenList(1) == 0 && citizenList(7) == 0
    plotCitizen(boxList, citizenList, bluePoint, redPoint)
    answer = input("There are no citizen left in the Mandarin squares. ", "s");
    for i = 2:6
        redPoint = redPoint+citizenList(i);
        citizenList(i) = 0;
    end
    for i = 8:12
        bluePoint = bluePoint+citizenList(i);
        citizenList(i) = 0;
    end
    if bluePoint > redPoint
        winner = "Blue";
    elseif bluePoint < redPoint
        winner = "Red";
    else
        winner = "Tie";
    end
elseif citizenNumber == 0 % game end when all pieces are captured
    plotCitizen(boxList, citizenList, bluePoint, redPoint)
    answer = input("All citizens are captured. ", "s");
    if bluePoint > redPoint
        winner = "Blue";
    elseif bluePoint < redPoint
        winner = "Red";
    else
        winner = "Tie";
    end
end

end
