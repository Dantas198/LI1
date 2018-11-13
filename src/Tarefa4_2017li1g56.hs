{-|
Module      : Tarefa4_2017li1g56
Description : Módulo da Tarefa 4 para LI1 17/18

Módulo para a realização da Tarefa 4 de LI1 em 2017/18.
-}
module Tarefa4_2017li1g56 where

import LI11718
import Data.Maybe


{-|
O testes a serem considerados pelo sistema de /feedback/
para a função 'atualiza'.
-}
testesT4 :: [(Tempo,Jogo,Acao)]
testesT4 = [(0.2,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0))] [1,1,1,1] [[],[],[],[]]),(Acao True False True False (Just 1))),
            (1,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 130 (0,-1)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0))] [1,1,1,1] [[],[],[],[]]),(Acao True True True False (Just 0))),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 39 (0.5,0.5)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0))] [1,1,1,1] [[(2,1)],[(2,1)],[(2,1)],[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 0 3 4 2 15 180) [(Carro (2,1) 39 (0.5,0.5)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0))] [1,1,1,1] [[(2,1)],[(2,1)],[(2,1)],[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (3,2) 39 (0.5,0.5)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0))] [1,1,1,1] [[(2,1)],[(2,1)],[(2,1)],[(2,1)]]),(Acao True False True False Nothing)),           
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (3,2) 39 (0.5,-0.5)),(Carro (2,1) 270 (0.5,-0.5)),(Carro (2,1) 315 (0.5,0.5)),(Carro (2,1) 300 (-1,0))] [1,1,1,1] [[(2,1)],[(2,1)],[(2,1)],[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (1.2,2.2) 185 (-0.5,0.5)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0))] [1,1,1,1] [[(2,1)],[(2,1)],[(2,1)],[(2,1)]]),(Acao False True False True Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 70 (0.5,-0.5)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0)),(Carro (2,1) 0 (0,0))] [1,1,1,1] [[(2,1)],[(2,1)],[(2,1)],[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 100 (0.5,-0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 200 (0.5,-0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 300 (0.5,-0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 39 (-0.5,-0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 100 (-0.5,-0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 150 (-0.5,-0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 200 (-0.5,-0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 280 (-0.5,-0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 220 (-0.5,0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 39 (-0.5,0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 100 (-0.5,0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 250 (-0.5,0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 300 (-0.5,0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 100 (0.5,0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 200 (0.5,0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 300 (0.5,0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 360 (0.5,0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 0 (0.5,0.5))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 0 (1,0))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 0 (0,-1))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 0 (-1,0))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 0 (0,1))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 90 (1,0))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 90 (0,-1))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 90 (-1,0))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 90 (0,1))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 180 (1,0))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 180 (0,-1))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 180 (-1,0))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 180 (0,1))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 270 (1,0))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 270 (0,-1))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 270 (-1,0))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 270 (0,1))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 360 (-1,0))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (1,2) 94 (-0.2,-1))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (1,2) 230 (0,1))] [1] [[(2,1)]]),(Acao True False True False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 60 (1,1))] [1] [[(2,1)]]),(Acao True True True True Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 60 (1,1))] [1] [[(2,1)]]),(Acao True True True True (Just 0))),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 60 (1,1))] [1] [[(2,1)]]),(Acao True True False False Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 60 (1,1))] [1] [[(2,1)]]),(Acao False False True True Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 60 (1,1))] [1] [[(2,1)]]),(Acao False True True True Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 60 (1,1))] [1] [[(2,1)]]),(Acao True False True True Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 30 (1,1)),(Carro (3,1) 90 (0,0))] [0,1] [[(4,2),(2,1)],[(3,1),(1,1)]]),(Acao True False False False (Just 1))),
            (1.2,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 40 (1,1))] [1] [[(2,1)]]),(Acao True True True True (Just 0))),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 60 (1,1))] [1] [[(2,1)]]),(Acao True True True True Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) (-400) (1,1))] [1] [[(2,1)]]),(Acao True False False True Nothing)),
            (0.5,(Jogo (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]) (Propriedades 2 3 4 2 15 180) [(Carro (2,1) 1000 (1,1))] [1] [[(2,1)]]),(Acao False True True False Nothing))]



