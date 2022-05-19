library(arrow)
library(purrr)
library(fs)
library(vroom)

download_dir <- "download"
data_dir <- "data"
fs::dir_create(data_dir)

process_file <- function(filename) {
    parquet <- basename(filename) |>
        strsplit("\\.") |>
        pluck(1) |>
        pluck(1) |>
        paste0(".parquet")
    arrow::write_parquet(vroom::vroom(filename,
        comment = "#"
    ),
    sink = file.path(data_dir, parquet)
    )
}
# process files
fs::dir_ls(path = download_dir, glob = "*.csv.*") |>
    append(fs::dir_ls(path = download_dir, glob = "*.txt.*")) |>
    append(fs::dir_ls(path = download_dir, glob = "*.txt")) |>
    unique() |>
    purrr::discard(~ grepl("*README.txt", .x)) |>
    walk(process_file)
