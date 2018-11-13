module Tarefa2_2017li1g56 where

import Data.Maybe
import LI11718

-- | função de testes
testesT2 :: [Tabuleiro]
testesT2 = [[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Este) 0,Peca (Rampa Este) 1,Peca Recta 2,Peca (Rampa Oeste) 1,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca (Curva Norte) 0,Peca (Curva Este) 0],[Peca (Curva Oeste) 0,Peca (Curva Sul) 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 1,Peca Lava 0,Peca Lava 1,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 1,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 1,Peca Recta 1,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Norte) 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Oeste) (-1),Peca (Rampa Oeste) (-2),Peca (Curva Este) (-2),Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Oeste) (-1),Peca (Rampa Oeste) (-2),Peca (Curva Sul) (-2),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca (Curva Norte) 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],
            [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Este) 0,Peca (Rampa Este) 1,Peca Recta 2,Peca (Rampa Oeste) 1,Peca Lava 0,Peca Lava 0],[]]]


{- | Verifica se um mapa é válido-}
valida :: Mapa -> Bool
valida mapa@(Mapa (coord,ori) (h:t)) = inBounds coord (x,y) -- verifica se as coordenadas estão estão dentro do mapa
                                  && validaLH (h:t) -- verifica se o mapa é retângulo e se os limites são sempre Lava
                                  && basicConditions peca mapa --verifica condições básicas
                                where (x,y) = (length h,length (h:t))
                                      peca = takePos (h:t) coord


{- | Verifica se as coordenadas iniciais são corretas-}
inBounds :: (Int,Int) -> (Int,Int) -> Bool
inBounds (c,l) (x,y) = (c<=x-1) && (l<=y-1) && (c>=0) && (l>=0)

{- | Verifica se toda a lava tem altura 0, se o circuito é fechado, se as alturas são congruentes e ainda se o numero de peças total é igual ao numero de peças do circuito-}
basicConditions :: Peca ->Mapa->Bool
basicConditions peca (Mapa (inicial,ori) tab) = initialCHeck peca ori
                                       && lavaGroundZero tab
                                       && circuitLen /= -1
                                       && countP tab 0 == circuitLen
                                 where
                                    circuitLen = countCircuit (Mapa (inicial,ori) tab) (ori,inicial) [inicial] 0

{- | Conta o numero de peças do circuito. Também verifica se as alturas são congruêntes e se o circuito é fechado-}
countCircuit :: Mapa -> (Orientacao,Posicao) -> [Posicao] -> Int -> Int 
countCircuit m@(Mapa (c,orInit) t) (ori,atual) l x | not (initialCHeck peca ori) = -1
                                                   | length l == 1 = countCircuit m (newDir, newCoord) (atual:l) (x+1) --inicio
                                                   | peca == Peca Lava 0 = -1 --caso de paragem
                                                   | hDescrepency peca newPeca atual newCoord = -1 --se vou para um altura errada
                                                   | atual == last l = if orInit == ori --circuito fechado
                                                                    then x
                                                                    else countCircuit m (newDir, newCoord) (atual:l) x
                                                   | atual `elem` l = countCircuit m (newDir, newCoord) (atual:l) x
                                                   | otherwise = countCircuit m (newDir, newCoord) (atual:l) (x+1)
                          where peca = takePos t atual                    
                                newPeca = takePos t newCoord
                                newDir = calculateDir ori peca
                                newCoord = calculateCoord newDir atual


{- | Compara as alturas de duas pecas-}
hDescrepency :: Peca -> Peca ->Posicao->Posicao-> Bool
hDescrepency (Peca (Rampa ori1) alt1) (Peca (Rampa ori2) alt2) p1 p2 = abs (alt1-alt2)/=1
hDescrepency (Peca (Rampa ori) alt1) peca p1 p2 = validRampH peca (Peca (Rampa ori) alt1) p2 p1
hDescrepency peca (Peca (Rampa ori) alt2) p1 p2 = validRampH peca (Peca (Rampa ori) alt2) p1 p2   
hDescrepency (Peca _ alt1) (Peca _ alt2) p1 p2 = alt1 /= alt2
                                        
