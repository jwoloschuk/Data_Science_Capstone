
# ---------------------------------------------------------------------
# Server.R
# author: JDW
# ---------------------------------------------------------------------
# Shiny App UI

library(shiny)
library(stringr)
library(tm) # for tidy functions such as removePunctuation

# Load n-gram tables - note these were created earlier
bigram_table <- readRDS("bigram_table.RData");
trigram_table <- readRDS("trigram_table.RData");
quadgram_table <- readRDS("quadgram_table.RData")

names(bigram_table)[names(bigram_table) == 'word1'] <- 'w_1'
names(bigram_table)[names(bigram_table) == 'word2'] <- 'w_2'

names(trigram_table)[names(trigram_table) == 'word1'] <- 'w_1'
names(trigram_table)[names(trigram_table) == 'word2'] <- 'w_2'
names(trigram_table)[names(trigram_table) == 'word3'] <- 'w_3'

names(quadgram_table)[names(quadgram_table) == 'word1'] <- 'w_1'
names(quadgram_table)[names(quadgram_table) == 'word2'] <- 'w_2'
names(quadgram_table)[names(quadgram_table) == 'word3'] <- 'w_3'
names(quadgram_table)[names(quadgram_table) == 'word4'] <- 'w_4'
message <- "" # default message


# Bigram function
Bigram_function <- function(the_word) {
        
        if (identical(character(0),as.character(head(
                bigram_table[bigram_table$w_1 == the_word[1], 2], 1)))) {
                
                message<<-"'It'is the most common word in the English language 
                and is the app's default guess if a non-English or unknown word 
                is used. Please note, corpus only contains a subset of total 
                word/text combinations, therefore certain words may be missing." 
                as.character(head("it",1))
        }
        else {
                message <<- "Bigram Table"
                as.character(head(
                        bigram_table[bigram_table$w_1 == the_word[1],2], 1))
                
        }
}

# Trigram function
Trigram_function <- function(the_word) {
        
        if (identical(character(0),as.character(head(
                trigram_table[trigram_table$w_1 == the_word[1] 
                              & trigram_table$w_2 == the_word[2], 3], 1)))) {
                
                as.character(next_word_function(the_word[2]))
                
        }
        else {
                message<<- "Trigram Table"
                as.character(head(
                        trigram_table[trigram_table$w_1 == the_word[1]
                                      & trigram_table$w_2 == the_word[2], 3], 1))
                
        }
}

# Quadgram function
Quadgram_function <- function(the_word) {
        
        if (identical(character(0),as.character(head(
                quadgram_table[quadgram_table$w_1 == the_word[1]
                               & quadgram_table$w_2 == the_word[2]
                               & quadgram_table$w_3 == the_word[3], 4], 1)))) {
                
                as.character(next_word_function(paste(the_word[2],the_word[3],sep=" ")))
        }
        else {
                message <<- "Quadgram Table"
                as.character(head(
                        quadgram_table[quadgram_table$w_1 == the_word[1]
                                       & quadgram_table$w_2 == the_word[2]
                                       & quadgram_table$w_3 == the_word[3], 4], 1))
                
        }       
}


# Predict the next-word function
next_word_function <- function(the_word) {
        
        # Clean the input word by removing numbers, punctuation, etc. using TM functions
        input_text <- stripWhitespace(removeNumbers(removePunctuation(
                tolower(the_word),preserve_intra_word_dashes = TRUE)))
        
        # Split the text into individual words
        the_word <- strsplit(input_text, " ")[[1]]
        
        # Store the word length
        n <- length(the_word)

        
        # If Bigram
        if (n == 1) {the_word <- as.character(tail(the_word,1));
        Bigram_function(the_word)}
        
        # If Trigram
        else if (n == 2) {the_word <- as.character(tail(the_word,2));
        Trigram_function(the_word)}
        
        # If Quadgram
        else if (n >= 3) {the_word <- as.character(tail(the_word,3));
        Quadgram_function(the_word)}
}



# Shiny server function to call the next_word_function
shinyServer(function(input, output) {
        
        output$prediction <- renderPrint({
                result <- next_word_function(input$inputText)
                output$ngram_used <- renderText({message})
                result
        })

}
)
