# 
# On the test set, output final and individual raters' rating scors.
# score need be factorized to <=4, ==5, and >=6
# then, will use sklearn classification report to estimate human F-1

hs_tidy_test <- merge(amt_hs, resp_test_lst, by="vid")
write.csv(hs_tidy_test, file='tSNE/hs_test.csv', row.names = F)
