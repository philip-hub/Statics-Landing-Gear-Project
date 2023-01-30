# E for ASTM D638

# data for D638 2008
thickness_D638_2008 =c(0.198, 0.198, 0.123, 0.123, 0.123, 0.123, 0.123, 0.123, 0.123, 0.123, 0.092, 0.092, 0.063, 0.063)
width_D638_2008=c(0.2, 0.1, 0.2, 0.15, 0.15, 0.1, 0.1, 0.1, 0.05, 0.05, 0.2, 0.088, 0.2, 0.07)
force_D638_2008=c(447, 208, 220, 181.8, 182.5, 105, 116.2, 117.5, 50, 50.6, 162, 70, 115, 37.5)
e_D638_2008 = c(force_D638_2008/(width_D638_2008*thickness_D638_2008))

# data for D638 2007
thickness_D638_2007 =c(0.192, 0.192, 0.124, 0.124,0.094,0.094, 0.065, 0.065)
width_D638_2007=c(0.2, 0.1, 0.2, 0.1, 0.2, 0.1, 0.2, 0.1)
force_D638_2007_p1=c(373, 175, 260, 120, 175, 83, 105,48.7)
force_D638_2007_p2=c(379, 171, 270, 126, 176, 90, 108, 50)
e_D638_2007_p1 = c(force_D638_2007_p1/(width_D638_2007*thickness_D638_2007))
e_D638_2007_p2 = c(force_D638_2007_p2/(width_D638_2007*thickness_D638_2007))
e_D638_2007 = append(e_D638_2007_p1,e_D638_2007_p2)


thickness_D638 = append(thickness_D638_2007,thickness_D638_2008)
e_D638 = append(e_D638_2008,e_D638_2007)




fos <-function(fos,e){
  e=c(e/fos)
  return(e)
}



outlierTest <- function(e,upper,lower){
  
  boxplot(e)
  q=quantile(e, prob=c(.25, .5, .75), type=1)
  e2=e
  for (i in e){
   
  if(i>q[3] & upper==TRUE){
          e2 = e2[!e2 %in% i]
  }
    
  if(i>q[1] & lower==TRUE){
        e2 = e2[!e2 %in% i]
  }
  }
  return(e2)
    
}

nylonSorter <- function(e,vThickness,fThickness,t,range){
  e2=c()
  p=1
  for(i in vThickness){
    if(range==FALSE & i == fThickness){
      index = which(vThickness==i)[p]
      e3=e[index]
      e2=append(e2,e3)
      p=p+1}
     
     if(range==TRUE){ 
       if(i<(fThickness+t*fThickness)&i>(fThickness-t*fThickness)){
      index = which(vThickness==i)[p]
      e3=e[index]
      e2=append(e2,e3)
      p=p+1
      }}}
  return(e2)
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

#62 , #94, #124

e62=nylonSorter(e_D638,thickness_D638,.062,.1,TRUE)
e94=nylonSorter(e_D638,thickness_D638,.094,.1,TRUE)
e124=nylonSorter(e_D638,thickness_D638,.124,.1,TRUE)

print(e124)





q=outlierTest(e_D638,TRUE,TRUE)
print(q)


fs = 1.15

findE(e_D638) #find E
findE(fos(fs,e_D638))#find E with FOS incoperated into the stats model
findE(outlierTest(e_D638,TRUE,TRUE))#find E without outliers
findE(fos(fs,outlierTest(e_D638,TRUE,TRUE))) #find E incoperating FOS into the stats model and without outliers

findE(e62) #find E
findE(fos(fs,e62))#find E with FOS incoperated into the stats model
findE(outlierTest(e62,TRUE,TRUE))#find E without outliers
findE(fos(fs,outlierTest(e62,TRUE,TRUE))) #find E incoperating FOS into the stats model and without outliers

findE(e94) #find E
findE(fos(fs,e94))#find E with FOS incoperated into the stats model
findE(outlierTest(e94,TRUE,TRUE))#find E without outliers
findE(fos(fs,outlierTest(e94,TRUE,TRUE))) #find E incoperating FOS into the stats model and without outliers


findE(e124) #find E
findE(fos(fs,e124))#find E with FOS incoperated into the stats model
findE(outlierTest(e124,TRUE,TRUE))#find E without outliers
findE(fos(fs,outlierTest(e124,TRUE,TRUE))) #find E incoperating FOS into the stats model and without outliers




