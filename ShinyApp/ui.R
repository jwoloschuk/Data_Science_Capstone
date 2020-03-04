

# ---------------------------------------------------------------------
# UI.R
# author: JDW
# ---------------------------------------------------------------------

# Load libraries
library(shiny)
library(markdown)
library(shinythemes) # use to control theme / background / font

# Shiny App UI
shinyUI(
        fluidPage( theme = shinytheme("superhero"),
                titlePanel(div(column(width = 4, strong("Next-Word Predictor Shiny Application")), 
                               column(width = 8, tags$img(src = "DS.png", height="30%", width="30%"))),),
                
                sidebarLayout( position = "right",
                        sidebarPanel(
                                strong(h3("Coursera / Johns Hopkins University: 
                                          Data Science Capstone",align = "center",
                                          style="color:black")),
                                h5("Jordan W, March 2020", align = "center"),
                         
                                h5("This Shiny application predicts the next word
                                   through n-gram analysis of various types of 
                                   text documents."),
                                br(), # blank row
                                h4("How to use the App"),
                                h5("1. Enter a word or sentence in the box."),
                                h5("2. The next-word will appear to the left."),
                                h6("Note: No need to hit enter, as the app will 
                                   automatically respond."),

                                br(), # blank row
                                
                                textInput("inputText", "Please enter your word 
                                          or sentence below:",
                                          value = ""),
                                br(), # blank row
                                
                                
                                
                        ),
                        mainPanel(
                                br(), # blank row
                                h5("For this application, a number of ngrams 
                                   (Unigram, Bigram, Trigram and Quintgram) tables
                                   were developed by examining Blogs posts, News 
                                   articles and Twitter posts."),
                                br(), # blank row
                                h5("When developing these n-gram tables a random
                                   5% subset of the entire corpus was used. Various
                                   cleaning steps were undertaken to fist clean and
                                   tidy the text data."),
                                br(),# blank row
                                h5("Depending on the word or words entered, the 
                                   app will determine best ngram table to use 
                                   and the corresponding next-word prediction."),
                                br(),# blank row
                                br(),# blank row
                                br(),# blank row
                                br(),# blank row
                                br(),# blank row
                                br(),# blank row
                                strong("The next-word is:"),
                                br(), # blank row
                                verbatimTextOutput("prediction"), # print the predicted word
                                br(),# blank row
                                h5("This next-word was determined using the:"),
                                code(textOutput('ngram_used')),
                                br(), # blank row
                                img(src='JHU_C_logo.png', align = "center", height="50%", width="50%")
                                
                        )
                )
        )
)
