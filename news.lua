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

buttonBg = colors.gray
buttonHover = colors.lime
mainFg = colors.lime

-- Inicio do código

-- Tela de Menu

mainMenu = basalt.createFrame()
    :setTheme({FrameBG = colors.black, FrameFG = colors.lightGray})
    


    -- Frame do Menu
    menuObt = mainMenu:addScrollableFrame()
        :setDirection("vertical")
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
            
            :addButton("0")
            :setText("REGRAS DO PORTAL")
            :setBackground(buttonBg)
            :setForeground(mainFg)
            :setPosition(4,8)
            :setSize(18,3)
            --.bntId == 0
            

        bntFeed  = menuObt
            :addButton("1")
            :setText("FEED DE NOTICIAS")
            :setBackground(buttonBg)
            :setForeground(mainFg)
            :setPosition(4,12)
            :setSize(18,3)
            --.bntId == 1

        bntPost = menuObt
            
            :addButton("2")
            :setText("POSTAR NOTICIA")
            :setBackground(buttonBg)
            :setForeground(mainFg)
            :setPosition(4,16)
            :setSize(18,3)
            --.bntId == 2
            

        bntExit = menuObt
            :addButton("3")
            :setText("SAIR")
            :setBackground(buttonBg)
            :setForeground(mainFg)
            :setPosition(4,20)
            :setSize(18,3)
            --.bntId == 3

        
    -- Funções do menu

    function buttonOnScroll(self, direction, x, y)
        basalt.debug("Someone scrolls on me!")
    end
    function bntHover(self)
        self:setForeground(colors.black)
        self:setBackground(buttonHover)
        basalt.debug("Opa")
    end
    function bntLeave(self)
        self:setForeground(mainFg)
        self:setBackground(buttonBg)
        --basalt.debug()
        
        if self:getName() == "0" then
            basalt.debug(" 0 Pressed! ")
        end
        if self:getName() == "1" then
            basalt.debug(" 1 Pressed! ")
        end
        if self:getName() == "2" then
            basalt.debug(" 2 Pressed! ")
        end
        if self:getName() == "3" then
            basalt.debug(" 3 Pressed! ")
        end
    end
            
    -- Configurações dos Elementos

    bntRegras:onClick(bntHover)
    bntRegras:onClickUp(bntLeave)
    bntFeed:onClick(bntHover)
    bntFeed:onClickUp(bntLeave)
    bntPost:onClick(bntHover)
    bntPost:onClickUp(bntLeave)
    bntExit:onClick(bntHover)
    bntExit:onClickUp(bntLeave)

-- Roda o programa
basalt.autoUpdate()
