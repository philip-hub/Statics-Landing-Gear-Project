# E for ASTM D638

# data for D638
thickness_D638 =c(0.198, 0.198, 0.123, 0.123, 0.123, 0.123, 0.123, 0.123, 0.123, 0.123, 0.092, 0.092, 0.063, 0.063)
width_D638=c(0.2, 0.1, 0.2, 0.15, 0.15, 0.1, 0.1, 0.1, 0.05, 0.05, 0.2, 0.088, 0.2, 0.07)
force_D638=c(447, 208, 220, 181.8, 182.5, 105, 116.2, 117.5, 50, 50.6, 162, 70, 115, 37.5)

e_D638 = c(force_D638/(width_D638*thickness_D638))




outlierTest <- function(e){
  
  boxplot(e)
  q=quantile(e, prob=c(.25, .5, .75), type=1)
  return(q)
  if(){
    
  }
  
}



findE <- function(y) {

  qqnorm(log(y))#test if log norm works y is cumlitive distribution function 
  
  qqline(log(y)) #line must go near points to prove model will represent data well
  
  mny = mean(log(y))
  
  #log normal works well with failure strength data
  
  sty = sd(log(y))
  
  range(log(y))
  
  seq.y = seq(from=9,to=10, length=1000)
  
  pr.break = pnorm(seq.y,mny,sty)
  plot(exp(seq.y),pr.break,xlab='evalue',ylab='prob break')
  
}

q=outlierTest(e_D638)
findE(e_D638)