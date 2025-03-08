# Study Guide - Introduction to Importing Data in R

| Term | Definition/Usage | Defaults |
|------------------|----------------------------|--------------------------|
| `read.csv` | Import CSV files with comma as separator and period as decimal point. Part of `utils` package. | `header = TRUE`, `sep = ","` |
| `read.csv2` | Import CSV files with semicolon as separator and comma as decimal point. Part of `utils` package. | `header = TRUE`, `sep = ";"` |
| Flat files | Simple text files that display data as tables. Often used for data storage and transfer. | N/A |
| `utils` | Base R package containing functions for data import and export, among other utilities. | N/A |
| `path` | Represents the file path in R, used to specify the location of files for import functions. | N/A |
| `read.delim` | Import tab-delimited text files. Part of `utils` package. | `header = TRUE`, `sep = "\t"`, `dec = "."` |
| `read.delim2` | Import tab-delimited text files with comma as decimal point. Part of `utils` package. | `header = TRUE`, `sep = "\t"`, `dec = ","` |
| `read.table` | General function for reading tabular data. Can handle various delimiters and formats. | `header = FALSE`, `sep = ""` \| |
| `colClasses` argument to `read.delim` | Specifies the data type for each column during import, improving efficiency and accuracy. | N/A |
| `read_tsv` | Import tab-separated values files, producing a tibble. Part of `readr` package. | `col_names = TRUE` |
| `read_csv` | Import CSV files, producing a tibble. Part of `readr` package. | `col_names = TRUE` |
| tibble | Enhanced version of a data frame, providing better printing and subsetting. | N/A |
| `read_delim` | General function for reading delimited files. Part of `readr` package. | `col_names = TRUE` |
| `fread` | Fast and flexible function for reading data into a data.table. Part of `data.table` package. | `header = TRUE` |
| `readxl` | Package for reading Excel files into R. Supports both `.xls` and `.xlsx` formats. | N/A |
| `excel_sheets()` | Lists the names of sheets in an Excel file. Part of `readxl` package. | N/A |
| `read_excel()` | Import data from a specified sheet in an Excel file. Part of `readxl` package. | `col_names = TRUE` |
