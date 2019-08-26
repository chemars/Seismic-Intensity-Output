clear all; close all; fclose all; clc;
file_list = dir("*.csv");
for ii = 1:size(file_list,1)
  disp(ii)
  filename = file_list(ii).name;
  fileID = fopen(filename,"r");
  row1 = textscan(fileID,"%s %s %3c %*[^\r\n]",1);
  row2 = textscan(fileID,"%s %f",1);
  row3 = textscan(fileID,"%s %f",1);
  row4 = textscan(fileID,"%s %s %s",1);
  row5 = textscan(fileID,"%s %s %s",1);
  station_code = char(row1{3})
  tempc = char(row4{3});
  tempn = length(tempc);
  sample_rate = str2num(tempc(1:tempn-2))
  fclose(fileID);
  
  disp("")
  if strcmp(char(row4{1}),"SAMPLING") == 0
    disp("Sample Rate Error.")
    disp(file_list(ii).name)
    break;
  endif
  if isnumeric(sample_rate) == 0
    disp("Sample Rate Number Error.")
    disp(file_list(ii).name)
    break;
  endif
  if strcmp(char(row5{3}),"gal(cm/s/s)") == 0
    disp("Unit Error.")
    disp(file_list(ii).name)
    break;
  endif
endfor