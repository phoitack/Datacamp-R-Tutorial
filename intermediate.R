# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")


# Convert to lowercase strings: split_low
split_low <- lapply(split_math,tolower)


# Take a look at the structure of split_low
str(split_low)

# -----------------------------------------------------------------------
# split_low has been created for you
split_low

# Transform: use anonymous function inside lapply
# select_first <- function(x) {
#  x[1]
# }
#names <- lapply(split_low, select_first)
names <- lapply(split_low, function(x) {x[1]})

# Transform: use anonymous function inside lapply
# select_second <- function(x) {
#  x[2]
# }
# years <- lapply(split_low, select_second)
years <- lapply(split_low, function(x) {x[2]})


# -----------------------------------------------------------------------
# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low,select_el,index = 1)
years <- lapply(split_low,select_el,index = 2)


# -----------------------------------------------------------------------
# temp is already available in the workspace

# Create a function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x))
}

# Apply extremes() over temp with sapply()
sapply(temp,extremes)

# Apply extremes() over temp with lapply()
lapply(temp,extremes)



# -----------------------------------------------------------------------
# temp is already prepared for you in the workspace

# Definition of below_zero()
below_zero <- function(x) {
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp,below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- lapply(temp,below_zero)

# Are freezing_s and freezing_l identical?
identical(freezing_s,freezing_l)




# -----------------------------------------------------------------------
# temp is already available in the workspace
str(temp)

# Definition of print_info()
print_info <- function(x) {
  cat("The average temperature is", mean(x), "\n")
}

# Apply print_info() over temp using sapply()
sapply(temp,print_info)

# Apply print_info() over temp using lapply()
lapply(temp,print_info)



# -----------------------------------------------------------------------
sapply(list(runif (10), runif (10)), 
       function(x) c(min = min(x), mean = mean(x), max = max(x)))

          [,1]      [,2]
min  0.1127744 0.1068350
mean 0.4808624 0.4993318
max  0.8338408 0.8589013


# -----------------------------------------------------------------------
first_and_last <- function(name) {
	name <- gsub(" ","", name)
	letters <- strsplit(name, split = "")[[1]]

	return (c(first=min(letters),last = max(letters)))
}

sapply(cities, first_and_last)


# -----------------------------------------------------------------------
# temp is already available in the workspace

# Definition of basics()
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply()
vapply(temp,basics,numeric(3))



# -----------------------------------------------------------------------
# temp is already available in the workspace

# Definition of the basics() function
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# Fix the error:
vapply(temp, basics, numeric(4))

# -----------------------------------------------------------------------

# temp is already defined in the workspace

# Convert to vapply() expression
vapply(temp, max, numeric(1))

# Convert to vapply() expression
vapply(temp, function(x, y) { mean(x) > y }, y = 5, logical(1))

# -----------------------------------------------------------------------

# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- unlist(linkedin)
fb_vec <- unlist(facebook)

# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec,fb_vec)


# Sort social_vec
sort(social_vec,decreasing=TRUE)


# -----------------------------------------------------------------------
# Fix me
rep(seq(1, 7, by = 2), times = 7)



# -----------------------------------------------------------------------
# Create first sequence: seq1
seq1 <- seq(1,500,by = 3)

# Create second sequence: seq2
seq2 <- seq(1200,900,by = -7)

# Calculate total sum of the sequences
sum(append(seq1,seq2))



# -----------------------------------------------------------------------

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl(pattern = "edu",x = emails)

# Use grep() to match for "edu", save result to hits
hits <- grep("edu",emails)

# Subset emails using hits
emails[hits]


# -----------------------------------------------------------------------

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly
grepl("@.*\\.edu$",emails)


# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep("@.*\\.edu$",emails)

# Subset emails using hits
emails[hits]


# -----------------------------------------------------------------------


# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "global@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use sub() to convert the email domains to datacamp.edu
sub("@.*\\.edu$","@datacamp.edu",emails)


[1] "john.doe@datacamp.edu"    "education@world.gov"     
[3] "global@peace.org"         "invalid.edu"             
[5] "quant@datacamp.edu"       "cookie.monster@sesame.tv"


# -----------------------------------------------------------------------

awards <- c("Won 1 Oscar.",
  "Won 1 Oscar. Another 9 wins & 24 nominations.",
  "1 win and 2 nominations.",
  "2 wins & 3 nominations.",
  "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
  "4 wins & 1 nomination.")

sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)

[1] "Won 1 Oscar." "24"           "2"            "3"            "2"           
[6] "1"

# -----------------------------------------------------------------------
# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2)
date3 <- as.Date(str3, format = "%d/%B/%Y")


# Convert dates to formatted strings
format(date1, "%A")
format(date2,"%d")
format(date3,"%b %Y")




# -----------------------------------------------------------------------

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2)


# Convert times to formatted strings
format(time1, format="%M")
format(time2, format="%I:%M %p")



# -----------------------------------------------------------------------
# day1, day2, day3, day4 and day5 are already available in the workspace

# Difference between last and first pizza day
day5 - day1

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)

# Create differences between consecutive pizza days: day_diff
day_diff <- diff(pizza)

# Average period between two consecutive pizza days
mean(day_diff)




# -----------------------------------------------------------------------

# login and logout are already defined in the workspace
# Calculate the difference between login and logout: time_online
time_online <- logout - login

# Inspect the variable time_online
print(time_online)

# Calculate the total time online
sum(time_online)

# Calculate the average time online
mean(time_online)



# -----------------------------------------------------------------------

# Convert astro to vector of Date objects: astro_dates
astro_dates <- as.Date(astro, format = "%d-%b-%Y")

# Convert meteo to vector of Date objects: meteo_dates
meteo_dates <- as.Date(meteo, format = "%B %d, %y")

# Calculate the maximum absolute difference between astro_dates and meteo_dates
max(abs(astro_dates - meteo_dates))



# -----------------------------------------------------------------------
