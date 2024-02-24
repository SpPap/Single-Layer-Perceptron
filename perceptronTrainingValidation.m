% Training & Validating script for single
% layer perceptron (SLP) for binary
% classification of "I", "O" characters
%
% Author: Spiros Papadopoulos

%% Load training data

% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 4);

% Specify sheet and range
opts.Sheet = "machine";
opts.DataRange = "A2:D60";

% Specify column names and types
opts.VariableNames = ["DataNum", "PixelsNumx1", "HorizontalVariancex2", "Class"];
opts.VariableTypes = ["double", "double", "double", "double"];

% Import the data
OIclassificationdata = readtable("~\Perceptron\O_I_classification data.xlsx", opts, "UseExcel", false);

% Convert to output type
OIclassificationdata = table2array(OIclassificationdata);

% Clear temporary variables
clear opts

% Define data
PixelsNumx1 = OIclassificationdata(:,2);
HorizontalVariancex2 = OIclassificationdata(:,3);
Class = OIclassificationdata(:,4);

%% Plot training data
figure(1)
for iData = 1:size(OIclassificationdata,1)
    hold on
    if Class(iData) == 1 % character "I"
        plot(HorizontalVariancex2(iData), PixelsNumx1(iData), "LineWidth", 1.5, "Marker", '|', "Color", 'red')
    end
    if Class(iData) == -1 % character "O"
        plot(HorizontalVariancex2(iData), PixelsNumx1(iData), "LineWidth", 1.5, "Marker", 'o', "Color", 'blue')
    end
end
title("Training Data Representation")
xlabel("Horizontal variance [x2]")
ylabel("Pixels Number [x1]")

%% Train Single Layer Perceptron 
[W, b] = perceptron([PixelsNumx1 HorizontalVariancex2], Class);

% Return weights
w1 = W(1);
w2 = W(2);

%% Plot decision limit
hold on
plot(HorizontalVariancex2,-w2/w1*HorizontalVariancex2-b/w1, 'k-')
xlim([min(HorizontalVariancex2)-5 max(HorizontalVariancex2)+5])
ylim([min(PixelsNumx1)-5 max(PixelsNumx1)+5])


%% Validation Data

% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 4);

% Specify sheet and range
opts.Sheet = "machine";
opts.DataRange = "A2:D30";

% Specify column names and types
opts.VariableNames = ["DataNum", "PixelsNumx1", "HorizontalVariancex2", "Class"];
opts.VariableTypes = ["double", "double", "double", "double"];

% Import the data
OIvalidationdata = readtable("~\Perceptron\O_I_validation.xlsx", opts, "UseExcel", false);

% Convert to output type
OIvalidationdata = table2array(OIvalidationdata);

% Clear temporary variables
clear opts

% Define data
PixelsNumx1 = OIvalidationdata(:,2);
HorizontalVariancex2 = OIvalidationdata(:,3);
Class = OIvalidationdata(:,4);

%% Plot validation data
figure(2)
for iData = 1:size(OIvalidationdata,1)
    hold on
    if Class(iData) == 1 % character "I"
        plot(HorizontalVariancex2(iData), PixelsNumx1(iData), "LineWidth", 1.5, "Marker", '|', "Color", 'red')
    end
    if Class(iData) == -1 % character "O"
        plot(HorizontalVariancex2(iData), PixelsNumx1(iData), "LineWidth", 1.5, "Marker", 'o', "Color", 'blue')
    end
end
title("Validation Data Representation")
xlabel("Horizontal variance [x2]")
ylabel("Pixels Number [x1]")

%% Plot decision limit
hold on
plot(HorizontalVariancex2,-w2/w1*HorizontalVariancex2-b/w1, 'k-')
xlim([min(HorizontalVariancex2)-5 max(HorizontalVariancex2)+5])
ylim([min(PixelsNumx1)-5 max(PixelsNumx1)+5])