{-|
Função usada para atualizar o estado do jogo dadas as
ações de um jogador num determinado período de tempo.
-}
atualiza :: Tempo -- ^ a duração da ação
         -> Jogo  -- ^ o estado do jogo
         -> Int   -- ^ o identificador do jogador
         -> Acao  -- ^ a ação tomada pelo jogador
         -> Jogo  -- ^ o estado atualizado do jogo
atualiza t j e a | verificaCarro e j && verificaNitros j a = convertToDegrees atual 
                 | verificaCarro e j = convertToDegrees atualException
                 | otherwise = j
                   where vetor = modificaVector t jogo e a
                         nitro = modificaNitros t vetor e a
                         direcao = modificaDirection t nitro e a
                         atual = modificaHistorico direcao e
                         atualException = modificaHistorico (modificaDirection t vetor e a) e
                         jogo = convertToRadians j 
                            

{- | Converte a direção de graus para radianos-}
convertToRadians :: Jogo -> Jogo
convertToRadians (Jogo m p c n hist) = Jogo m p (radians c) n hist

{- | Função auxiliar para a conversão de graus para radianos-}
radians :: [Carro] -> [Carro] 
radians [] = []
radians (Carro p deg v:t) = (Carro p (deg * (pi/180)) v) : radians t

{- | Converte a direção de radianos para graus-}
convertToDegrees :: Jogo -> Jogo
convertToDegrees (Jogo m p c n hist) = Jogo m p (degrees c) n hist

{- | Função auxiliar para a conversão de radianos para graus-}
degrees :: [Carro] -> [Carro] 
degrees [] = []
degrees ((Carro p rad v):t) = [Carro p (rad *(180/pi)) v] ++ degrees t                                                    

{- | Verifica se existe um carro identificado pelo Int recebido-}
verificaCarro :: Int -> Jogo -> Bool
verificaCarro x (Jogo m p c n hist) = (x <= length c) && (x <= length hist)

{- | Verifica se existe o nitro identificado pelo Int recebido-}
verificaNitros :: Jogo ->Acao-> Bool
verificaNitros (Jogo m p c n hist) (Acao _ _ _ _ Nothing) = True
verificaNitros (Jogo m p c n hist) (Acao _ _ _ _ (Just e)) = e<length n  


{- | Função principal para modificar o histórico de um carro-}
modificaHistorico :: Jogo -> Int -> Jogo
modificaHistorico (Jogo m p c n hist) e = Jogo m p c n (callUponHistorico carro 0 e hist) 
                                        where carro = callUponCarro c 0 e 

{- | Função auxiliar da modificação do histórico, que encontra na lista de históricos o que vai ser alterado-}
callUponHistorico :: Carro -> Int -> Int-> [[Posicao]] -> [[Posicao]]
callUponHistorico carro indice e [[]] = if e==indice then [putH carro []] else [[]] 
callUponHistorico carro indice e (h:ts) | e==indice = putH carro h:ts 
                                        | otherwise = h:callUponHistorico carro (indice+1) e ts

                                    
{- | Função auxiliar que encontra o carro de acordo com um Int numa lista de carros-}
callUponCarro :: [Carro] -> Int -> Int -> Carro
callUponCarro (h:ts) indice e = if indice == e then h else callUponCarro ts (indice+1) e

{- | Coloca a nova posição do carro no histórico-}
putH :: Carro -> [Posicao] -> [Posicao]
putH (Carro (x,y) d (v1,v2)) [] = [(floor x, floor y)]
putH (Carro (x,y) d (v1,v2)) l = if (x2 == p1) && (y2 == p2) then l else [(x2,y2)] ++ l
                                where (x2,y2) = (floor x, floor y)
                                      (p1,p2) = head l 


{- | Função principal para alterar a direção do carro-}
modificaDirection :: Tempo -> Jogo -> Int -> Acao -> Jogo
modificaDirection t (Jogo m p c n hist) indice a = Jogo m p carro n hist
                                                    where carro = callUponDir (0,t,indice) p c a 

