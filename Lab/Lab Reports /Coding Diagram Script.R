MachineRead_output <- read.csv("MachineRead_output.csv")
MachineRead_output$Paper.ID <- gsub("\\[","",MachineRead_output$Paper.ID)
MachineRead_output$Paper.ID <- gsub("\\]","",MachineRead_output$Paper.ID)
MachineRead_output$Paper.ID <- gsub("\\'","",MachineRead_output$Paper.ID)
MachineRead_output$Paper.ID <- gsub(" ","",MachineRead_output$Paper.ID)


paper_ids <-c()
for(each in MachineRead_output$Paper.ID){
paper_ids <- unlist(strsplit(each,","))

row_num <- which(each == MachineRead_output$Paper.ID)

MachineRead_output$number_unique[row_num] <- length(unique(paper_ids))
  
  }
row_to_remove <- which(MachineRead_output$number_unique == 1)
MachineRead_output <-MachineRead_output[-c(row_to_remove),]

