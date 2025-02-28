# AULA 2

# TIRAR NOTAÇÃO CIENTÍFICA ####
options(scipen = 999)

# EXCLUIR UMA BASE DE DADOS
nomedoobjeto <- NULL

## ATALHOS DE TECLADO ####
# "<-": "ALT" + "-"
# PARA EXECUTAR A LINHA: "ALT" + "ENTER"
# PARA EXECUTAR TODO SCRIPT: "ALT" + "SHIFT" + "ENTER"

## BIBLIOTECA PARA ACESSAR DADOS DO BANCO MUNDIAL ####

#install.packages('WDI') # PRIMEIRO A EXECUTAR
library(WDI) # CARREGAR O PACOTE

## VARIÁVEIS ####

# EXPECTATIVA DE VIDA H/M (%): SP.DYN.LE00.IN
# INDICE GINI (%): SI.POV.GINI

# Infos: http://vincentarelbundock.github.io/WDI/

Exp_vida <- WDIsearch('Life expectancy at birth') # GDP = PIB (todos)
ind_gini <- WDIsearch('Gini index') # TODAS AS VAR. DO BM

variaveis <- c('SP.DYN.LE00.IN',
               'SI.POV.GINI')

# BASE DE DADOS DE CORTE TRANSVERSAL

dadosall <- WDI(indicator = variaveis,
             country = 'all',
             start = 2022, end = 2022) # PROBLEMAS NA NA

dadosBR <- WDI(indicator = variaveis,
               country = 'BR') # PROBLEMA DE NA

# install.packages("tidyverse")
library(tidyverse)
dadosallOK <- WDI(indicator = variaveis,
                    country = 'all',
                    start = 2022, end = 2022) %>% 
  na.omit()

dadosBROK <- WDI(indicator = variaveis,
               country = 'BR') %>% 
  na.omit()

rm(dadosall2022)
