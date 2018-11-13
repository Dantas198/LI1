{-|
Module      : Tarefa6_2017li1g56
Description : Módulo da Tarefa 6 para LI1 17/18

Módulo para a realização da Tarefa 6 de LI1 em 2017/18.
-}
module Tarefa6_2017li1g56 where

import LI11718
-- | tipo formado por um par de pontos.
type Line = (Ponto,Ponto) 

{-|
Função usada para simular um /bot/ no jogo /Micro Machines/.
Em cada instante, dado o tempo decorrido, o estado do jogo
e o identificador do jogador, toma uma ação.
-}
bot :: Tempo  -- ^ tempo decorrido desde a última decisão
    -> Jogo   -- ^ estado atual do jogo
    -> Int    -- ^ identificador do jogador dentro do estado
    -> Acao   -- ^ a decisão tomada pelo /bot/
bot tick (Jogo (Mapa (_,_) tab) p c n h) e = if length c==0 
                                                then (Acao False False False False Nothing) 
                                                else choices tab hist carro e
                                                where hist = takeH h 0 e
                                                      carro = takeC c 0 e   

-- | Retira da lista de listas de posições a lista que queremos.
takeH :: [[Posicao]] -> Int -> Int -> [Posicao]
takeH [h] _ _ = h
takeH (h:t) int e | int == e = h
                  | otherwise = takeH t (int+1) e


-- | Retira da lista de carros o carro que queremos.
takeC :: [Carro] -> Int -> Int -> Carro
takeC [h] _ _= h
takeC (h:t) int e | int == e = h
                  | otherwise = takeC t (int+1) e

-- | Função que gere o tipo de escolhas que vamos tomar, se estamos numa curva, a ir para uma ou não.
choices :: Tabuleiro -> [Posicao] -> Carro ->Int-> Acao --peça onde estamos 
choices tab hist c@(Carro (x,y) d (v1,v2)) e | isCurva pecaI = turnCurva tab hist (x,y) pecaI newPeca
                                             | isCurva newPeca = turnBeforeCurva tab c hist newPeca
                                             | otherwise = adjustPosition tab c hist e newPeca                     
                                              where pecaI = (getPeca tab (floor x, floor y))
                                                    ((newPeca,pos),int) = pecaTime2 tab (v1,v2) (x,y)

-- | Função que executa a viragem numa curva.
turnCurva :: Tabuleiro -> [Posicao] ->Ponto -> Peca->Peca-> Acao
turnCurva tab ((x,y):(z,w):ts) p pecaI pecaN | (x<z || x>z) = turnVertical tab p pecaI pecaN
                                             | otherwise = turnHorizontal tab p pecaI pecaN

-- | Vira quando nos estamos a movimentar no eixo do x numa curva.
turnHorizontal :: Tabuleiro -> Ponto -> Peca -> Peca -> Acao
turnHorizontal tab p pecaI@(Peca (Curva ori) a) pecaN | ori == Norte || ori == Sul = (Acao True False False True Nothing)
                                                      | otherwise = (Acao True False True False Nothing)
                                                        where rightPeca = rightPathCurv tab 11 p pecaI

-- | Vira quando nos estamos a movimentar no eixo y numa curva.
turnVertical :: Tabuleiro -> Ponto -> Peca -> Peca -> Acao
turnVertical tab p pecaI@(Peca (Curva ori) a) pecaN | ori == Oeste || ori == Este = (Acao True False False True Nothing)
                                                    | otherwise = (Acao True False True False Nothing)
                                                        where rightPeca = rightPathCurv tab 22 p pecaI

-- | Encontra a peça que corresponde ao caminho certo ao sair de uma curva.
rightPathCurv :: Tabuleiro -> Int -> Ponto-> Peca -> Peca 
rightPathCurv tab 11 (x,y) (Peca (Curva ori) a) | ori == Norte || ori == Oeste = getPeca tab (ceiling x, floor y)
                                                | otherwise = getPeca tab (remendafloor x, floor y)
rightPathCurv tab 22 (x,y) (Peca (Curva ori) a) | ori == Norte || ori == Este = getPeca tab (floor x, ceiling y)
                                                | otherwise = getPeca tab (floor x, remendafloor y)


-- | Função que executa uma ligeira viragem antes de uma curva.
turnBeforeCurva :: Tabuleiro ->Carro -> [Posicao] -> Peca -> Acao
turnBeforeCurva tab c ((x,y):(z,w):ts) (Peca (Curva ori) a) | x<z = adjustCurv tab (Oeste,ori) c
                                                            | x>z = adjustCurv tab (Este,ori) c 
                                                            | y>w = adjustCurv tab (Sul,ori) c  
                                                            | otherwise = adjustCurv tab (Norte,ori) c
turnBeforeCurva tab c _ peca = (Acao True False False False Nothing)


