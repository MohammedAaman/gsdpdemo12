library(tidyverse)
library(janitor)
library(stringr)

dir()
dir(path = "gsdp")
"gsdp/NAD-Andhra_Pradesh-GSVA_cur_2016-17.csv" %>% 
read.csv() -> ap.df

"NAD-Andhra_Pradesh-GSVA_cur_2016-17.csv" %>% 
  str_split("-") %>% 
  unlist() -> state_name_vector

state_name_vector[2]-> st_name

ap.df %>% 
  slice(-c(7,11,27:33)) %>% 
  pivot_longer(-c(1,2), names_to = "year",values_to = "gsdp1") %>% 
  clean_names() %>% 
  select(-1) %>% 
  mutate(state = st_name) %>% 
view()


#create a loop and iterate over all files name
dir(path="gsdp",
    pattern = "NAD")-> state_files
tempdf <- tibble()

for (i  in state_files) {
  print(paste0("file name",i))
i %>% 
  str_split("-") %>% 
  unlist() -> state_name_vector
state_name_vector[2] ->st_name

print(paste0("State Name:",st_name))
paste0("gsdp/",i) %>% 
  read_csv()-> st_df8

st_df8 %>%
  slice(-c(7,11,27:38)) %>% 
  pivot_longer(-c(1,2),names_to = "year",values_to = "gsdp") %>%
  clean_names() %>% 
  select(-1) %>% 
  mutate(state = st_name)-> st_df9
print(st_df9)
bind_rows(tempdf,st_df9) -> tempdf
}

tempdf -> final_statewise_gsdp
final_statewise_gsdp %>% 
  write.csv("final_statewise_gsdp.csv")
  
  
