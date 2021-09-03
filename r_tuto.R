##Please follow the tutorial below to get an idea of how to work in R. The HTML
##version of this tutorial was created using knitr::spin().

## Basics

# arithmetic, interacting with the interpreter

# basic arithmetic operations

2 + 3 # addition
2 - 3 # subtraction
2*3   # multiplication
2/3   # division
2^3   # exponentiation

# precedence of operators

4^2 - 3*2
1 - 6 + 4
2^-3

(4^2) - (3*2) # use parentheses to group, clarify
4 + 3^2
(4 + 3)^2

-2--3
-2 - -3 # use spaces to clarify


# functions, arguments to functions, obtaining help and information

log(100) # natural log
log(100, base=10) # log base-10
log10(100) # equivalent
log(100, b=10)  # argument abbreviation

args(log) # arguments of the log() function

help("log")    # documentation
?log           # equivalent 
example("log") # execute examples in help page

log(100, 10)  #  specifyingarguments by position

apropos("log")
help.search("log")

RSiteSearch("loglinear", "functions")

# creating vectors

c(1, 2, 3, 4)  # combine

1:4     # integer-sequence operator
4:1
-1:2    # note precedence
-(1:2)
seq(1, 4)
seq(2, 8, by=2) # specify interval
seq(0, 1, by=0.1) # non-integer sequence
seq(0, 1, length=11) # specify number of elements

# vectorized arithmetic

c(1, 2, 3, 4)/2
c(1, 2, 3, 4)/c(4, 3, 2, 1)
log(c(0.1, 1, 10, 100), 10)

c(1, 2, 3, 4) + c(4, 3) # recyling: no warning
c(1, 2, 3, 4) + c(4, 3, 2) # produces warning

# creating variables (named objects) by assignment

x <- c(1, 2, 3, 4) # assignment
x # print

x = c(1, 2, 3, 4) # can use = for assignment (best avoided)
x

x/2            # equivalent to c(1, 2, 3, 4)/2
(y <- sqrt(x)) # parentheses to assign and print trick

(x <- rnorm(100))
head(x) # first few
summary(x)  # a "generic" function

# character and logical data

(words <- c("To", "be", "or", "not", "to", "be"))
paste(words, collapse=" ")

(logical.values <- c(TRUE, TRUE, FALSE, TRUE))
!logical.values # negation (not operator)

# coercion

sum(logical.values)      # number of TRUEs (coercion to numeric)
sum(!logical.values)     # number of FALSEs (TRUE-> 1, FALSE -> 0)
c("A", FALSE, 3.0)       # coerced to character
c(10, FALSE, -6.5, TRUE) # coerced to numeric

# basic indexing

x[12]             # 12th element
words[2]          # second element
logical.values[3] # third element
x[6:15]           # elements 6 through 15
x[c(1, 3, 5)]     # 1st, 3rd, 5th elements 

x[-(11:100)] # omit elements 11 through 100
x[1:10]      # same!

v <- 1:4
v[c(TRUE, FALSE, FALSE, TRUE)] # logical indexing

#comparison and logical operators

1 == 2       # equal to
1 != 2       # not equal to
1 <= 2       # less than or equal to
1 < 1:3      # less than (vectorized) 
3:1 > 1:3    # greater than
3:1 >= 1:3   # greater than or equal to

TRUE & c(TRUE, FALSE)                        # logical and
c(TRUE, FALSE, FALSE) | c(TRUE, TRUE, FALSE) # logical or

(z <- x[1:10])      # first 10 elements of x
z < -0.5            # is each element less than -0.5?
z > 0.5             # is each element greater than 0.5
z < -0.5 | z > 0.5  #  < and > are of higher precedence than |
abs(z) > 0.5        # absolute value, equivalent to last expression
z[abs(z) > 0.5]     # values of z for which |z| > 0.5


# user-defined functions

mean(x)  # of 100 random-normal numbers

sum(x)/length(x)  # equivalent


myMean <- function(x) {
  sum(x)/length(x)
}
myMean # can be printed like any object

myMean(x)
y # from sqrt(c(1, 2, 3, 4))
myMean(y)
myMean(1:100)
head(x) # global x undisturbed

mySD <- function(x) {
  sqrt(sum((x - myMean(x))^2)/(length(x) - 1))
}
mySD(1:100)
sd(1:100) # check

# cleaning up

