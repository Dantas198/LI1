module Tarefa1_2017li1g56 where

import LI11718

-- | par de informações sobre a orientação e a altura
type Info = (Orientacao,Altura)

{- |Função de testes-}
testesT1 :: [Caminho]
testesT1 = [[],
            [Avanca,Avanca,Avanca],[CurvaDir,CurvaDir,CurvaDir,CurvaDir],[Avanca,Sobe,Sobe,Desce,Desce,Desce,Desce,CurvaEsq],
            [Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir],[Sobe,Sobe,Sobe],[Desce,Desce,Desce],[Sobe,Sobe,Desce,Desce],
            [CurvaDir,Sobe,CurvaEsq,Sobe,Avanca,Desce,Desce,Avanca],
            [Avanca, Avanca, CurvaDir, Sobe, Avanca, Avanca, CurvaEsq, Desce, Avanca, Avanca, CurvaEsq, Avanca, Avanca, Avanca, Avanca, CurvaEsq, Sobe, Avanca, Desce, Avanca, Avanca,Avanca,CurvaEsq,CurvaEsq]
            ,[Avanca, Avanca, CurvaDir, Sobe, Avanca, Avanca, CurvaEsq, Desce, Avanca, Avanca, CurvaEsq, Avanca, Desce, Desce, Avanca, CurvaEsq, Avanca, Avanca, Sobe, Sobe, Avanca,Avanca,CurvaEsq,CurvaEsq],
            [Avanca, Avanca, Avanca, Avanca, Avanca, Avanca, CurvaEsq, CurvaEsq, Avanca, Avanca, Avanca, Avanca, Avanca,Avanca,CurvaEsq,CurvaEsq],
            [Avanca, Avanca, Desce, Desce, CurvaDir, CurvaEsq, Avanca, Sobe, Avanca, Avanca, Avanca, CurvaDir, Avanca, Sobe, Sobe, Sobe, Sobe, Avanca, CurvaEsq, CurvaDir, CurvaDir, Desce, Desce, CurvaDir, Avanca, Avanca, Avanca, Avanca, CurvaEsq, Avanca, Avanca, Sobe, CurvaEsq, CurvaEsq, Desce, Desce, Desce, Avanca, Avanca, Avanca, CurvaEsq, Sobe, Sobe, Sobe, Avanca, Avanca, Avanca, Avanca, CurvaEsq, CurvaEsq, Desce, Desce, CurvaDir, Avanca, Avanca, Avanca, Avanca, CurvaDir, CurvaEsq, Avanca, Avanca, Avanca, Avanca, Avanca, CurvaEsq, CurvaEsq],
            [Avanca, CurvaDir, CurvaDir, Avanca, CurvaEsq, CurvaEsq, Avanca, Avanca, CurvaEsq, Avanca, Avanca, CurvaEsq, Avanca, Avanca, CurvaDir, CurvaDir, Avanca, Avanca, Avanca, CurvaDir, Avanca, Avanca, Avanca, Avanca, CurvaDir, Avanca, Avanca, Avanca, CurvaEsq, CurvaEsq, Avanca, Avanca, Avanca,Avanca, CurvaEsq, Avanca, Avanca, Avanca, Avanca, Avanca, Avanca, CurvaEsq, Avanca, Avanca, Avanca, Avanca, CurvaDir, CurvaDir, Avanca, Avanca, Avanca, Avanca, Avanca, CurvaDir, Avanca,Avanca, Avanca, Avanca, Avanca, Avanca, Avanca, Avanca, CurvaDir, Avanca, Avanca, Avanca, Avanca, Avanca, Avanca, CurvaDir, Avanca, Avanca, Avanca, Avanca, CurvaDir, Avanca],
            [Sobe,Sobe,Sobe,CurvaDir,CurvaDir,Desce,Avanca,Avanca,Desce,Desce,Desce,CurvaDir,CurvaDir,Sobe,Avanca,Avanca]]


