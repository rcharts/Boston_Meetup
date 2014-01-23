hair_eye_male = subset(as.data.frame(HairEyeColor), Sex == "Male")
n1 <- nPlot(Freq ~ Hair, 
  group = 'Eye', 
  data = hair_eye_male, 
  type = 'multiBarChart'
)
n1