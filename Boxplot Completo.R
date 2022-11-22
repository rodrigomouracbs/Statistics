#Test	
#-------------------------------------------------------------------
#The Basics
#-------------------------------------------------------------------
#<-This is a comment and is not read by R
"This is my code" #This is a comment
#Define an object (variable)
A=2 #Make object "A" equal to 2
B=2 #Make object "B" equal to 2

#The use of "equals" in R means you can't "=" to ask a question
#"==" is how you "test"
A==B #A does Equal B this is TRUE

B=3 #Make object "B" equal to 3
A==B #A does not Equal B this is FALSE
C=A #Did I really want to set C as the same as value A?
#Make object 2 equal to "A" doesn't work 
2=A #You cant change the definition of "2" the whole of statistics would fall apart!
#Using "=" can get a bit confusing.
#"=" is DIRECTIONAL:
#The FIRST "thing" (the variable) takes the value of the SECOND "thing" 
#It is better (and less confusing) to use "<-" to assign an object
A<-2
#Which is the same as 
A=2
#You can't get it the wrong way round
2<-A
#NOW you CAN put the variable after the object if you switch the arrow.
2->A
#Functions do something to an object these take the form: 
#function(argument)
#The class function tells us what class the variable is
class(A) #"A" which has the value 2 is a numeric
#Another class of data object is a string or 'character'
C<-"This is a string"
class(C)
#Functions exp(1) gives the base of natural logarithms
#1 is the object
exp(1)
#The function takes an input (in this case 1 to signify the base) and gives an output
#Some basic functions that are useful are:
print(C)
cat(C)
#THEY DO SIMILAR THINGS
cat(C,C,C,C,C)#Some functions can take multiple arguments
print(C,C,C,C,C)#Some can't 
#If we want to print(C,C,C,C,C) we need to "paste" them together first
print(paste(C,C,C,C,C)) # we have put the paste function within the print function
# the paste function has a NAMED ARGUMENT sep which is how we want to separate the arguments before it!
print(paste(C,C,C,C,C,sep="...")) 
#You can find the "manual" for any function with "?"
?paste
#There are some special characters when it comes to strings that you can't use like a \
C<-"This is a\string"
#"\" is an escape character it tells R to look very carefully at what follows
#"\n" is the code for a new line
C<-"This is a\nstring"
cat(C)
C
#cat interprets the string but just running C doesn't!

#Variables can hold many things.
D<-c(1,2,3,4,5)
#"c" means concatenate i.e. join together into a vector
D
#Indexing a variable allows is to subset it. i.e. extract parts 
D[2] #the second item of D
#2:4 gives us a range
D[2:4]#the second to fourth item of D
D[c(FALSE,TRUE,TRUE,TRUE,FALSE)] #This does the same thing
#This identifies the vector items that are equal to three
D==3
#This subsets (filters) the vector items to those that equal 3
D[D==3]

#2D structures
#2D structures can be data.frames/tables or matrices (there are some others)
#The cbind function allows us to bind to lists together as columns (rbind does it as rows)
cbind(c(1,2,3),c(4,5,6))
rbind(c(1,2,3),c(4,5,6))
class(rbind(c(1,2,3),c(4,5,6)))
#Usually though we will want to use data.frames 
cbind.data.frame(c(1,2,3),c(4,5,6))
class(cbind.data.frame(c(1,2,3),c(4,5,6)))
#The column names in this case aren't very meaningful!
data.frame(One=c(1,2,3),Two=c(2,3,4))
ATable<-data.frame(One=c(1,2,3),Two=c(2,3,4))
#With two dimensional objects subsetting is different.
ATable[1,2]
#ALWAYS [ROW,COLUMN]
ATable[,2] #all of column two
ATable[2,] #all of row two
#We can also do it a simpler way using the column names
ATable$One
#Dollar ($) gives us the column named "one" in table A Table
ATable[,"One"] #This does the same thing
#This identifies the items in column one that are equal to three
ATable$One==3
#This returns the values in column "one" where column one equals three
ATable[ATable$One==3,"One"]
#This returns the values in column "two" where column one equals three
ATable[ATable$One==3,"Two"]

#R is very difficult to break and there is lots of help on the internet
#R has lots of different libraries created by people on the internet 
#Some are even created by huge bodies like The European Bioinformatics Institute 

#PLAY
#WITH
#IT

#-------------------------------------------------------------------
#Import Data
#-------------------------------------------------------------------
#The data for the fish is in xlsx format to read excel files we need the library
library("readxl")
#If you have never used the readxl library before you will need to install it
install.packages("readxl")
#IF YOU GOT AN ERROR TRY LIBRARY readxl again.
library("readxl")

#in creating scripts it sometimes helps to define the source of your infomration 
#and (if necessary) where you want to output it

InputDirectory<-"c:\\Diretorio R\\" 
OutputDirectory<-"c:\\Diretorio R\\" 
#Because "\" is a special character we have to use it twice to tell R we really mean it 
cat("\\n is a special character that tells r to add\na\ncarriage\nreturn\n") 
#\\n tells r that the second "\" is an actual "\" which means that it didn't read it as a new line
#The directory R is looking at is the working directory we can change that
setwd(InputDirectory)
Data<-read_excel("Dados R.xlsx")
#read_excel creates a custom-type object
class(Data)
#we just want the a data table
Data<-as.data.frame(Data,stringsAsFactors=F) #WE MIGHT GO INTO FACTORS AT A LATER DATE
#"head" shows the first few rows
head(Data)
#"head" with a number as a second argument tells R how many rows to print
head(Data,2)

