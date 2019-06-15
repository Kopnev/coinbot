require 'sampfuncs'
require 'moonloader'

local buyid, tdid
local active = false
local sampev = require 'lib.samp.events'
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
activebot = false

imgui.SwitchContext()
local style = imgui.GetStyle()
local Colors = style.Colors
local ImVec4 = imgui.ImVec4
local ImVec2 = imgui.ImVec2

	WindowPadding = ImVec2(15, 15)
    WindowRounding = 5.0
    FramePadding = ImVec2(5, 5)
    FrameRounding = 4.0
    ItemSpacing = ImVec2(12, 8)
    ItemInnerSpacing = ImVec2(8, 6)
    IndentSpacing = 25.0
    ScrollbarSize = 15.0
    ScrollbarRounding = 9.0
    GrabMinSize = 5.0
    GrabRounding = 3.0

    Colors[imgui.Col.Text] = ImVec4(0.80, 0.80, 0.83, 1.00)
    Colors[imgui.Col.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
    Colors[imgui.Col.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00)
    Colors[imgui.Col.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
    Colors[imgui.Col.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
    Colors[imgui.Col.Border] = ImVec4(0.80, 0.80, 0.83, 0.88)
    Colors[imgui.Col.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
    Colors[imgui.Col.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    Colors[imgui.Col.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
    Colors[imgui.Col.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
    Colors[imgui.Col.TitleBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    Colors[imgui.Col.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75)
    Colors[imgui.Col.TitleBgActive] = ImVec4(0.07, 0.07, 0.09, 1.00)
    Colors[imgui.Col.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    Colors[imgui.Col.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    Colors[imgui.Col.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
    Colors[imgui.Col.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    Colors[imgui.Col.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    Colors[imgui.Col.ComboBg] = ImVec4(0.19, 0.18, 0.21, 1.00)
    Colors[imgui.Col.CheckMark] = ImVec4(0.80, 0.80, 0.83, 0.31)
    Colors[imgui.Col.SliderGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
    Colors[imgui.Col.SliderGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    Colors[imgui.Col.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
    Colors[imgui.Col.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
    Colors[imgui.Col.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
    Colors[imgui.Col.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
    Colors[imgui.Col.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    Colors[imgui.Col.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    Colors[imgui.Col.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00)
    Colors[imgui.Col.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    Colors[imgui.Col.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    Colors[imgui.Col.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
    Colors[imgui.Col.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
    Colors[imgui.Col.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
    Colors[imgui.Col.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
    Colors[imgui.Col.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
    Colors[imgui.Col.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
    Colors[imgui.Col.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
    Colors[imgui.Col.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
    Colors[imgui.Col.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)

local main_windows_state = imgui.ImBool(false)
local imguiDemo = imgui.ImBool(false)
local text_buffer = imgui.ImBuffer(256)

local radio1 = imgui.ImInt(0)
local limit = imgui.ImInt(0)
local click = imgui.ImBool(false)
local nolimit = imgui.ImBool(true)

function main()
  if not isSampLoaded() or not isSampfuncsLoaded() then return end
  while not isSampAvailable() do wait(100) end
  sampRegisterChatCommand("botvk", cmd_imgui)
  sampAddChatMessage('[BotVkCoin] {FFFFFF}Скрипт загружен. Активация: {F1CB09}/botvk', 0xF1CB09)

  --cmd_imgui()

    while true do
	wait(10)
		  if main_windows_state.v == false then imgui.Process = false end

		  if testCheat("bb") and activebot == true then
		  	activebot = false
		  	sampAddChatMessage('[BotVkCoin] {FFFFFF}Бот завершил свою работу', 0xF1CB09)
		  	wait(400)
		  end

		  if testCheat("kk") then
		  	cmd_imgui()
		  end


		  if click.v == true then
		  	if not tdid then
		        sampAddChatMessage('[BotVkCoin] {FFFFFF}Откройте свой телефон', 0xF1CB09)
		        click.v = false
    		end

    		if tdid then
                    sampSendClickTextdraw(tdid)
               end

		  end

		  if activebot == true then botvk() end
	end



end

function sampev.onShowTextDraw(id, data)
	if data.letterColor == -5028352 then
        tdid = id
       -- print(id)
    end
    if data.letterColor == -14013787 then
        buyid = id
    end
end

local value = 0

function botvk()

	if sampGetCurrentDialogId() == 25013 then
			sampCloseCurrentDialogWithButton(1)
		end

	if value.v ~= 0 or nolimit.v == true then

		local list = radio1.v


		if sampGetCurrentDialogId() == 25012 then
			sampSendDialogResponse(25012, 1, list, -1)
			if nolimit.v == false then value.v = value.v -1 end
		end

	else
		sampAddChatMessage('[BotVkCoin] {FFFFFF}Бот завершил работу', 0xF1CB09)
		activebot = false

	end
end


function cmd_imgui()
	main_windows_state.v = not main_windows_state.v
	imgui.Process = main_windows_state.v
end

local function drawImguiDemo()
	if imguiDemo.v then
		imgui.ShowTestWindow(imguiDemo)
	end
end

function ShowHelpMarker(desc)

    imgui.TextDisabled('(?)')
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(450.0)
        imgui.TextUnformatted(desc)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end


function imgui.OnDrawFrame()

	imgui.SetNextWindowPos(imgui.ImVec2(imgui.GetIO().DisplaySize.x - 185, imgui.GetIO().DisplaySize.y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
	imgui.SetNextWindowSize(imgui.ImVec2(250, 300), imgui.Cond.FirstUseEver)
	imgui.Begin('CoinMiner', main_windows_state, imgui.WindowFlags.MenuBar)

	if imgui.BeginMenuBar() then
		if imgui.BeginMenu(u8'Инфо') then
			 if imgui.MenuItem(u8'Информация') then
			 	sampAddChatMessage('[BotVkCoin] {FFFFFF}Автор: Даниил Копнев.', 0xF1CB09)
			 	sampAddChatMessage('[BotVkCoin] {FFFFFF}Вк: vk.com/d.k8515', 0xF1CB09)
			 	sampAddChatMessage('[BotVkCoin] {FFFFFF}Специально для: Аризона | Полезные вещи', 0xF1CB09)
			 end
			imgui.EndMenu()
		end
		imgui.EndMenuBar()
	end

        imgui.Separator()
        imgui.NewLine()
        imgui.SameLine(3)

	if imgui.TreeNode(u8'Покупка улчшений') then



		if imgui.TreeNode(u8'Выберите что покупать') then
			imgui.RadioButton(u8'Клик мыши', radio1, 0)
			imgui.RadioButton(u8'Видеокарта', radio1, 1)
			imgui.RadioButton(u8'Стойка видеокарт', radio1, 2)
			imgui.RadioButton(u8'Суперкомпьютер', radio1, 3)
			imgui.RadioButton(u8'Сервер Arizona Games', radio1, 4)
			imgui.RadioButton(u8'Квантовый компьютер', radio1, 5)
			imgui.RadioButton(u8'Датацентр', radio1, 6)
			imgui.TreePop()
		end

		if imgui.TreeNode(u8'Введите сколько покупать') then

			imgui.Checkbox(u8'Без лимита', nolimit)
			if nolimit.v == false then
			imgui.InputInt('', limit, 1) end
			imgui.TreePop()
		end


		if imgui.Button(u8'Начать') then
			if limit.v == 0 and nolimit.v == false then
				sampAddChatMessage('[BotVkCoin] {FFFFFF}Вы не установили лимит', 0xF1CB09)
			else if sampGetCurrentDialogId() == 25012 then
				value = limit
				activebot = true
			else sampAddChatMessage('[BotVkCoin] {FFFFFF}Откройте диалог с покупкой улчшений.', 0xF1CB09) end end
		end

		if activebot then
			imgui.SameLine()
			if imgui.Button(u8'Стоп') then
				activebot = false
			end
		end

		imgui.TreePop()
	end
	imgui.Separator()
        imgui.NewLine()
        imgui.SameLine(3)

	if imgui.TreeNode(u8'Коин кликер') then
		imgui.Checkbox(u8'Активация', click) imgui.SameLine()
		ShowHelpMarker(u8'Если коинкликер открыт, попробуйте откртыть его заного.')
		imgui.TreePop()
	end

	imgui.Separator()
        imgui.NewLine()
        imgui.SameLine(3)
	imgui.End()
end
