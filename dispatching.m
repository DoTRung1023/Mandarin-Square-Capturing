function [citizenList, currentPoint] = dispatching(citizenList, currentPoint)
% initialise variable
emptySquare = 0;
answer = "";

% check if row of red or blue is empty
for i = 2:1:6 % check red squares
    if citizenList(i) == 0
        emptySquare = emptySquare+1;
    end
end
% fill one citizen in each square
if emptySquare == 5
    answer = input("Let's dispatch.", "s");
    for i = 2:1:6
        citizenList(i) = 1;
        currentPoint = currentPoint-1;
    end
end

emptySquare = 0; % reset variable

for i = 8:1:12 % check blue squares
    if citizenList(i) == 0
        emptySquare = emptySquare+1;
    end
end
% fill one citizen in each square
if emptySquare == 5
    answer = input("Let's dispatch.", "s");
    for i = 8:1:12
        citizenList(i) = 1;
        currentPoint = currentPoint - 1;
    end
end

end









