module Tarefa3_2017li1g56 where

import Data.Maybe
import LI11718

-- | Tipo de um reta, formada por dois pontos
type Line = (Ponto,Ponto) 

-- | Função de testes
testesT3 :: [(Tabuleiro,Tempo,Carro)]
testesT3 = [([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 1, Carro {posicao=(2.8,1.3),direcao=45,velocidade=(-1,0)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 0.9, Carro {posicao=(2.8,1.3),direcao=45,velocidade=(0,-1)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 0.9, Carro {posicao=(2.8,1.3),direcao=45,velocidade=(0.5,1)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 1, Carro {posicao=(2.8,1.3),direcao=45,velocidade=(0.5,0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],1, Carro {posicao=(3.6,3.3),direcao=45,velocidade=(0.5,0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],10, Carro {posicao=(2.5,3.3),direcao=45,velocidade=(-0.3,0.2)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] ,20, Carro {posicao=(2.5,3.3),direcao=45,velocidade=(-0.5,0.2)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] ,20, Carro {posicao=(2.5,3.3),direcao=45,velocidade=(-0.5,-0.4)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] ,1, Carro {posicao=(2.5,3.3),direcao=45,velocidade=(-0.4,-0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] ,2, Carro {posicao=(2.5,3.3),direcao=45,velocidade=(-0.4,-0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] ,3, Carro {posicao=(2.5,3.3),direcao=45,velocidade=(-0.4,-0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] ,4, Carro {posicao=(2.5,3.3),direcao=45,velocidade=(-0.4,-0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] ,5, Carro {posicao=(2.5,3.3),direcao=45,velocidade=(-0.4,-0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] ,6, Carro {posicao=(2.5,3.3),direcao=45,velocidade=(-0.4,-0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca (Curva Sul) (-1),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] ,10, Carro {posicao=(2.5,3.3),direcao=45,velocidade=(-0.4,-0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 0.01, Carro {posicao=(2.8,1.3),direcao=45,velocidade=(0,1.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 1, Carro {posicao=(2.8,1.3),direcao=45,velocidade=(1,0)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 1, Carro {posicao=(2.5,1.5),direcao=45,velocidade=(1,0)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 1, Carro {posicao=(2.5,3.5),direcao=45,velocidade=(0.5,-0.6)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 1, Carro {posicao=(2.5,3.5),direcao=45,velocidade=(0.5,0.6)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 1, Carro {posicao=(2.5,3.5),direcao=45,velocidade=(-0.5,0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 1, Carro {posicao=(2.5,3.5),direcao=45,velocidade=(-0.5,-0.6)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 1, Carro {posicao=(2.5,3.5),direcao=45,velocidade=(0.6,-0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 1, Carro {posicao=(2.5,3.5),direcao=45,velocidade=(-0.6,0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 0.666, Carro {posicao=(2.5,3.5),direcao=45,velocidade=(0.6,0.5)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], 1, Carro {posicao=(2.5,3.5),direcao=45,velocidade=(-0.5,-0.3)}),
           ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]],0.5,Carro {posicao=(2,1),direcao=0,velocidade=(0,0)})]


-- | Cria o movimento do carro
movimenta :: Tabuleiro -> Tempo -> Carro -> Maybe Carro
movimenta m t c@(Carro (x,y) d v) = if t==0 
                                       then (Just c)
                                       else case car of
                                                  Nothing -> Nothing
                                                  Just x -> movimenta m time x
                  where peca = getPeca m (floor x, floor y)
                        inter = interaction m t c peca
                        car = maybeCarro $ fst inter
                        time = snd inter

-- | Devolve o carro sob a forma Maybe Carro
maybeCarro :: Carro -> Maybe Carro
maybeCarro (Carro (-1,-1) d v) = Nothing
maybeCarro c = Just c


-- | Escolhe os dois tipos de interações, se estamos numa curva ou não.
interaction :: Tabuleiro -> Tempo -> Carro ->Peca-> (Carro,Tempo)
interaction tab t carro pe@(Peca (Curva ori) a) = interactionCurve tab pe t carro 
interaction tab t carro pe = interactionSimple tab pe t carro 
 
-- | Modifica o carro de acordo com a interação. Função utilizada quando estamos numa peça que não é uma curva.                                         
interactionSimple :: Tabuleiro ->Peca -> Tempo -> Carro -> (Carro,Tempo)
interactionSimple tab pecaI t (Carro (x,y) d v@(v1,v2)) | t'>t = (Carro (givePoint t (x,y) v) d (v1,v2),0)
                                                        | state == "bounceR" = (Carro pointNormal d vector,t-t')
                                                        | state == "continue" = (Carro pointNormal d (v1,v2),t-t')
                                                        | otherwise = (Carro (-1,-1) d v,0)
                                                        where state = resultInteractionSimple pecaI peca
                                                              ((t',(peca,position)),i) = pecaTime tab (v1,v2) (x,y)
                                                              pointNormal = givePoint t' (x,y) v
                                                              vector = vectorImp v (x,y) (peca,position) i

-- | Dá o tipo de interação, representado por uma string, quando estamos em peças não curvas e de acordo para onde vamos.
resultInteractionSimple :: Peca -> Peca -> String
resultInteractionSimple (Peca _ a1) (Peca Lava a2) | a1 -a2 <= (-1) = "bounceR"
                                                   | otherwise = "dead"
resultInteractionSimple (Peca _ a)  (Peca (Rampa _) _) = "continue"
resultInteractionSimple (Peca _ a1) (Peca _ a2) | a1 -a2 < (-1) = "bounceR"
                                                | a1 - a2 >1 = "dead"
                                                | otherwise = "continue" 




-- | Modifica o carro de acordo com a interação. Função utilizada quando estamos numa curva.
interactionCurve :: Tabuleiro -> Peca -> Tempo -> Carro -> (Carro,Tempo)
interactionCurve tab pecaI t (Carro (x,y) d v@(v1,v2)) | state == "bounceC" && tempoN > t = (Carro (givePoint t (x,y) v) d v,0)
                                                       | state == "bounceC" = (Carro pointCurva d (vectorImp v (x,y) (pecaI,pos) 33),t-tempoN) 
                                                       | state == "continue" && t'>t = (Carro (givePoint t (x,y) v) d v,0)
                                                       | state == "continue" = (Carro pointNormal d v,t-t')
                                                       | state == "bounceR" && t' > t = (Carro (givePoint t (x,y) v) d v,0)
                                                       | state == "bounceR" = (Carro pointNormal d (vectorImp v (x,y) (peca,position) i),t-t')
                                                       | state == "deadC" && tempoN > t = (Carro (givePoint t (x,y) v) d v,0)
                                                       | state == "deadC" = (Carro (-1,-1) d v,0)
                                                       | state == "dead" && t'>t = (Carro (givePoint t (x,y) v) d v,0)
                                                       | otherwise = (Carro (-1,-1) d v,0)
                                                      where state  = resultInteractionCurva bool pecaI peca  
                                                            ((t',(peca,position)),i) = pecaTime tab (v1,v2) (x,y)
                                                            pos    = (floor x, floor y)
                                                            dist   = distBetween2P (x,y) (p1,p2)
                                                            tempoN = calculateTSDiagonal (v1,v2) dist 
                                                            pointCurva = givePoint tempoN (x,y) v
                                                            pointNormal = givePoint t' (x,y) v
                                                            bool = onDeadSpace tab (x+v1*2,y+v2*2) (pecaI,(floor x, floor y))
                                                            (p1,p2) = case (maybeIntersection ((x,y),(x+v1,y+v2)) (curvPoint pecaI pos)) of 
                                                                                Nothing -> (20000,20000)
                                                                                Just x -> x    


-- | Dá como output um booleano que indica se nos encontramos em cima ou para além do espaço permitido numa curva, ou seja se estamos no lado correto da diagonal.
onDeadSpace ::Tabuleiro-> Ponto ->(Peca,Posicao)-> Bool
onDeadSpace tab (x,y) (pe@(Peca (Curva ori) _),(z,w)) | ori == Este  || ori == Norte = (y<= (d*x)+b)     
                                                      | otherwise = (y>= (d*x)+b)
                                                      where ((p1,p2),(p3,p4)) = curvPoint pe (z,w)
                                                            d = (declive (p1,p2) (p3,p4))
                                                            b = (p4-(d*p3))
onDeadSpace tab _ _ = False           

-- |  Dá o tipo de interação, representado por uma string, quando estamos em peças curvas e de acordo para onde vamos.
resultInteractionCurva :: Bool -> Peca -> Peca -> String
resultInteractionCurva True (Peca _ a1) (Peca _ a2)  | a1 < a2   = "bounceC"
                                                     | otherwise = "deadC"
resultInteractionCurva False _ (Peca (Rampa _) _) = "continue"
resultInteractionCurva False (Peca _ a1) (Peca _ a2) | a1 == a2  = "continue"
                                                     | a1 - a2 <= (-1) = "bounceR"
                                                     | otherwise = "dead"

-- | Calcula o vetor resultante de uma colisão, dependendo do tipo de peça com que colidimos.
vectorImp :: Velocidade ->Ponto->(Peca,Posicao)->Int -> Velocidade
vectorImp (x,y) _ _ 11 = (x,-y)
vectorImp (x,y) _ _ 22 = (-x,y)
vectorImp (x,y) p info@((Peca (Curva ori) a),pos) int = (norma*(cos resultante) ,(norma * (-sin resultante)))
                                                        where norma = sqrt (x^2 + y^2)
                                                              resultante = angResultante (x,y) (Peca (Curva ori) a) ang
                                                              ang = calculaAngulo (x,y) p info 

-- | Calcula o ângulo de saída do carro, pós-colisão.
angResultante :: Velocidade -> Peca -> Double -> Double
angResultante (v1,v2) (Peca (Curva ori) a) ang | ori == Este && ang>=pi/4 && ((v1>0 && v2>=0)) = 7*pi/4 -ang
                                               | ori == Este && ang>=pi/4 && ((v1>=0 && v2<0)) = 3*pi/4+ang
                                               | ori == Este && ((v1>0 && v2>0) || (v1>0)) = 7*pi/4 - ang 
                                               | ori == Este && ((v1<0 && v2<0) || (v2<0)) = 3*pi/4 + ang 
                                               | ori == Norte && ang>=pi/4 && (v1<0 && v2<=0) = ang
                                               | ori == Norte && ang>=pi/4 && (v1<=0 && v2>0) = 5*pi/4 + ang
                                               | ori == Norte && ((v1<0 && v2>0) || v1<0 ) = ang
                                               | ori == Norte && ((v1<0 && v2<0) || v2<0 ) = 5*pi/4 + ang
                                               | ori == Oeste && ang>=pi/4 && (v1<=0 && v2>0) = 7*pi/4 + ang
                                               | ori == Oeste && ang>=pi/4 && (v1<0 && v2<=0) = ang
                                               | ori == Oeste && ((v1>0 && v2>0) || v1>0) = 7*pi/4 + ang
                                               | ori == Oeste && ((v1<0 && v2<0) || v2<0) = ang
                                               | ori == Sul && ang>=pi/4 && (v1>=0 && v2<0) = pi/4 + ang
                                               | ori == Sul && ang<=pi/4 && (v1>0 && v2>=0) = 5*pi/4 -ang
                                               | ori == Sul && ((v1<0 && v2>0) || v1<0) = 5*pi/4 - ang
                                               | otherwise = pi/4 +ang     

-- | Calcula o ângulo formado entre a reta que representa o movimento do carro e a reta diagonal, para a qual vamos colidir. 
calculaAngulo :: Velocidade -> Ponto -> (Peca,Posicao) -> Double
calculaAngulo (x,y) p@(p1,p2) (pe@(Peca (Curva ori) _),(a,b)) | dV == 0 = atan $ abs(1/dC)  
                                                              | otherwise = atan $ abs $ (dV-dC)/(1+(dV*dC))
                                                                  where ((px,py),(pz,pw)) = curvPoint pe (a,b) -- pontos da curva
                                                                        dV = declive (p1,p2) (p1+x,p2+y)
                                                                        dC = declive (px,py) (pz,pw) 
-- | Calcula o declive de uma reta.
declive :: Ponto -> Ponto -> Double
declive (x,y) (z,w) | ((w-y)==0 || (z-x)==0) = 0
                    | otherwise = ((y-w)/(x-z))


-- | Calcula o novo ponto a partir da velocidade e do antigo ponto
givePoint :: Tempo->Ponto->Velocidade->Ponto
givePoint time (p1,p2) (v1,v2) = (p1+ (v1*time),p2 + (v2*time)) 






-- | Devolve o tempo que demora a chegar a um limite, a peça, a sua posição e um identificador sobre a disposição desta mesma, vertical, horizontal ou diagonal.                                      
-- 1 -- lado Este e Sul
-- 2 -- lado Norte e Oeste
-- 3 -- lado Este e Norte
-- 4 -- lado Oeste e Sul
pecaTime :: Tabuleiro -> Velocidade ->Ponto->((Tempo,(Peca,Posicao)),Int)
pecaTime tab (v1,v2) p | v1>=0 && v2>=0 = choosePeca (timePair (showPeca tab 1 p) 1 (v1,v2) p)     
                       | v1<=0 && v2<=0 = choosePeca (timePair (showPeca tab 2 p) 2 (v1,v2) p)
                       | v1>=0 && v2<=0 = choosePeca (timePair (showPeca tab 3 p) 3 (v1,v2) p)
                       | v1<=0 && v2>=0 = choosePeca (timePair (showPeca tab 4 p) 4 (v1,v2) p)
                       | otherwise = choosePeca (timePair (showPeca tab 1 p) 1 (v1,v2) p)


 
-- | Retira uma altura de uma peca
getHeigth :: Peca -> Int
getHeigth (Peca _ alt) = alt

-- | Dá como output um par com a informação das duas possíveis peças para onde podemos ir e a sua posição, de acordo com a velocidade.
showPeca :: Tabuleiro -> Int -> Ponto -> ((Peca,Posicao),(Peca,Posicao))
showPeca tab 1 (x,y) = (((getPeca tab (remendaceiling x, floor y)),(remendaceiling x, floor y)), ((getPeca tab (floor x, remendaceiling y)),(floor x, remendaceiling y)))
showPeca tab 2 (x,y) = (((getPeca tab (remendafloor x,floor y)),(remendafloor x, floor y)), ((getPeca tab (floor x, remendafloor y)),(floor x, remendafloor y)))
showPeca tab 3 (x,y) = (((getPeca tab (remendaceiling x, floor y)),(remendaceiling x,floor y)), ((getPeca tab (floor x, remendafloor y)),(floor x, remendafloor y)))
showPeca tab 4 (x,y) = (((getPeca tab (remendafloor x, floor y)),(remendafloor x,floor y)), ((getPeca tab (floor x, remendaceiling y)),(floor x, ceiling y)))


-- | Escolhe o limite da peça para o qual vamos, em função do que demora menos tempo.
choosePeca ::((Tempo,(Peca,Posicao)),(Tempo,(Peca,Posicao)))->((Tempo,(Peca,Posicao)),Int)
choosePeca ((time1,pe1),(time2,pe2))  | cseTime time1 time2 = ((time1,pe1),int1)    
                                      | otherwise = ((time2,pe2),int2)
                                        where int1 = if (isCurva $ fst $ pe1 ) then 32 else 22
                                              int2 = if (isCurva $ fst $ pe2 ) then 31 else 11


-- | Calcula o tempo menor.
cseTime :: Tempo -> Tempo -> Bool 
cseTime 0 t = False
cseTime t 0 = True
cseTime t1 t2 = if t1<t2 then True else False

-- | Verifica se a peça é uma curva.
isCurva :: Peca -> Bool 
isCurva (Peca (Curva _) _) = True
isCurva _ = False


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

-- | Função auxiliar para arredondar um double
remendaceiling :: Double -> Int
remendaceiling x = if (fromIntegral (ceiling x) == x) then (ceiling x + 1) else ceiling x               

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

-- | Efetua o calculo da distância
dist :: Int -> Double -> Double
dist x p = abs(fromIntegral x - p)

-- | Verifica se nos encontramos em cima de um limite
equalLimit:: Double->Bool
equalLimit x = if ((x==fromIntegral (ceiling x)) || (x==fromIntegral (floor x))) then True else False 

-- | Calcula o tempo da Curva
timeCurve :: Tempo -> Tempo -> Tempo
timeCurve tempo1 tempoc = tempo1+tempoc

-- | Calcula o ponto de interseção entre a reta vetorial e a diagonal de uma curva
maybeIntersection :: Line -> Line -> Maybe Ponto
maybeIntersection ((ax, ay), (bx, by)) ((px, py), (qx, qy)) =
  let (pqDX, abDX) = (px - qx, ax - bx)
      (pqDY, abDY) = (py - qy, ay - by)
      determinant = abDX * pqDY - abDY * pqDX
      f pq ab =
        ((((ax * by) - (ay * bx)) * pq) - 
         (((px * qy) - (py * qx)) * ab)) /
        determinant
  in case determinant of
       0 -> Nothing
       _ -> Just (f pqDX abDX, f pqDY abDY)
  



-- | Calcula o par de pontos que pertencem a uma diagonal
curvPoint :: Peca ->(Int,Int) -> (Ponto,Ponto)
curvPoint (Peca (Curva Norte) _) (p1,p2) = ((fI(p1+1), fI p2),(fI p1,fI (p2+1)))
                                      
curvPoint (Peca (Curva Sul) _) (p1,p2)   = ((fI (p1+1) ,fI p2),(fI p1,fI (p2+1)))
                                            
curvPoint (Peca (Curva Oeste) _) (p1,p2) = ((fI p1,fI p2), (fI (p1+1),fI (p2+1)))

curvPoint (Peca (Curva Este) _) (p1,p2)  = ((fI p1, fI p2),(fI (p1+1),fI (p2+1)))

-- | Função fromIntegral
fI :: (Num b, Integral a) => a -> b
fI x = fromIntegral x

-- | Acede a uma peça do tabuleiro 
getPeca :: Tabuleiro -> Posicao-> Peca
getPeca tab (x,y) = (tab !! y) !! x 
                