objects()
remove(v, x, y, z, logical.values, words)
objects()

# using traceback()

letters
mySD(letters)

traceback()

## Workflow

# Using scripts

# An illustrative data analysis: Duncan's occupational prestige regression

library("car")      # load car package (for functions and data)

Duncan <- read.table("Duncan.txt", header=TRUE)
head(Duncan, n=10)  # first 10 cases
brief(Duncan)       # abbreviated output
dim(Duncan)         # rows and columns
View(Duncan)        # in the RStudio data viewer
summary(Duncan)     # invoking the summary() generic function
help("Duncan")      # codebook for the data set (copy in carData package)

# Examining the Data

with(Duncan, hist(prestige))

scatterplotMatrix( ~ prestige + education + income, 
                   id=list(n=3), data=Duncan)

# Duncan's regression

(duncan.model <- lm(prestige ~ education + income, data=Duncan))

summary(duncan.model)  # more detailed report

# some regression diagnostics

# distribution of the (studentized) residuals

densityPlot(rstudent(duncan.model))
qqPlot(duncan.model, id=list(n=3))
outlierTest(duncan.model)

# influence diagnostics

influencePlot(duncan.model, id=list(n=3))

avPlots(duncan.model, id=list(n=3, method="mahal"))

# nonlinearity diagnostic

crPlots(duncan.model)

# nonconstant-spread diagnostics

spreadLevelPlot(duncan.model)
ncvTest(duncan.model)
ncvTest(duncan.model, var.formula= ~ income + education)

# refit without ministers and conductors

duncan.model.2 <- update(duncan.model, 
                         subset = !(rownames(Duncan) %in% c("minister", "conductor")))
summary(duncan.model.2)
compareCoefs(duncan.model, duncan.model.2)

# using R Markdown: in file RMarkdown-examples.Rmd

## Linear models in R

# multiple regression (Prestige data)

names(Prestige) # from carData package
some(Prestige)  # 10 randomly sampling observations
brief(Prestige)
View(Prestige)
?Prestige       #help on data set

prestige.mod.1 <- lm(prestige ~ education + log2(income) + women,
                     data=Prestige)  
summary(prestige.mod.1)
S(prestige.mod.1)
brief(prestige.mod.1)

# dummy regression

Prestige$type # a factor
class(Prestige$type) 
str(Prestige$type) # structure: also see RStudio Environment tab

Prestige.2 <- na.omit(Prestige) # filter out missing data
nrow(Prestige)
nrow(Prestige.2)
levels(Prestige.2$type)
Prestige.2$type <- with(Prestige.2, 
                        factor(type, levels=c("bc", "wc", "prof"))) # reorder levels
Prestige.2$type

# generating contrasts from factors

getOption("contrasts")
contrasts(Prestige.2$type)
model.matrix(~ type, data=Prestige.2)

contrasts(Prestige.2$type) <- contr.treatment(levels(Prestige.2$type), base=2)
# changing baseline level
contrasts(Prestige.2$type)

contrasts(Prestige.2$type) <- "contr.sum"  # "deviation" contrasts
contrasts(Prestige.2$type)

contrasts(Prestige.2$type) <- NULL  # back to default

prestige.mod.2 <- lm(prestige ~ log2(income) + education + type, 
                     data=Prestige.2)
S(prestige.mod.2)

scatter3d(prestige ~ log2(income) + education | type, 
          parallel=TRUE, data=Prestige) # uses rgl package, need XQuartz in macOS

prestige.mod.3 <- update(prestige.mod.2, 
                         . ~ . + log2(income):type + education:type)  # adding interactions
S(prestige.mod.3)
scatter3d(prestige ~ log2(income) + education | type, 
          parallel=FALSE, data=Prestige)

# equivalent specifications:

brief(lm(prestige ~ log2(income)*type + education*type, 
         data=Prestige.2))
brief(lm(prestige ~ (log2(income) + education)*type, 
         data=Prestige.2))

## Generalized linear models

# binary logit model

?Cowles

mod.cowles <- glm(volunteer ~ sex + extraversion*neuroticism, 
                  family=binomial, data=Cowles)
S(mod.cowles)

# Poisson and quasi-Poisson regression

some(Ornstein)
nrow(Ornstein)
?Ornstein
(tab <- xtabs(~interlocks, data=Ornstein))

