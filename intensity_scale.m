clear all; close all; fclose all; clc;
delimiter = "";
ignore_row = 11;
ns_column = 3;
ew_column = 4;
ud_column = 2;
file_list = dir("*.*.txt");
for ii=1:size(file_list,1)
  ii
  filename = file_list(ii).name;
  fileID = fopen(filename);
  row1 = textscan(fileID,"#%s %s",1);
  row5 = textscan(fileID,"#%s %f",1,"HeaderLines",3);
  station_code = char(row1{2})
  sample_rate = row5{2}
  fclose(fileID);
  
  I_cwb2000 = cwb2000(filename,delimiter,ignore_row,ns_column,ew_column,ud_column);
  I_cwb2020 = cwb2020(filename,delimiter,ignore_row,ns_column,ew_column,ud_column,sample_rate);
  I_jma = jma(filename,delimiter,ignore_row,ns_column,ew_column,ud_column,sample_rate);
  I_fjea = fjea(filename,delimiter,ignore_row,ns_column,ew_column,ud_column,sample_rate);
  JMA_scale = scale("jma",I_jma);
  CWB_scale = scale("cwb2020",I_cwb2020);

  fid = fopen("intensity.txt","a+");
  fprintf(fid,"%s,%1.0f,%1.1f,%s,%1.1f,%s,%1.0f\n",station_code,I_cwb2000,I_cwb2020,CWB_scale,I_jma,JMA_scale,I_fjea);
  fclose(fid);
endfor