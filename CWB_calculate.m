clear all; close all; fclose all; clc;
output = "intensity.csv";
delimiter = "";
ignore_row = 11;
ns_column = 3;
ew_column = 4;
ud_column = 2;
file_list = dir("*.*.txt");

fid = fopen(output,"a");
header = "Station code,I_CWB(2000),CWB scale,I_JMA,JMA scale,I_FJEA";
fprintf(fid,"%s\n",header);
fclose(fid);

for ii = 1:size(file_list,1)
  disp(ii)
  filename = file_list(ii).name;
  fileID = fopen(filename,"r");
  row1 = textscan(fileID,"%s %s",1);
  row5 = textscan(fileID,"%s %f",1,"HeaderLines",3);
  station_code = char(row1{2});
  sample_rate = row5{2};
  fclose(fileID);
  disp("")

  I_cwb2000 = cwb2000(filename,delimiter,ignore_row,ns_column,ew_column,ud_column);
  CWB_scale = cwb2020(filename,delimiter,ignore_row,ns_column,ew_column,ud_column,sample_rate);
  I_jma = jma(filename,delimiter,ignore_row,ns_column,ew_column,ud_column,sample_rate);
  JMA_scale = intensity_scale("jma",I_jma);
  I_fjea = fjea(filename,delimiter,ignore_row,ns_column,ew_column,ud_column,sample_rate); 

  fid = fopen(output,"a");
  fprintf(fid,"%s,%.0f,%s,%.1f,%s,%.0f\n",station_code,I_cwb2000,CWB_scale,I_jma,JMA_scale,I_fjea);
  fclose(fid);
endfor