-- | Função que determina para onde virar, esquerda ou direita, ao aproximarmo-nos de uma curva.
adjustCurv :: Tabuleiro -> (Orientacao,Orientacao) ->Carro -> Acao
adjustCurv tab (orI,orN) (Carro (x,y) d v) |orI == Oeste && (x>coordX + 0.4) = (Acao True False False False Nothing) 
                                           |orI == Este  && (x<coordX + 0.4) = (Acao True False False False Nothing)
                                           |orI == Norte && (y>coordY + 0.4) = (Acao True False False False Nothing)
                                           |orI == Sul   && (y<coordY + 0.4) = (Acao True False False False Nothing)
                                           |orI == Oeste && orN == Norte     = (Acao True False True False Nothing)
                                           |orI == Oeste && orN == Oeste     = (Acao True False False True Nothing)
                                           |orI == Este  && orN == Este      = (Acao True False False True Nothing)
                                           |orI == Este  && orN == Sul       = (Acao True False True False Nothing) 
                                           |orI == Norte && orN == Norte     = (Acao True False False True Nothing)
                                           |orI == Norte && orN == Este      = (Acao True False True False Nothing)
                                           |orI == Sul   && orN == Sul       = (Acao True False False True Nothing)
                                           |orI == Sul   && orN == Oeste     = (Acao True False True False Nothing)
                                             where coordX = fromIntegral $ floor x
                                                   coordY = fromIntegral $ floor y 
                                                        



-- | Ajusta a posição do carro quando não estamos próximos de uma curva
adjustPosition :: Tabuleiro -> Carro ->[Posicao] ->Int->Peca-> Acao
adjustPosition tab c ((x,y):(z,w):ts) e peca | x<z = adjust tab Oeste c peca e
                                             | x>z = adjust tab Este c peca e
                                             | y>w = adjust tab Sul c peca e
                                             | otherwise = adjust tab Norte c peca e
adjustPosition tab c _ e peca = (Acao True False False False Nothing)

-- | Ajusta a posição de acordo com a orientação que o carro leva.
adjust :: Tabuleiro -> Orientacao -> Carro -> Peca -> Int -> Acao
adjust tab ori (Carro (x,y) d (v1,v2)) peca i | peca==rightPeca = (Acao True False False False nitro)
                                              | ori == Oeste && v2<0 = (Acao True False True False nitro)
                                              | ori == Oeste && v2>0 = (Acao True False False True nitro)
                                              | ori == Este && v2<0 = (Acao True False False True nitro)
                                              | ori == Este && v2>0 = (Acao True False True False nitro)
                                              | ori == Norte && v1>0 = (Acao True False True False nitro)
                                              | ori == Norte && v1<0 = (Acao True False False True nitro)
                                              | ori == Sul && v1>0 = (Acao True False False True nitro)
                                              | otherwise = (Acao True False True False nitro)
                                                where rightPeca = rightPath tab ori (x,y)
                                                      nitro = canUseN rightPeca i


-- | Calcula o caminho certo à saida de uma curva.
rightPath :: Tabuleiro ->Orientacao -> Ponto -> Peca 
rightPath tab Este (x,y) = getPeca tab (remendaceiling x, floor y)
rightPath tab Oeste (x,y) = getPeca tab (remendafloor x, floor y)
rightPath tab Norte (x,y)= getPeca tab (floor x, remendafloor y)
rightPath tab Sul (x,y) = getPeca tab (floor x, remendaceiling y)

-- | Função que verifica se podemos usar o nitro.
canUseN :: Peca -> Int -> Maybe Int
canUseN (Peca (Rampa _) a) i = (Just i)
canUseN _ _ = Nothing

-- | Devolve um triplo com a peça para a qual vamos, o tempo que demora a lá chegar, mais um identificador do tipo de parede.                                       
-- 1 -- lado Este e Sul
-- 2 -- lado Norte e Oeste
-- 3 -- lado Este e Norte
-- 4 -- lado Oeste e Sul
pecaTime2 :: Tabuleiro -> Velocidade ->Ponto->((Peca,Posicao),Int)
pecaTime2 tab (v1,v2) p | v1>=0 && v2>=0 = choosePeca (timePair (showPeca tab 1 p) 1 (v1,v2) p)     
                        | v1<=0 && v2<=0 = choosePeca (timePair (showPeca tab 2 p) 2 (v1,v2) p)
                        | v1>=0 && v2<=0 = choosePeca (timePair (showPeca tab 3 p) 3 (v1,v2) p)
                        | v1<=0 && v2>=0 = choosePeca (timePair (showPeca tab 4 p) 4 (v1,v2) p)
                        | otherwise = choosePeca (timePair (showPeca tab 1 p) 1 (v1,v2) p)

 
-- | Dá como output um par com a informação das duas possíveis peças para onde podemos ir e a sua posição, de acordo com a velocidade.
showPeca :: Tabuleiro -> Int -> Ponto -> ((Peca,Posicao),(Peca,Posicao))
showPeca tab 1 (x,y) = (((getPeca tab (remendaceiling x, floor y)),(remendaceiling x, floor y)), ((getPeca tab (floor x, remendaceiling y)),(floor x, remendaceiling y)))
showPeca tab 2 (x,y) = (((getPeca tab (remendafloor x,floor y)),(remendafloor x, floor y)), ((getPeca tab (floor x, remendafloor y)),(floor x, remendafloor y)))
showPeca tab 3 (x,y) = (((getPeca tab (remendaceiling x, floor y)),(remendaceiling x,floor y)), ((getPeca tab (floor x, remendafloor y)),(floor x, remendafloor y)))
showPeca tab 4 (x,y) = (((getPeca tab (remendafloor x, floor y)),(remendafloor x,floor y)), ((getPeca tab (floor x, remendaceiling y)),(floor x, ceiling y)))


