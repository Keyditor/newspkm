-- Portal de Noticias do Servidor
-- Aplicativo de comunicação e atualização

-- Importando livrarias
salt = assert(require("salt"))
basalt = require("basalt")


-- Declarando variaveis vitais
nodoType = "Cliente"
nodoId = os.getComputerID()
nodoOwner = "Test Guy"

-- Declarando variaveis de estilo

buttonBg = colors.black
mainFg = colors.lime

-- Inicio do código

-- Tela de Menu

mainMenu = basalt.createFrame()
    :setTheme({FrameBG = colors.black, FrameFG = colors.lightGray})
    


    -- Frame do Menu
    menuObt = mainMenu
        :addFrame()
        --:setScrollable()
        --:setScrollAmount(25)
        :setSize(24, 18)
        :setForeground(mainFg)
        :setPosition(2, 2)
        
        -- Elementos do menu
        Tittle = menuObt
            :addLabel()
            :setPosition(4,3)
            :setText("PORTAL DE NOTICIAS")
            
            :show()
        subTittle = menuObt
            :addLabel()
            :setPosition(7,4)
            :setText("DO  SERVIDOR")
            :show()


        
        
        bntRegras = menuObt
            
            :addButton()
            :setText("REGRAS DO PORTAL")
            :setBackground(buttonBg)
            :setPosition(4,8)
            :setSize(18,3)
            

        bntFeed  = menuObt
            :addButton()
            :setText("FEED DE NOTICIAS")
            :setBackground(buttonBg)
            :setPosition(4,12)
            :setSize(18,3)
            
        
        -- Funções do menu
        function bntHover(nBnt)
            if nBnt == 0 then
                bntRegras:setBackground(mainFg)
                bntRegras:setForeground(buttonBg)
            end
            if nBnt == 1 then
                bntFeed:setBackground(mainFg)
                bntFeed:setForeground(buttonBg)
            end
            if nBnt == nil then
                bntRegras:setBackground(buttonBg)
                bntRegras:setForeground(mainFg)
                bntFeed:setBackground(buttonBg)
                bntFeed:setForeground(mainFg)
            end
        end
            
        -- Configurações dos Elementos
        bntRegras:onHover(bntHover(0))
        bntFeed:onHover(bntHover(1))
        bntRegras:onLeave(bntHover(nil))
        bntFeed:onLeave(bntHover(nil))

-- Roda o programa
basalt.autoUpdate()
