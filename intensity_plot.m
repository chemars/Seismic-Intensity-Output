clear all; close all; fclose all; clc;

filename = "intensity_20180206.txt";
column_x = 3;
column_y = 5;

data = dlmread(filename,",",1,0);
x = data(:,column_x);
y = data(:,column_y);
hold on; grid on;
plot(x,y,".b",'MarkerSize',18)
plot([1 8],[1 8],"-k")
text(8.1,8,"x=y","fontsize",18)
axis square
xlim([1 8])
ylim([1 8])
title("Instrumental Seismic Intensity")
xlabel("CWB_{new}")
ylabel("JMA")
set(gca,"fontsize",14)