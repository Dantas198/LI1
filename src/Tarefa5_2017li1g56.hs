{-|
Module      : Tarefa5_2017li1g56
Description : Módulo da Tarefa 5 para LI1 17/18

Módulo para a realização da Tarefa 5 de LI1 em 2017/18.
-}
module Main where

import LI11718
import Graphics.Gloss
import Graphics.Gloss.Data.Picture      
import Graphics.Gloss.Interface.Pure.Game
import System.Environment
import Graphics.Gloss.Data.Color
import Graphics.Gloss.Data.Bitmap
import Graphics.Gloss.Interface.IO.Game
import Data.Maybe
import Data.Char
import GHC.Float

import Tarefa1_2017li1g56
import Tarefa2_2017li1g56
import Tarefa3_2017li1g56
import Tarefa4_2017li1g56
import Tarefa6_2017li1g56

-- | tipo que contém toda a informação necessária para o jogo.

type Estado = ((String,Bool),(Float,Float),(Picture,Picture),[[Picture]],(Float,String,Int,Int),[Propriedades],[Jogo],[Acao])
{-|
Função principal usada para animar um jogo completo.
Compilar com o GHC.
-}
-- | O estado inicial do jogo.
-- Carrega as imagens do jogo e define os outros parâmetros.
mapaTreino = constroi [Avanca,Avanca,CurvaDir,Avanca,Desce,Avanca,CurvaDir,CurvaEsq,CurvaEsq,Sobe,Avanca,CurvaEsq,Sobe,Avanca,Avanca,Avanca,Avanca,Avanca,CurvaEsq,Desce,Desce,Avanca,Avanca,Avanca,CurvaEsq,Sobe,CurvaEsq,Avanca]
mapaCompetitivo = constroi [Avanca,Desce,Avanca,Avanca,CurvaDir,Avanca,Avanca,Avanca,CurvaDir,Avanca,Avanca,Avanca,Avanca,CurvaDir,Avanca,Avanca,Sobe,CurvaDir]

estadoInicial :: IO Estado
estadoInicial = do
    relva  <- loadBMP "Imagens/erva2.bmp"
    agua   <- loadBMP "Imagens/water.bmp"
    areia  <- loadBMP "Imagens/sand.bmp"
    carro1  <- loadBMP "Imagens/redcar.bmp"
    carro2 <- loadBMP "Imagens/greencar.bmp"
    retaA  <- loadBMP "Imagens/road.bmp"
    retaD  <- loadBMP "Imagens/dirt.bmp" 
    retaI  <- loadBMP "Imagens/ice.bmp"
    curvaA <- loadBMP "Imagens/curvaAsphalt.bmp"
    curvaD <- loadBMP "Imagens/curvaDirt.bmp"
    curvaI <- loadBMP "Imagens/curvaIce.bmp"
    rampaA <- loadBMP "Imagens/roadRampa.bmp"
    rampaD <- loadBMP "Imagens/dirtRampa.bmp" 
    rampaI <- loadBMP "Imagens/rampaIce.bmp"
    bar1 <- loadBMP "Imagens/bars.bmp"
    bar2 <- loadBMP "Imagens/bars(1).bmp"
    bar3 <- loadBMP "Imagens/bars(2).bmp"
    bar4 <- loadBMP "Imagens/bars(3).bmp"
    clock <- loadBMP "Imagens/clock.bmp"
    relvaW <- loadBMP "Imagens/relvaW.bmp"
    areiaW <- loadBMP "Imagens/areiaW.bmp"
    aguaW <- loadBMP "Imagens/aguaW.bmp"
    return (("p",True),
            (600,600),
            (carro1,carro2),
            [[retaA,relva,curvaA,rampaA,relvaW],[retaI,agua,curvaI,rampaI,aguaW],[retaD,areia,curvaD,rampaD,areiaW],[bar1,bar2,bar3,bar4,clock]],
            (0,"main",1,1),
            [Propriedades 4 5 8 4 10 120,Propriedades 0.3 0.4 2 1.5 15 270,Propriedades 2 3 4 2 15 180],
            [Jogo mapaCompetitivo (Propriedades 0 0 0 0 0 0) [(Carro (2,1.3) 0 (0,0)),(Carro (2,1.6) 0 (0,0))] [10,10] [[(2,1)],[(2,1)]],
             Jogo mapaTreino (Propriedades 0 0 0 0 0 0) [(Carro (2,3.5) 0 (0,0))] [10] [[(2,3)]]],
            [Acao False False False False Nothing,Acao False False False False Nothing])
                        
