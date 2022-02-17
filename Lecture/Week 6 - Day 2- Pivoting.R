library(tidyverse)
library(haireye)

dat_he <- as_tibble(HairEyeColor) %>% 
  count(Hair, Eye, wt = n) %>% 
  rename(hair = Hair, eye = Eye)
#this is the Tidy Version 

dat_he_un <- dat_he %>%
  mutate(eye = str_c(eye, "_eyed")) %>% 
  pivot_wider(id_cols = hair, names_from = eye, values_from = n)
##This is the untidy version 
##how do we go from this to tidy

dat_he_un %>% 
  pivot_longer(cols      = c(Blue_eyed, Brown_eyed, Green_eyed, Hazel_eyed), ##COuld also to Brown_eyed:Hazel_eyed
               names_to  = "eye",
               values_to = "n")
##Making themn a longer structure, taking the name store in new variable, values for each column into new varaible. 
##cols = which variables are being maipulated 
##names_to = where these new varibles will be located in, IE which column is it going to 
##values_to = Where the values will be stored. Coincides with the names_to argument. 

##Pivot Wider (going from tidy to untidy) this is useful for presentation
dat_he %>% 
  pivot_wider(id_cols = c(),
              )
