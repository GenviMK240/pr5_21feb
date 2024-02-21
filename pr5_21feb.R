getwd()
nuevo_dir<-"C:/pr5_21feb"
setwd(nuevo_dir)

#1
library()
set.seed(123)
n_registros <-200
yacimiento<- sample(paste0("Site", 1:10), n_registros,replace=TRUE)
tipo_artefactos<- sample(c("Pottery","Tools","Jewerly","Weapons"), n_registros, replace=TRUE)
numero_artefactos <- sample(1:1000, n_registros, replace= TRUE)
contexto<- sample(c("Habitacional","Funerario","Otros"), n_registros, replace=TRUE)
latitud<- sample(0:90, n_registros, replace= TRUE)
longitud<- sample(-180:180, n_registros, replace= TRUE)

archaeology_data <- data.frame(
  yacimiento= yacimiento,
  tipo_artefactos= tipo_artefactos,
  numero_artefactos= cantidad_artefactos,
  contexto= contexto,
  latitud= latitud,
  longitud=longitud
)

print(archaeology_data)
str(archaeology_data)
#2

mean(numero_artefactos)

quantile(numero_artefactos, 0.25)

quantile(numero_artefactos, 0.75)

quantile(numero_artefactos, 1.00)

#3
hist(x = numero_artefactos, main = "Histograma de Numero de artefactos", 
     xlab = "Tipo", ylab = "Frecuencia",
     col = "purple")

Posee mas bien una distribucion casi simetrica

#4
boxplot(x = numero_artefactos, y = numero_artefactos, main = "Numero de Artefactos", 
     xlab = "Tipo", ylab = "Frecuencia", 
     col = c("orange3"))

Pues que su distribucion es bastante simetrica

#5
ESTE NO SE HACE


#6

library(ggplot2)

ggplot(archaeology_data, aes(x = longitud, y = latitud)) +
  geom_bin2d() +
  labs(title="Desidad numero artefactos", x="Longitud", y= "Latitud")

#7
total_num_art <- sum(archaeology_data$numero_artefactos)
print(total_num_art)

#8
median(archaeology_data$numero_artefactos)

#9
sd(archaeology_data$numero_artefactos)

#10
which.max(archaeology_data$numero_artefactos)

#11
aggregate(numero_artefactos~site,data=archaeology_data, 
          col=mean(archaeology_data$numero_artefactos), 
          col=median(archaeology_data$numero_artefactos), 
          col=sd(archaeology_data$numero_artefactos))
#12
boxplot(x = archaeology_data$yacimiento, y = archaeology_data$numero_artefactos, main = "Densidad artefactos por yacimiento", 
     xlab = "Yacimiento", ylab = "Artefactos", 
     col = c("orange3", "yellow3", "green3", "grey"))

