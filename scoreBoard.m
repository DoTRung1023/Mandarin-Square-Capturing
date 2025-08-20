function [] = scoreBoard(winner, bluePoint, redPoint)

% print winners
if winner == "Blue"
    scoreStatement = sprintf("Blue is the winner!");
elseif winner == "Red"
    scoreStatement = sprintf("Red is the winner!");
else
    scoreStatement = sprintf("It's a tie game!");
end
% plot winner
subTitle = sprintf("Blue: %d - %d :Red", bluePoint, redPoint);
title("MANDARIN SQUARE CAPTURING", subTitle + ' --- ' + scoreStatement, 'Color', 'k', 'FontSize', 20)

end









