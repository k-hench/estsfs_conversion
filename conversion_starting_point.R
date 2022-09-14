library(tidyverse)
library(rlang)
data <- read_tsv("test_counts.tsv")

digest_ac <- function(str){
#  str <- enexpr(str)
  A = 0; C = 0; G = 0; T = 0
  eval(parse(text = str))
  glue::glue("{A},{C},{G},{T}")
}

data |> 
  mutate(ac = map_chr(.x = `{ALLELE=COUNT}`, .f = digest_ac))