{- | Função especifica para comparar as alturas em relação a rampas-}
validRampH :: Peca ->Peca-> Posicao ->Posicao -> Bool
validRampH (Peca _ alt1) (Peca (Rampa ori) alt2) (x1,y1) (x2,y2) = not
                                                                  (((ori==Este)  && (x1<x2) && altDif==0)
                                                                || ((ori==Este)  && (x1>x2) && altDif==1)
                                                                || ((ori==Oeste) && (x1<x2) && altDif==1)
                                                                || ((ori==Oeste) && (x1>x2) && altDif==0)
                                                                || ((ori==Norte) && (y1>y2) && altDif==0)
                                                                || ((ori==Norte) && (y1<y2) && altDif==1)
                                                                || ((ori==Sul)   && (y1>y2) && altDif==1)
                                                                || ((ori==Sul)   && (y1<y2) && altDif==0))
                                                    where
                                                      altDif = abs(alt1-alt2)

{- | Verifica se existe alguma lava com altura diferente de 0 -}                                                                  
lavaGroundZero :: Tabuleiro -> Bool
lavaGroundZero [[]] = True
lavaGroundZero ([]:ts) = lavaGroundZero ts
lavaGroundZero ((Peca Lava a:t):ts) = a==0 && lavaGroundZero (t:ts)
lavaGroundZero ((_:t):ts) = lavaGroundZero (t:ts)


{- | Conta as peças totais do tabuleiro, diferentes de Lava -}
countP :: Tabuleiro -> Int -> Int
countP [[]] x = x 
countP ([]:ts) x = countP ts x
countP ((Peca Lava b:t):ts) x = countP (t:ts) x  
countP ((_:t):ts) x = countP (t:ts) (x+1)

 
{- | Calcula a nova direção a seguir-}
calculateDir :: Orientacao -> Peca-> Orientacao ---usar isto para ver se a orientão inicial está bem          
calculateDir Este (Peca (Curva Este) a) = Sul  
calculateDir Este (Peca (Curva Sul) a) = Norte 
calculateDir Oeste (Peca (Curva Oeste) a ) = Norte
calculateDir Oeste (Peca (Curva Norte) a) = Sul
calculateDir Norte (Peca (Curva Norte) a) = Este
calculateDir Norte (Peca (Curva Este) a) = Oeste
calculateDir Sul (Peca (Curva Sul) a) = Oeste 
calculateDir Sul (Peca (Curva Oeste) a) = Este
calculateDir orient _ = orient

{- | Calcula as novas coordenadas em função da orientação.-}
calculateCoord :: Orientacao -> Posicao -> Posicao
calculateCoord Sul (x,y) = (x,y+1)
calculateCoord Norte (x,y) = (x,y-1)
calculateCoord Este (x,y) = (x+1,y)
calculateCoord Oeste (x,y) = (x-1,y)

{- | Verifica se o tabuleiro é retângulo e se os limites são compostos só por lava.-}
validaLH :: Tabuleiro -> Bool
validaLH  [] = False
validaLH  l = verify (head l) && verify (last l) && llength l && clength l

{- | Acede à peca de uma determinada posição-}
takePos :: Tabuleiro -> Posicao-> Peca
takePos l (x,y) = (l !! y) !! x

{- | Verifica se falta alguma peça,nas linhas, ou seja, se há algum "buraco" no mapa.-} 
llength :: Tabuleiro -> Bool
llength  [] = True
llength [x] = True
llength (x:y:ys) = length x==length y && llength (y:ys) 

{- | Verifica se falta alguma peça, nas colunas. -}
clength :: Tabuleiro -> Bool
clength [] = True
clength (h:t) = head h == Peca Lava 0 && last h == Peca Lava 0 && clength t 

{-| Verifica se um limite é só constituido por lava. -}
verify :: [Peca] -> Bool
verify [] = True
verify l = foldr (\h -> (&&) (h==Peca Lava 0)) True l

{- | Verifica se a orientção inicial é válida para a peça em questão. -}
initialCHeck :: Peca -> Orientacao -> Bool
initialCHeck (Peca Lava a) ori = False
initialCHeck (Peca Recta a) ori = True --vai dar merda
initialCHeck (Peca (Curva Norte) a) ori = (ori == Norte) || (ori == Oeste)
initialCHeck (Peca (Curva Este) a) ori =  (ori == Este)  || (ori == Norte)
initialCHeck (Peca (Curva Sul) a) ori =   (ori == Sul)   || (ori == Este)
initialCHeck (Peca (Curva Oeste) a) ori = (ori == Oeste) || (ori == Sul)
initialCHeck (Peca (Rampa Norte) a) ori = (ori == Norte) || (ori == Sul)
initialCHeck (Peca (Rampa Sul) a) ori =   (ori == Sul)   || (ori == Norte)
initialCHeck (Peca (Rampa Este) a) ori =  (ori == Oeste) || (ori == Este)
initialCHeck (Peca (Rampa Oeste) a) ori = (ori == Oeste) || (ori == Este)