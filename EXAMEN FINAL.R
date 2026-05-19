# NOMBRE:
# MATRÍCULA: 

#============================================================
# EXAMEN DE DISEÑOS EXPERIMENTALES
# Prueba t independiente
# Problema 1: Crecimiento de plántulas con y sin cercado
# ============================================================

# ------------------------------------------------------------
# 1. Cargar paquetes
# ------------------------------------------------------------

# install.packages("tidyverse")
# install.packages("car")

library(tidyverse)
library(car)

# ------------------------------------------------------------
# 2. Crear el conjunto de datos
# ------------------------------------------------------------

datos <- data.frame(
  tratamiento = rep(c("Cercado", "Sin cercado"), each = 25),
  altura_cm = c(
    34.8, 35.2, 36.1, 35.7, 36.5,
    34.9, 35.6, 36.2, 35.4, 36.0,
    35.8, 36.4, 35.1, 35.9, 36.3,
    34.7, 35.5, 36.1, 35.3, 36.6,
    35.7, 36.2, 35.0, 35.8, 36.4,
    
    28.1, 27.9, 29.0, 28.4, 29.1,
    27.8, 28.6, 29.3, 28.2, 28.7,
    28.5, 29.2, 27.7, 28.8, 29.0,
    27.6, 28.3, 29.1, 28.0, 29.4,
    28.5, 28.9, 27.8, 28.6, 29.2
  )
)

# ------------------------------------------------------------
# 3. Revisar estructura de los datos
# ------------------------------------------------------------

str(datos)
head(datos)

# Respuesta del estudiante:
# 
# Número de grupos comparados:
# 

# ------------------------------------------------------------
# 4. Estadística descriptiva por grupo
# ------------------------------------------------------------

datos %>%
  group_by(tratamiento) %>%
  summarise(
    n = n(),
    media = mean(altura_cm),
    desviacion_estandar = sd(altura_cm),
    minimo = min(altura_cm),
    maximo = max(altura_cm)
  )

# Respuesta del estudiante:
# ¿Qué grupo presentó mayor promedio?
# 
# ¿La diferencia observada parece relevante desde el punto de vista forestal?
# 

# ------------------------------------------------------------
# 5. Gráfico exploratorio
# ------------------------------------------------------------

ggplot(datos, aes(x = tratamiento, y = altura_cm)) +
  geom_boxplot() +
  geom_jitter(width = 0.1, size = 2) +
  labs(
    title = "Altura de plántulas por tratamiento",
    x = "Tratamiento",
    y = "Altura de plántulas (cm)"
  ) +
  theme_minimal()

# Respuesta del estudiante:
# Describa la distribución de los datos en cada grupo:
# 
# ------------------------------------------------------------
# 6. Prueba de normalidad Shapiro-Wilk
# ------------------------------------------------------------

by(datos$altura_cm, datos$tratamiento, shapiro.test)

# Respuesta del estudiante:
# Valor p para el grupo Cercado:
# 
# Valor p para el grupo Sin cercado:
# 
# ¿Se cumple el supuesto de normalidad?
# 

# ------------------------------------------------------------
# 7. Evaluación de homogeneidad de varianzas
# ------------------------------------------------------------

leveneTest(altura_cm ~ tratamiento, data = datos)

# Respuesta del estudiante:
# Valor p de la prueba de Levene:
# 
# ¿Se cumple el supuesto de homogeneidad de varianzas?
# 

# ------------------------------------------------------------
# 8. Aplicar prueba t independiente
# ------------------------------------------------------------

resultado_t <- t.test(
  altura_cm ~ tratamiento,
  data = datos,
  var.equal = TRUE
)

resultado_t

# Respuesta del estudiante:
# Estadístico t:
# 
# Grados de libertad:
# 
# Valor p:
# 
# Intervalo de confianza:
# 

# ------------------------------------------------------------
# 9. Interpretación estadística
# ------------------------------------------------------------

# Respuesta del estudiante:
# ¿Se rechaza o no se rechaza la hipótesis nula?
# 
# ¿Existe diferencia estadísticamente significativa entre tratamientos?
# 

# ------------------------------------------------------------
# 10. Interpretación forestal
# ------------------------------------------------------------

# Respuesta del estudiante:
# Explique qué significa el resultado en el contexto del crecimiento de plántulas:
# 