-- | Função que desenha o jogo. Desenha a borda, o tabuleiro, os carros, as informações e ainda os menus.
desenhaEstado :: Estado -> Picture
desenhaEstado ((m,bool),(xMapa,yMapa),carros,pics,(t,"jogo",int,i),prop,[j@(Jogo mapaInicial p c nit hist)],a) | null c = Pictures  ([borda] ++ [tabuleiro] ++info)
                                                                                                               | otherwise = Pictures  ([borda] ++ [tabuleiro] ++ car ++info)
                                                                                      where borda = if m== "p" 
                                                                                                       then Translate (-1000) (-1000) $Scale 2 2 $  Color white (Polygon [(0,0),(0,1000),( 1000, 1000),(1000,0)])
                                                                                                       else Translate (-(xMapa)/2) (-(yMapa+100)/2) $ Color white (Polygon [(0,0),(0,1000),( 800, 1000),(800,0)])
                                                                                            tabuleiro = if m=="p"
                                                                                                           then Translate (50-35/2) (-50-25/2) $ drawMap m mapaInicial (choosePicture pics i) c 
                                                                                                           else Translate (-xMapa/2-150) (yMapa/2) $ drawMap m mapaInicial (choosePicture pics i) c 
                                                                                            car = if m=="p" 
                                                                                                     then figura (m,bool) (-35/2,-25/2) c carros
                                                                                                     else figura (m,bool) ((-xMapa/2-200),(yMapa/2)+50) c carros
                                                                                            info =  if m=="p"
                                                                                                       then []
                                                                                                       else gameInfo j t (choosePicture pics 4)
desenhaEstado (m,(xMapa,yMapa),carros,pics,(t,estado,int,i),prop,j,a) = Pictures  $ map (Translate (-xMapa/2) (-yMapa/2)) (desenhaInteracoes estado int)                                                                                           


-- | Desenha os dois carros do jogo e enquadra-os com o mapa.
figura :: (String,Bool) -> (Float,Float)->[Carro] ->(Picture,Picture)->[Picture]
figura (_,_) (x,y) [] carros = []
figura ("p",_) (x,y) [Carro (p1,p2) d (v1,v2)] (carro1,carro2) = [Translate x y $ Rotate (- double2Float d) carro1]
figura (_,_) (x,y) [c1,c2] (carro1,carro2) = [Translate x y $ drawCarro c1 carro1, Translate x y $ drawCarro c2 carro2]
figura (_,True) (x,y) [c] (carro1,carro2) = [Translate x y $ drawCarro c carro1]
figura (_,False) (x,y) [c] (carro1,carro2) = [Translate x y $ drawCarro c carro2]

                                                                                                
                                                 
-- | Desenha um carro de acordo com a sua direção e a sua posição.
drawCarro ::Carro -> Picture -> Picture
drawCarro (Carro (x,y) d v) pic = Translate xx yy $ Rotate dir pic
                                where xx = double2Float (x * fromIntegral 100)
                                      yy = double2Float (y * fromIntegral (-100))
                                      dir = - double2Float d

-- | Desenha o mapa do jogo. No modo practice,"p", o mapa mexe-se e o carro não, nos outros modos é ao contrário.
drawMap :: String -> Mapa -> [Picture] ->[Carro] -> Picture
drawMap "p" (Mapa (_,_) table) pics []= Translate (-100*2) (100*3.5) $ Pictures $ drawTable "p" 0 0 pics table 
drawMap "p" (Mapa (_,_) table) pics c@[Carro (x,y) d v] = Translate (-px*100) (py*100)  $ Pictures $ drawTable "p" 0 0 pics table 
                                                            where px = double2Float x
                                                                  py = double2Float y
drawMap str (Mapa (_,_) table) pics c = Pictures $ drawTable str 0 0 pics table 


