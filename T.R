

# importar datos

cumb <- read.csv("cumbres.csv", header = T)
cumb <- read.csv("cumbres.csv", header = T)
boxplot(cumb$TEMP,
                  col = "skyblue",
                 ylim = c(10,35))
abline(h=21.8, col = "indianred", lwd =2, lty =2)
cumb <- read.csv("cumbres.csv", header = T)
boxplot(cumb$TEMP,
                   col = "skyblue",
                   ylim = c(10,35))
abline(h=21.8, col = "indianred", lwd =3, lty = "dashed")
abline(h=mean(cumb$TEMP), col = "darkgrey", lwd=3, lty = "solid")
mean(cumb$TEMP)

t.test(mu = 21.8, cumb$TEMP)

#muestras dependientes
inventario <- read.csv("inventario.csv", header = T)
inventario$Fecha <- as.factor(inventario$Fecha)
boxplot(inventario$Kilogramo ~ inventario$Fecha,
        xlab = "Año",
        ylab = "Semilla",
        col = "lightgreen",
        ylin = c(40,60))
tapply(inventario$kilogramo, inventario$fecha, mean)
t.test(inventario$kilogramo~)

