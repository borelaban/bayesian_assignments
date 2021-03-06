#Assignment 1.1

#Simulate the following data
set.seed(1000)
bmi = alpha + B1*Sexi + B2*Agei + ei #The linear model for body mass index

Agei~N(25, variance = 5)
Sexi~Bern(0.52)
ei~N(0,sd=1.7321)

#Parameters
    B1 = -0.6  
    B2 = 0.3
    alpha = -2
    i = 1:150
    
# Fit the linear model in R by 
    #1. Using "lm"
    #2. Using quasi Newton ("optim") 
    #3. Using Newton Raphson by first principle
    
    #|theta^t-theta^t-1| < 0.0001
    
#Solution
    Agei = rnorm(150, 25, sqrt(5))
    Sexi = rbinom(150, 1, 0.52)  #outcome of 150 observations with trial set to 1
    ei   = rnorm(150, 0, 1.7321)
    
linear_model <- lm(formula = bmi ~ Sexi+Agei) #using lm

#2. Using quasi Newton ("optim")



#When using quasi-Newton we do not need the Hessian matrix 

#write the code here 


#3. Using Newton Raphson Method
#Define the function

linear_model_using_newton_raphson = function(bmi, toler = .0001) {
    #bmi is the linear regression model with 3 parameters
    startvalue = median(bmi)
    #n = length(bmi);
    thetahatcurr = startvalue
 
    
    
    # Compute first deriviative of log likelihood
    #
    #firstderivll = 2 * sum((bmi - thetahatcurr) / (1 + (bmi - thetahatcurr) ^ 2))
    
    # Continue Newton’s method until the first derivative
    # of the likelihood is within toler of 0.0001
    
    while (abs(thetahatnew-thetahatcurr) < toler)
    {
        # Compute second derivative of log likelihood
        secondderivll = 2 * sum(((bmi - thetahatcurr) ^ 2 - 1) / (1 + (bmi - thetahatcurr) ^2) ^ 2)
        
        # Compute first derivative of log likelihood
        
        firstderivll = 2 * sum((bmi - thetahatcurr) / (1 + (bmi - thetahatcurr) ^ 2))
        
        # Newton Raphson method update of estimate of theta
        
        thetahatnew = thetahatcurr - firstderivll / secondderivll
        
        thetahatcurr = thetahatnew
        
        
     
    }
    list(thetahat = thetahatcurr)
    
    
}


(linear_model_using_newton_raphson(bmi))

hist(bmi)

summary(bmi)
    