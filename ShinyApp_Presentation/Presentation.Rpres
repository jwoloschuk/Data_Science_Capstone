<style>
output:
  slidy_presentation:
    font_adjustment: -10
</style>

Next-Word Predictor Shiny Application
========================================================
author: Jordan W
date: March 2020
font-import: http://fonts.googleapis.com/css?family=Geneva
font-family: 'Geneva'
autosize: true


Project Overview
========================================================

<small> This capstone project is apart of the [Coursera Data Science Specialization](https://www.coursera.org/specializations/jhu-data-science). </small>

This is the final report of the **Data Science Capstone Project** and is the 
culmination of the analysis of multiple, large text files to determine the the 
structure of the data and how common words are put together to develop a
**Next-Word Shiny Application**.

This application provides the next predicted word based on the usage of n-grams 
database of english text files (Twitter, Blogs, and New articles), scoring based 
on frequency to predict the next word. The raw datafiles are available [here](
(https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip).

The functionality of this tool is similar to that of other search engine bars 
(e.g. Google or Bing) or by companies like [SHIFTKEY](https://shiftkeylabs.ca/).

This application can be accessed [here](https://jwoloschuk.shinyapps.io/Capstone_Next-Word_App/):

Methodology
========================================================

* <small> After downloading the text datafiles, a subset was obtained. This subset of text
was then cleaned and tidied to develop a corpus of text. This process of cleaing
involved converting the text to lower case, removing the punctuation, white spaces,
numbers and profanity words. </small>

* <small> This **Corpus** (subset of text with ~5% of each text file) was 
**Tokenized** (process of breaking text into individual words) into **NGrams** ( a sequence of "n" items pulled from our Corpus). </small>

* <small> Ngrams tables were then developed which contain the frequencies of word combinations:</small>
  + <small> For n = 2, this is called a *bigram* </small>
  + <small> For n = 3, this is called a *trigram* </small>
  + <small> For n = 4, this is called a *quadgram* </small>


* <small> An algorithm was then developed to predict the next word based on the 
text entered by the user based on the ngram tables/frequencies.</small>


Shiny Application
========================================================


* A **Next-Word Shiny Application** was developed to predict the next possible 
word in a text string. 

* After a user has entered text into input box, the application will return the 
most likley next word to be used.

* This predicted word is based on analysis of the previously constructed n-grams 
tables and comparing it with tokenized frequency of the bigram, trigram and 
quadgram sequences. The application will also display ngram table that was used 
to predit the next-word. 

* This application responds to a users inputs instantly, and automatically shows
the predicted word. 

Application UI
========================================================

The following image shows the **User Interface** of the application and 
illustrates key inputs and outputs: 
<div style="height: 750px", align="center">
     <img src="App_image.png" alt=" " style="max-height: 75%" />
</div>


Results and Takeaways 
========================================================

* The developed application takes the users word or sentence and outputs the 
predicted next word based on the next most frequently used word as determined 
from the Corpus.

* The application could be improved in a few ways: 
  + Outputting multiple possible words in the order of most to least frequent.
  + The model only considers ngrams, where n is between 2-4, this could be expanded to
  *4+-grams* to improve match results (i.e. n = 6).
  + Word pairs that appear less frequently, say fewer than 10 times, could be 
  removed to improve accuracy.
  + A larger set text data could be analyzed to improve predictions.
  
* The underlying data analysis/models can be found on my [GitHub](https://github.com/jwoloschuk/Data_Science_Capstone) page.

**Thank You!**
