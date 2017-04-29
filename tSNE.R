library(tidyverse)
library(magrittr)
library(stringr)

# for t-SNE analysis
vec <- read.csv('tSNE/vec.tsv', sep='\t', header = F)
meta <- read.csv('tSNE/vec.meta', sep='\t', header = F)
colnames(meta) <- c("vid", "score")

together <- cbind(vec, meta)

# one item
# a function to split vid into turk and item
obt_item <- function(x){
  vid_pt <- "SELTCAWRS_(t\\d+)_(v\\d+)"
  tks <- str_match(x, vid_pt)
  tks[3] # item
  
}

cat_score <- function(x){
  if(x <=4){
    y = "L"
  }
  if(x == 5){
    y = "M"
  }
  if(x >=6){
    y = "H"
  }
  y
  
}

one_item <- function(item_id) {
  one <- together %>%
    mutate(item = unlist(lapply(vid, obt_item))) %>%
    mutate(score.cat = unlist(lapply(score, cat_score))) %>%
    filter(item == item_id)
  show(summary(one$score))
  show(table(one$score.cat))
  show("\n")
  
  write.table(
    one[1:50],
    file = paste("tSNE/", item_id, ".tsv"),
    sep = "\t",
    row.names = F,
    col.names = F
  )
  write.table(one[c("vid", "score.cat")],
              file = paste("tSNE/", item_id, "_meta.tsv"),
              sep = "\t",
              row.names = F)
}

# for each item, generated vec and meta TSV files can be used for t-SNE view.
one_item('v1')
one_item("v2")
one_item('v3')
one_item('v4')
one_item('v5')
one_item('v6')
one_item('v7')
one_item('v8')
