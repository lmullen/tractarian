library(readr)
library(dplyr)
library(stringr)
library(purrr)
library(tokenizers)

paths <- list.files("data-raw/tracts", full.names = TRUE)
files <- basename(paths)
id <- str_replace_all(files, "\\.txt", "")
texts <- lapply(paths, read_file)

tracts_for_the_times <- data_frame(id = id,
                                   number = as.integer(str_extract(id, "\\d+")),
                                   text = texts)

devtools::use_data(tracts_for_the_times, overwrite = TRUE)
