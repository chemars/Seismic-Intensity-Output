# 測站震度輸出
以[地震震度計算程式](https://github.com/chemars/Seismic-Intensity-Scales)為基礎，計算各地震測站的震度並輸出到檔案。

## 準備步驟
1. 安裝 [GNU Octave](https://www.gnu.org/software/octave/)（計算程式適用於 Windows-64 版）。
2. 下載[地震震度計算程式](https://github.com/chemars/Seismic-Intensity-Scales)，將程式加入 GNU Octave 的函數路徑（[相關說明](https://octave.org/doc/interpreter/Manipulating-the-Load-Path.html)）。
3. 下載所有檔案，並另外下載地震測站觀測資料，把所有檔案放在同一目錄。
4. 執行對應的程式即可輸出震度。

## 測站資料
* 中央氣象局地震測報中心 [個案地震報導](https://scweb.cwb.gov.tw/zh-tw/page/disaster/3)
  - 對應程式：`CWB_check.m`、`CWB_calculate.m`
* 民生公共物聯網-資料服務平台 [中央氣象局地震監測站](https://ci.taiwan.gov.tw/dsp/Views/dataset/detail.aspx?id=earthquake_1)、[國家地震工程研究中心地震監測站](https://ci.taiwan.gov.tw/dsp/Views/dataset/detail.aspx?id=earthquake_6) （[歷史資料](https://history.colife.org.tw/#/)）
  - 對應程式：`CIT_check.m`、`CIT_calculate.m`

## 說明
`*_check.m`是檢查檔案格式是否正確，`*_calculate.m`是計算與輸出震度並附加測站資訊，輸出檔案名稱為`intensity.csv`，檔案格式如下
* CWB：`測站代碼,中央氣象局地震震度（2000年版本）,中央氣象局地震震度,日本氣象廳計測震度,日本氣象廳震度階級,福建省地震局地震儀器烈度`
* CIT：`測站代碼,測站名稱,測站經度,測站緯度,中央氣象局地震震度（2000年版本）,中央氣象局地震震度,日本氣象廳計測震度,日本氣象廳震度階級,福建省地震局地震儀器烈度`

## 授權條款
[MIT 授權條款](https://github.com/chemars/Seismic-Intensity-Output/blob/master/LICENSE)