x <- as.numeric(names(tab)) # the names are the distinct values of interlocks
plot(x, as.vector(tab), type="h", 
     xlab="Number of Interlocks", ylab="Frequency")
points(x, tab, pch=16)

mod.ornstein <- glm(interlocks ~ log2(assets) + nation + sector,
                    family=poisson, data=Ornstein)
S(mod.ornstein)

# quasi-Poisson model, allowing for overdispersion

mod.ornstein.q <- update(mod.ornstein, family=quasipoisson)
S(mod.ornstein.q)


## A mixed-effects models for longitudinal data (time permitting)

# Blackmore data

library("nlme")

brief(Blackmore, c(10, 10))  # first and last 10 obs.
dim(Blackmore)
sum(Blackmore$exercise == 0)

Blackmore$log.exercise <- log(Blackmore$exercise + 5/60, 2)
#logs, base 2 (add 5 minutes to avoid 0s)

par(mfrow=c(1, 2), mar=c(5, 4, 1, 4))
boxplot(exercise ~ group, ylab="Exercise (hours/week)", data=Blackmore)
boxplot(log.exercise ~ group, ylab=expression(log[2]*(Exercise + 5/60)),
        data=Blackmore)
axis(4, at=seq(-2, 4, by=2), labels=round(2^seq(-2, 4, by=2) - 5/60, 1))
mtext("Exercise (hours/week)", 4, line=3)

set.seed(12345) # for reproducibility

pat <- with(Blackmore,
            sample(unique(subject[group=='patient']), 20) # 20 patients
)
Pat.20 <- with(Blackmore, 
               groupedData(log.exercise ~ age | subject,
                           data=Blackmore[is.element(subject, pat),])
)

con <- with(Blackmore,
            sample(unique(subject[group=='control']), 20) # 20 controls
)
Con.20 <- with(Blackmore, 
               groupedData(log.exercise ~ age | subject,
                           data=Blackmore[is.element(subject, con),])
)

print(plot(Con.20, main='Control Subjects', cex.main=1,
           xlab='Age', ylab=expression(log[2]*Exercise),
           ylim=1.2*range(Con.20$log.exercise, Pat.20$log.exercise),
           layout=c(10, 2), aspect=1.0),
      position=c(0, 0, 1, .5), more=TRUE)
print(plot(Pat.20, main='Patients', cex.main=1,
           xlab='Age', ylab=expression(log[2]*Exercise),
           ylim=1.2*range(Con.20$log.exercise, Pat.20$log.exercise),
           layout=c(10, 2), aspect=1.0),
      position=c(0, .5, 1, 1))

pat.list <- lmList(log.exercise ~ age | subject, subset= group == "patient",
                   data=Blackmore)

con.list <- lmList(log.exercise ~ age | subject, subset= group == "control",
                   data=Blackmore)

pat.coef <- coef(pat.list)
con.coef <- coef(con.list)

par(mfrow=c(1, 2))
boxplot(pat.coef[,1], con.coef[,1], main='Intercepts', cex.main=1,
        names=c('Patients', 'Controls'))
boxplot(pat.coef[,2], con.coef[,2], main='Slopes', cex.main=1,
        names=c('Patients', 'Controls'))

bm.mod.1 <- lme(log.exercise ~ I(age - 8)*group,
                random = ~ I(age - 8) | subject,
                data=Blackmore)
S(bm.mod.1)

bm.mod.2 <- update(bm.mod.1, random = ~ 1 | subject) 
# no random slopes
anova(bm.mod.1, bm.mod.2)

bm.mod.3 <- update(bm.mod.1, random = ~ I(age - 8) - 1 | subject)
# no random intercepts
anova(bm.mod.1, bm.mod.3)

bm.mod.4 <- update(bm.mod.1, correlation = corCAR1(form = ~ age |subject))
# CAR1 errors; this model doesn't converge

bm.mod.5 <- update(bm.mod.1, random = ~ 1 | subject,
                   correlation = corCAR1(form = ~ age |subject))
# CAR1 errors, no random slopes

bm.mod.6 <- update(bm.mod.1, random = ~ I(age - 8) - 1 | subject,
                   correlation = corCAR1(form = ~ age |subject))
# CAR1 errors, no random intercepts

logLik(bm.mod.1)
logLik(bm.mod.5)
logLik(bm.mod.6)

BIC(bm.mod.1, bm.mod.5, bm.mod.6)

AIC(bm.mod.1, bm.mod.5, bm.mod.6)