-- | Desenha um tabuleiro completo. 
drawTable :: String -> Int -> Int -> [Picture] -> Tabuleiro -> [Picture]
drawTable str x y pics [[]] = []
drawTable str x y pics ([]:t) = drawTable str 0 (y+1) pics t
drawTable str x y pics ((h:t):ts) = (Translate (fromIntegral x*100) (fromIntegral (y*(-100))) $ drawTile str pics h) :
                             drawTable str (x+1) y pics (t:ts)

-- | Desenha cada peça de acordo com uma imagem específica.
drawTile ::String -> [Picture]-> Peca -> Picture
drawTile str [reta,relva,curva,rampa,_] (Peca Lava x) = if str == "p" then whiteBlock else relva
drawTile str [reta,relva,curva,rampa,_] (Peca Recta x) = reta
drawTile str [reta,relva,curva,rampa,_] (Peca (Rampa Norte) x) = rampa
drawTile str [reta,relva,curva,rampa,_] (Peca (Rampa Sul) x) = Rotate 180 rampa 
drawTile str [reta,relva,curva,rampa,_] (Peca (Rampa Este) x) = Rotate 90 rampa 
drawTile str [reta,relva,curva,rampa,_] (Peca (Rampa Oeste) x) = Rotate (-90) rampa 
drawTile str [reta,relva,curva,rampa,white] (Peca (Curva Norte) x) = if str == "p" then Rotate (-180) white else Rotate (-180) curva  
drawTile str [reta,relva,curva,rampa,white] (Peca (Curva Sul) x) = if str == "p" then white else curva
drawTile str [reta,relva,curva,rampa,white] (Peca (Curva Este) x) = if str == "p" then Rotate (-90) white else Rotate (-90) curva 
drawTile str [reta,relva,curva,rampa,white] (Peca (Curva Oeste) x) =  if str == "p" then Rotate 90 white else Rotate 90 curva

-- | Bloco branco. Utilizado para desenhar o mapa.
whiteBlock :: Picture
whiteBlock = Color white (Polygon [(0,0),(0,1),(1,1),(1,0)])

-- | Escolhe a lista de Picture que vamos utilizar de acordo com um identificador.                                                              
choosePicture :: [[Picture]] -> Int -> [Picture]
choosePicture [a,i,d,m] int | int == 1 = a
                          | int == 2 = i
                          | int == 3 = d
                          | otherwise = m

-- | Escolhe as propriedades que vamos utilizar de acordo com um identificador
choosePropriedade ::[Jogo] -> [Propriedades] -> Int -> [Jogo]
choosePropriedade [j] [a,i,d] int | int == 1 = putPropriedades a j
                                  | int == 2 = putPropriedades i j
                                  | otherwise = putPropriedades d j

-- | Desenha as informações sobre o jogo atual, como o tempo geral e o nitro de cada jogador.
gameInfo :: Jogo -> Float -> [Picture] -> [Picture]
gameInfo (Jogo m p car [t1,t2] [h1,h2]) t [b1,b2,b3,b4,c] = [nitro1] ++ [nitro2] ++ [clock,time,p1,p2,n1,n2]  
                                                        where nitro1 = Pictures $ drawNitro t1 (380,70) [b1,b2,b3,b4]
                                                              nitro2 = Pictures $ drawNitro t2 (380,-130) [b1,b2,b3,b4]
                                                              clock  = Translate 340 280 c
                                                              time = Translate 380 260 $Scale 0.3 0.3 $ Text $ show t
                                                              p1 = Translate 310 130 $ Scale 0.2 0.2 $ Text "Player 1"
                                                              n1 = Translate 310 100 $ Scale 0.2 0.2 $ Text "Nitro" 
                                                              p2 = Translate 310 (-80) $ Scale 0.2 0.2 $ Text "Player 2"  
                                                              n2 = Translate 310 (-110) $ Scale 0.2 0.2 $ Text "Nitro" 
        

-- | Desenha o nitro de cada player.
drawNitro :: Tempo ->(Float,Float) -> [Picture] -> [Picture]
drawNitro n1 (x,y) [t1,t2,t3,t4] | n1 >= 7.5 = [Translate x y t1]
                                 | n1>= 5    = [Translate (x-dim) y t2]
                                 | n1>= 2.5  = [Translate (x-dim*2) y t3]
                                 | n1>0      = [Translate (x-dim*3) y t4]
                                 | otherwise = []
                                 where dim = 150/8

