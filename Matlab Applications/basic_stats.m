clc;
close all;
clear all;

format long g;
format compact;


x=[68 84 75 82 68 90 62 88 76 93 73 79 ...
   88 73 60 93 71 59 85 75 61 65 75 87 ...
   74 62 95 78 63 72 66 78 82 75 94 77 ...
   69 74 68 60 96 78 89 61 75 95 60 79 ...
   83 71 79 79 62 67 97 78 85 76 65 71 ...
   75 65 80 73 57 88 78 62 76 53 74 86 ...
   67 73 81 72 63 76 75 85 77];

% find the minimum value
minVal = min(x);
fprintf("min value is %d\n", minVal)

% find the maximum value
maxVal = max(x);
fprintf("max value is %d\n", maxVal)

% calculate the mean value
meanVal = mean(x);
fprintf("mean value is %d\n", meanVal)

% calculate the median
medianVal = median(x);
fprintf("median value is %d\n", medianVal)

% calculate the mode
modeVal = mode(x);
fprintf("mod values is %d\n", modeVal)

% calculate the standard deviation
stdVal = std(x);
fprintf("standard deviation is %d\n", stdVal)

nbins = 6;
% plot the histogram of the data set with $nbins classes
figure(1);
hold on;
% histogram(x,nbins) % results in a different graph
% or run the below code (not recommended)
hist(x, nbins)

% obtain class frequencies and marks with $nbins classes
[classFreqs, classMarks] = hist(x, nbins); 
disp(["class frequencies: ", classFreqs])
disp(["class marks: ", classMarks])

% plot the relative frequency curve
xlabel("exam grade");
ylabel("number of students");
relativeFreqs = classFreqs / sum(classFreqs);
disp(["relative frequencies", relativeFreqs])
plot(classMarks, relativeFreqs*100, '-rs')

figure(2);
plot(classMarks, relativeFreqs, '-ms')

% plot a logarithmic histogram
y = zeros(length(x));
for i=1:length(x)
    y(i)=log(x(i));
end

figure(3);
hist(y, nbins);



