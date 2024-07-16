-- Portal de Noticias do Servidor
-- Aplicativo de comunicação e atualização

-- Importando livrarias
salt = assert(require("salt"))
basalt = require("basalt")
models = require("models")


-- Declarando variaveis vitais
nodoType = "Cliente"
nodoId = os.getComputerID()
nodoOwner = "Test Guy"

-- Declarando variaveis de estilo

buttonBg = colors.gray
buttonHover = colors.lime
mainFg = colors.lime

-- Inicio do código
mainMenu = basalt.createFrame("mainMenu")
    :setTheme({FrameBG = colors.black, FrameFG = colors.lightGray})

local sidebar = mainMenu:addScrollableFrame():setBackground(colors.gray):setPosition("parent.w", 1):setSize(15, "parent.h"):setZIndex(25)
:onGetFocus(function(self)
    self:setPosition("parent.w - (self.w-1)")
end)
:onLoseFocus(function(self)
    self:setPosition("parent.w")
end)

--Definindo telas
local sub = {
    mainMenu:addFrame("Inicio"):setPosition(1, 1):setSize("parent.w", "parent.h"),
    mainMenu:addFrame("Regras"):setPosition(1, 1):setSize("parent.w", "parent.h"):hide(),
    mainMenu:addFrame("Noticias"):setPosition(1, 1):setSize("parent.w", "parent.h"):hide(),
    mainMenu:addFrame("Sair"):setPosition(1, 1):setSize("parent.w", "parent.h"):hide(),
}

local y = 2
for k,v in pairs(sub)do
    if k == 1 then
        name = "Inicio"
    end
    if k == 2 then
        name = "Regras"
    end
    if k == 3 then
        name = "Noticias"
    end
    if k == 4 then
        name = "Sair"
    end
    sidebar:addButton():setText(name) -- creating the button and adding a name k is just the index
    :setBackground(colors.black)
    :setForeground(colors.lightGray)
    :setSize("parent.w - 2", 3)
    :setPosition(2, y)
    :onClick(function() -- here we create a on click event which hides ALL sub frames and then shows the one which is linked to the button
        for a, b in pairs(sub)do
            b:hide()
            v:show()
        end
    end)
    y = y + 4
end

-- Tela de Regras

rulePage = sub[2]:addScrollableFrame()
    :show()
    --:setVisible(false)
    :setDirection("vertical")
    --:setScrollAmount(25)
    :setSize(24, 18)
    :setForeground(mainFg)
    :setPosition(2, 2)


    regrasText = rulePage
        :addLabel()
        :setSize("parent.w","parent.h")
        :setPosition(3,3)
        --:setTextAlign("center")
        :setText("        REGRAS        Para postar no feed de noticias do servidor existem algumas regras                      Regra 01: SEM FLOOD!  Regra 02: SEM CHAT!   Regra 03: SEM BIBLIAS!                      Preencha os campos antes de publicar a noticia para nao haver duplicatas!                                     Outras coisas serao adicionadas com o tempo..")
        :show()


-- Tela de Menu

-- Frame do Menu
menuObj = sub[1]:addScrollableFrame("mainMenu")
    :setDirection("vertical")
    --:setScrollAmount(25)
    :setSize(24, 18)
    :setForeground(mainFg)
    :setPosition(2, 2)

    -- Elementos do menu
    Tittle = menuObj
        :addLabel()
        :setPosition(3,3)
        :setText("PORTAL DE NOTICIAS")
        :show()
    subTittle = menuObj
        :addLabel()
        :setPosition(6,4)
        :setText("DO  SERVIDOR")
        :show()


    bntRegras = menuObj

        :addButton("0")
        :setText("REGRAS DO PORTAL")
        :setBackground(buttonBg)
        :setForeground(mainFg)
        :setPosition(3,8)
        :setSize(18,3)
        --.bntId == 0


    bntFeed  = menuObj
        :addButton("1")
        :setText("FEED DE NOTICIAS")
        :setBackground(buttonBg)
        :setForeground(mainFg)
        :setPosition(3,12)
        :setSize(18,3)
        --.bntId == 1

    bntPost = menuObj

        :addButton("2")
        :setText("POSTAR NOTICIA")
        :setBackground(buttonBg)
        :setForeground(mainFg)
        :setPosition(3,16)
        :setSize(18,3)
        --.bntId == 2


    bntExit = menuObj
        :addButton("3")
        :setText("SAIR")
        :setBackground(buttonBg)
        :setForeground(mainFg)
        :setPosition(3,20)
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
        basalt.setActiveFrame(rulePage)
        mainMenu:setPosition(1,27)
        basalt.debug(basalt.getActiveFrame():getName())

    end
    if self:getName() == "1" then
        basalt.debug(" 1 Pressed! ")
    end
    if self:getName() == "2" then
        basalt.debug(" 2 Pressed! ")
    end
    if self:getName() == "3" then
        os.shutdown()
    end
    if self:getName() == "return" then
        regrasObj:hide()
        mainMenu:setPosition(1,1)

    end
end

-- Configurações dos Elementos
    --menu principal
bntRegras:onClick(bntHover)
bntRegras:onClickUp(bntLeave)
bntFeed:onClick(bntHover)
bntFeed:onClickUp(bntLeave)
bntPost:onClick(bntHover)
bntPost:onClickUp(bntLeave)
bntExit:onClick(bntHover)
bntExit:onClickUp(bntLeave)
    --menu regras
--bntReturn:onClick(bntHover)
--bntReturn:onClickUp(bntLeave)

basalt.debug(basalt.getActiveFrame():getName())


-- Roda o programa
--basalt.setActiveFrame("mainMenu")
basalt.autoUpdate()
