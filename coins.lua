script_author('kopnev')

local imgui = require 'imgui'
local encoding = require 'encoding'

encoding.default = 'CP1251'
u8 = encoding.UTF8

local main_window = imgui.ImBool(true)

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
    apply_custom_style()
    sampRegisterChatCommand("botvk",function()
        main_window.v = not main_window.v
    end)
    while true do
        wait(0)
        imgui.Process = main_window.v
    end
end

function imgui.OnDrawFrame()
    if main_window.v then
        imgui.SetNextWindowSize(imgui.ImVec2(350, 350), imgui.Cond.FirstUseEver)
        imgui.SetNextWindowPos(imgui.ImVec2(imgui.GetIO().DisplaySize.x / 2, imgui.GetIO().DisplaySize.y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.Begin(u8'Coin Miner',main_window, imgui.WindowFlags.NoResize )
        imgui.NewLine() imgui.NewLine() imgui.NewLine()
        imgui.SameLine(15)
        imgui.BeginGroup()
        imgui.TextColored(imgui.ImVec4(1, 0, 0, 1),"Ooops")
        --imgui.NewLine()
        imgui.TextColored(imgui.ImVec4(1, 0, 0, 1),u8"Кажется Вы стали жертвой пиратского контента")
        imgui.NewLine()

        imgui.Text(u8"Скачать актуальную версию CoinMiner можно тут:")
        imgui.NewLine()
        imgui.Text("blast.hk:") imgui.SameLine(100) if imgui.Button(u8"Перейти") then os.execute('explorer "https://www.blast.hk/threads/51376/"') end
        imgui.Text(u8"Группа ВК:") imgui.SameLine(100) if imgui.Button(u8"Перейти##1") then os.execute('explorer "https://vk.com/kscripts/"') end
        imgui.Text(u8"Сайт:") imgui.SameLine(100) if imgui.Button(u8"Перейти##2") then os.execute('explorer "https://kscripts.ru/') end imgui.SameLine() imgui.Text(u8"   ( Нельзя скачать )")
        imgui.NewLine() imgui.NewLine()
        imgui.Text(u8"Разработано:") imgui.SameLine(100) imgui.Text("Kopnev Scripts")
        imgui.EndGroup()
        imgui.End()
    end
end

function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    style.WindowRounding = 2
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 0
    style.ItemSpacing = imgui.ImVec2(1.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0
    style.WindowPadding = imgui.ImVec2(4.0, 4.0)
    style.FramePadding = imgui.ImVec2(3.5, 3.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    colors[clr.WindowBg]              = ImVec4(0.00, 0.00, 0.00, 1.00);
    colors[clr.ChildWindowBg]         = ImVec4(0.30, 0.20, 0.39, 0.00);
    colors[clr.PopupBg]               = ImVec4(0.05, 0.05, 0.10, 0.90);
    colors[clr.Border]                = ImVec4(0.89, 0.85, 0.92, 0.30);
    colors[clr.BorderShadow]          = ImVec4(0.00, 0.00, 0.00, 0.00);
    colors[clr.FrameBg]               = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.FrameBgHovered]        = ImVec4(0.41, 0.19, 0.63, 0.68);
    colors[clr.FrameBgActive]         = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.TitleBg]               = ImVec4(0.41, 0.19, 0.63, 1);
    colors[clr.TitleBgCollapsed]      = ImVec4(0.41, 0.19, 0.63, 1);
    colors[clr.TitleBgActive]         = ImVec4(0.41, 0.19, 0.63, 1);
    colors[clr.MenuBarBg]             = ImVec4(0.30, 0.20, 0.39, 0.57);
    colors[clr.ScrollbarBg]           = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.ScrollbarGrab]         = ImVec4(0.41, 0.19, 0.63, 0.31);
    colors[clr.ScrollbarGrabHovered]  = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.ScrollbarGrabActive]   = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.ComboBg]               = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.CheckMark]             = ImVec4(0.56, 0.61, 1.00, 1.00);
    colors[clr.SliderGrab]            = ImVec4(0.41, 0.19, 0.63, 0.24);
    colors[clr.SliderGrabActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.Button]                = ImVec4(0.41, 0.19, 0.63, 0.8); 
    colors[clr.ButtonHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
    colors[clr.ButtonActive]          = ImVec4(0.64, 0.33, 0.94, 1.00);
    colors[clr.Header]                = ImVec4(0.41, 0.19, 0.63, 0.76);
    colors[clr.HeaderHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
    colors[clr.HeaderActive]          = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.ResizeGrip]            = ImVec4(0.41, 0.19, 0.63, 0.20);
    colors[clr.ResizeGripHovered]     = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.ResizeGripActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.CloseButton]           = ImVec4(1.00, 1.00, 1.00, 0);
    colors[clr.CloseButtonHovered]    = ImVec4(0.88, 0.74, 1.00, 0.59);
    colors[clr.CloseButtonActive]     = ImVec4(0.88, 0.85, 0.92, 1.00);
    colors[clr.PlotLines]             = ImVec4(0.89, 0.85, 0.92, 0.63);
    colors[clr.PlotLinesHovered]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.PlotHistogram]         = ImVec4(0.89, 0.85, 0.92, 0.63);
    colors[clr.PlotHistogramHovered]  = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.TextSelectedBg]        = ImVec4(0.41, 0.19, 0.63, 0.43);
    colors[clr.Text]                  = ImVec4(1, 1, 1, 1);
    colors[clr.ModalWindowDarkening]  = ImVec4(0.20, 0.20, 0.20, 0.35);
    colors[clr.Separator]             = ImVec4(0.56, 0.56, 0.56, 0.65);
end