-- | Coloca uma determinada propriedade no jogo.
putPropriedades :: Propriedades -> Jogo -> [Jogo] 
putPropriedades prop (Jogo m p c h n) = [Jogo m prop c h n]

-- | Desnha os menus e o seu fundo.
desenhaInteracoes :: String -> Int -> [Picture]
desenhaInteracoes "jogo" _  = []
desenhaInteracoes estado int = fundoM : (options estado int)
                               
-- | Bloco que representa o fundo dos menus.
fundoM :: Picture
fundoM =  Color white (Polygon [(0,0),(0,600),(600,600),(600,0)])

-- | Escolhe o tipo de menu a desenhar.
options :: String -> Int -> [Picture]
options "main" i = mainOptions i 
options "menu" i = gameoptions i 
options "pausa" i = pausaOptions i
options "controlos" i = controls
options "modes" i = gameModes i  

{- | Desenha o menu principal -}
mainOptions :: Int -> [Picture]
mainOptions int  = [newgame,title,controls,seta] 
                    where title = Translate 20 450 $ Scale 0.58 0.58 $ Color red $ Text "Micro Machines"
                          newgame = Translate 130 280 $ Scale 0.5 0.5 $ Text "New Game"
                          controls = Translate 180 100 $ Scale 0.5 0.5 $ Text "Controls"
                          seta = if int ==1 
                                    then Translate 35 280 $ Color black $ Scale 0.5 0.5 $ Text "->"
                                    else Translate 35 100 $ Color black $ Scale 0.5 0.5 $ Text "->"


{- | Desenha o menu dos controlos-}
controls :: [Picture]
controls = [acelera,trava,direita,esquerda,nitro1,nitro2,pausa,escape]
                where acelera = Translate 50 450 $ Scale 0.2 0.2 $ Text "Up or W to accelerate"
                      trava   = Translate 50 400 $ Scale 0.2 0.2 $ Text "Down or S to break and reverse"
                      direita = Translate 50 350 $ Scale 0.2 0.2 $ Text "Left or A to turn left"
                      esquerda = Translate 50 300 $ Scale 0.2 0.2 $ Text "Right or D to turn right"
                      nitro1 = Translate 50 250 $ Scale 0.2 0.2 $ Text "M or C to use nitro on urself"
                      nitro2 = Translate 50 200 $ Scale 0.2 0.2 $ Text  "N or V use nitro on the other player"
                      pausa = Translate 50 150 $ Scale 0.2 0.2 $ Text  "P to pause the game"
                      escape = Translate 50 100 $ Scale 0.2 0.2 $ Text "E to escape and go to main menu"

{- | Desenha o menu dos modos de jogo-}
gameModes :: Int -> [Picture]
gameModes int = [competitiveBot,competitivePlayers,practice,seta]
              where dim = 400/3
                    competitiveBot = Translate 190 (dim*3) $ Scale 0.4 0.4 $ Text "1 vs Bot"
                    competitivePlayers = Translate 190 (dim*2) $ Scale 0.4 0.4 $ Text "1 vs 1"
                    practice = Translate 200 dim $ Scale 0.4 0.4 $ Text "Practice"
                    seta 
                      | int==1 = Translate 100 (dim*3) $ Scale 0.4 0.4 $ Text "->"
                      | int==2 = Translate 100 (dim*2) $ Scale 0.4 0.4 $ Text "->"
                      | otherwise =  Translate 100 dim $ Scale 0.4 0.4 $ Text "->"  

{- | Desenha o menu de escolha do tipo de terreno-}
gameoptions ::Int -> [Picture]
gameoptions int = [asphalt,ice,dirt,seta] 
                    where asphalt =  Translate 210 (dim*3) $ Color black $ Scale 0.4 0.4 $ Text "Asphalt"
                          ice = Translate 260 (dim*2) $ Color black $ Scale 0.4 0.4 $ Text "Ice"        
                          dirt =Translate 250 dim $ Color black $ Scale 0.4 0.4 $ Text "Dirt" 
                          seta 
                            | int==1 = Translate 130 (dim*3) $ Scale 0.4 0.4 $ Text "->"
                            | int==2 = Translate 130 (dim*2) $ Scale 0.4 0.4 $ Text "->"
                            | otherwise =  Translate 130 (dim) $ Scale 0.4 0.4 $ Text "->"  
                          dim = 400/3
                
                            
                                            
