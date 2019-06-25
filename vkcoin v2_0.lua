script_name('vkcoin')
script_author('kopnev')
script_version('2.0')
script_version_number(3)

require 'sampfuncs'
require 'moonloader'

local buyid, tdid
local active = false
local sampev = require 'lib.samp.events'
local imgui = require 'imgui'
local encoding = require 'encoding'
local inicfg   = require 'inicfg'
encoding.default = 'CP1251'
u8 = encoding.UTF8
activebot = false

local dlstatus = require('moonloader').download_status

local def = {
	settings = {
		theme = 1
	},
	stats = {
		clickall = 0
	}

}

local directIni = "KopnevScripts\\vkcoin.ini"

local ini = inicfg.load(def, directIni)

		local main_windows_state = imgui.ImBool(false)
		local main_windows_state_new = imgui.ImBool(false)
		local price_windows_state = imgui.ImBool(false)
		local imguiDemo = imgui.ImBool(false)
		local text_buffer = imgui.ImBuffer(256)

		local radio1 = imgui.ImInt(0)
		local limit = imgui.ImInt(0)
		local delay = imgui.ImInt(350)
		local delayc = imgui.ImInt(350)
		local click = imgui.ImBool(false)
		local nolimit = imgui.ImBool(true)
		local new = 0
		local tip = imgui.ImInt(0)
		local upb = imgui.ImBuffer(128)
		local coins = imgui.ImBuffer(64)
		local balance = imgui.ImBuffer(128)


		local statclick = imgui.ImInt(0)



		local items = {
			u8"Ҹ���� ����",
			u8"����� ����",
			u8"������� ����",
			u8"������� ����",
			u8"������ ����",
			u8"��������� ����"
		}



		local buy = {
			imgui.ImBool(false), -- 1 ���� ����
			imgui.ImBool(false), -- 2 ����������
			imgui.ImBool(false), -- 3 ������ ���������
			imgui.ImBool(false), -- 4 ��������������
			imgui.ImBool(false), -- 5 ������ Arizona Games
			imgui.ImBool(false), -- 6 ��������� ���������
			imgui.ImBool(false), -- 7 ���������
		}



		function firstThread()
		  print("wait 1000")
		  wait(1000)
		end

		local tema = imgui.ImInt(ini.settings.theme)







function main()
  if not isSampLoaded() or not isSampfuncsLoaded() then return end
  while not isSampAvailable() do wait(100) end
  sampRegisterChatCommand("botvk", cmd_imgui)
	sampRegisterChatCommand("tdstr", tdstr)
	update()
  sampAddChatMessage('[BotVkCoin] {FFFFFF}������ ��������. ���������: {F1CB09}/botvk', 0xF1CB09)

	main_windows_state_new.v = not main_windows_state_new.v

    while true do
			wait(350)
		  imgui.Process = main_windows_state_new.v

		  if testCheat("bb") and activebot == true then
		  	activebot = false
		  	sampAddChatMessage('[BotVkCoin] {FFFFFF}��� �������� ���� ������', 0xF1CB09)
		  	wait(400)
		  end

		  if testCheat("kk") then
		  	cmd_imgui()
		  end

			if activebot == true then
				for i = 10,9 do
					if activebot == true then
					wait(delay.v)
					botvk()
				end
				end
			end



			if click.v == true then
		  	--[[if not tdid then
		        sampAddChatMessage('[BotVkCoin] {FFFFFF}�������� ���� �������', 0xF1CB09)
		        click.v = false--]]
						for i = 2,9 do
							if click.v == true then
							wait(delayc.v)
							sampSendClickTextdraw(2104)
							statclick.v = statclick.v + 1
							ini.stats.clickall = ini.stats.clickall + 1
							inicfg.save(ini, directIni)
						end
    		end


		  end
	end

end

function tdstr()
	sampAddChatMessage(ini.price.click, -1)
	ini.price.click = 11
	inicfg.save(ini, directIni)
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

--[[if sampGetCurrentDialogId() == 25013 then
		sampCloseCurrentDialogWithButton(1)
end

if sampGetCurrentDialogId() == 25012 then else sampAddChatMessage('[BotVkCoin] {FFFFFF}�������� ������ � �������� ���������.', 0xF1CB09) activebot = false end end]]--