{- | Função auxiliar que encontra o carro a ser alterado-}
callUponDir :: (Int,Tempo,Int) ->Propriedades-> [Carro] -> Acao -> [Carro]
callUponDir (x,t,i) p (c:ct) a | i==x = changeDir t p c a : ct 
                               | otherwise = c:callUponDir (x+1,t,i) p ct a

{- | Muda a direção do carro de acordo com a ação-}
changeDir :: Tempo -> Propriedades -> Carro -> Acao -> Carro 
changeDir t (Propriedades atr pns acel pe ni ro) (Carro xy rad v) (Acao a trav esq dir n) | esq && dir = Carro xy rad v
                                                                                          | dir = Carro xy newDir v
                                                                                          | esq = Carro xy newEsq v
                                                                                          | otherwise = Carro xy rad v
                                                                                          where roda = ro*(pi/180)*t
                                                                                                newDir = rad-roda 
                                                                                                newEsq = rad+roda  


{- | Função principal que modifica o nitro-}
modificaNitros :: Tempo -> Jogo -> Int -> Acao -> Jogo
modificaNitros t (Jogo m p c n hist) indice a = Jogo m p carro nitros hist
                                                    where nitros = callUponNitroTimeD (0,t,indice) n a
                                                          tempoUtil = callUponNitroUsefulT (0,t,indice) n a 
                                                          carro = callUponNitro (0,indice,t,tempoUtil) p c a 

{- | Função auxiliar que encontra o carro onde foi colocado o nitro-}
callUponNitro :: (Int,Int,Tempo,Tempo)->Propriedades-> [Carro] -> Acao -> [Carro]
callUponNitro (n,indice,t,tempU) p [] (Acao a trav esq dir Nothing) = []
callUponNitro (n,indice,t,tempU) p (c:ct) (Acao a trav esq dir Nothing) = c:ct
callUponNitro (n,indice,t,tempU) p (c:ct) (Acao a trav esq dir (Just j)) | j==n = putNitro (indice,j) tempU c (a,p):ct 
                                                                         | otherwise = c:callUponNitro (n+1,indice,t,tempU) p ct (Acao a trav esq dir (Just j))

{- | Modifica o carro onde foi inserido o nitro-}                                                                            
putNitro :: (Int,Int) -> Tempo ->Carro -> (Bool,Propriedades) -> Carro -- o bool serve para ver se está a acelerar
putNitro (indice,j) tempU c (acel,p) =  putInSame tempU p c   

{- | Calcula o vetor mofificado pelo nitro e modifica o carro-}
putInSame :: Tempo -> Propriedades -> Carro -> Carro
putInSame t (Propriedades atr pns acel pe ni ro) (Carro (x,y) d (v1,v2)) = Carro (x,y) d (v1 + compN1, v2 + compN2)
                                                                          where compN1 = (ni*t) * cos d
                                                                                compN2 = (ni*t) * (-sin d)

{- | Função principal para alterar a lista de tempos do nitro-}
callUponNitroTimeD :: (Int,Tempo,Int) -> [Tempo] -> Acao -> [Tempo]
callUponNitroTimeD (x,t,i) (n:nt) (Acao a trav esq dir Nothing) = n:nt
callUponNitroTimeD (x,t,i) (n:nt) (Acao a trav esq dir (Just j)) | i==x = dec n t:nt 
                                                                 | otherwise = n:callUponNitroTimeD (x+1,t,i) nt (Acao a trav esq dir (Just j)) 

{- | Fornece o tempo útil de utilização do nitro-}
callUponNitroUsefulT :: (Int,Tempo,Int) -> [Tempo] -> Acao -> Tempo
callUponNitroUsefulT (x,t,i) (n:nt) (Acao a trav esq dir Nothing) = 0 
callUponNitroUsefulT (x,t,i) (n:nt) (Acao a trav esq dir (Just j)) | i==x = tempoUtil n t 
                                                                   | otherwise = callUponNitroUsefulT (x+1,t,i) nt (Acao a trav esq dir (Just j)) 
{- | Devolve o tempo resultante da utilização do nitro-}
dec :: Tempo -> Tempo -> Tempo
dec t1 t2 = if t2>t1 then 0 else t1-t2 