{- | Constroi um mapa em função do caminho que lhe é dado.-}
constroi:: Caminho -> Mapa
constroi l   = Mapa (pInicial,dirInit) (makeBoard (lavaM l dim) l (pInicial,dirInit) altInit) --chamada de função auxiliar
               where pInicial = partida l -- posiçao inicial
                     dim = dimensao l --dimensão do mapa
                     

{- | Faz recursivamente o tabuleiro do mapa,em função da lista de movimentos, utilizando um tabuleiro de lava como base.-}
makeBoard :: Tabuleiro -> Caminho -> (Posicao,Orientacao) -> Altura->Tabuleiro
makeBoard tab [] _ _  = tab --caso de paragem
makeBoard tab (h:ts) (pos, orient) n  = makeBoard a ts (b,c) altura
                                          where first= fst(passo2peca h orient n) --peça que vo[Avanca,Sobe,Sobe,Desce,Desce,Desce,Desce,CurvaEsq]u colocar
                                                second = snd(passo2peca h orient n) -- nova Info (orientação,altura)
                                                a = replace tab pos first -- substitui uma peça
                                                b = calculateCoord (fst second) pos -- calcula a nova coordenada
                                                c = fst second  -- calcula a nova orientação
                                                altura = snd second --altura nova

{- | Coloca uma peça na coordenada a ser alterada, procurando a linha. -}
replace :: Tabuleiro -> Posicao ->Peca->Tabuleiro
replace [] x peca = [] --caso de paraem
replace ((h:ts):hts) (x,0) peca = replaceXX (h:ts) peca x :hts -- coloca na coluna
replace ((h:ts):hts) (x,y) peca = (h:ts): replace hts (x,y-1) peca-- procura a linha
                              
{- | Coloca a peca na coluna certa. -}
replaceXX :: [Peca] ->Peca->Int-> [Peca]
replaceXX [] peca pos= [peca] -- caso de paragem
replaceXX (h:ts) peca 0 = peca:ts -- caso em que substitui
replaceXX (h:ts) peca x = h:replaceXX ts peca (x-1) --ainda está a procurar


{- | Cria um tabuleiro só de lava. -}
lavaM :: Caminho -> Posicao-> Tabuleiro
lavaM l (x,y)= replicate y (replicate x (Peca Lava altLava))


{- | Converte um passo numa Peça, consoante a orientação. Juntamente à Peça coloca a nova Info (orientação,altura). -}
passo2peca :: Passo -> Orientacao ->Altura-> (Peca,Info)
passo2peca Avanca   o alt= (Peca Recta alt,(o,alt)) 
passo2peca Sobe  o alt= (Peca (Rampa o) alt ,(o,alt+1)) 
passo2peca Desce o alt= (Peca (Rampa (switchCoord o)) (alt-1), (o,alt-1)) 
passo2peca CurvaDir o alt | o==Este  = (Peca (Curva Este)  alt,(Sul,alt))  
                          | o==Oeste = (Peca (Curva Oeste) alt,(Norte,alt)) 
                          | o==Norte = (Peca (Curva Norte) alt,(Este,alt)) 
                          | o==Sul   = (Peca (Curva Sul)   alt,(Oeste,alt)) 
passo2peca CurvaEsq o alt | o==Este  = (Peca (Curva Sul)   alt,(Norte,alt)) 
                          | o==Oeste = (Peca (Curva Norte) alt,(Sul,alt)) 
                          | o==Norte = (Peca (Curva Este)  alt,(Oeste,alt))  
                          | o==Sul   = (Peca (Curva Oeste) alt,(Este,alt)) 

{- | Troca uma orientação, será aplicada em concreto às rampas-}
switchCoord :: Orientacao -> Orientacao
switchCoord Norte = Sul
switchCoord Sul = Norte
switchCoord Oeste = Este
switchCoord Este = Oeste

{-| Calcula as novas coordenadas de acordo com uma orientação-}
calculateCoord :: Orientacao -> Posicao -> Posicao
calculateCoord Sul (x,y) = (x,y+1)
calculateCoord Norte (x,y) = (x,y-1)
calculateCoord Este (x,y) = (x+1,y)
calculateCoord Oeste (x,y) = (x-1,y)

