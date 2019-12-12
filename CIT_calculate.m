clear all; close all; fclose all; clc;
output = "intensity.csv";
delimiter = "";
ignore_row = 22;
ns_column = 3;
ew_column = 4;
ud_column = 2;
file_list = dir("*.dat");
if size(file_list,1) == 0
  file_list = dir("*.txt");
endif

fid = fopen(output,"a");
header = "Station code,Station name,Station longitude,Station latitude,I_CWB(2000),CWB scale,I_JMA,JMA scale,I_FJEA";
fprintf(fid,"%s\n",header);
fclose(fid);

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
  station_name = char(row10{2});
  station_lon = row11{2};
  station_lat = row12{2};
  sample_rate = row16{2}
  fclose(fileID);
  
  disp("")
  I_cwb2000 = cwb2000(filename,delimiter,ignore_row,ns_column,ew_column,ud_column);
  CWB_scale = cwb2020(filename,delimiter,ignore_row,ns_column,ew_column,ud_column,sample_rate);
  I_jma = jma(filename,delimiter,ignore_row,ns_column,ew_column,ud_column,sample_rate);
  JMA_scale = intensity_scale("jma",I_jma);
  I_fjea = fjea(filename,delimiter,ignore_row,ns_column,ew_column,ud_column,sample_rate);

  fid = fopen(output,"a");
  fprintf(fid,"%s,%s,%.4f,%.4f,%.0f,%s,%.1f,%s,%.0f\n",station_code,station_name,station_lon,station_lat,I_cwb2000,CWB_scale,I_jma,JMA_scale,I_fjea);
  fclose(fid);
endfor