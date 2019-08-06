clear all; close all; fclose all; clc;
file_list = dir("*.*.txt");
for ii = 1:size(file_list,1)
  disp(ii)
  filename = file_list(ii).name;
  fileID = fopen(filename);
  row1 = textscan(fileID,"%s %s",1);
  row2 = textscan(fileID,"%s %5c %14c",1);
  row3 = textscan(fileID,"%s %s",1);
  row4 = textscan(fileID,"%s %f",1);
  row5 = textscan(fileID,"%s %f",1);
  row6 = textscan(fileID,"%s %s %s",1);
  station_code = char(row1{2})
  sample_rate = row5{2}
  unit = char(row6{2});
  fclose(fileID);
  disp("")
  if strcmp(unit,"gal.") == 0
    disp("Unit Error.")
    break;
  endif
  if strcmp(char(row5{1}),"#SampleRate(Hz):") == 0
    disp("Sample Rate Error.")
    break;
  endif
  if isnumeric(sample_rate) == 0
    disp("Sample Rate Number Error.")
    break;
  endif
endfor