# PLANTILLA PARA EL PREPROCESADO DE DATOS FALTANTES
#Importar el conjunto de datos

dataset = read.csv('Data.csv')
# dataset = dataset[:, 2:3]

Tratamiento de los valores NaN
#Con el simbolo $ se accede a las variables del DF
dataset$Age = ifelse(is.na(dataset$Age),  
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm=TRUE)), dataset$Salary)

