library(tidyverse)
bind_cols()
bind_rows()

tibble( x = 1:5,
       y = 6:10 )-> df1
tibble( x =11:15,
       y =16:20 )-> df2
bind_cols(df1,df2)

bind_cols(df1,df2) -> df3
bind_rows(df1,df2) -> df4

view(df3)
view(df4)
tibble(x = 1:3,
       y = 4:6,
       z = 7:9) -> v1

tibble(x = 11:13,
       y = 14:16,
       z = 17:19) -> v2

bind_cols(v1,v2)
bind_rows(v1,v2) 

v1 %>% bind_rows(v2)-> v3
view(v3)
read.csv("GSDP.csv") -> dff1
view(dff1)
get