{- | Desenha o menu pausa-}
pausaOptions :: Int  -> [Picture]
pausaOptions int = [newgame,continue,seta] 
                    where newgame =Translate 190 200 $ Color black $ Scale 0.4 0.4 $ Text "New Game"  
                          continue = Translate 190 400 $ Color black $ Scale 0.5 0.5 $ Text "Continue"
                          seta = if int ==1 
                                    then Translate 50 400 $ Color black $ Scale 0.4 0.4 $ Text "->"
                                    else Translate 50 200 $ Color black $ Scale 0.4 0.4 $ Text "->"
                          


-- | Função que altera o estado do jogo quando acontece um evento.
reageEvento :: Event -> Estado -> Estado
--mainMenu 
reageEvento (EventKey (SpecialKey KeyDown)  Down _ _) (m,x,y,pics,(t,"main",2,i),p,j,a)   = (m,x,y,pics,(t,"main",2,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyDown)  Down _ _) (m,x,y,pics,(t,"main",1,i),p,j,a)   = (m,x,y,pics,(t,"main",2,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyUp)    Down _ _) (m,x,y,pics,(t,"main",2,i),p,j,a)   = (m,x,y,pics,(t,"main",1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyUp)    Down _ _) (m,x,y,pics,(t,"main",1,i),p,j,a)   = (m,x,y,pics,(t,"main",1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyRight) Down _ _) (m,x,y,pics,(t,"main",1,i),p,j,a) = (m,x,y,pics,(t,"modes",1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyRight) Down _ _) (m,x,y,pics,(t,"main",2,i),p,j,a) = (m,x,y,pics,(t,"controlos",2,i),p,j,a)
--controlos
reageEvento (EventKey (Char 'e') Down _ _) (m,x,y,pics,(t,"controlos",int,i),p,j,a) = (m,x,y,pics,(t,"main",1,i),p,j,a)

--gameModes
reageEvento (EventKey (SpecialKey KeyDown)  Down _ _) (m,x,y,pics,(t,"modes",3,i),p,j,a)   = (m,x,y,pics,(t,"modes",3,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyDown)  Down _ _) (m,x,y,pics,(t,"modes",int,i),p,j,a)   = (m,x,y,pics,(t,"modes",int+1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyUp)  Down _ _) (m,x,y,pics,(t,"modes",1,i),p,j,a)   = (m,x,y,pics,(t,"modes",1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyUp)  Down _ _) (m,x,y,pics,(t,"modes",int,i),p,j,a)   = (m,x,y,pics,(t,"modes",int-1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyRight)  Down _ _) (m,x,y,pics,(t,"modes",1,i),p,j,a)   = (("1vb",True),x,y,pics,(t,"menu",1,i),p,[head j],a)
reageEvento (EventKey (SpecialKey KeyRight)  Down _ _) (m,x,y,pics,(t,"modes",2,i),p,j,a)   = (("1v1",True),x,y,pics,(t,"menu",1,i),p,[head j],a)
reageEvento (EventKey (SpecialKey KeyRight)  Down _ _) (m,x,y,pics,(t,"modes",3,i),p,j,a)   = (("p",True),x,y,pics,(t,"menu",1,i),p,[last j],a)

