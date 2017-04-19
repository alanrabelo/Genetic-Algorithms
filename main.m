clear;
close all;
clc;

numberOfQueens = 4;
sizeOfBoard = 4;

x = generateIndividual(numberOfQueens)
y = generatePopulation(10)

% board = zeros(4,4);
% 
% for i = 1:length(board)
%     board(indexesForRow(x(i,:)), indexesForIndividual(x(i,:))) = 1;
% end

% testBoard =    [ 
%                             0     0     0     1;
%                             0     0     1     0;
%                             0     1     0     0;
%                             1     0     0     0
%                        ];
%                    
% testBoardWorst =    [ 
%                             0     0     0     0;
%                             1     0     1     0;
%                             0     1     0    1;
%                             0     0     0     0
%                        ];
%                  
% testBoard2 =    [ 
%                             0     0     1     0;
%                             1     0     0     0;
%                             0     0     0     1;
%                             0     1     0     0
%                        ];
%                    
% y1 = fitness(testBoard)
% y2 = fitness(testBoard2)
% y3 = fitness(testBoardWorst)













function y = fitness(indidual)
valuesInD1 = [];
valuesInD2 = [];
% Percorrendo e somando as diagonais
boardSize = length(indidual)-1;
for i = -boardSize:boardSize
    valuesInD1 = [valuesInD1 sum(diag(indidual, i))];
    valuesInD2 = [valuesInD2 sum(diag(rot90(indidual), i))];
end

valuesInD1;
valuesInD2;
valuesInCol = [sum(indidual) 0 0 0];
valuesInRow = [sum(indidual') 0 0 0];

x = [valuesInD1; valuesInD2; valuesInCol; valuesInRow];
y = sum(sum(x(x > 1)));
end

function y = generatePosition()
    y = randi(2,1,2) - 1;
end

function y = generateIndividual(numberOfQueens)
    
    nonRepeatingPositions = [0 0; 0,1; 1,0; 1,1];
    newArray = zeros(4,4);
    for x = 1:numberOfQueens
        newArray(x, :) = [nonRepeatingPositions(x, :) generatePosition()];
    end
    y = newArray;

end

function y = generatePopulation(count)
    emptyIndividuals = [];
    
    for i = 1:count
        emptyIndividuals = [emptyIndividuals; generateIndividual(4)];
    end
    y = emptyIndividuals;
end

function y = indexesForIndividual(individual)
    if individual(1, 3) == 0
        if individual(1, 4) == 0
            y = 1;
        else
            y = 2;
        end
    else
        if individual(1, 4) == 0
            y=3;
        else
            y=4;
        end
    end
end

function y = indexesForRow(individual)
    if individual(1, 1) == 0
        if individual(1, 2) == 0
            y = 1;
        else
            y = 2;
        end
    else
        if individual(1, 2) == 0
            y=3;
        else
            y=4;
        end
    end
end