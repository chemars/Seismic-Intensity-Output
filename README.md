# 測站震度計算
以[地震震度計算程式](https://github.com/chemars/Seismic-Intensity-Scales)為基礎，批次計算一地震各測站的不同震度。

## 準備步驟
1. 安裝 [GNU Octave](https://www.gnu.org/software/octave/)。（計算程式適用於 GNU Octave 5.1.0 Windows-64 版）
2. 下載所有檔案，並另外下載觀測資料，資料需包括三軸加速度訊號（單位為 gal）及取樣率（單位為 Hz），把所有檔案放在同一目錄。
3. 開啟 GNU Octave，切換到檔案所在的目錄。

## 地震測站資料
* 中央氣象局地震測報中心 [個案地震報導](https://scweb.cwb.gov.tw/zh-tw/page/disaster/3)
* 日本氣象廳 [強震観測データ](https://www.data.jma.go.jp/svd/eqev/data/kyoshin/jishin/index.html)
* 民生公共物聯網-資料服務平台 [感測資料-中央氣象局地震監測站](https://ci.taiwan.gov.tw/dsp/environmental_eq_cwb.aspx)
* 民生公共物聯網-資料服務平台 [感測資料-國家地震工程研究中心地震監測站](https://ci.taiwan.gov.tw/dsp/environmental_eq_ncree.aspx)