compareCoefs(bm.mod.1, bm.mod.5, bm.mod.6)

S(bm.mod.5)

## Confidence intervals and hypothesis tests
# confidence intervals for coefficients

S(prestige.mod.1)
confint(prestige.mod.1)
Confint(prestige.mod.1)

S(mod.cowles)
Confint(mod.cowles)

# Hypothesis tests

# Linear models

# ANOVA tables

S(prestige.mod.2)
anova(prestige.mod.2) # sequential (Type-I) tests -- not generally useful
Anova(prestige.mod.2) # partial (Type-II) tests

S(prestige.mod.3)
Anova(prestige.mod.3)

# direct computation of LR F tests for nested models

anova(prestige.mod.2, prestige.mod.3) # both sets of interactions

brief(duncan.model)
brief(duncan.model.0 <- lm(prestige ~ I(income + education), data=Duncan)) # equal slopes
anova(duncan.model, duncan.model.0) # test of equal slopes

# Wald tests of linear hypotheses

matchCoefs(prestige.mod.3, ":")
linearHypothesis(prestige.mod.3, matchCoefs(prestige.mod.3, ":")) # no interactions

linearHypothesis(duncan.model, "income = education") # test of equal slopes

# Analysis of deviance for a GLM

Anova(mod.cowles)

# Wald tests for fixed-effect terms in a mixed-effects model

S(bm.mod.5)
Anova(bm.mod.5)

## Visualizing fitted models: Effect displays

library("effects")
plot(predictorEffects(prestige.mod.3, c("income", "education")))

plot(Effect(c("extraversion", "neuroticism"), mod.cowles))
plot(Effect(c("extraversion", "neuroticism"), mod.cowles), multiline=TRUE)
plot(Effect(c("extraversion", "neuroticism"), mod.cowles), 
     lines=list(multiline=TRUE), 
     confint=list(style="bands"))

plot(Effect(c("age", "group"), bm.mod.5))
plot(Effect(c("age", "group"), bm.mod.5, 
            transformation=list(link=function(x) log2(x + 5/60), 
                                inverse=function(x) 2^x - 5/60)), 
     type="response",
     lines=list(multiline=TRUE), 
     confint=list(style="bars"), 
     axes=list(x=list(age=list(lab="Age (years)"), rug=FALSE), 
               y=list(lab="Exercise (hours/week)")), 
     lattice=list(key.args=list(x = 0.20, y = 0.75, corner = c(0, 0), 
                                padding.text = 1.25)), 
     main="")

## Some regression (model) diagnostics

# added-variable ("partial regression") plots

avPlots(duncan.model, id=list(n=3, method="mahal"))

compareCoefs(duncan.model, duncan.model.2)

# component + residual ("partial residual") plots

brief(prestige.mod.4 <- lm(prestige ~ income + education, 
                           data=Prestige))
crPlots(prestige.mod.4)

brief(prestige.mod.5 <- lm(prestige ~ log2(income) + education, 
                           data=Prestige)) # original analysis
crPlots(prestige.mod.5)

# adding partial residuals to effect plots

brief(prestige.mod.2)
plot(Effect(c("income", "type"), prestige.mod.2, residuals=TRUE), 
     partial.residual=list(span=1))
plot(Effect(c("education", "type"), prestige.mod.2, residuals=TRUE), 
     partial.residual=list(span=1))

brief(prestige.mod.6 <- lm(prestige ~ type*(income + education), data=Prestige.2))
Anova(prestige.mod.6)
plot(allEffects(prestige.mod.6, partial.residuals=TRUE), span=1)

# these diagnostics also work with GLMs

plot(Effect(c("extraversion", "neuroticism"), mod.cowles, residuals=TRUE),
     partial.residuals=list(span=0.9))

brief(mod.ornstein.1 <- glm(interlocks ~ assets + nation + sector,
                            family=quasipoisson, data=Ornstein))
crPlot(mod.ornstein.1, "assets")
brief(mod.ornstein.2 <- glm(interlocks ~ log2(assets) + nation + sector,
                            family=quasipoisson, data=Ornstein))
crPlot(mod.ornstein.2, "log2(assets)")
avPlot(mod.ornstein.2, "log2(assets)", id=list(n=2, method="mahal"))

# and some with mixed models

plot(Effect(c("age", "group"), bm.mod.5, residuals=TRUE))
