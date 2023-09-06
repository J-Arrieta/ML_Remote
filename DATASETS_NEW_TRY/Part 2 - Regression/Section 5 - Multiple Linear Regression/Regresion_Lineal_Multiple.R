#Regresión lineal múltiple

ds = read.csv("50_Startups.csv")

#Codificación de las variables categóricas
#c() sirve para crear un vector
#Factor da la idea de las variables dummy
ds$State = factor(ds$State,
                         levels = c("New York", "California", "Florida"),
                         labels = c(1,2,3))

#División de los datos
#SplitRatio indica qué tamaño de la muestra se quedará en el conjunto de entrenamiento
set.seed(123)
split = sample.split(ds$Profit, SplitRatio = 0.8)
training_set = subset(ds, split == TRUE)
testing_set  = subset(ds, split == FALSE)

#Ajustar el modelo de regresión lineal simple con el conjunto de entrenamiento
# lm -> función para regresión lineal
# ~ -> en relación a
# ~ . -> variable dependiente en función de las restantes
regression = lm(formula = Profit ~ .,
                 data = training_set)
 
 # Predicción de los resultados 
y_pred = predict(regression, newdata = testing_set)

# Construcción de un modelo óptimo eliminando hacia atrás
SL = 0.05
regression = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
                 data = ds)

# Eliminando estados

regression = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
                data = ds)
summary(regression)

# Eliminando Administration

regression = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
                data = ds)
summary(regression)


# Eliminando Marketing.Spend

regression = lm(formula = Profit ~ R.D.Spend,
                data = ds)
summary(regression)
