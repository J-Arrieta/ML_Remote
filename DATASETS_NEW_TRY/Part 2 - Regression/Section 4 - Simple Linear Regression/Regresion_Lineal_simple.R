# REGRESIÓN LINEAR SIMPLE

ds = read.csv('Salary_Data.csv')

#División de los datos
#SplitRatio indica qué tamaño de la muestra se quedará en el conjunto de entrenamiento
set.seed(123)
split = sample.split(ds$Salary, SplitRatio = 2/3)
training_set = subset(ds, split == TRUE)
testing_set  = subset(ds, split == FALSE)

#Ajustar el modelo de regresión lineal simple con el conjunto de entrenamiento
# lm -> función para regresión lineal
# ~ -> en relación a
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

# Predicción de los resultados 
y_pred = predict(regressor, newdata = testing_set)

# Visualización de los resultados en el conjunto de entrenamiento
#install.packages("ggplot2")

ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = "red") + 
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
geom_smooth(method ='lm')  +
ggtitle("Sueldo vs Años de experiencia (conjunto de entrenamiento)") +
xlab("Años de experiencia") + 
ylab("Sueldo en dolares")

# Visualización de los resultados en el conjunto de pruebas
#install.packages("ggplot2")

ggplot() +
  geom_point(aes(x = testing_set$YearsExperience, y = testing_set$Salary),
             colour = "red") + 
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  geom_smooth(method ='lm')  +
  ggtitle("Sueldo vs Años de experiencia (conjunto de pruebas)") +
  xlab("Años de experiencia") + 
  ylab("Sueldo en dolares")
