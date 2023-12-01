# Step 1 - Installing and running tidyverse
## install.packages(tidyverse)
library(tidyverse)

## We will be using the Iris data to go through our basic data visualisations today.


# base R data visualisations
## These are some quick and easy base-r data visualisations. I often use these to quickly check the distribution of my variables to ensure that statistical assumptions for my required analayses are met.
summary(iris)


### Boxplots
boxplot(iris$Sepal.Length) # using $ sign to select a specific variable.
boxplot(iris) #not using $ sign to have boxplots for all variables. Be careful as this might not always work - especially when working with large datasets.

### Histograms 
hist(iris$Sepal.Width)
hist(iris) # notice how the command doesnt work here - histograms only work with numeric data.

### Model assumptions
#### We can also use base R to visually check the assumptions of our regression analyses.
m <- lm(Petal.Length ~ Sepal.Width * Species, iris) # specifying a model
summary(m)
plot(m)


# Getting more control - enter ggplot
## ggplot uses the "grammar of graphics" to allow for greater control, customisability and structure for creating data vis. Now this can appear to be somewhat intimidating, but in practice it means that it operates in layers. Time for a demo so you can "visualise" what I mean.
## In this example, we will work towards visualising the regression model from earlier. 
## Visualising continuous vs continuous data

### Step 1 - setting the data
ggplot(iris, )

### Step 2 - setting the aesthetic (i.e., which variables we will use)
ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length ))
### What do you notice here?

## Step 3 - Setting the geometries (shapes to understand the data)
ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length )) + 
  geom_point()

## Step 4 - faceting the data (That is - to group data by a 3rd variable - often categorical). There are many ways of doing this, and it provides you with the freedom to find what you think is best for communicating your research.

### Option a) facet wrap
ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length )) + 
  geom_point() +
  facet_wrap(~Species)

### Option b) - using color (The 2 options below acheive the same at this stage, but will have subtle differences when it comes to adding the statistic later). We can also define as `shape` or `size` instead of color if we want to. 

ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length, color = Species )) + 
  geom_point()

ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length)) + 
  geom_point(aes(color = Species))

### Option c) - combining facet and color 
ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length, color = Species )) + 
  geom_point() +
  facet_wrap(~Species)


## Step 5 - adding a statistic. Here we will explore how we can add a statistic to model the data

### Default model
ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length, color = Species )) + 
  geom_point() +
  geom_smooth() # default is loess - local regression (flexible)

### Linear model - and spotting the simpson paradox 
plot <- ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length, color = Species )) + 
  geom_point() +
  geom_smooth(method = "lm") # Model set to "lm" (linear model). Notice here the statistic is set to each cluster . We have also assigned the plot to "plot" (this will save time later) - play with facetwrap?
plot  #+ facet_wrap(~Species)

 ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length)) + 
  geom_point(aes(color = Species)) +
  geom_smooth(method = "lm")  # Here the visualisation is generalised to the entire sample - notice how the trend has reversed! 

 

#### Which of the two plots above do you think best represents the data? Which of the two plots do you think best represents the research? ;) Which 2 of the 3 models below represent the plots above?
#### Below are the statistical models representing the plots  

model_1 <- lm(Petal.Length ~ Sepal.Width, iris)
model_2 <- lm(Petal.Length ~ Sepal.Width + Species, iris)
model_3 <- lm(Petal.Length ~ Sepal.Width * Species, iris)
summary(model_1)
summary(model_2)
summary(model_3)


### Step 5 + Plotting predicted values with more complicated models.

#### Adding predicted values to the dataset

model_complex <- lm(Petal.Length ~ Sepal.Width + Species, iris)
iris_new <- iris %>% mutate(predlm = predict(model_complex))

#### Visualising (note that this can get complicated, and you need to be careful)
ggplot(iris_new,
       aes(x = Sepal.Width, y = Petal.Length, color = Species)) + 
  geom_point() +
  geom_line(aes(y = predlm), linewidth = 1)


## Step 6 - the co-ordinates 
### Here we need to be careful, as sometimes we might inadvertently exxagerate differences by changing the co-ordinates. But at other times it may be necessary.


### coord_cartesian() allows us to zoom in on our data vis - play around
ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length, color = Species )) + 
  geom_point() +
  geom_smooth(method = "lm") +
  coord_cartesian(xlim = c(2, # minimum x
                           4.5), # maximum x
                  ylim = c(0.8, #minimum y
                           2)) #maximum y

### coord_flip() allows us to flip our x and y coordinates

ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length, color = Species )) + 
  geom_point() +
  geom_smooth(method = "lm") +
  coord_flip()


### coord_fixed() creates a coordinate system with a specified aspect ratio. This is very useful if both axes use the same units.

ggplot(iris,
       aes(x = Sepal.Width, y = Petal.Length, color = Species )) + 
  geom_point() +
  geom_smooth(method = "lm") +
  coord_fixed(ratio = 1)

plot

#### We can also use our previously assigned "plot" to have it's coordinates chagned (or any additional layered changes we like!).

plot + 
  coord_fixed(ratio = 1)

## Step 7 - Theme - setting the "decorations", and making our labels

plot +
  theme_classic()

plot +
  theme_dark()

### We can also customise our themes

plot +
  theme(legend.position = "bottom")

### Or we can use and customise ready made themes for specific purposes

library(jtools) # I use this to create APA ready plots
plot +
  theme_apa()

#### Adding labels

plot +
  theme_bw()+
  theme(legend.position = "bottom", legend.direction = "horizontal")+
  labs(title = "Our pretty plot",
       subtitle = "It's really pretty!",
       x = "Sepal Width",
       y = "Petal Length",
       color = "",
       caption = "Made you read me...",
       ) #+
  labs(caption = NULL) # We can use NULL to remove a label

  # To finish off - lets export our plot. This is just a case of click and go 
  
  
 # For the rest of the session, lets do some data-vis playing! For this we will use the PalmerPenguins data set. Below I have provided some skeleton code that you can use for customising. But be brave and try to play around without the stablisiers as well. 
  
  library(palmerpenguins)  
  summary(penguins)
  
  # standard scatter plot
  ggplot(penguins,
         aes(x = ... , y = ... , color... )) +
    geom_point() 
  
  # Regression line
  ggplot(penguins,
         aes(x = ... , y = ... , color = )) +
    geom_point(alpha = ...) +
    geom_smooth(method = "lm")
    facet_wrap(~...)
  
    
    # Splitting by category
  ggplot(penguins,
         aes(x = ... , y = ... , color = )) +
    geom_point() +
    facet_wrap(~...)
  
  
  # Splitting by 2 categories
  ggplot(penguins,
         aes(x = ... , y = ... , color = )) +
    geom_point() +
    facet_grid(~... , ~...)