function botvk()

	if sampGetCurrentDialogId() == 25013 then

 else

	if sampGetCurrentDialogId() == 25012 then else sampAddChatMessage('[BotVkCoin] {FFFFFF}�������� ������ � �������� ���������.', 0xF1CB09) activebot = false end end

	if tip.v == 1 then
		if value.v ~= 0 or nolimit.v == true then

			local list = radio1.v


						if sampGetCurrentDialogId() == 25012 then
									sampSendDialogResponse(25012, 1, list, -1)
									sampSendDialogResponse(25013, 1, -1, -1)
									sampCloseCurrentDialogWithButton(1)
									if nolimit.v == false then value.v = value.v -1 end
					 end

		else
			sampAddChatMessage('[BotVkCoin] {FFFFFF}��� �������� ������', 0xF1CB09)
			activebot = false
		end
	end

		if tip.v == 0 then

				if upb.v < balance then

					if buy[7].v == true then
							wait(100)
							sampSendDialogResponse(25012, 1, 6, -1)
							wait(200)
							sampCloseCurrentDialogWithButton(1)
					end
					if buy[6].v == true then
							wait(100)
							sampSendDialogResponse(25012, 1, 5, -1)
							wait(200)
							sampCloseCurrentDialogWithButton(1)
					end
					if buy[5].v == true then
							wait(100)
							sampSendDialogResponse(25012, 1, 4, -1)
							wait(200)
							sampCloseCurrentDialogWithButton(1)
					end
					if buy[4].v == true then
							wait(100)
							sampSendDialogResponse(25012, 1, 3, -1)
							wait(200)
							sampCloseCurrentDialogWithButton(1)
					end
					if buy[3].v == true then
							wait(100)
							sampSendDialogResponse(25012, 1, 2, -1)
							wait(200)
							sampCloseCurrentDialogWithButton(1)
					end
					if buy[2].v == true then
							wait(100)
							sampSendDialogResponse(25012, 1, 1, -1)
							wait(200)
							sampCloseCurrentDialogWithButton(1)
					end

					if buy[1].v == true then
							wait(100)
							sampSendDialogResponse(25012, 1, 0, -1)
							wait(200)
							sampCloseCurrentDialogWithButton(1)
					end




				end

		end
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




local menu = {
	false,
	false,
	false,
	true,
}

local ert = imgui.ImBuffer(64)

