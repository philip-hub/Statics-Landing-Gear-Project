# E for ASTM D638

y_D638=c(11287.87879, 10505.05051, 8943.089431, 9853.658537, 9891.598916, 8536.585366, 9447.154472,9552.845528, 8130.081301, 8227.642276, 8804.347826, 8646.245059, 9126.984127)

#11287.878787878786, 11287.878787878786 these values have been excluded because they kinda look like outliers

findE() <- function() {

  qqnorm(log(y))#test if log norm works y is cumlative distrbution function 
  
  qqline(log(y)) # line must go near points to prove model will represent data well
  
  mny = mean(log(y))
  
  #log normakl works well with failure strength data
  
  sty = sd(log(y))
  
  range(log(y))
  
  seq.y = seq(from=9,to=10, length=1000)
  
  pr.break = pnorm(seq.y,mny,sty)
  plot(exp(seq.y),pr.break,xlab='evalue',ylab='prob break')
  
}