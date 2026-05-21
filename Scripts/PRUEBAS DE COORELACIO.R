resp <- data.frame(
  tiempo = c(12, 15, 17, 18, 20, 21, 22, 26),
  edad = c(13, 25, 20, 35, 45, 30, 60, 95)
)
resp

plot( resp$tiempo, resp$edad,
     C0L = "black",
     pch = 19,
     xlab = "Tiempo de respuesta" ,
     ylab = "Edad" )

resp$Rango_Tiempo <- rank(resp$tiempo, ties.method = "first")
resp

# crear nuevas columnas con los rangos (1 a 8)
resp$Rango_Tiempo <- rank(resp$tiempo, ties.method = "first")
resp$Rango_Edad <- rank(resp$edad, ties.method = "first")

# ver resultado
resp

plot(resp$Rango_Tiempo, resp$Rango_Edad,
     col = "pink", # color de datos
     pch = 19, # cambia la forma del simbolo
     cex = 1.2, # modifica el tamaño del simbolo
     xlab = "rango variable tiempo", # eje X
     ylab = "Rango edad" # Eje Y
     )

cor.test(resp$Rango_Tiempo, resp$Rango_Edad, method = "spearman")

# Tau de kendall
tau <- data.frame(
  A = c(1,2,3,4,5,6),
  B = c(3,1,4,2,6,5)
)
cor.test(tau$A, tau$B, method = "kendall")

plot(tau$A, tau$B, 
     col = "blue", # color de datos
     pch = 19, # cambia forma del simbolo
     cex = 1.4, # modifica el tamaño del simbolo
     xlab = "evaluacion med, A", #Eje X 
     ylab = "evaluacion med, B" # Eje Y
)
