# Eric Jennings
# IndE 421
# 24 Oct 2003

# Xbar and R chart template program
# R does not come with any SPC software, so I program it myself

# setting up the graphics
par(ask=TRUE)

# the data table
thesedata<- read.table("Hw3prob5_12b.dat", header=TRUE)
attach(thesedata)

# the sample size
n<- 5

# defining constants to be used with the charts
# SEE TEXTBOOK for values and definitions
A2<- .577
D3<- 0
D4<- 2.115
L<- 3

# counting the number of samples --the length of the data vector.
no.samps<- nrow(thesedata)
samps<- paste("The number of samples is:",no.samps)
print(samps)

# getting x-double-bar --the grand average of the measurement values.
xdblbar<- mean(Xb)
cl.loc<- paste("The centerline for the Xbar chart is at:",xdblbar)
print(cl.loc)

# getting R-bar --the average range of the set of samples.
rbar<- mean(Rge)
r.loc<- paste("The centerline for the Range chart is at:",rbar)
print(r.loc)

# upper control limits for the x-bar chart
uclx<- xdblbar+A2*rbar
upperx<- paste("The upper control limit for the X-bar chart is at:",uclx)
print(upperx)

# lower control limits for the x-bar chart
lclx<- xdblbar-A2*rbar
lowerx<- paste("The lower control limit for the X-bar chart is at:",lclx)
print(lowerx)

# upper control limit for the range chart
uclr<- rbar*D4
upperr<- paste("The upper control limit for the R-chart is at:", uclr)
print(upperr)

# lower control limit for the range chart
lclr<- rbar*D3
lowerr<- paste("The lower control limit for the R-chart is at:", lclr)
print(lowerr)

# plotting the charts

# first plot is the x-bar chart
plot(Xb,ylim=c(lclx-1,uclx+1),type="o",xlab="Sample Number",main="X-bar chart for problem 5-12a,")
abline(h=uclx);text(3.5,uclx,"Upper Control Limit")
abline(h=xdblbar);text(2,xdblbar,"Centerline")
abline(h=lclx);text(3.5,lclx,"Lower Control Limit")

# second plot is the range chart
plot(Rge,ylim=c(lclr-1,uclr+1), type="o",xlab="Sample Number", main="Range chart for problem 5-12a")
abline(h=uclr);text(3.5,uclr,"Upper Control Limit")
abline(h=rbar);text(1,rbar,"R-bar")
abline(h=lclr);text(3.5,lclr,"Lower Control Limit")

detach(thesedata)

# done