--menu
reageEvento (EventKey (SpecialKey KeyDown)  Down _ _) (m,x,y,pics,(t,"menu",3,i),p,j,a)   = (m,x,y,pics,(t,"menu",1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyDown)  Down _ _) (m,x,y,pics,(t,"menu",int,i),p,j,a) = (m,x,y,pics,(t,"menu",int+1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyUp)    Down _ _) (m,x,y,pics,(t,"menu",1,i),p,j,a)   = (m,x,y,pics,(t,"menu",3,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyUp)    Down _ _) (m,x,y,pics,(t,"menu",int,i),p,j,a) = (m,x,y,pics,(t,"menu",int-1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyRight) Down _ _) (m,x,y,pics,(t,"menu",int,i),p,j,a) = (m,x,y,pics,(t,"jogo",int,int),p,j,a)
--pausa
reageEvento (EventKey (SpecialKey KeyDown) Down _ _) (m,x,y,pics,(t,"pausa",2,i),p,j,a) = (m,x,y,pics,(t,"pausa",2,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyDown) Down _ _) (m,x,y,pics,(t,"pausa",1,i),p,j,a) = (m,x,y,pics,(t,"pausa",2,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyUp) Down _ _) (m,x,y,pics,(t,"pausa",2,i),p,j,a) = (m,x,y,pics,(t,"pausa",1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyUp) Down _ _) (m,x,y,pics,(t,"pausa",1,i),p,j,a) = (m,x,y,pics,(t,"pausa",1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyRight) Down _ _) (m,x,y,pics,(t,"pausa",2,i),p,[Jogo mapa prop c n h],a) = (m,x,y,pics,(0,"main",1,i),p,
                                                                                                                [Jogo mapaCompetitivo (Propriedades 0 0 0 0 0 0) [Carro (2,1.3) 0 (0,0),Carro (2,1.6) 0 (0,0)] [10,10] [[(2,1)],[(2,1)]],
                                                                                                                 Jogo mapaTreino (Propriedades 0 0 0 0 0 0) [Carro (2,3.5) 0 (0,0)] [10] [[(2,3)]]],a)

reageEvento (EventKey (SpecialKey KeyRight) Down _ _) (m,x,y,pics,(t,"pausa",int,i),p,j,a) = (m,x,y,pics,(t,"jogo",int,i),p,j,a)

--jogo
--2nd player 
reageEvento (EventKey (Char 'c') Down _ _) (("1v1",bool),x,y,pics,(t,"jogo",int,i),p,j,[fp,Acao a tr e d ni]) = (("1v1",bool),x,y,pics,(t,"jogo",1,i),p,j,[fp,Acao a tr e d (Just 1)]) 
reageEvento (EventKey (Char 'v') Down _ _) (("1v1",bool),x,y,pics,(t,"jogo",int,i),p,j,[fp,Acao a tr e d ni]) = (("1v1",bool),x,y,pics,(t,"jogo",1,i),p,j,[fp,Acao a tr e d (Just 0)])
reageEvento (EventKey (Char 'c') Up _ _)   (("1v1",bool),x,y,pics,(t,"jogo",int,i),p,j,[fp,Acao a tr e d ni]) = (("1v1",bool),x,y,pics,(t,"jogo",1,i),p,j,[fp,Acao a tr e d Nothing]) 
reageEvento (EventKey (Char 'v') Up _ _)   (("1v1",bool),x,y,pics,(t,"jogo",int,i),p,j,[fp,Acao a tr e d ni]) = (("1v1",bool),x,y,pics,(t,"jogo",1,i),p,j,[fp,Acao a tr e d Nothing])  
reageEvento (EventKey (Char 's') Down _ _)  (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr e d ni]) = (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a True e d ni])
reageEvento (EventKey (Char 'a') Down _ _)  (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr e d ni]) = (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr True d ni])
reageEvento (EventKey (Char 'w') Down _ _)  (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr e d ni]) = (("1v1",bool),x,y,pics,t,p,j,[fp,Acao True tr e d ni])
reageEvento (EventKey (Char 'd') Down _ _)  (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr e d ni]) = (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr e True ni])
reageEvento (EventKey (Char 's')  Up _ _) (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr e d ni])   = (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a False e d ni])
reageEvento (EventKey (Char 'a')  Up _ _) (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr e d ni])   = (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr False d ni])
reageEvento (EventKey (Char 'w')  Up _ _) (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr e d ni])   = (("1v1",bool),x,y,pics,t,p,j,[fp,Acao False tr e d ni])
reageEvento (EventKey (Char 'd')  Up _ _) (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr e d ni])   = (("1v1",bool),x,y,pics,t,p,j,[fp,Acao a tr e False ni])