{- | Devolve o tempo útil-}
tempoUtil :: Tempo -> Tempo -> Tempo
tempoUtil t1 t2 = if t2>t1 then t1 else t2


{- | Função principal que atualiza o vetor do carro-}
modificaVector ::Tempo -> Jogo -> Int -> Acao -> Jogo
modificaVector t (Jogo m p c nitro hist) indice a = Jogo m p (callUponVector(0,indice,t) (m,p) c a) nitro hist   

{- | Função auxiliar que encontra o carro que vamos atualizar-}
callUponVector :: (Int,Int,Tempo) -> (Mapa, Propriedades) -> [Carro] -> Acao -> [Carro]
callUponVector (n,indice,t) (m,p) [] a = []
callUponVector (n,indice,t) (m,p) (h:ts) a | n==indice = carroWvector:ts
                                           | otherwise = h:callUponVector (n+1,indice,t) (m,p) ts a
                                            where carroWvector = vetorResultante t (m,p) h a

{- | Devolve o carro com o vetor já modificado-}
vetorResultante :: Tempo -> (Mapa,Propriedades) -> Carro -> Acao -> Carro
vetorResultante t (m,p@(Propriedades atr pns acel pe ni ro)) c@(Carro xy d (v1,v2)) (Acao a trav esq dir n) = 
                                                                Carro xy d (v1+atrx+acelx+travx+viraCx+g1, v2+atry+acely+travy+viraCy+g2)
                                                                        where (atrx, atry) = atritoC t atr (v1,v2)
                                                                              (acelx, acely) = if a then acelerA t p c else (0,0)
                                                                              (travx, travy) = if trav then travA t p c else (0,0) 
                                                                              (viraCx, viraCy) = vira t p c 
                                                                              (g1,g2) = verificaGravidade t (m,p) c


{- | Calcula as componentes da aceleração do carro -}
acelerA :: Tempo -> Propriedades -> Carro -> Velocidade
acelerA t (Propriedades atr pns acel pe ni ro) (Carro (x,y) d (v1,v2)) = (t*(acel * cos d), t*(acel * (-sin d)))

{- | Calcula as componentes da travagem do carro-}
travA :: Tempo -> Propriedades -> Carro -> Velocidade
travA t (Propriedades atr pns acel pe ni ro) (Carro (x,y) d (v1,v2)) = (-(t*(acel * cos d)), -(t*(acel * (-sin d))))

{- | Calcula as componentes do atrito do carro-}
atritoC :: Tempo -> Double -> Velocidade -> Velocidade
atritoC t atr (v1,v2) = (atrx,atry)
                        where atrx= if v1<0 then atr* t* abs v1 else atr*t*(-v1)
                              atry=if v2<0 then atr* t* abs v2 else atr*t*(-v2)       

{- | Calcula as componentes da viragem do carro-}
vira :: Tempo -> Propriedades -> Carro -> Velocidade
vira t (Propriedades atr pns acel pe ni ro) (Carro (x,y) d (v1,v2)) = (valor * cos newA, valor * (-sin newA ))
                                                                       where angle = angleViragem (v1,v2) d 
                                                                             newA = calculaAngulo (v1,v2) d 
                                                                             valor = sin angle * pns * t * sqrt( (v1^2)+(v2^2))

{- | Calcula o angulo da força dos pneus-}
calculaAngulo :: Velocidade -> Angulo -> Angulo
calculaAngulo (v1,v2) d | (v1>0 && v2>0) && (dir<=pi/2 && dir>=0) = angForcaP d 0 (pi/2) 
                        | (v1>0 && v2<0) && (dir>=3*pi/2 && dir<2*pi) = angForcaP d 1 (pi/2)
                        | (v1<0 && v2>0) && (dir<=pi/2 && dir>=0) = angForcaP d 0 (pi/2)
                        | (v1>0 && v2<0) && (dir>=pi && dir<=3*pi/2) = angForcaP d 0 (pi/2) --
                        | (v1>0 && v2>0) && (dir>=pi/2 && dir<=pi) = angForcaP d 0 (pi/2)
                        | (v1<0 && v2<0) && (dir>=3*pi/2 && dir<=2*pi) = angForcaP d 0 (pi/2) --
                        | dir>=anguloVel = angForcaP d 0 (pi/2)  --ver o maior ou igual
                        | otherwise = angForcaP d 1 (pi/2)
                        where dir = case normalizaDirecao d of
                                        0 -> if anguloVel <= pi then 0 else 2*pi
                                        x -> x 
                              anguloVel = biggest (v1,v2) (1,0) d 
                              (ang1,ang2) = (cos dir, -sin dir)


