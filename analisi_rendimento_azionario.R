#A#

#costruiamo il vettore delle medie in base ai dati del problema 
mu = c(7.5, 10, 20) / 100 # dobbiamo però convertire i valori percentuali in valori decimali per poter operare

#riscriviamo anche le deviazioni standard, presenti nel testo
sigma_a = 7 / 100
sigma_b = 12 / 100
sigma_c = 18 / 100

#ora costruisco la matrice di covarianza utilizzando le deviazioni standard e i coefficienti di correlazione
cov_matrix <- matrix(c(
  sigma_a^2,                0.7 * sigma_a * sigma_b,   -0.5 * sigma_a * sigma_c,
  0.7 * sigma_a * sigma_b,  sigma_b^2,                -0.3 * sigma_b * sigma_c,
  -0.5 * sigma_a * sigma_c, -0.3 * sigma_b * sigma_c,  sigma_c^2
), nrow = 3, ncol = 3)

cov_matrix

# Stampa del vettore delle medie e della matrice di covarianza
print("Vettore delle medie:")
print(mu)
print("Matrice di covarianza:")
print(cov_matrix)


#B#

library(mvtnorm)
#Definiamo i limiti superiori come come 0 (per ottenere P(X ≤ 0))
limiti_superiori = c (0, 0, 0)

#Ora dobbiamo calcolare la probabilità congiunta 
probabilita = pmvnorm (upper = limiti_superiori, mean = mu, sigma = cov_matrix)

print("Probabilità che i rendimenti di tutte le tre azioni siano non superiori allo 0%:")
print(probabilita) #ricorda che è una probabilità congiunta 
#diremo perciò che la probabilità che i rendimenti delle azioni siano non superiori allo 0% è di circa lo 0,15%

#C#

limiti_inferiori_c = c(0, 0, -Inf)
limiti_superiori_c = c(Inf, Inf, 0)

#calcoliamo la probabilità congiunta

probabilita = pmvnorm (lower = limiti_inferiori_c, upper = limiti_superiori_c, 
                       mean = mu,
                       sigma = cov_matrix)

# Stampa della probabilità
print("Probabilità che i rendimenti delle azioni A e B siano positivi e quello dell'azione C sia negativo:")
print(probabilita)

#D#

# Vettore dei pesi del portafoglio
w <- c(1/4, 1/4, 1/2)

# Calcolo della media del rendimento del portafoglio
mu_portafoglio <- sum(w * mu)

# Calcolo della varianza del rendimento del portafoglio
var_portafoglio <- t(w) %*% cov_matrix %*% w

# Calcolo della deviazione standard del rendimento del portafoglio
sd_portafoglio <- sqrt(var_portafoglio)

# Stampa dei risultati
print("Media del rendimento del portafoglio:")
print(mu_portafoglio)
print("Deviazione standard del rendimento del portafoglio:")
print(sd_portafoglio)

#E#

# Vettore dei pesi per il primo portafoglio (dalla parte d)
w1 <- c(1/4, 1/4, 1/2)

# Calcolo della media e della varianza del primo portafoglio
mu_portafoglio1 <- sum(w1 * mu)
var_portafoglio1 <- t(w1) %*% cov_matrix %*% w1
sd_portafoglio1 <- sqrt(var_portafoglio1)

# Vettore dei pesi per il secondo portafoglio (dalla parte e)
w2 <- c(1/2, 1/4, 1/4)

# Calcolo della media e della varianza del secondo portafoglio
mu_portafoglio2 <- sum(w2 * mu)
var_portafoglio2 <- t(w2) %*% cov_matrix %*% w2
sd_portafoglio2 <- sqrt(var_portafoglio2)

# Calcolo della covarianza tra i due portafogli
cov_portafogli <- t(w1) %*% cov_matrix %*% w2

# Creazione della matrice di covarianza congiunta
cov_matrix_congiunta <- matrix(c(var_portafoglio1, cov_portafogli,
                                 cov_portafogli, var_portafoglio2), 
                               nrow = 2, ncol = 2)

# Stampa dei risultati
print("Media del primo portafoglio:")
print(mu_portafoglio1)
print("Deviazione standard del primo portafoglio:")
print(sd_portafoglio1)

print("Media del secondo portafoglio:")
print(mu_portafoglio2)
print("Deviazione standard del secondo portafoglio:")
print(sd_portafoglio2)

print("Matrice di covarianza congiunta dei rendimenti dei due portafogli:")
print(cov_matrix_congiunta)