--fst player
reageEvento (EventKey (Char 'm') Down _ _) (m,x,y,pics,(t,"jogo",int,i),p,j,[Acao a tr e d ni,bot]) = (m,x,y,pics,(t,"jogo",1,i),p,j,[Acao a tr e d (Just 0),bot]) 
reageEvento (EventKey (Char 'n') Down _ _) (m,x,y,pics,(t,"jogo",int,i),p,j,[Acao a tr e d ni,bot]) = (m,x,y,pics,(t,"jogo",1,i),p,j,[Acao a tr e d (Just 1),bot])
reageEvento (EventKey (Char 'm') Up _ _) (m,x,y,pics,(t,"jogo",int,i),p,j,[Acao a tr e d ni,bot]) = (m,x,y,pics,(t,"jogo",1,i),p,j,[Acao a tr e d Nothing,bot]) 
reageEvento (EventKey (Char 'n') Up _ _) (m,x,y,pics,(t,"jogo",int,i),p,j,[Acao a tr e d ni,bot]) = (m,x,y,pics,(t,"jogo",1,i),p,j,[Acao a tr e d Nothing,bot])  
reageEvento (EventKey (Char 'p') Down _ _) (m,x,y,pics,(t,"jogo",int,i),p,j,a) = (m,x,y,pics,(t,"pausa",1,i),p,j,a)
reageEvento (EventKey (SpecialKey KeyDown)  Down _ _) (m,x,y,pics,t,p,j,[Acao a tr e d ni,bot]) = (m,x,y,pics,t,p,j,[Acao a True e d ni,bot])
reageEvento (EventKey (SpecialKey KeyLeft)  Down _ _) (m,x,y,pics,t,p,j,[Acao a tr e d ni,bot]) = (m,x,y,pics,t,p,j,[Acao a tr True d ni,bot])
reageEvento (EventKey (SpecialKey KeyUp)    Down _ _) (m,x,y,pics,t,p,j,[Acao a tr e d ni,bot]) = (m,x,y,pics,t,p,j,[Acao True tr e d ni,bot])
reageEvento (EventKey (SpecialKey KeyRight) Down _ _) (m,x,y,pics,t,p,j,[Acao a tr e d ni,bot]) = (m,x,y,pics,t,p,j,[Acao a tr e True ni,bot])
reageEvento (EventKey (SpecialKey KeyDown)  Up _ _) (m,x,y,pics,t,p,j,[Acao a tr e d ni,bot])   = (m,x,y,pics,t,p,j,[Acao a False e d ni,bot])
reageEvento (EventKey (SpecialKey KeyLeft)  Up _ _) (m,x,y,pics,t,p,j,[Acao a tr e d ni,bot])   = (m,x,y,pics,t,p,j,[Acao a tr False d ni,bot])
reageEvento (EventKey (SpecialKey KeyUp)    Up _ _) (m,x,y,pics,t,p,j,[Acao a tr e d ni,bot])   = (m,x,y,pics,t,p,j,[Acao False tr e d ni,bot])
reageEvento (EventKey (SpecialKey KeyRight) Up _ _) (m,x,y,pics,t,p,j,[Acao a tr e d ni,bot])   = (m,x,y,pics,t,p,j,[Acao a tr e False ni,bot]) 
reageEvento _ mapa = mapa


{- | Função que aplica o movimento a uma lista de carros-}
move ::Tempo-> Jogo -> [Maybe Carro]
move t (Jogo (Mapa (_,_) table) p [] ni hist) = []
move t (Jogo (Mapa (_,_) table) p [c1] ni hist) = [movimenta table t c1]
move t (Jogo (Mapa (_,_) table) p [c1,c2] ni hist) = [movimenta table t c1, movimenta table t c2]
 
