# 
# On the test set, output final and individual raters' rating scors.
# then, will use sklearn classification report to estimate human F-1
library(tidyverse)
library(magrittr)

merge_ <- function(x, y){
  out <- merge(x, y, by='vid') %>%
    select(vid:final)
  out
  
}

write.csv(merge_(amt_hs_asr, resp_test_lst), file='tSNE/hs_test.csv', row.names = F)
write.csv(merge_(amt_ag_asr, resp_test_lst), file='tSNE/ag_test.csv', row.names = F)
write.csv(merge_(amt_ex_asr, resp_test_lst), file='tSNE/ex_test.csv', row.names = F)
write.csv(merge_(amt_co_asr, resp_test_lst), file='tSNE/co_test.csv', row.names = F)
write.csv(merge_(amt_em_asr, resp_test_lst), file='tSNE/em_test.csv', row.names = F)
write.csv(merge_(amt_op_asr, resp_test_lst), file='tSNE/op_test.csv', row.names = F)
