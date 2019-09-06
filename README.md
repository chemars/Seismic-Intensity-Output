# 測站震度計算
以[地震震度計算程式](https://github.com/chemars/Seismic-Intensity-Scales)為基礎，批次計算各地震測站的不同震度。

## 準備步驟
1. 安裝 [GNU Octave](https://www.gnu.org/software/octave/)（計算程式適用於 GNU Octave 5.1.0 Windows-64 版）。
2. 下載[地震震度計算程式](https://github.com/chemars/Seismic-Intensity-Scales)，將程式加入 GNU Octave 函數路徑（[詳細說明](https://octave.org/doc/interpreter/Manipulating-the-Load-Path.html)）。
3. 下載所有檔案，並另外下載測站資料，把所有檔案放在同一目錄。
4. 執行對應的程式即可檢查資料與計算震度。

## 地震測站資料
* 中央氣象局地震測報中心 [個案地震報導](https://scweb.cwb.gov.tw/zh-tw/page/disaster/3)
  - 對應程式：`CWB_check.m`、`CWB_calculate.m`

* 民生公共物聯網-資料服務平台 [感測資料-中央氣象局地震監測站](https://ci.taiwan.gov.tw/dsp/environmental_eq_cwb.aspx)、[感測資料-國家地震工程研究中心地震監測站](https://ci.taiwan.gov.tw/dsp/environmental_eq_ncree.aspx)
  - 對應程式：`CIT_check.m`、`CIT_calculate.m`

* 日本氣象廳 [強震観測データ](https://www.data.jma.go.jp/svd/eqev/data/kyoshin/jishin/index.html)
  - 對應程式：`JMA_check.m`
