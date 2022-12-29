#RPi


web_repo <- 'https://github.com/JAlcocerT'
web_hosted <- 'https://jalcocert.github.io'

#Get the current wd as the directory of this file
wd<-dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(wd)
#knitt the file on its current folder to test its view
rmarkdown::render('Linux_index.Rmd',
                  output_file = paste('index', 
                                      '.html', sep=''))