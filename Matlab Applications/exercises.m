clc;
clear all;
close all;

numOfSales = [[0,2]; [2,4]; [4,6]; [6,8]; [8,10]];
number_of_real_estate_brokers = [16; 25; 13; 4; 2];

%% Question 1. how class mark, class boundaries, class mids and construct a frequency distribution, relative frequency histogram, relative and cumulative frequency curves

% frequencies

frequencies = number_of_real_estate_brokers;

% class boundaries

classBoundaries = numOfSales;

intervalBetweenBoundaries =  numOfSales(2,1) - numOfSales(1,2);
intervalBetweenBoundaries = intervalBetweenBoundaries/2;
intervalCount = length(numOfSales(:,1));
classBoundaries = zeros(intervalCount, 2);
for i=1:intervalCount
    classBoundaries(i,1) = numOfSales(i, 1) - intervalBetweenBoundaries;
    classBoundaries(i,2) = numOfSales(i, 2) + intervalBetweenBoundaries;
end

table(numOfSales, frequencies, classBoundaries)

% class marks

disp(intervalCount)
classMarks = zeros(intervalCount, 1);
for i=1:intervalCount
    classMarks(i) = abs(numOfSales(i,1) + numOfSales(i,2))/2;
end
table(numOfSales, frequencies, classMarks)

% class mids

classMids = classMarks;

% frequency distribution

figure(1);
plot(classMarks, frequencies)

% relative frequency histrogram

totalFreq = 0;
for i=1:length(frequencies)
    totalFreq = totalFreq + frequencies(i);
end
relativeFreqs = frequencies/totalFreq;

figure(2);
bar(classMarks, relativeFreqs);

% relative frequency distribution

figure(3);
plot(classMarks, relativeFreqs);

% cumulative frequency distribution

cumulativeFreqs = zeros(length(frequencies), 1);
for i=1:length(frequencies)
    if i == 1
        cumulativeFreqs(i) = frequencies(i);
    else
        cumulativeFreqs(i) = cumulativeFreqs(i-1) + frequencies(i);
    end
end

figure(4);
plot(classMarks, cumulativeFreqs);

table(frequencies, relativeFreqs, cumulativeFreqs)

%% Question 2:  Calculate mean, mode, median, and standard deviation for the distribution by using computer in your calculations.

% mean
mean = sum(frequencies.*classMarks) / totalFreq;
fprintf("mean is %f \n", mean)

% median

% The median is located at the middle.
medianPoint = totalFreq/2;
if rem(medianPoint, 2) == 0
    % if location index is even its index is between two values
    medianPoint = medianPoint + 0.5;
end

tempFreqSum = 0;
classContainingMedian = -1;
% The index of the class which contains median is found 
for i=1:length(frequencies)
    tempFreqSum = tempFreqSum + frequencies(i);
    if medianPoint < tempFreqSum
        classContainingMedian = i;
        break
    end
end

L = classBoundaries(classContainingMedian); % Lower class boundary of the class containing the median
N = totalFreq; % the number of items in data
freqSum = 0;
for i=1:length(frequencies)
    if (i >= classContainingMedian)
        break
    end
    freqSum = freqSum + frequencies(i);
end
freqMedian = frequencies(classContainingMedian); % sum of frequencies of all classes lower than median class
C = abs(classBoundaries(classContainingMedian, 1) - classBoundaries(classContainingMedian, 2)); % size of median class interval

median = L + ((N/2)-freqSum)*(C/freqMedian);
fprintf("Median is %f \n", median);

% mode

[greatestFreq, index] = max(frequencies);
delta1 = abs(greatestFreq - frequencies(index-1));
delta2 = abs(frequencies(index+1) - greatestFreq);
mode = L + (delta1 / (delta1+delta2)) * C;
fprintf("Mode is %f \n", mode);

% standart deviation

fx2 = sum(frequencies.*(classMarks.*classMarks));
standartDeviation=sqrt(fx2/totalFreq-mean*mean);
fprintf("Standart Deviation is %f \n", standartDeviation);

% variance

variance = standartDeviation*standartDeviation;
fprintf("Variance is %f \n", variance);

% skewness

fx3 = (1/totalFreq)*sum((classMarks - mean).^3);
skewness = fx3 / standartDeviation^3;
fprintf("Skewness Coefficient is is %f \n", skewness);