{- | Calcula a direção normalizada do carro-}
normalizaDirecao :: Angulo -> Angulo
normalizaDirecao ang | ang<=2*pi && ang>=0 = ang
                     | ang>2*pi = normalizaDirecao (ang-(2*pi))
                     | otherwise = normalizaDirecao (ang+(2*pi))

{- | Soma ou subtrai o angulo da força dos pneus ao angulo da direçãp-}
angForcaP :: Angulo -> Int -> Angulo -> Angulo
angForcaP d 1 x = if (d-x)<0 then 2*pi-(x - d) else d-x
angForcaP d 0 x = if (d+x)>2*pi then d+x-(2*pi) else d+x

{- | Calcula o angulo do vetor velocidade-}
biggest :: Velocidade -> Velocidade ->Angulo -> Angulo
biggest (v1x,v1y) (v2x,v2y) d  
 | ang < 0 = (2*pi)+ang
 | dir>pi && ang==0 = 2*pi
 | otherwise = ang
 where ang = atan2 det dot
       dot = v1x*v2x + v1y*v2y
       det = v1x*v2y - v1y*v2x
       dir = normalizaDirecao d

{- | Calcula o angulo entre a direção e a velocidade-}
angleViragem :: Velocidade -> Angulo -> Angulo
angleViragem  (v1,v2) rad | (v1*r1 + v2*r2)==0 = pi/2
                          | (v1*r1 + v2*r2)==(-1) = pi
                          | (v1*r1 + v2*r2)==1 = 0
                          | otherwise = angle
                          where (r1,r2) = (cos rad, -sin rad)
                                norma1 = sqrt(r1^2 + r2^2)
                                norma2 = sqrt(v1^2 + v2^2)
                                angle = acos ((v1*r1 + v2*r2)/ (norma1 * norma2))


{- | verifica se o carro está numa rampa, dando como resultado o vetor da gravidade da rampa -}
verificaGravidade ::Tempo -> (Mapa,Propriedades) -> Carro -> Velocidade
verificaGravidade t (Mapa _ (h:ts), Propriedades _ _ _ peso _ _) (Carro (p1,p2) d (v1,v2)) = case check of
                                                                                                  Nothing -> (0,0)
                                                                                                  Just x -> x
                                                                                              where check = isRamp (takePosMaybe (x,y) (h:ts) (c,l)) t peso 
                                                                                                    (x,y) = (floor p1, floor p2)
                                                                                                    c = length h 
                                                                                                    l = length (h:ts) 

{- | verifica se uma peça é uma rampa-}
isRamp ::Maybe Peca -> Tempo -> Double -> Maybe Velocidade
isRamp (Just (Peca (Rampa ori) a)) t peso = Just $ daGravidade ori t peso
isRamp _ _ _ = Nothing


{-| calcula o vetor gravidade de acordo com a orientação da rampa-}
daGravidade :: Orientacao ->Tempo -> Double-> Velocidade
daGravidade ori _ 0 = (0,0)
daGravidade ori t peso | ori == Norte = (0,gravidadeV)
                       | ori == Sul  = (0,-gravidadeV)
                       | ori == Este  = (-gravidadeV,0)
                       | ori == Oeste = (gravidadeV,0)
                        where gravidadeV = t*(peso * sin (pi/2))
                              --gravidadeH = t*(peso * cos (pi/2))

-- | Acede a uma peça do mapa tendo em atenção se o local que queremos aceder é válido
takePosMaybe :: Posicao ->Tabuleiro->(Int,Int)-> Maybe Peca
takePosMaybe (x,y) l (column,line) =  if (x>(column-1)) || (y>(line-1)) || (x<0) || (y<0) then Nothing else Just ((l !! y ) !! x)
