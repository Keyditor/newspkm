-- Portal de Noticias do Servidor
-- Aplicativo de comunicação e atualização

-- Importando livrarias
salt = assert(require("./salt"))
basalt = require("./basalt")

-- Declarando variaveis vitais
nodoType = "Cliente"
nodoId = os.getComputerID()
nodoOwner = "Test Guy"

-- Inicio do código

-- Tela de Menu

mainMenu = basalt.createFrame()
    :setTheme({FrameBG = colors.black, FrameFG = colors.lightGray})
    



    menuObt = mainMenu
        :addFrame()
        :setSize(24, 18)
        :setPosition(2, 2)
        

        subTittle = menuObt
            :addLabel()
            :setPosition(1,1)
            :setText("DO SERVIDOR")
            :show()
        subTittle = menuObt
            :addLabel()
            :setPosition(2,1)
            :setText("DO SERVIDOR")
            :show()

-- Roda o programa
basalt.autoUpdate()
