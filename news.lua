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
        name = "Publicar"
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
        :setSize("parent.w - 3","parent.h")
        :setPosition(2,2)
        --:setTextAlign("center")
        :setText("       REGRAS                           Para postar no feed de noticias do servidor existem algumas regras                              Regra 01: SEM FLOOD! Regra 02: SEM CHAT! Regra 03: SEM BIBLIAS!             Regra 04: SEM ACENTO PARA NAO BUGAR!                         Preencha os campos antes de publicar a noticia para nao haver duplicatas!                                     Outras coisas serao adicionadas com o tempo..")
        :show()


-- Tela de sair
exitScreen = sub[4]:addScrollableFrame()
    :show()
    :setSize(24, 18)
    :setForeground(mainFg)
    :setPosition(2, 2)
    
    exitText = exitScreen
        :addLabel()
        :setText("Deseja mesmo sair?")
        :setPosition("parent.w / 2 - 8","parent.h / 2 - 3")
        :show()
    exitYes = exitScreen
        :addButton("exitYes")
        :setText("SIM")
        :setBackground(buttonBg)
        :setForeground(mainFg)
        :setPosition("(parent.w / 2) - 5","parent.h / 2 + 1")
        :setSize(5,3)
        :show()
    exitNo = exitScreen
        :addButton("exitNo")
        :setText("NAO")
        :setBackground(buttonBg)
        :setForeground(mainFg)
        :setPosition("(parent.w / 2) + 2","parent.h / 2 + 1")
        :setSize(5,3)
        :show()

-- Tela de Publicar

postScreen = sub[3]:addScrollableFrame("Post")
    :show()
    :setSize(24,22)
    :setForeground(colors.lime)
    :setBackground(colors.black)
    :setPosition(1,1)
    qLabel = postScreen:addLabel()
        :show()
        :setSize("parent.w","parent.h")
        :setText("No que voce esta pensando hoje?")
        :setPosition(2,2)
    postText = postScreen:addTextfield()
            :show()
            :setSize(22,12)
            :setPosition(1,5)



-- Tela Principal

menuObj = sub[1]:addScrollableFrame("mainMenu")
    :setDirection("vertical")
    --:setScrollAmount(25)
    :setSize(26, 24)
    :setForeground(colors.black)
    :setBackground(colors.lime)
    :setPosition(1, 1)

    -- Elementos da tela principal

    Tittle = menuObj
        :addLabel()
        :setPosition(4,3)
        :setText("PORTAL DE NOTICIAS")
        :show()
    subTittle = menuObj
        :addLabel()
        :setPosition(7,4)
        :setText("DO  SERVIDOR")
        :show()

    -- Frame de noticias

    newsFrame = menuObj
        :addScrollableFrame("news")
        :setDirection("vertical")
        :setSize(22,18)
        :setPosition(2,6)
        :setForeground(colors.lime)
        :setBackground(colors.black)
        
        refreshBnt = menuObj:addButton("refresh")
            :setSize(10,3)
            :setText("§ Reload")
            :setPosition(8,22)

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

    if self:getName() == "exitYes" then
        os.shutdown()
    end
    if self:getName() == "exitNo" then
        sub[4]:hide()
        sub[1]:show()

    end
end

-- Configurações dos Elementos
    --menu principal
exitYes:onClick(bntHover)
exitYes:onClickUp(bntLeave)
exitNo:onClick(bntHover)
exitNo:onClickUp(bntLeave)
--bntPost:onClick(bntHover)
--bntPost:onClickUp(bntLeave)
--bntExit:onClick(bntHover)
--bntExit:onClickUp(bntLeave)
    --menu regras
--bntReturn:onClick(bntHover)
--bntReturn:onClickUp(bntLeave)

basalt.debug(basalt.getActiveFrame():getName())


-- Roda o programa
--basalt.setActiveFrame("mainMenu")
basalt.autoUpdate()
