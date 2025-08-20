function [boxList, citizenList, pointInTurn] = checkCapturing(boxList, citizenList, endSquare, nextBoxPosition, direction, initialBoxPosition)

% reset points in this turn
pointInTurn = 0;

% initialise variable
capturing = false;
captureEnd = 0; % the position of the square after capturing square

% change direction
if initialBoxPosition(1) ~= boxList(endSquare, 1)
    switch direction
        case "r"
        direction = "l";
        otherwise
        direction = "r";
    end
end

% capturing
if boxList(endSquare, 1) == 'k' && direction == "r" && nextBoxPosition(1) == 'b' && boxList(endSquare, 1) == 0 ...
    || boxList(endSquare, 1) == 'k' && direction == "l" && nextBoxPosition(1) == 'b' && boxList(endSquare, 1) == 0 ...
    || boxList(endSquare, 1) == 'k' && direction == "r" && nextBoxPosition(1) == 'r' && boxList(endSquare, 1) == 0 ...
    || boxList(endSquare, 1) == 'k' && direction == "l" && nextBoxPosition(1) == 'r' && boxList(endSquare, 1) == 0 ...
    ||nextBoxPosition(1) == 'b' && direction == "r" || nextBoxPosition(1) == 'r' && direction == "l" 
    % go against clockwise
    while ~capturing
        for i = endSquare:-2:1
            % capture first time
            if i == 1 && citizenList(1) == 0 && citizenList(12) ~= 0
                % capture
                pointInTurn = pointInTurn + citizenList(12);
                captureEnd = 11;
                citizenList(12) = 0;
            elseif i > 1 && citizenList(i-1)~=0 && citizenList(i) == 0
                % capture
                pointInTurn = pointInTurn + citizenList(i-1);
                citizenList(i-1) = 0;
                captureEnd = i-2;
                if captureEnd == 0
                    captureEnd = 12;
                end
            else
                % end
                capturing = true;
                break;
            end
            % continue capturing
            if captureEnd > 0
                for j = captureEnd:-2:1
                    if citizenList(j) == 0 && citizenList(j-1)~=0
                        pointInTurn = pointInTurn + citizenList(j-1);
                        citizenList(j-1) = 0;
                    else
                        capturing = true;
                        break;                        
                    end
                end
            end
        end
    end
elseif boxList(endSquare, 1) == 'k' && direction == "l" && nextBoxPosition(1) == 'b' && boxList(endSquare, 1) == 0 ...
    || boxList(endSquare, 1) == 'k' && direction == "r" && nextBoxPosition(1) == 'b' && boxList(endSquare, 1) == 0 ...
    || boxList(endSquare, 1) == 'k' && direction == "l" && nextBoxPosition(1) == 'r' && boxList(endSquare, 1) == 0 ...
    || boxList(endSquare, 1) == 'k' && direction == "r" && nextBoxPosition(1) == 'r' && boxList(endSquare, 1) == 0 ...
    ||nextBoxPosition(1) == 'b' && direction == "l" || nextBoxPosition(1) == 'r' && direction == 'r' 
    % go clockwise
    while ~capturing
        for i = endSquare:2:12
            % capture first time
            if i == 12 && citizenList(12) == 0 && citizenList(1) ~= 0
                % capture
                pointInTurn = pointInTurn + citizenList(1);
                citizenList(1) = 0;
                captureEnd = 2;
            elseif i<12 && citizenList(i+1)~=0 && citizenList(i) == 0
                % capture
                pointInTurn = pointInTurn + citizenList(i+1);
                citizenList(i+1) = 0;
                captureEnd = i+2;
                if captureEnd == 13
                    captureEnd = 1;
                end
            else
                % end
                capturing = true;
                break;
            end
            if captureEnd > 0
                for j = captureEnd:2:1
                    if citizenList(j) == 0 && citizenList(j+1)~=0
                        pointInTurn = pointInTurn + citizenList(j+1);
                        citizenList(j+1) = 0;
                    else
                        capturing = true;
                        break;                        
                    end
                end
            end
        end
    end
end
if pointInTurn > 0
    % hold on
    plotDirection(boxList, endSquare, direction)
    answer = input("Nice move! Let's capture.", "s");
else
    % hold on
    plotDirection(boxList, endSquare, direction)
    answer = input("Cannot capture any citizen.", "s");
end

end
