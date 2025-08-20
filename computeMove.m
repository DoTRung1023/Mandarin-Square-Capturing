function [boxList, citizenList, endSquare] = computeMove(boxList, citizenList, currentBoxPosition, direction, initialBox)

% initialise current number of citizens ditributed
citizenMove = 0;
% change direction 
if currentBoxPosition(1) ~= 'k' && initialBox(1) ~= currentBoxPosition(1)
    switch direction
        case "r"
        direction = "l";
        otherwise
        direction = "r";
    end
end


% player chooses left+blue or right+red (citizenList changes from top to bottom)
if direction == "l" && currentBoxPosition(1) == 'b' || direction == "r" && currentBoxPosition(1) == 'r'
    for i = 1:length(boxList)
        if currentBoxPosition == boxList(i, :)

            citizenMove = citizenList(i); % get number of citizens ditributed
            citizenList(i) = 0; % take all citizens of that box
    
            for j = i+1:12
                citizenList(j) = citizenList(j)+1;
                citizenMove = citizenMove-1;
                if citizenMove == 0
                    if j == 12 % get the next square
                        endSquare = 1;
                    else
                        endSquare = j+1;
                    end
                    break;
                end
            end
            if citizenMove > 0
                for j = 1:12
                    citizenList(j) = citizenList(j)+1;
                    citizenMove = citizenMove-1;
                    if citizenMove == 0
                        if j == 12 % get the next square 
                            endSquare = 1;
                        else
                            endSquare = j+1;
                        end
                        break;
                    end
                end
            end
        end
    end
% player chooses right+blue or left+red (citizenList changes from bottom to top)
elseif direction == "l" && currentBoxPosition(1) == 'r' || direction == "r" && currentBoxPosition(1) == 'b'
    for i = 1:12
        if currentBoxPosition == boxList(i, :)

            citizenMove = citizenList(i); % get number of citizens ditributed
            citizenList(i) = 0; % take all citizens of that box
    
            for j = i-1:-1:1
                citizenList(j) = citizenList(j)+1;
                citizenMove = citizenMove-1;
                if citizenMove == 0
                    if j == 1 % get the next square
                        endSquare = 12;
                    else
                        endSquare = j-1;
                    end
                    break;
                end
            end
            if citizenMove > 0
                for j = 12:-1:1
                    citizenList(j) = citizenList(j)+1;
                    citizenMove = citizenMove-1;
                    if citizenMove == 0
                        if j == 1 % get the next square
                            endSquare = 12;
                        else
                            endSquare = j-1;
                        end
                        break;
                    end
                end
            end
        end
    end
else
    switch currentBoxPosition
        case "k1"
        endSquare = 1;
        case "k2"
        endSquare = 7;
    end
end

end
