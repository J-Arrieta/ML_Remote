# PLANTILLA PARA EL PREPROCESADO DE DATOS
#Importar el conjunto de datos

dataset = read.csv('Data.csv')
#Tratamiento de los valores NaN
#Con el simbolo $ se accede a las variables del DF
dataset$Age = ifelse(is.na(dataset$Age),  
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), dataset$Age)
                     
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm=TRUE)), dataset$Salary)

#Codificación de variables categóricas
dataset$Country = factor(dataset$Country,
                         levels = c("France", "Spain", "Germany"),
                         labels = c(1,2,3))

dataset$Purchased = factor(dataset$Purchased,
                           levels = c("No", "Yes"),
                           labels = c(0,1))

# Dividir los datos en conjunto de entrenamiento y prueba
#install.packages("caTools")
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
testing_set  = subset(dataset, split == FALSE)

# Escalado de las variables
training_set[, 2:3] = scale(training_set[, 2:3])
testing_set[, 2:3] = scale(testing_set[, 2:3])
