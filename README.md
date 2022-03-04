# CMIP5Downloader : 氣候模擬資料下載工具

依據使用者設定的參數，能快速且精準的獲取大量且不同的氣候資料集。

## Setup

```
$ chmod +x ./get_CMIP5_dataset.sh
```

對照 CMIP5 所公布之檔案下載路徑，分別設定：

#### About Model
* model
* model_url
* ensemble_member
* version_number
* experiment

#### About Variable
* start_year
* end_year
* interval_years
* realm
* variable

## Usage


```
$ ./get_CMIP5_dataset.sh 
```

執行後，會依指定的 model 名稱來建立資料夾，所下載的資料儲存於其中。

