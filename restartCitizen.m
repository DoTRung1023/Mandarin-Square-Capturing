function [boxList, citizenList] = restartCitizen() % reset number of rocks
% initialise array for box names and rock numbers
boxList = []; % box name
citizenList = [];% citizen number
citizenNumber = 5;
mandarinNumber = 10;

% add Madarian box 1 (k1)
rowBox = [];
rowCitizen = [];
% add box name by row to array
rowBox = ['k'];
rowBox = [rowBox int2str(1)];
boxList = [boxList; rowBox];
% add citizen number by row to array
rowCitizen = [rowCitizen mandarinNumber];
citizenList = [citizenList; rowCitizen];

% add red boxes
% reset row
for i = 1:citizenNumber
    rowBox = [];
    rowCitizen = [];
    % add box name by row to array
    rowBox = [rowBox 'r'];
    rowBox = [rowBox int2str(i)];
    boxList = [boxList; rowBox];
    
    % add citizen number by row to array
    rowCitizen = [rowCitizen citizenNumber];
    citizenList = [citizenList; rowCitizen];
end

% add Madarian box 2 (k2)
% reset row
rowBox = [];
rowCitizen = [];
% add box name by row to array
rowBox = ['k'];
rowBox = [rowBox int2str(2)];
boxList = [boxList; rowBox];

% add citizen number by row to array
rowCitizen = [rowCitizen mandarinNumber];
citizenList = [citizenList; rowCitizen];

% add blue boxes
for i = citizenNumber:-1:1
    % reset row
    rowBox = [];
    rowCitizen = [];
    % add box name by row to array
    rowBox = [rowBox 'b'];
    rowBox = [rowBox int2str(i)];
    boxList = [boxList; rowBox];
    
    % add citizen number by row to array
    rowCitizen = [rowCitizen citizenNumber];
    citizenList = [citizenList; rowCitizen];
end