{- | Função que coloca o carro na posição inicial quando ele morre-}
manageCars :: Jogo -> [Maybe Carro] -> ([Jogo],Bool)
manageCars (Jogo m p c n h) [] = ([Jogo m p [Carro (2,1.3) 0 (0,0),Carro (2,1.6) 0 (0,0)] n h],True)
manageCars (Jogo m p c n h) [Nothing] = ([Jogo m p [Carro (2,1.3) 0 (0,0),Carro (2,1.6) 0 (0,0)] n h],True)
manageCars (Jogo m p c n h) [Nothing,Nothing] = ([Jogo m p [Carro (2,1.3) 0 (0,0),Carro (2,1.6) 0 (0,0)] n h],False)
manageCars (Jogo m p c n h) [Nothing,Just y] = ([Jogo m p [Carro (2,1.3) 0 (0,0),y] n h],False)
manageCars (Jogo m p c n h) [Just x,Nothing] = ([Jogo m p [x,Carro (2,1.6) 0 (0,0)] n h],True)
manageCars (Jogo m p c n h) [Just x,Just y] = ([Jogo m p [x,y] n h],True)

{- | Função que atualiza os movimentos no modo de treino-}
atualizaMovimentosP :: Tempo -> Jogo -> [Acao] -> Jogo
atualizaMovimentosP t jogo a = novoJogo 
                                where (Jogo m p c n h) = atualiza t jogo 0 (head a) -- fazer depois para outros carros
                                      carrosAct = move t (Jogo m p c n h) 
                                      novoJogo = case carrosAct of
                                                    [Nothing] -> Jogo m p [Carro (2,3.3) 0 (0,0)] n h
                                                    [Just x] -> Jogo m p [x] n h 

{- | Função que atualiza os movimentos em modos com mais de um carro-}
atualizaMovimentos ::String -> Tempo -> [Jogo] -> [Acao] -> ([Jogo],Bool)
atualizaMovimentos _ t [] _ = ([],True)
atualizaMovimentos str t [j] [a1,a2] = novoJogo
                                        where jogo1 = atualiza t j 0 a1
                                              jogo = if str =="1vb"
                                                        then atualiza t jogo1 1 (bot t jogo1 1)
                                                        else atualiza t jogo1 1 a2
                                              carros = move t jogo 
                                              novoJogo = manageCars jogo carros  



-- | Função que altera o estado do jogo quando o tempo avança @n@ segundos.
reageTempo :: Float -> Estado -> Estado
reageTempo t' (m,pos,carro,pics,(t,"main",int,i),prop,j,a)  = (m,pos,carro,pics,(t,"main",int,i),prop,j,a)
reageTempo t' (m,pos,carro,pics,(t,"controlos",int,i),prop,j,a)  = (m,pos,carro,pics,(t,"controlos",int,i),prop,j,a)
reageTempo t' (m,pos,carro,pics,(t,"menu",int,i),prop,j,a)  = (m,pos,carro,pics,(t,"menu",int,i),prop,choosePropriedade j prop int,a)
reageTempo t' (m,pos,carro,pics,(t,"pausa",int,i),prop,j,a)  = (m,pos,carro,pics,(t,"pausa",int,i),prop,j,a)
reageTempo t' (m,pos,carro,pics,(t,"modes",int,i),prop,j,a)  = (m,pos,carro,pics,(t,"modes",int,i),prop,j,a)
reageTempo t' ((str,bool),(xMapa,yMapa),carro,pics,(t,estado,int,i),prop,[j],a) | str == "p" =((str,bool),(xMapa,yMapa),carro,pics,(t+t',estado,int,i),prop,[(atualizaMovimentosP time j a)],a)
                                                                                | otherwise  = ((str,alive),(xMapa,yMapa),carro,pics,(t+t',estado,int,i),prop,game,a)
                                                                                    where time = float2Double t'
                                                                                          alive= snd $ atualizaMovimentos str time [j] a
                                                                                          game = fst $ atualizaMovimentos str time [j] a
                                                                                         

                                                                                          
-- | Função que cria um jogo.
joga :: Estado -> IO ()
joga inicio = play
    (InWindow "Novo Jogo " (1000, 800) (150, 400))  -- tamanho da janela do jogo
    (greyN 0.5)                               -- côr do fundo da janela
    60                                        -- refresh rate
    inicio                                    -- estado inicial
    desenhaEstado                             -- função que desenha o estado do jogo
    reageEvento                                 -- reage a um evento
    reageTempo                                -- reage ao passar do tempo


-- | Função main.
main :: IO ()
main = do 
        inicio <- estadoInicial
        joga inicio
