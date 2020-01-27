# 1_import_data.R
# Jordan Woloschuk
# ------------------

setwd("~/GitHub/Data_Science_Capstone")

# Load the stingi library for text manipulation
library(stringi)

# Inspect the data
list.files("final")
list.files("final/en_US")

# Import the blogs and twitter datasets in text mode
blogs <- readLines("final/en_US/en_US.blogs.txt", encoding="UTF-8")
twitter <- readLines("final/en_US/en_US.twitter.txt", encoding="UTF-8")
news <- readLines("final/en_US/en_US.news.txt", encoding="UTF-8")


# Save the data to an .RData files

if (!file.exists("blogs.RData")) {save(blogs, file="blogs.RData")}
if (!file.exists("news.RData")){save(news, file="news.RData")}
if (!file.exists("twitter.RData")){save(twitter, file="twitter.RData")}

# Character Counts
blogs_nchar   <- nchar(blogs)
news_nchar    <- nchar(news)
twitter_nchar <- nchar(twitter)

# Characters for each
blogs_words <- wordcount(blogs, sep = " ")
news_words  <- wordcount(news,  sep = " ")
twitter_words <- wordcount(news, sep = " ")

# Line counts for each
blogs_lines <- length(blogs)
news_lines <- length(news)
twitter_lines <- length(twitter)

repo_summary <- data.frame(f_names = c("blogs", "news", "twitter"),
                           f_size  = c(blogs_size, news_size, twitter_size),
                           f_lines = c(blogs_lines, news_lines, twitter_lines),
                           n_char =  c(blogs_nchar_sum, news_nchar_sum, twitter_nchar_sum),
                           n_words = c(blogs_words, news_words, twitter_words))
repo_summary <- repo_summary %>% mutate(pct_n_char = round(n_char/sum(n_char), 2))
repo_summary <- repo_summary %>% mutate(pct_lines = round(f_lines/sum(f_lines), 2))
repo_summary <- repo_summary %>% mutate(pct_words = round(n_words/sum(n_words), 2))



# Sample Size in terms of the number of lines
sample_percent <- 0.05

# Set Seed for reporducability
set.seed(1)


Blogs_size <- Blogs_lines * sample_percent
News_size <- News_lines * sample_percent
Twitter_size <- Twitter_lines * sample_percent


# Creat Sample groups
Blogs_sample <- sample(blogs, Blogs_size)
News_sample <- sample(news, News_size)
Twitter_sample <- sample(twitter, Twitter_size)

# Combine into a single repo
repo_sample <- c(Blogs_sample, News_sample, Twitter_sample)