-- | Escolhe o limite da peça para o qual vamos, em função do que demora menos tempo.
choosePeca ::((Tempo,(Peca,Posicao)),(Tempo,(Peca,Posicao)))->((Peca,Posicao),Int)
choosePeca ((time1,pe1),(time2,pe2))  | cseTime time1 time2 = (pe1,int1)    
                                      | otherwise = (pe2,int2)
                                      where int1 = if (isCurva $ fst $ pe1 ) then 32 else 22
                                            int2 = if (isCurva $ fst $ pe2 ) then 31 else 11
     

-- | Calcula o tempo menor
cseTime :: Tempo -> Tempo -> Bool 
cseTime 0 t = False
cseTime t 0 = True
cseTime t1 t2 = if t1<t2 then True else False

-- | Verifica se a peça é uma curva.
isCurva :: Peca -> Bool 
isCurva (Peca (Curva _) _) = True
isCurva _ = False

-- | Função auxiliar para arredondar um double
remendaceiling :: Double -> Int
remendaceiling x = if (fromIntegral (ceiling x) == x) then (ceiling x + 1) else ceiling x  

-- | Coloca os tempos de chegarmos aos dois limites
timePair ::((Peca,Posicao),(Peca,Posicao)) -> Int -> Velocidade -> Ponto -> ((Tempo,(Peca,Posicao)),(Tempo,(Peca,Posicao)))
timePair (pe1,pe2) 1 v@(v1,v2) ponto = ((calculateTS v1 (fst(cDist pe1 (1,1) v ponto)),pe1),(calculateTS v2 (snd(cDist pe2 (1,1) v ponto)),pe2))
timePair (pe1,pe2) 2 v@(v1,v2) ponto = ((calculateTS v1 (fst(cDist pe1 (2,2) v ponto)),pe1),(calculateTS v2 (snd(cDist pe2 (2,2) v ponto)),pe2))
timePair (pe1,pe2) 3 v@(v1,v2) ponto = ((calculateTS v1 (fst(cDist pe1 (1,2) v ponto)),pe1),(calculateTS v2 (snd(cDist pe2 (1,2) v ponto)),pe2))
timePair (pe1,pe2) 4 v@(v1,v2) ponto = ((calculateTS v1 (fst(cDist pe1 (2,1) v ponto)),pe1),(calculateTS v2 (snd(cDist pe2 (2,1) v ponto)),pe2))

-- | Função auxiliar para arredondar o double                     
remendafloor :: Double -> Int
remendafloor x | x<=1 = 0
               | otherwise = floor (x-(fromIntegral 1))

-- | Calcula a distância das abcissas de dois pontos
distBetween2P :: Ponto -> Ponto -> Double
distBetween2P (x1,y1) (x2,y2) | x2-x1 == 0 = abs(y2-y1)
                              | otherwise = abs(x2-x1)

-- | Calcula o tempo que demora a embater com uma diagonal
calculateTSDiagonal :: Velocidade -> Double -> Double
calculateTSDiagonal (v1,v2) d | v1==0 && v2==0 = 0
                              | v1==0 = abs(d/v2)
                              | v2==0 = abs(d/v1)
                              | otherwise = abs(d/v1)

-- | Calcula o tempo, através da distância e da velocidade
calculateTS :: Double -> Double -> Double
calculateTS vel dist | vel== 0 = 0
                     | otherwise = abs((abs(dist))/vel) 

-- | Calcula a distância a paredes, tendo em conta se estamos em cima de uma.
cDist :: (Peca,Posicao) -> (Int,Int) -> Velocidade-> Ponto -> (Double,Double)  
cDist (pe,pos) (i,j) (v1,v2) (x,y) | equalLimit x && equalLimit y = (1,1)
                                   | equalLimit x = (1,normalDist j y)
                                   | equalLimit y = (normalDist i x, 1)
                                   | otherwise = (normalDist i x, normalDist j y) 
                                      


-- | Calcula a distância unidimensional.
normalDist :: Int -> Double -> Double
normalDist 1 x = dist (ceiling x) x 
normalDist 2 x = dist (floor x) x

-- | Calcula a distância
dist :: Int -> Double -> Double
dist x p = abs(fromIntegral x - p)

-- | Verifica se nos encontramos em cima de um limite
equalLimit:: Double->Bool
equalLimit x = if ((x==fromIntegral (ceiling x)) || (x==fromIntegral (floor x))) then True else False 


-- | Acede a uma peça do tabuleiro 
getPeca :: Tabuleiro -> Posicao-> Peca
getPeca tab (x,y) = (tab !! y) !! x 
