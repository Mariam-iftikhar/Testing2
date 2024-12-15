week <- c('Sunday',
          'Monday',
          'Tuesday',
          'Wednesday',
          'Thursday',
          'Friday',
          'Saturday')

# using for loop to iterate
# over each string in the vector
for (i in  seq_along(week)){
    print(paste("Index:", i, "Day:", week[i]))
  }

