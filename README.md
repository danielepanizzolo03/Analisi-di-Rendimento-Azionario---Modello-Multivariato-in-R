# Analisi di Rendimento Azionario - Modello Multivariato in R

## Descrizione
Questo repository contiene uno script in R che affronta un problema di statistica applicata ai rendimenti azionari di tre società (A, B e C). L'analisi si basa su un esercizio che richiede di costruire una distribuzione normale multivariata, calcolare la matrice di covarianza e stimare la probabilità di specifici scenari sui rendimenti delle azioni.

## Problema
Il problema da risolvere è il seguente:
1. **Rendimento delle azioni**: Le azioni di tre società (A, B e C) hanno i seguenti valori attesi e deviazioni standard:
   - **Azione A**: Valore atteso 7.5%, deviazione standard 7%
   - **Azione B**: Valore atteso 10%, deviazione standard 12%
   - **Azione C**: Valore atteso 20%, deviazione standard 18%

2. **Coefficiente di correlazione tra i rendimenti**:
   - Tra **A e B**: 0.7
   - Tra **A e C**: -0.5
   - Tra **B e C**: -0.3

## Obiettivi dell'Analisi
1. **Costruire il vettore delle medie e la matrice di covarianza** che descrivono i rendimenti delle azioni.
2. **Calcolare la probabilità** che i rendimenti di tutte e tre le azioni siano non superiori allo 0%.
3. **Determinare la probabilità** che i rendimenti delle azioni A e B siano positivi e che quello dell'azione C sia negativo.
4. **Costruire un portafoglio finanziario** che privilegia il rendimento, composto per metà da azioni C e per metà equamente distribuita tra A e B. Calcolare la distribuzione del rendimento di questo portafoglio.
5. **Costruire un portafoglio cautelativo** composto per metà da azioni A e per metà equamente divisa tra le azioni B e C, e determinare la distribuzione congiunta del rendimento di questo portafoglio.

## Funzionalità Principali dello Script
- **Calcolo delle Medie e della Matrice di Covarianza**: Lo script calcola il vettore delle medie e la matrice di covarianza dei rendimenti.
- **Probabilità Multivariate**: Utilizza la distribuzione normale multivariata per stimare la probabilità di eventi specifici sui rendimenti.
- **Simulazione di Portafogli**: Analizza due strategie di portafoglio con diverse composizioni delle azioni A, B e C.

## Requisiti
- **R** (versione 4.0 o successiva)
- Pacchetto richiesto:
  - `mvtnorm`

## Installazione
1. Clona il repository:
   ```bash
   git clone https://github.com/tuo-username/analisi-rendimento-azionario.git