#-------------------------------------------------------------------
#Simple Analysis
#-------------------------------------------------------------------
#Summary provides a pre-programmed statistical summary
summary(Data)
#some of the functions to run the statistics are pretty self explanatory
mean(Data$robustezegrossura)#mean
median(Data$robustezegrossura)#median
#NOTE: if a number vector contains an "NA" (not applicable) the result is usually NA
mean(c(1,2,NA,4,5))
#there is a special named argument to remove NAs in most statistical functions
mean(c(1,2,NA,4,5),na.rm=TRUE)#

#We can subset the data exactly the same way as before 
Data[Data$Fornecedor=="C",c("Fornecedor","robustezegrossura","QualidBarbatanas")]

#-------------------------------------------------------------------
#Simple Plots
#-------------------------------------------------------------------
#The simplest analysis is just a plot
plot(Data$robustezegrossura,Data$equilibrioeFormatogeral)  #THIS FUNCTION TAKES TWO "arguments"
#It looks pretty crap!!!!
plot(Data$robustezegrossura,Data$equilibrioeFormatogeral,main="Relationship Between robustezegrossura and equilibrioeFormatogeral")
#It still looks pretty crap!!!!
plot(Data$robustezegrossura,Data$equilibrioeFormatogeral,main="Relationship Between robustezegrossura\nand equilibrioeFormatogeral")
#There are LOTS of named arguments we can use
plot(Data$robustezegrossura,Data$equilibrioeFormatogeral,
	main="Relationship Between robustezegrossura\nand equilibrioeFormatogeral", #main title
	xlab="robustezegrossura", #label for the x axis
	ylab="equilibrioeFormatogeral", #label for the y axis
	pch=22,
	bg="blue",
	col="red"
)
#This looks better?

#-------------------------------------------------------------------
#Linear Regression
#-------------------------------------------------------------------
#This plot still doesn't PROVE anything
#lets do a linear regression. i.e. a linear model. the function "lm"
MyLinearModel<-lm(Data$equilibrioeFormatogeral~Data$robustezegrossura)
#"~" is part of an R formula
#We can summarise it
summary(MyLinearModel)
#We can produce the anova table
anova(MyLinearModel)
#We can overlay the regression on the plot
abline(MyLinearModel)

#-------------------------------------------------------------------
#Boxplots & Barplots
#-------------------------------------------------------------------
#A boxplot looking at Robustezegrossura by Fornecedor
library(ggplot2)
fao<-read.table("clipboard",h=T)

#Gr?fico Mundo
data<-read.table("clipboard",h=T)
boxplot(Kc~Fase,data,
	col="darkgreen",
	main="Kc por fase fenol?gica - Mundo",
	xlab="Fase Fenol?gica",
	ylab="Kc",yaxt = "n")
axis(2, at = seq(0,1.8,0.1), las = 2)

points(fao$Kc,col="yellow",pch=20) 
points(3.5,0.35,col="yellow",pch=20)
text (3.57,0.35,"Kc FAO56",pos = 4)
median.result <- median(data$Kc)
median.result
abline(h=0.895)

#Gr?fico Brasil
data2<-read.table("clipboard",h=T)
boxplot(Kc~Fase,data2,
        col="darkgreen",
        main="Kc por fase fenol?gica - Brasil",
        xlab="Fase Fenol?gica",
        ylab="Kc",yaxt = "n")

axis(2, at = seq(0,1.8,0.1), las = 2)

points(fao$Kc,col="yellow",pch=20) 
points(3.5,0.35,col="yellow",pch=20)
text (3.57,0.35,"Kc FAO56",pos = 4)
median.result <- median(data$Kc)
median.result
abline(h=0.895)




#Find out the median Robustezegrossura by Fornecedor
aggregate(Kc~Fase,data,median)

#Store the analysis to a variable
Analysis<-aggregate(robustezegrossura~Fornecedor,Data,median)

barplot(Analysis$robustezegrossura,names=Analysis$Fornecedor,
	col="darkblue",
	main="Robustezegrossura by Fornecedor",
	xlab="Fornecedor",
	ylab="Robustezegrossura")
#-------------------------------------------------------------------
#Ifs and loops
#-------------------------------------------------------------------
#IFS
X<-2

	if(X==1){ 		 #Evaluate X=1
		print("X=1") #Do this if X=1
	}else if (X==2){ 	 #Evaluate X=2
		print("X=2") #Do this if X=2
	}else{		 #Otherwise 
		print(" X isn't 1 or 2")
	}


ifelse(c(1,2,1,2,1,2,1,2)==1,"Yes","No")


#LOOPS
	for (X in 1:10){
		print(X*2)
	}
x<-colnames(Data)[3]
y<-colnames(Data)[4]
#-------------------------------------------------------------------
#Putting it all together
#-------------------------------------------------------------------
par(mfrow=c(3,3),mar=c(4,4,3,1)) #This sets up the number of rows and columns of plots and defines the margin

for (x in colnames(Data)[3:5]){
	for (y in colnames(Data)[3:5]){
		if(x==y){
			boxplot(as.formula(paste(y,"~Fornecedor",sep="")),
				Data,
				col="darkred",
				main=paste(y,"by Fornecedor"),
				xlab="Fornecedor",
				ylab=y)

		}else{
			plot(Data[,x],Data[,y],
				main=paste(y,"by",x), #main title
				xlab=x, #label for the x axis
				ylab=y, #label for the y axis
				pch=22,
				bg="darkblue")
			
			Model<-lm(as.formula(paste(y,"~",x,sep="")),
					Data)

			abline(Model,
				col="darkred",
				lwd=3)

				if(summary(Model)$coefficients[2,4]<0.001){
					text(max(Data[,x]),
						min(Data[,y]),
						"P<0.001",
						pos=2)	
				}else{
					text(max(Data[,x]),
						min(Data[,y]),
						paste("P =",round(summary(Model)$coefficients[2,4],3)),
						pos=2)
				}

		}
	}
}
