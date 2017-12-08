function [alpha,cd,cl] = readfile(file)

    [~, ~, raw] = xlsread(file,'Sheet1','A2:F15');
    stringVectors = string(raw(:,4));
    stringVectors(ismissing(stringVectors)) = '';
    raw = raw(:,[1,2,3,5,6]);

    % Create output variable
    data = reshape([raw{:}],size(raw));

    % Create table
    tracking = table;

    % Allocate imported array to column variable names
    tracking.AoA = data(:,1);
    tracking.sinAoA = data(:,2);
    tracking.cosAoA = data(:,3);
    tracking.Done = stringVectors(:,1);
    tracking.Cd = data(:,4);
    tracking.Cl = data(:,5);

    % Clear temporary variables
    clearvars data raw stringVectors;
    
    cd = tracking.Cd;
    cl = tracking.Cl;
    alpha = tracking.AoA;

end

