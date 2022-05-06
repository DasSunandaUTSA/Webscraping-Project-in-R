library(rvest)
library(tidyverse)

#get all asian resturant info for Austin
geturl = "https://www.yelp.com/search?find_desc=Asian+Food&find_loc=Austin%2C+TX"
page <- read_html(geturl)


#get all the pages
pgnum <- page %>%
html_elements(xpath = "//div[@class=' border-color--default__09f24__NPAKY text-align--center__09f24__fYBGO']") %>%
html_text() %>%
str_extract ('of.*') %>%
str_remove('of ') %>%
as.numeric()
pgseq <- seq(from=0, to = (9 * 10)-10, by = 10)

#store all of the items 
resturant_name_all = c()
ratings_all = c()
number_of_review_all = c()

###########

for (i in pgseq){
        if (i ==0){
            page <- read_html(geturl)}
        else {
             page <- read_html(paste0(geturl, '&start=' , i))
 }

#resturant name
resturant_name<- page %>%
html_elements(xpath = "//div[@class=' businessName__09f24__EYSZE display--inline-block__09f24__fEDiJ border-color--default__09f24__NPAKY']") %>%
  html_text()

#ratings
review_ratings <- page %>%
html_elements(xpath = ".//div[contains(@aria-label, 'rating')]")%>%
html_attr('aria-label') %>%
str_remove_all(' star rating')%>%
as.numeric()

#number of review
review_count <- page %>%
html_elements(xpath="//span[@class='reviewCount__09f24__tnBk4 css-chan6m']") %>%
html_text()

resturant_name_all = append(resturant_name_all, resturant_name)
ratings_all = append(ratings_all, review_ratings )
number_of_review_all = append(number_of_review_all, review_count )

    }

df <- data.frame('Resturant' = resturant_name_all ,
                 'Rating' = ratings_all,
                   'Reviewer' = number_of_review_all )

write.csv(df, "C:\\Users\\sdas\\Desktop\\Spring 2022\\Web scrap project\\Austin_Asian_Data.csv")