function imgui.OnDrawFrame()
	if ini.settings.theme == 0 then theme1() end
	if ini.settings.theme == 1 then theme2() end
	if ini.settings.theme == 2 then theme3() end
	if ini.settings.theme == 3 then theme4() end
	if ini.settings.theme == 4 then theme5() end
	if ini.settings.theme == 5 then theme6() end

	if main_windows_state_new.v then
		imgui.SetNextWindowPos(imgui.ImVec2(imgui.GetIO().DisplaySize.x / 3.4, imgui.GetIO().DisplaySize.y - 325), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(600, 340), imgui.Cond.FirstUseEver)
		imgui.Begin( '		  CoinMiner | version ' .. thisScript().version, main_windows_state_new, 2)
		imgui.Text('') imgui.SameLine() if imgui.Button(u8'�����������', imgui.ImVec2(135, 30)) then uu() menu[1] = true end imgui.SameLine()
		if imgui.Button(u8'������', imgui.ImVec2(135, 30)) then uu() menu[2] = true end imgui.SameLine()
		if imgui.Button(u8'���������', imgui.ImVec2(135, 30)) then uu() menu[3] = true end imgui.SameLine()
		if imgui.Button(u8'����������', imgui.ImVec2(135, 30)) then uu() menu[4] = true end
		imgui.Separator()
		imgui.NewLine()
		imgui.SameLine(3)

		if menu[1] then
			imgui.SameLine(25) imgui.Text(u8'�������� ��� �������: ') imgui.SameLine(180)
			imgui.RadioButton(u8'"����� �������"', tip, 0) imgui.SameLine()
			imgui.RadioButton(u8'���������', tip, 1)




					if tip.v == 0 then
						imgui.NewLine()
						if sampTextdrawIsExists(2103) == false then
						imgui.SameLine(25)	imgui.Text(u8'������ �� ������: ' )
						imgui.SameLine(180)	imgui.Text(u8'� ��� �� ������ �������')
		        imgui.SameLine(340) if imgui.Button(u8'�������') then
							sampSendChat('/phone')
							sampSendDialogResponse(1000,1,0,-1)
							sampSendClickTextdraw(2119)
						end
						imgui.SameLine()
						ShowHelpMarker(u8'���� � ������� ���� �� ���������, ���������� ��� ���.')
					else imgui.SameLine(25)	imgui.Text(u8'������ �� ������: ' )
							balance = sampTextdrawGetString(2103)
							imgui.SameLine(180) imgui.Text(balance) imgui.SameLine(340) imgui.NewLine()

						end
							imgui.NewLine() imgui.NewLine()
							imgui.SameLine(25)
							imgui.Text(u8'�������� ��� ��������:')
							imgui.NewLine()
							imgui.SameLine(25) imgui.Text(u8'���� ����') imgui.SameLine(200) imgui.Checkbox('##1', buy[1]) imgui.SameLine(250)
							imgui.Text(u8 "����������") imgui.SameLine(420) imgui.Checkbox('##2', buy[2])
							imgui.NewLine()

							imgui.SameLine(25) imgui.Text(u8 "������ ���������") imgui.SameLine(200) imgui.Checkbox('##3', buy[3]) imgui.SameLine(250)
							imgui.Text(u8 "��������������") imgui.SameLine(420) imgui.Checkbox('##4', buy[4])
							imgui.NewLine()
							imgui.SameLine(25) imgui.Text(u8 "������ Arizona Games") imgui.SameLine(200) imgui.Checkbox('##5', buy[5]) imgui.SameLine(250)
							imgui.Text(u8 "��������� ���������") imgui.SameLine(420) imgui.Checkbox('##6', buy[6])
							imgui.NewLine()
							imgui.SameLine(25) imgui.Text(u8 "���������") imgui.SameLine(200) imgui.Checkbox('##7', buy[7])
									imgui.NewLine() imgui.NewLine()
							imgui.SameLine(25) imgui.Text(u8'��������:')
							imgui.SameLine()
							ShowHelpMarker(u8'�������� ������� ���������, ������ �� �������� ������� ���������.')
							imgui.SameLine(250) imgui.Text(u8'�������� ������� ����� ������ ����:')
							imgui.NewLine() imgui.SameLine(250)
							imgui.PushItemWidth(150) imgui.InputText('coins', upb, 1) imgui.PopItemWidth(150)
							imgui.SameLine(25)
							imgui.PushItemWidth(150) imgui.InputInt('ms', delay, 15) imgui.PopItemWidth(150)

							imgui.NewLine() imgui.SameLine(25)
							if imgui.Button(u8'������� ������', imgui.ImVec2(110, 22)) then
								if sampTextdrawIsExists(2101) == true then
									sampSendClickTextdraw(2101)
								else
								sampSendChat('/phone')
								sampSendDialogResponse(1000,1,0,-1)
								sampSendClickTextdraw(2119)
								sampSendClickTextdraw(2101) end
							end
							imgui.SameLine()
							ShowHelpMarker(u8'������� ������ � �������� �������� / ���������. ���� ������� ������, ������������� ��� ������� ��� ������� � ������. ���� � ������� ���� �� ���������, ���������� ��� ���.')
							if activebot then
								imgui.SameLine(420)
								if imgui.Button(u8'����', imgui.ImVec2(80, 25)) then
									activebot = false
								end
							end
							imgui.SameLine(510) if imgui.Button(u8'������', imgui.ImVec2(80, 25)) then
								if limit.v == 0 and nolimit.v == false then
									sampAddChatMessage('[BotVkCoin] {FFFFFF}�� �� ���������� �����', 0xF1CB09)
								else
								value = limit
								activebot = true
							end
							end
				end




				if tip.v == 1 then
					imgui.NewLine() imgui.NewLine()
					imgui.SameLine(25) imgui.RadioButton(u8'���� ����', radio1, 0) imgui.SameLine(250)
					imgui.RadioButton(u8'����������', radio1, 1)
					imgui.NewLine()
					imgui.SameLine(25) imgui.RadioButton(u8'������ ���������', radio1, 2) imgui.SameLine(250)
					imgui.RadioButton(u8'��������������', radio1, 3)
					imgui.NewLine()
					imgui.SameLine(25) imgui.RadioButton(u8'������ Arizona Games', radio1, 4) imgui.SameLine(250)
					imgui.RadioButton(u8'��������� ���������', radio1, 5)
					imgui.NewLine()
					imgui.SameLine(25) imgui.RadioButton(u8'���������', radio1, 6) imgui.SameLine(250)
					imgui.Checkbox(u8'��� ������', nolimit)
					imgui.NewLine() imgui.NewLine()
					imgui.SameLine(25) imgui.Text(u8'��������:')
					imgui.SameLine()
					ShowHelpMarker(u8'�������� ������� ���������, ������ �� �������� ������� ���������.')
					if nolimit.v == false then
						imgui.SameLine(250) imgui.Text(u8'�����:')
						imgui.SameLine()
						ShowHelpMarker(u8'���� �� ���������� �����, ����� ��� �������� �� ���-�� �������, ������� �� ����������.')
					end
					imgui.NewLine()
					imgui.SameLine(25)
					imgui.PushItemWidth(150) imgui.InputInt(' ', delay, 15) imgui.PopItemWidth()

					if nolimit.v == false then
					imgui.SameLine(250)
					imgui.PushItemWidth(150)
					imgui.InputInt('', limit, 1) imgui.PopItemWidth() end

					imgui.NewLine() imgui.NewLine() imgui.NewLine() imgui.SameLine(25)
					if imgui.Button(u8'������� ������', imgui.ImVec2(110, 22)) then
						if sampTextdrawIsExists(2101) == true then
							sampSendClickTextdraw(2101)
						else
						sampSendChat('/phone')
						sampSendDialogResponse(1000,1,0,-1)
						sampSendClickTextdraw(2119)
						sampSendClickTextdraw(2101) end
					end
					imgui.SameLine()
					ShowHelpMarker(u8'������� ������ � �������� �������� / ���������. ���� ������� ������, ������������� ��� ������� ��� ������� � ������. ���� � ������� ���� �� ���������, ���������� ��� ���.')
					if activebot then
						imgui.SameLine(420)
						if imgui.Button(u8'����', imgui.ImVec2(80, 25)) then
							activebot = false
						end
					end
					imgui.SameLine(510) if imgui.Button(u8'������', imgui.ImVec2(80, 25)) then
						if limit.v == 0 and nolimit.v == false then
							sampAddChatMessage('[BotVkCoin] {FFFFFF}�� �� ���������� �����', 0xF1CB09)
						else
						value = limit
						activebot = true
					end
					end
				end

		end


		if menu[2] then
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(250) imgui.Text(u8'���� ������')
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(100) imgui.Text(u8' ���������:') imgui.SameLine(189) imgui.Checkbox(u8' ', click) imgui.SameLine(310) imgui.Text(u8'��������:') imgui.SameLine(390)  imgui.PushItemWidth(150) imgui.InputInt('  ', delayc, 15) imgui.PopItemWidth()
			imgui.NewLine() imgui.NewLine()
			if sampTextdrawIsExists(2103) == false then
			imgui.SameLine(100)	imgui.Text(u8'������ �� ������: ' )
			imgui.SameLine(310)	imgui.Text(u8'� ��� �� ������ �������')
			imgui.SameLine(480) if imgui.Button(u8'�������') then
				sampSendChat('/phone')
				sampSendDialogResponse(1000,1,0,-1)
				sampSendClickTextdraw(2119)
			end
			imgui.SameLine()
			ShowHelpMarker(u8'���� � ������� ���� �� ���������, ���������� ��� ���.')
		else imgui.SameLine(100)	imgui.Text(u8'������ �� ������: ' )
				balance = sampTextdrawGetString(2103)
				imgui.SameLine(310) imgui.Text(balance..'   VKoin') imgui.SameLine(340) imgui.NewLine()

			end

			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(250) imgui.Text(u8'����������:')
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(100) imgui.Text(u8'������� ������ �� ������� �����:      '..statclick.v)
			imgui.SameLine(390) if imgui.Button(u8'�������� ') then statclick.v = 0 end
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(100) imgui.Text(u8'������� ������ �� �� �����:             '..ini.stats.clickall)
			imgui.SameLine(390) if imgui.Button(u8'��������') then ini.stats.clickall = 0 inicfg.save(ini, directIni) end
		end


		if menu[3] then
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(250)
			imgui.Text(u8'���������')
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(100) imgui.Text(u8'����� ����:   ') imgui.SameLine()
			if imgui.Combo('', tema, items, -1) then
				ini.settings.theme = tema.v
				inicfg.save(ini, directIni)
			end
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(100) if imgui.Button(u8'��������� ����������') then
				local fpath = os.getenv('TEMP') .. '\\testing_version.json' -- ���� ����� �������� ��� ������ ��� ��������� ������
			  downloadUrlToFile('https://raw.githubusercontent.com/danil8515/coinbot/master/version.json', fpath, function(id, status, p1, p2) -- ������ �� ��� ������ ��� ���� ������� ������� � ��� � ���� ��� ����� ������ ����
			    if status == dlstatus.STATUS_ENDDOWNLOADDATA then
			    local f = io.open(fpath, 'r') -- ��������� ����
			    if f then
			      local info = decodeJson(f:read('*a')) -- ������
			      updatelink = info.updateurl
			      if info and info.latest then
			        version = tonumber(info.latest) -- ��������� ������ � �����
			        ver = tonumber(info.ver)
			        if version > thisScript().version_num then -- ���� ������ ������ ��� ������ ������������� ��...
			          new = 1
								sampAddChatMessage(('[BotVkCoin]: {FFFFFF}�������� ����������!'), 0xF1CB09)
			        	else -- ���� ������, ��
			          update = false -- �� ��� ����������
			          sampAddChatMessage(('[BotVkCoin]: {FFFFFF}� ��� ����������� ��������� ������!'), 0xF1CB09)
			        end
			      end
			    end
			  end
			end)


			 end
			if new == 1 then
				imgui.SameLine()
				if imgui.Button(u8'��������') then
					update()
				end
			end
		end


		if menu[4] then
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(250)
			imgui.Text(u8'����������')
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(100) imgui.Text(u8'�����: ������ ������')
			imgui.NewLine()
			imgui.SameLine(100) imgui.Text(u8'�� ������: vk.com/d.k8515   ')
			imgui.SameLine(300) if imgui.Button(u8'�������') then os.execute('explorer "https://vk.com/d.k8515"') end
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(100) imgui.Text(u8'���������� ���: ������� | �������� ����')
			imgui.NewLine()
			imgui.SameLine(100) imgui.Text(u8'������: vk.com/arizonapolezno  ')
			imgui.SameLine(299) if imgui.Button(u8'�e�����') then os.execute('explorer "https://vk.com/arizonapolezno"') end
			imgui.NewLine() imgui.NewLine()
			imgui.SameLine(100) imgui.Text(u8'������ �������: '..thisScript().version)
			if new == 1 then imgui.SameLine() imgui.Text(u8'( �������� ����� ������: '..ver..' )') else
				imgui.SameLine() imgui.Text(u8'( ��������� ������ )') end
		end

		imgui.End()
	end

	--[[if price_windows_state.v then

		imgui.Begin(u8'��������� ���', price_windows_state)
		imgui.Text(u8'������� ������� ��������� � ��� ������� ��� ������� ���� �� ���������:')
		imgui.NewLine()

		imgui.BeginChild('acc', imgui.ImVec2(450, 210), true)
		imgui.Columns(3, 'mycolumns')
		imgui.Separator()
		imgui.Text(u8'���������') imgui.NextColumn()
		imgui.Text(u8'���-��') imgui.NextColumn()
		imgui.Text(u8'����') imgui.NextColumn()
		imgui.Separator()
		imgui.Text(u8'���� ����') imgui.NextColumn() imgui.InputFloat('##1', clicks,1) imgui.NextColumn() imgui.Text(''..clicks.v*0.0002 .. ' VKoin') imgui.NextColumn()
		imgui.Text(u8'����������') imgui.NextColumn() imgui.InputFloat('##2', video,1) imgui.NextColumn() imgui.Text(''..video.v*0.0008 .. ' VKoin') imgui.NextColumn()
		imgui.Text(u8'������ ���������') imgui.NextColumn() imgui.InputFloat('##3', stoika,1) imgui.NextColumn() imgui.Text(''..stoika.v*0.003 .. ' VKoin') imgui.NextColumn()
		imgui.Text(u8'��������������') imgui.NextColumn() imgui.InputFloat('##4', super,1) imgui.NextColumn() imgui.Text(''..super.v*0.01 .. ' VKoin') imgui.NextColumn()
		imgui.Text(u8'������ Arizona Games') imgui.NextColumn() imgui.InputFloat('##5', server,1) imgui.NextColumn() imgui.Text(''..server.v*0.04 .. ' VKoin') imgui.NextColumn()
		imgui.Text(u8'��������� ���������') imgui.NextColumn() imgui.InputFloat('##6', kvant,1) imgui.NextColumn() imgui.Text(''..kvant.v*0.16 .. ' VKoin') imgui.NextColumn()
		imgui.Text(u8'���������') imgui.NextColumn() imgui.InputFloat('##7', data,1) imgui.NextColumn() imgui.Text(''..data.v*1 .. ' VKoin')
		imgui.EndChild()
		imgui.NewLine()
		imgui.SameLine(360)
		if imgui.Button(u8'���������', ImVec2(100, 30)) then
			ini.price.click = clicks.v
			ini.price.data = data.v
			ini.price.kvant = kvant.v
			ini.price.stoika = stoika.v
			ini.price.server = server.v
			ini.price.video = video.v
			ini.price.super = super.v
			if inicfg.save(ini, directIni) then
				sampAddChatMessage('[BotVkCoin] {FFFFFF}������� ���������.', 0xF1CB09)
			else sampAddChatMessage('[BotVkCoin] {f10000}������.', 0xF1CB09) end
			price_windows_state.v = not price_windows_state.v
		end
		imgui.End()
	end]]--

	if main_windows_state.v then

	imgui.SetNextWindowPos(imgui.ImVec2(imgui.GetIO().DisplaySize.x - 185, imgui.GetIO().DisplaySize.y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
	imgui.SetNextWindowSize(imgui.ImVec2(250, 300), imgui.Cond.FirstUseEver)
	imgui.Begin('		  CoinMiner | version ' .. thisScript().version, main_windows_state, imgui.WindowFlags.MenuBar)

	if imgui.BeginMenuBar() then
		if imgui.BeginMenu(u8'����') then
			 if imgui.MenuItem(u8'����������') then
			 	sampAddChatMessage('[BotVkCoin] {FFFFFF}�����: ������ ������.', 0xF1CB09)
			 	sampAddChatMessage('[BotVkCoin] {FFFFFF}��: vk.com/d.k8515', 0xF1CB09)
			 	sampAddChatMessage('[BotVkCoin] {FFFFFF}���������� ���: ������� | �������� ����', 0xF1CB09)
			 end
			 if new == 1 then
				 if imgui.MenuItem(u8'����������') then
					 lua_thread.create(goupdate) -- ������
				 end
			 end
			imgui.EndMenu()
		end
		imgui.EndMenuBar()
	end

        imgui.Separator()
        imgui.NewLine()
        imgui.SameLine(3)

	if imgui.TreeNode(u8'������� ��������') then

		if imgui.TreeNode(u8'�������� ��� �������') then
			imgui.RadioButton(u8'�� ��� �������', tip, 0)
			imgui.RadioButton(u8'���������', tip, 1)
			imgui.TreePop()
		end

		if tip.v == 0 then
			if imgui.TreeNode(u8'��������� �������') then
			  imgui.Text(u8'��� ��������?')
				imgui.Text(u8'')
		   	imgui.Text(u8'���� ����') imgui.SameLine(200) imgui.Checkbox('##1', buy[1])
				imgui.Text(u8 "����������") imgui.SameLine(200) imgui.Checkbox('##2', buy[2])
				imgui.Text(u8 "������ ���������") imgui.SameLine(200) imgui.Checkbox('##3', buy[3])
				imgui.Text(u8 "��������������") imgui.SameLine(200) imgui.Checkbox('##4', buy[4])
				imgui.Text(u8 "������ Arizona Games") imgui.SameLine(200) imgui.Checkbox('##5', buy[5])
				imgui.Text(u8 "��������� ���������") imgui.SameLine(200) imgui.Checkbox('##6', buy[6])
				imgui.Text(u8 "���������") imgui.SameLine(200) imgui.Checkbox('##7', buy[7])
				imgui.Text(u8'')
				imgui.TreePop()
			end
		end

		if tip.v == 1 then
		if imgui.TreeNode(u8'�������� ��� ��������') then
			imgui.RadioButton(u8'���� ����', radio1, 0)
			imgui.RadioButton(u8'����������', radio1, 1)
			imgui.RadioButton(u8'������ ���������', radio1, 2)
			imgui.RadioButton(u8'��������������', radio1, 3)
			imgui.RadioButton(u8'������ Arizona Games', radio1, 4)
			imgui.RadioButton(u8'��������� ���������', radio1, 5)
			imgui.RadioButton(u8'���������', radio1, 6)
			imgui.TreePop()
		end end


		if imgui.TreeNode(u8'������� ������� ��������') then

			imgui.Checkbox(u8'��� ������', nolimit)
			if nolimit.v == false then
			imgui.InputInt('', limit, 1) imgui.Text(' ') end
			imgui.TreePop()
		end

		if imgui.TreeNode(u8'���������� ��������') then
			imgui.Text(u8'��������:')
			imgui.SameLine()
			ShowHelpMarker(u8'�������� ������� ���������, ������ �� �������� ������� ���������.')
			imgui.InputInt(' ', delay, 15)
			imgui.Text(' ')
			imgui.TreePop()
		end



		if imgui.Button(u8'������') then
			if limit.v == 0 and nolimit.v == false then
				sampAddChatMessage('[BotVkCoin] {FFFFFF}�� �� ���������� �����', 0xF1CB09)
			else
			value = limit
			activebot = true
		end
		end

		if activebot then
			imgui.SameLine()
			if imgui.Button(u8'����') then
				activebot = false
			end
		end

		imgui.TreePop()
	end
	imgui.Separator()
        imgui.NewLine()
        imgui.SameLine(3)

	if imgui.TreeNode(u8'���� ������') then
		imgui.Checkbox(u8'���������', click) imgui.SameLine()
		ShowHelpMarker(u8'���� ���������� ������, ���������� �������� ��� ������.')
		imgui.TreePop()
	end

	imgui.Separator()
        imgui.NewLine()
        imgui.SameLine(3)

	--[[if imgui.TreeNode(u8'����� ��������') then
		imgui.Text(u8'��������:')
		imgui.SameLine()
		ShowHelpMarker(u8'����� �������� ������ �� �������� ���� ������� � ���� ������� ���������. ��� ���������� ������ ������������� ������� 350')
		imgui.InputInt(' ', delay, 15)
		imgui.Text(' ')
		imgui.TreePop()
	end--]]

	imgui.End()
end
end


function update()
  local fpath = os.getenv('TEMP') .. '\\testing_version.json' -- ���� ����� �������� ��� ������ ��� ��������� ������
  downloadUrlToFile('https://raw.githubusercontent.com/danil8515/coinbot/master/version.json', fpath, function(id, status, p1, p2) -- ������ �� ��� ������ ��� ���� ������� ������� � ��� � ���� ��� ����� ������ ����
    if status == dlstatus.STATUS_ENDDOWNLOADDATA then
    local f = io.open(fpath, 'r') -- ��������� ����
    if f then
      local info = decodeJson(f:read('*a')) -- ������
      updatelink = info.updateurl
      if info and info.latest then
        version = tonumber(info.latest) -- ��������� ������ � �����
        ver = tonumber(info.ver)
        if version > thisScript().version_num then -- ���� ������ ������ ��� ������ ������������� ��...
          new = 1
					sampAddChatMessage(('[BotVkCoin]: {FFFFFF}�������� ����������!'), 0xF1CB09)
        	else -- ���� ������, ��
          update = false -- �� ��� ����������
          sampAddChatMessage(('[BotVkCoin]: {FFFFFF}� ��� ����������� ��������� ������!'), 0xF1CB09)
        end
      end
    end
  end
end)
end

function goupdate()
sampAddChatMessage(('[BotVkCoin]: ���������� ����������. AutoReload ����� �������������. ����������...'), 0xF1CB09)
sampAddChatMessage(('[BotVkCoin]: ������� ������: '..thisScript().version..". ����� ������: "..ver), 0xF1CB09)
wait(300)
downloadUrlToFile(updatelink, thisScript().path, function(id3, status1, p13, p23) -- ������ ��� ������ � latest version
  if status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
  sampAddChatMessage(('[BotVkCoin]: ���������� ���������!'), 0xF1CB09)
  thisScript():reload()
end
end)
end

function uu()
    for i = 0,4 do
        menu[i] = false
    end
end


function theme1()
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
				style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)

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
end

function theme2()
	imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function theme3()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.FrameBg]                = ImVec4(0.48, 0.16, 0.16, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.98, 0.26, 0.26, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.98, 0.26, 0.26, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.48, 0.16, 0.16, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.88, 0.26, 0.24, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.Button]                 = ImVec4(0.98, 0.26, 0.26, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.98, 0.06, 0.06, 1.00)
    colors[clr.Header]                 = ImVec4(0.98, 0.26, 0.26, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.98, 0.26, 0.26, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.75, 0.10, 0.10, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.75, 0.10, 0.10, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.98, 0.26, 0.26, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.98, 0.26, 0.26, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.98, 0.26, 0.26, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.98, 0.26, 0.26, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function theme4()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.FrameBg]                = ImVec4(0.16, 0.48, 0.42, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.98, 0.85, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.98, 0.85, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.48, 0.42, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.88, 0.77, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.98, 0.85, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.98, 0.82, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.98, 0.85, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.98, 0.85, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.10, 0.75, 0.63, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.10, 0.75, 0.63, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.98, 0.85, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.98, 0.85, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.98, 0.85, 0.95)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.81, 0.35, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.98, 0.85, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function theme5()
	local style = imgui.GetStyle()
  local clr = imgui.Col
  local ImVec4 = imgui.ImVec4

	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
  style.Alpha = 1.0
  style.Colors[clr.Text] = ImVec4(1.000, 1.000, 1.000, 1.000)
  style.Colors[clr.TextDisabled] = ImVec4(0.000, 0.543, 0.983, 1.000)
  style.Colors[clr.WindowBg] = ImVec4(0.000, 0.000, 0.000, 0.895)
  style.Colors[clr.ChildWindowBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
  style.Colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
  style.Colors[clr.Border] = ImVec4(0.184, 0.878, 0.000, 0.500)
  style.Colors[clr.BorderShadow] = ImVec4(1.00, 1.00, 1.00, 0.10)
  style.Colors[clr.TitleBg] = ImVec4(0.026, 0.597, 0.000, 1.000)
  style.Colors[clr.TitleBgCollapsed] = ImVec4(0.099, 0.315, 0.000, 0.000)
  style.Colors[clr.TitleBgActive] = ImVec4(0.026, 0.597, 0.000, 1.000)
  style.Colors[clr.MenuBarBg] = ImVec4(0.86, 0.86, 0.86, 1.00)
  style.Colors[clr.ScrollbarBg] = ImVec4(0.000, 0.000, 0.000, 0.801)
  style.Colors[clr.ScrollbarGrab] = ImVec4(0.238, 0.238, 0.238, 1.000)
  style.Colors[clr.ScrollbarGrabHovered] = ImVec4(0.238, 0.238, 0.238, 1.000)
  style.Colors[clr.ScrollbarGrabActive] = ImVec4(0.004, 0.381, 0.000, 1.000)
  style.Colors[clr.CheckMark] = ImVec4(0.009, 0.845, 0.000, 1.000)
  style.Colors[clr.SliderGrab] = ImVec4(0.139, 0.508, 0.000, 1.000)
  style.Colors[clr.SliderGrabActive] = ImVec4(0.139, 0.508, 0.000, 1.000)
  style.Colors[clr.Button] = ImVec4(0.000, 0.000, 0.000, 0.400)
  style.Colors[clr.ButtonHovered] = ImVec4(0.000, 0.619, 0.014, 1.000)
  style.Colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
  style.Colors[clr.Header] = ImVec4(0.26, 0.59, 0.98, 0.31)
  style.Colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
  style.Colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
  style.Colors[clr.ResizeGrip] = ImVec4(0.000, 1.000, 0.221, 0.597)
  style.Colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
  style.Colors[clr.ResizeGripActive] = ImVec4(0.26, 0.59, 0.98, 0.95)
  style.Colors[clr.PlotLines] = ImVec4(0.39, 0.39, 0.39, 1.00)
  style.Colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
  style.Colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
  style.Colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
  style.Colors[clr.TextSelectedBg] = ImVec4(0.26, 0.59, 0.98, 0.35)
  style.Colors[clr.ModalWindowDarkening] = ImVec4(0.20, 0.20, 0.20, 0.35)

  style.ScrollbarSize = 16.0
  style.GrabMinSize = 8.0
  style.WindowRounding = 0.0

  style.AntiAliasedLines = true
end

function theme6()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	local ImVec2 = imgui.ImVec2

	style.WindowRounding = 2.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0

	colors[clr.Text] = ImVec4(0.80, 0.80, 0.83, 1.00)
	colors[clr.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
	colors[clr.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00)
	colors[clr.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
	colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
	colors[clr.Border] = ImVec4(0.80, 0.80, 0.83, 0.88)
	colors[clr.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
	colors[clr.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
	colors[clr.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
	colors[clr.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
	colors[clr.TitleBg] = ImVec4(0.76, 0.31, 0.00, 1.00)
	colors[clr.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75)
	colors[clr.TitleBgActive] = ImVec4(0.80, 0.33, 0.00, 1.00)
	colors[clr.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
	colors[clr.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
	colors[clr.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
	colors[clr.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
	colors[clr.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
	colors[clr.ComboBg] = ImVec4(0.19, 0.18, 0.21, 1.00)
	colors[clr.CheckMark] = ImVec4(1.00, 0.42, 0.00, 0.53)
	colors[clr.SliderGrab] = ImVec4(1.00, 0.42, 0.00, 0.53)
	colors[clr.SliderGrabActive] = ImVec4(1.00, 0.42, 0.00, 1.00)
	colors[clr.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
	colors[clr.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
	colors[clr.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
	colors[clr.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
	colors[clr.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
	colors[clr.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
	colors[clr.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
	colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
	colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
	colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
	colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
	colors[clr.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
	colors[clr.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
	colors[clr.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
	colors[clr.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
	colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
	colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end
