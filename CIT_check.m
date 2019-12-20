clear all; close all; fclose all; clc;
file_list = dir("*.dat");
if size(file_list,1) == 0
  file_list = dir("*.txt");
endif
for ii = 1:size(file_list,1)
  disp(ii)
  filename = file_list(ii).name;
  fileID = fopen(filename,"r");
  row8 = textscan(fileID,"%s %s",1,"HeaderLines",7);
  row9 = textscan(fileID,"%[^:] %*s %s",1);
  row10 = textscan(fileID,"%[^:] %*s %[^\r\n]",1);
  row11 = textscan(fileID,"%[^:] %*s %f",1);
  row12 = textscan(fileID,"%[^:] %*s %f",1);
  row13 = textscan(fileID,"%[^:] %*s %[^\r\n]",1);
  row14 = textscan(fileID,"%[^:] %*s %s",1);
  row15 = textscan(fileID,"%[^:] %*s %f",1);
  row16 = textscan(fileID,"%[^:] %*s %f",1);
  row17 = textscan(fileID,"%[^:] %*s %[^\r\n]",1);
  station_code = char(row9{2})
  sample_rate = row16{2}
  fclose(fileID);
  
  disp("")
  if strncmp(char(row16{1}),"#SampleRate(Hz)",15) == 0
    disp("Sample Rate Error")
    disp(file_list(ii).name)
    break;
  endif
  if isnumeric(sample_rate) == 0
    disp("Sample Rate Number Error")
    disp(file_list(ii).name)
    break;
  endif
  if strncmp(char(row17{2}),"gal.",4) == 0
    disp("Unit Error")
    disp(file_list(ii).name)
    break;
  endif
endfor