local unpackValues = unpack or table.unpack
local ok, result = pcall(function()
	return loadstring(game:HttpGet("https://pastebin.com/raw/0EQy5vhw"))()
end)
local isResultStatus = not ok
if not isResultStatus then
	isResultStatus = result

	if result then
		isResultStatus = result.Status == "False"
	end
end
if isResultStatus then
	return
end
game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = game:GetService("Players").LocalPlayer
LocalPlayer:GetMouse()
if not (gethui and gethui()) then
end
if not (UserInputService.TouchEnabled and "Mobile") then
end
local _ = workspace.CurrentCamera

local UI_FONT_ID = "12187360881"
local UI_FONT = Font.new("rbxassetid://" .. UI_FONT_ID, Enum.FontWeight.Regular, Enum.FontStyle.Normal)
local UI_FONT_BOLD = Font.new("rbxassetid://" .. UI_FONT_ID, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
local UI_FONT_MEDIUM = Font.new("rbxassetid://" .. UI_FONT_ID, Enum.FontWeight.Medium, Enum.FontStyle.Normal)

local function applyUiFont(inst, bold)
	if inst and (inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox")) then
		pcall(function()
			inst.FontFace = bold and UI_FONT_BOLD or UI_FONT
		end)
	end
end

local colorSequence = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(90, 90, 90)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
})
local fromRgbResult = Color3.fromRGB(12, 12, 12)
local secondaryFromRgbResult = Color3.fromRGB(200, 200, 200)
local alternateFromRgbResult = Color3.fromRGB(255, 255, 255)
local additionalFromRgbResult = Color3.fromRGB(255, 255, 255)
local fallbackFromRgbResult = Color3.fromRGB(190, 190, 190)
local darker = {
	["Color Hub 1"] = colorSequence,
	["Color Hub 2"] = fromRgbResult,
	["Color Stroke"] = secondaryFromRgbResult,
	["Color Theme"] = alternateFromRgbResult,
	["Color Text"] = additionalFromRgbResult,
	["Color Dark Text"] = fallbackFromRgbResult,
}
local secondaryColorSequence = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 70, 70)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 8)),
})
local nestedFromRgbResult = Color3.fromRGB(10, 10, 10)
local innerFromRgbResult = Color3.fromRGB(170, 170, 170)
local outerFromRgbResult = Color3.fromRGB(255, 255, 255)
local previousFromRgbResult = Color3.fromRGB(255, 255, 255)
local currentFromRgbResult = Color3.fromRGB(185, 185, 185)
local themes = {
	Darker = darker,
	Dark = {
		["Color Hub 1"] = secondaryColorSequence,
		["Color Hub 2"] = nestedFromRgbResult,
		["Color Stroke"] = innerFromRgbResult,
		["Color Theme"] = outerFromRgbResult,
		["Color Text"] = previousFromRgbResult,
		["Color Dark Text"] = currentFromRgbResult,
	},
}

local info = {
	Version = "1.2.0",
}
local save = {
	UISize = {
		434,
		247,
	},
	TabSize = 160,
	Theme = "Dark",
}
local icons = (function()
	return {
		accessibility = "rbxassetid://10709751939",
		activity = "rbxassetid://10709752035",
		airvent = "rbxassetid://10709752131",
		airplay = "rbxassetid://10709752254",
		alarmcheck = "rbxassetid://10709752405",
		alarmclock = "rbxassetid://10709752630",
		alarmclockoff = "rbxassetid://10709752508",
		alarmminus = "rbxassetid://10709752732",
		alarmplus = "rbxassetid://10709752825",
		album = "rbxassetid://10709752906",
		alertcircle = "rbxassetid://10709752996",
		alertoctagon = "rbxassetid://10709753064",
		alerttriangle = "rbxassetid://10709753149",
		aligncenter = "rbxassetid://10709753570",
		aligncenterhorizontal = "rbxassetid://10709753272",
		aligncentervertical = "rbxassetid://10709753421",
		alignendhorizontal = "rbxassetid://10709753692",
		alignendvertical = "rbxassetid://10709753808",
		alignhorizontaldistributecenter = "rbxassetid://10747779791",
		alignhorizontaldistributeend = "rbxassetid://10747784534",
		alignhorizontaldistributestart = "rbxassetid://10709754118",
		alignhorizontaljustifycenter = "rbxassetid://10709754204",
		alignhorizontaljustifyend = "rbxassetid://10709754317",
		alignhorizontaljustifystart = "rbxassetid://10709754436",
		alignhorizontalspacearound = "rbxassetid://10709754590",
		alignhorizontalspacebetween = "rbxassetid://10709754749",
		alignjustify = "rbxassetid://10709759610",
		alignleft = "rbxassetid://10709759764",
		alignright = "rbxassetid://10709759895",
		alignstarthorizontal = "rbxassetid://10709760051",
		alignstartvertical = "rbxassetid://10709760244",
		alignverticaldistributecenter = "rbxassetid://10709760351",
		alignverticaldistributeend = "rbxassetid://10709760434",
		alignverticaldistributestart = "rbxassetid://10709760612",
		alignverticaljustifycenter = "rbxassetid://10709760814",
		alignverticaljustifyend = "rbxassetid://10709761003",
		alignverticaljustifystart = "rbxassetid://10709761176",
		alignverticalspacearound = "rbxassetid://10709761324",
		alignverticalspacebetween = "rbxassetid://10709761434",
		anchor = "rbxassetid://10709761530",
		angry = "rbxassetid://10709761629",
		annoyed = "rbxassetid://10709761722",
		aperture = "rbxassetid://10709761813",
		apple = "rbxassetid://10709761889",
		archive = "rbxassetid://10709762233",
		archiverestore = "rbxassetid://10709762058",
		armchair = "rbxassetid://10709762327",
		arrowbigdown = "rbxassetid://10747796644",
		arrowbigleft = "rbxassetid://10709762574",
		arrowbigright = "rbxassetid://10709762727",
		arrowbigup = "rbxassetid://10709762879",
		arrowdown = "rbxassetid://10709767827",
		arrowdowncircle = "rbxassetid://10709763034",
		arrowdownleft = "rbxassetid://10709767656",
		arrowdownright = "rbxassetid://10709767750",
		arrowleft = "rbxassetid://10709768114",
		arrowleftcircle = "rbxassetid://10709767936",
		arrowleftright = "rbxassetid://10709768019",
		arrowright = "rbxassetid://10709768347",
		arrowrightcircle = "rbxassetid://10709768226",
		arrowup = "rbxassetid://10709768939",
		arrowupcircle = "rbxassetid://10709768432",
		arrowupdown = "rbxassetid://10709768538",
		arrowupleft = "rbxassetid://10709768661",
		arrowupright = "rbxassetid://10709768787",
		asterisk = "rbxassetid://10709769095",
		atsign = "rbxassetid://10709769286",
		award = "rbxassetid://10709769406",
		axe = "rbxassetid://10709769508",
		axis3d = "rbxassetid://10709769598",
		baby = "rbxassetid://10709769732",
		backpack = "rbxassetid://10709769841",
		baggageclaim = "rbxassetid://10709769935",
		banana = "rbxassetid://10709770005",
		banknote = "rbxassetid://10709770178",
		barchart = "rbxassetid://10709773755",
		barchart2 = "rbxassetid://10709770317",
		barchart3 = "rbxassetid://10709770431",
		barchart4 = "rbxassetid://10709770560",
		barcharthorizontal = "rbxassetid://10709773669",
		barcode = "rbxassetid://10747360675",
		baseline = "rbxassetid://10709773863",
		bath = "rbxassetid://10709773963",
		battery = "rbxassetid://10709774640",
		batterycharging = "rbxassetid://10709774068",
		batteryfull = "rbxassetid://10709774206",
		batterylow = "rbxassetid://10709774370",
		batterymedium = "rbxassetid://10709774513",
		beaker = "rbxassetid://10709774756",
		bed = "rbxassetid://10709775036",
		beddouble = "rbxassetid://10709774864",
		bedsingle = "rbxassetid://10709774968",
		beer = "rbxassetid://10709775167",
		bell = "rbxassetid://10709775704",
		bellminus = "rbxassetid://10709775241",
		belloff = "rbxassetid://10709775320",
		bellplus = "rbxassetid://10709775448",
		bellring = "rbxassetid://10709775560",
		bike = "rbxassetid://10709775894",
		binary = "rbxassetid://10709776050",
		bitcoin = "rbxassetid://10709776126",
		bluetooth = "rbxassetid://10709776655",
		bluetoothconnected = "rbxassetid://10709776240",
		bluetoothoff = "rbxassetid://10709776344",
		bluetoothsearching = "rbxassetid://10709776501",
		bold = "rbxassetid://10747813908",
		bomb = "rbxassetid://10709781460",
		bone = "rbxassetid://10709781605",
		book = "rbxassetid://10709781824",
		bookopen = "rbxassetid://10709781717",
		bookmark = "rbxassetid://10709782154",
		bookmarkminus = "rbxassetid://10709781919",
		bookmarkplus = "rbxassetid://10709782044",
		bot = "rbxassetid://10709782230",
		box = "rbxassetid://10709782497",
		boxselect = "rbxassetid://10709782342",
		boxes = "rbxassetid://10709782582",
		briefcase = "rbxassetid://10709782662",
		brush = "rbxassetid://10709782758",
		bug = "rbxassetid://10709782845",
		building = "rbxassetid://10709783051",
		building2 = "rbxassetid://10709782939",
		bus = "rbxassetid://10709783137",
		cake = "rbxassetid://10709783217",
		calculator = "rbxassetid://10709783311",
		calendar = "rbxassetid://10709789505",
		calendarcheck = "rbxassetid://10709783474",
		calendarcheck2 = "rbxassetid://10709783392",
		calendarclock = "rbxassetid://10709783577",
		calendardays = "rbxassetid://10709783673",
		calendarheart = "rbxassetid://10709783835",
		calendarminus = "rbxassetid://10709783959",
		calendaroff = "rbxassetid://10709788784",
		calendarplus = "rbxassetid://10709788937",
		calendarrange = "rbxassetid://10709789053",
		calendarsearch = "rbxassetid://10709789200",
		calendarx = "rbxassetid://10709789407",
		calendarx2 = "rbxassetid://10709789329",
		camera = "rbxassetid://10709789686",
		cameraoff = "rbxassetid://10747822677",
		car = "rbxassetid://10709789810",
		carrot = "rbxassetid://10709789960",
		cast = "rbxassetid://10709790097",
		charge = "rbxassetid://10709790202",
		check = "rbxassetid://10709790644",
		checkcircle = "rbxassetid://10709790387",
		checkcircle2 = "rbxassetid://10709790298",
		checksquare = "rbxassetid://10709790537",
		chefhat = "rbxassetid://10709790757",
		cherry = "rbxassetid://10709790875",
		chevrondown = "rbxassetid://10709790948",
		chevronfirst = "rbxassetid://10709791015",
		chevronlast = "rbxassetid://10709791130",
		chevronleft = "rbxassetid://10709791281",
		chevronright = "rbxassetid://10709791437",
		chevronup = "rbxassetid://10709791523",
		chevronsdown = "rbxassetid://10709796864",
		chevronsdownup = "rbxassetid://10709791632",
		chevronsleft = "rbxassetid://10709797151",
		chevronsleftright = "rbxassetid://10709797006",
		chevronsright = "rbxassetid://10709797382",
		chevronsrightleft = "rbxassetid://10709797274",
		chevronsup = "rbxassetid://10709797622",
		chevronsupdown = "rbxassetid://10709797508",
		chrome = "rbxassetid://10709797725",
		circle = "rbxassetid://10709798174",
		circledot = "rbxassetid://10709797837",
		circleellipsis = "rbxassetid://10709797985",
		circleslashed = "rbxassetid://10709798100",
		citrus = "rbxassetid://10709798276",
		clapperboard = "rbxassetid://10709798350",
		clipboard = "rbxassetid://10709799288",
		clipboardcheck = "rbxassetid://10709798443",
		clipboardcopy = "rbxassetid://10709798574",
		clipboardedit = "rbxassetid://10709798682",
		clipboardlist = "rbxassetid://10709798792",
		clipboardsignature = "rbxassetid://10709798890",
		clipboardtype = "rbxassetid://10709798999",
		clipboardx = "rbxassetid://10709799124",
		clock = "rbxassetid://10709805144",
		clock1 = "rbxassetid://10709799535",
		clock10 = "rbxassetid://10709799718",
		clock11 = "rbxassetid://10709799818",
		clock12 = "rbxassetid://10709799962",
		clock2 = "rbxassetid://10709803876",
		clock3 = "rbxassetid://10709803989",
		clock4 = "rbxassetid://10709804164",
		clock5 = "rbxassetid://10709804291",
		clock6 = "rbxassetid://10709804435",
		clock7 = "rbxassetid://10709804599",
		clock8 = "rbxassetid://10709804784",
		clock9 = "rbxassetid://10709804996",
		cloud = "rbxassetid://10709806740",
		cloudcog = "rbxassetid://10709805262",
		clouddrizzle = "rbxassetid://10709805371",
		cloudfog = "rbxassetid://10709805477",
		cloudhail = "rbxassetid://10709805596",
		cloudlightning = "rbxassetid://10709805727",
		cloudmoon = "rbxassetid://10709805942",
		cloudmoonrain = "rbxassetid://10709805838",
		cloudoff = "rbxassetid://10709806060",
		cloudrain = "rbxassetid://10709806277",
		cloudrainwind = "rbxassetid://10709806166",
		cloudsnow = "rbxassetid://10709806374",
		cloudsun = "rbxassetid://10709806631",
		cloudsunrain = "rbxassetid://10709806475",
		cloudy = "rbxassetid://10709806859",
		clover = "rbxassetid://10709806995",
		code = "rbxassetid://10709810463",
		code2 = "rbxassetid://10709807111",
		codepen = "rbxassetid://10709810534",
		codesandbox = "rbxassetid://10709810676",
		coffee = "rbxassetid://10709810814",
		cog = "rbxassetid://10709810948",
		coins = "rbxassetid://10709811110",
		columns = "rbxassetid://10709811261",
		command = "rbxassetid://10709811365",
		compass = "rbxassetid://10709811445",
		component = "rbxassetid://10709811595",
		conciergebell = "rbxassetid://10709811706",
		connection = "rbxassetid://10747361219",
		contact = "rbxassetid://10709811834",
		contrast = "rbxassetid://10709811939",
		cookie = "rbxassetid://10709812067",
		copy = "rbxassetid://10709812159",
		copyleft = "rbxassetid://10709812251",
		copyright = "rbxassetid://10709812311",
		cornerdownleft = "rbxassetid://10709812396",
		cornerdownright = "rbxassetid://10709812485",
		cornerleftdown = "rbxassetid://10709812632",
		cornerleftup = "rbxassetid://10709812784",
		cornerrightdown = "rbxassetid://10709812939",
		cornerrightup = "rbxassetid://10709813094",
		cornerupleft = "rbxassetid://10709813185",
		cornerupright = "rbxassetid://10709813281",
		cpu = "rbxassetid://10709813383",
		croissant = "rbxassetid://10709818125",
		crop = "rbxassetid://10709818245",
		cross = "rbxassetid://10709818399",
		crosshair = "rbxassetid://10709818534",
		crown = "rbxassetid://10709818626",
		cupsoda = "rbxassetid://10709818763",
		curlybraces = "rbxassetid://10709818847",
		currency = "rbxassetid://10709818931",
		database = "rbxassetid://10709818996",
		delete = "rbxassetid://10709819059",
		diamond = "rbxassetid://10709819149",
		dice1 = "rbxassetid://10709819266",
		dice2 = "rbxassetid://10709819361",
		dice3 = "rbxassetid://10709819508",
		dice4 = "rbxassetid://10709819670",
		dice5 = "rbxassetid://10709819801",
		dice6 = "rbxassetid://10709819896",
		dices = "rbxassetid://10723343321",
		diff = "rbxassetid://10723343416",
		disc = "rbxassetid://10723343537",
		divide = "rbxassetid://10723343805",
		dividecircle = "rbxassetid://10723343636",
		dividesquare = "rbxassetid://10723343737",
		dollarsign = "rbxassetid://10723343958",
		download = "rbxassetid://10723344270",
		downloadcloud = "rbxassetid://10723344088",
		droplet = "rbxassetid://10723344432",
		droplets = "rbxassetid://10734883356",
		drumstick = "rbxassetid://10723344737",
		edit = "rbxassetid://10734883598",
		edit2 = "rbxassetid://10723344885",
		edit3 = "rbxassetid://10723345088",
		egg = "rbxassetid://10723345518",
		eggfried = "rbxassetid://10723345347",
		electricity = "rbxassetid://10723345749",
		electricityoff = "rbxassetid://10723345643",
		equal = "rbxassetid://10723345990",
		equalnot = "rbxassetid://10723345866",
		eraser = "rbxassetid://10723346158",
		euro = "rbxassetid://10723346372",
		expand = "rbxassetid://10723346553",
		externallink = "rbxassetid://10723346684",
		eye = "rbxassetid://10723346959",
		eyeoff = "rbxassetid://10723346871",
		factory = "rbxassetid://10723347051",
		fan = "rbxassetid://10723354359",
		fastforward = "rbxassetid://10723354521",
		feather = "rbxassetid://10723354671",
		figma = "rbxassetid://10723354801",
		file = "rbxassetid://10723374641",
		filearchive = "rbxassetid://10723354921",
		fileaudio = "rbxassetid://10723355148",
		fileaudio2 = "rbxassetid://10723355026",
		fileaxis3d = "rbxassetid://10723355272",
		filebadge = "rbxassetid://10723355622",
		filebadge2 = "rbxassetid://10723355451",
		filebarchart = "rbxassetid://10723355887",
		filebarchart2 = "rbxassetid://10723355746",
		filebox = "rbxassetid://10723355989",
		filecheck = "rbxassetid://10723356210",
		filecheck2 = "rbxassetid://10723356100",
		fileclock = "rbxassetid://10723356329",
		filecode = "rbxassetid://10723356507",
		filecog = "rbxassetid://10723356830",
		filecog2 = "rbxassetid://10723356676",
		filediff = "rbxassetid://10723357039",
		filedigit = "rbxassetid://10723357151",
		filedown = "rbxassetid://10723357322",
		fileedit = "rbxassetid://10723357495",
		fileheart = "rbxassetid://10723357637",
		fileimage = "rbxassetid://10723357790",
		fileinput = "rbxassetid://10723357933",
		filejson = "rbxassetid://10723364435",
		filejson2 = "rbxassetid://10723364361",
		filekey = "rbxassetid://10723364605",
		filekey2 = "rbxassetid://10723364515",
		filelinechart = "rbxassetid://10723364725",
		filelock = "rbxassetid://10723364957",
		filelock2 = "rbxassetid://10723364861",
		fileminus = "rbxassetid://10723365254",
		fileminus2 = "rbxassetid://10723365086",
		fileoutput = "rbxassetid://10723365457",
		filepiechart = "rbxassetid://10723365598",
		fileplus = "rbxassetid://10723365877",
		fileplus2 = "rbxassetid://10723365766",
		filequestion = "rbxassetid://10723365987",
		filescan = "rbxassetid://10723366167",
		filesearch = "rbxassetid://10723366550",
		filesearch2 = "rbxassetid://10723366340",
		filesignature = "rbxassetid://10723366741",
		filespreadsheet = "rbxassetid://10723366962",
		filesymlink = "rbxassetid://10723367098",
		fileterminal = "rbxassetid://10723367244",
		filetext = "rbxassetid://10723367380",
		filetype = "rbxassetid://10723367606",
		filetype2 = "rbxassetid://10723367509",
		fileup = "rbxassetid://10723367734",
		filevideo = "rbxassetid://10723373884",
		filevideo2 = "rbxassetid://10723367834",
		filevolume = "rbxassetid://10723374172",
		filevolume2 = "rbxassetid://10723374030",
		filewarning = "rbxassetid://10723374276",
		filex = "rbxassetid://10723374544",
		filex2 = "rbxassetid://10723374378",
		files = "rbxassetid://10723374759",
		film = "rbxassetid://10723374981",
		filter = "rbxassetid://10723375128",
		fingerprint = "rbxassetid://10723375250",
		flag = "rbxassetid://10723375890",
		flagoff = "rbxassetid://10723375443",
		flagtriangleleft = "rbxassetid://10723375608",
		flagtriangleright = "rbxassetid://10723375727",
		flame = "rbxassetid://10723376114",
		flashlight = "rbxassetid://10723376471",
		flashlightoff = "rbxassetid://10723376365",
		flaskconical = "rbxassetid://10734883986",
		flaskround = "rbxassetid://10723376614",
		fliphorizontal = "rbxassetid://10723376884",
		fliphorizontal2 = "rbxassetid://10723376745",
		flipvertical = "rbxassetid://10723377138",
		flipvertical2 = "rbxassetid://10723377026",
		flower = "rbxassetid://10747830374",
		flower2 = "rbxassetid://10723377305",
		focus = "rbxassetid://10723377537",
		folder = "rbxassetid://10723387563",
		folderarchive = "rbxassetid://10723384478",
		foldercheck = "rbxassetid://10723384605",
		folderclock = "rbxassetid://10723384731",
		folderclosed = "rbxassetid://10723384893",
		foldercog = "rbxassetid://10723385213",
		foldercog2 = "rbxassetid://10723385036",
		folderdown = "rbxassetid://10723385338",
		folderedit = "rbxassetid://10723385445",
		folderheart = "rbxassetid://10723385545",
		folderinput = "rbxassetid://10723385721",
		folderkey = "rbxassetid://10723385848",
		folderlock = "rbxassetid://10723386005",
		folderminus = "rbxassetid://10723386127",
		folderopen = "rbxassetid://10723386277",
		folderoutput = "rbxassetid://10723386386",
		folderplus = "rbxassetid://10723386531",
		foldersearch = "rbxassetid://10723386787",
		foldersearch2 = "rbxassetid://10723386674",
		foldersymlink = "rbxassetid://10723386930",
		foldertree = "rbxassetid://10723387085",
		folderup = "rbxassetid://10723387265",
		folderx = "rbxassetid://10723387448",
		folders = "rbxassetid://10723387721",
		forminput = "rbxassetid://10723387841",
		forward = "rbxassetid://10723388016",
		frame = "rbxassetid://10723394389",
		framer = "rbxassetid://10723394565",
		frown = "rbxassetid://10723394681",
		fuel = "rbxassetid://10723394846",
		functionsquare = "rbxassetid://10723395041",
		gamepad = "rbxassetid://10723395457",
		gamepad2 = "rbxassetid://10723395215",
		gauge = "rbxassetid://10723395708",
		gavel = "rbxassetid://10723395896",
		gem = "rbxassetid://10723396000",
		ghost = "rbxassetid://10723396107",
		gift = "rbxassetid://10723396402",
		giftcard = "rbxassetid://10723396225",
		gitbranch = "rbxassetid://10723396676",
		gitbranchplus = "rbxassetid://10723396542",
		gitcommit = "rbxassetid://10723396812",
		gitcompare = "rbxassetid://10723396954",
		gitfork = "rbxassetid://10723397049",
		gitmerge = "rbxassetid://10723397165",
		gitpullrequest = "rbxassetid://10723397431",
		gitpullrequestclosed = "rbxassetid://10723397268",
		gitpullrequestdraft = "rbxassetid://10734884302",
		glass = "rbxassetid://10723397788",
		glass2 = "rbxassetid://10723397529",
		glasswater = "rbxassetid://10723397678",
		glasses = "rbxassetid://10723397895",
		globe = "rbxassetid://10723404337",
		globe2 = "rbxassetid://10723398002",
		grab = "rbxassetid://10723404472",
		graduationcap = "rbxassetid://10723404691",
		grape = "rbxassetid://10723404822",
		grid = "rbxassetid://10723404936",
		griphorizontal = "rbxassetid://10723405089",
		gripvertical = "rbxassetid://10723405236",
		hammer = "rbxassetid://10723405360",
		hand = "rbxassetid://10723405649",
		handmetal = "rbxassetid://10723405508",
		harddrive = "rbxassetid://10723405749",
		hardhat = "rbxassetid://10723405859",
		hash = "rbxassetid://10723405975",
		haze = "rbxassetid://10723406078",
		headphones = "rbxassetid://10723406165",
		heart = "rbxassetid://10723406885",
		heartcrack = "rbxassetid://10723406299",
		hearthandshake = "rbxassetid://10723406480",
		heartoff = "rbxassetid://10723406662",
		heartpulse = "rbxassetid://10723406795",
		helpcircle = "rbxassetid://10723406988",
		hexagon = "rbxassetid://10723407092",
		highlighter = "rbxassetid://10723407192",
		history = "rbxassetid://10723407335",
		home = "rbxassetid://10723407389",
		hourglass = "rbxassetid://10723407498",
		icecream = "rbxassetid://10723414308",
		image = "rbxassetid://10723415040",
		imageminus = "rbxassetid://10723414487",
		imageoff = "rbxassetid://10723414677",
		imageplus = "rbxassetid://10723414827",
		import = "rbxassetid://10723415205",
		inbox = "rbxassetid://10723415335",
		indent = "rbxassetid://10723415494",
		indianrupee = "rbxassetid://10723415642",
		infinity = "rbxassetid://10723415766",
		info = "rbxassetid://10723415903",
		inspect = "rbxassetid://10723416057",
		italic = "rbxassetid://10723416195",
		japaneseyen = "rbxassetid://10723416363",
		joystick = "rbxassetid://10723416527",
		key = "rbxassetid://10723416652",
		keyboard = "rbxassetid://10723416765",
		lamp = "rbxassetid://10723417513",
		lampceiling = "rbxassetid://10723416922",
		lampdesk = "rbxassetid://10723417016",
		lampfloor = "rbxassetid://10723417131",
		lampwalldown = "rbxassetid://10723417240",
		lampwallup = "rbxassetid://10723417356",
		landmark = "rbxassetid://10723417608",
		languages = "rbxassetid://10723417703",
		laptop = "rbxassetid://10723423881",
		laptop2 = "rbxassetid://10723417797",
		lasso = "rbxassetid://10723424235",
		lassoselect = "rbxassetid://10723424058",
		laugh = "rbxassetid://10723424372",
		layers = "rbxassetid://10723424505",
		layout = "rbxassetid://10723425376",
		layoutdashboard = "rbxassetid://10723424646",
		layoutgrid = "rbxassetid://10723424838",
		layoutlist = "rbxassetid://10723424963",
		layouttemplate = "rbxassetid://10723425187",
		leaf = "rbxassetid://10723425539",
		library = "rbxassetid://10723425615",
		lifebuoy = "rbxassetid://10723425685",
		lightbulb = "rbxassetid://10723425852",
		lightbulboff = "rbxassetid://10723425762",
		linechart = "rbxassetid://10723426393",
		link = "rbxassetid://10723426722",
		link2 = "rbxassetid://10723426595",
		link2off = "rbxassetid://10723426513",
		list = "rbxassetid://10723433811",
		listchecks = "rbxassetid://10734884548",
		listend = "rbxassetid://10723426886",
		listminus = "rbxassetid://10723426986",
		listmusic = "rbxassetid://10723427081",
		listordered = "rbxassetid://10723427199",
		listplus = "rbxassetid://10723427334",
		liststart = "rbxassetid://10723427494",
		listvideo = "rbxassetid://10723427619",
		listx = "rbxassetid://10723433655",
		loader = "rbxassetid://10723434070",
		loader2 = "rbxassetid://10723433935",
		locate = "rbxassetid://10723434557",
		locatefixed = "rbxassetid://10723434236",
		locateoff = "rbxassetid://10723434379",
		lock = "rbxassetid://10723434711",
		login = "rbxassetid://10723434830",
		logout = "rbxassetid://10723434906",
		luggage = "rbxassetid://10723434993",
		magnet = "rbxassetid://10723435069",
		mail = "rbxassetid://10734885430",
		mailcheck = "rbxassetid://10723435182",
		mailminus = "rbxassetid://10723435261",
		mailopen = "rbxassetid://10723435342",
		mailplus = "rbxassetid://10723435443",
		mailquestion = "rbxassetid://10723435515",
		mailsearch = "rbxassetid://10734884739",
		mailwarning = "rbxassetid://10734885015",
		mailx = "rbxassetid://10734885247",
		mails = "rbxassetid://10734885614",
		map = "rbxassetid://10734886202",
		mappin = "rbxassetid://10734886004",
		mappinoff = "rbxassetid://10734885803",
		maximize = "rbxassetid://10734886735",
		maximize2 = "rbxassetid://10734886496",
		medal = "rbxassetid://10734887072",
		megaphone = "rbxassetid://10734887454",
		megaphoneoff = "rbxassetid://10734887311",
		meh = "rbxassetid://10734887603",
		menu = "rbxassetid://10734887784",
		messagecircle = "rbxassetid://10734888000",
		messagesquare = "rbxassetid://10734888228",
		mic = "rbxassetid://10734888864",
		mic2 = "rbxassetid://10734888430",
		micoff = "rbxassetid://10734888646",
		microscope = "rbxassetid://10734889106",
		microwave = "rbxassetid://10734895076",
		milestone = "rbxassetid://10734895310",
		minimize = "rbxassetid://10734895698",
		minimize2 = "rbxassetid://10734895530",
		minus = "rbxassetid://10734896206",
		minuscircle = "rbxassetid://10734895856",
		minussquare = "rbxassetid://10734896029",
		monitor = "rbxassetid://10734896881",
		monitoroff = "rbxassetid://10734896360",
		monitorspeaker = "rbxassetid://10734896512",
		moon = "rbxassetid://10734897102",
		morehorizontal = "rbxassetid://10734897250",
		morevertical = "rbxassetid://10734897387",
		mountain = "rbxassetid://10734897956",
		mountainsnow = "rbxassetid://10734897665",
		mouse = "rbxassetid://10734898592",
		mousepointer = "rbxassetid://10734898476",
		mousepointer2 = "rbxassetid://10734898194",
		mousepointerclick = "rbxassetid://10734898355",
		move = "rbxassetid://10734900011",
		move3d = "rbxassetid://10734898756",
		movediagonal = "rbxassetid://10734899164",
		movediagonal2 = "rbxassetid://10734898934",
		movehorizontal = "rbxassetid://10734899414",
		movevertical = "rbxassetid://10734899821",
		music = "rbxassetid://10734905958",
		music2 = "rbxassetid://10734900215",
		music3 = "rbxassetid://10734905665",
		music4 = "rbxassetid://10734905823",
		navigation = "rbxassetid://10734906744",
		navigation2 = "rbxassetid://10734906332",
		navigation2off = "rbxassetid://10734906144",
		navigationoff = "rbxassetid://10734906580",
		network = "rbxassetid://10734906975",
		newspaper = "rbxassetid://10734907168",
		octagon = "rbxassetid://10734907361",
		option = "rbxassetid://10734907649",
		outdent = "rbxassetid://10734907933",
		package = "rbxassetid://10734909540",
		package2 = "rbxassetid://10734908151",
		packagecheck = "rbxassetid://10734908384",
		packageminus = "rbxassetid://10734908626",
		packageopen = "rbxassetid://10734908793",
		packageplus = "rbxassetid://10734909016",
		packagesearch = "rbxassetid://10734909196",
		packagex = "rbxassetid://10734909375",
		paintbucket = "rbxassetid://10734909847",
		paintbrush = "rbxassetid://10734910187",
		paintbrush2 = "rbxassetid://10734910030",
		palette = "rbxassetid://10734910430",
		palmtree = "rbxassetid://10734910680",
		paperclip = "rbxassetid://10734910927",
		partypopper = "rbxassetid://10734918735",
		pause = "rbxassetid://10734919336",
		pausecircle = "rbxassetid://10735024209",
		pauseoctagon = "rbxassetid://10734919143",
		pentool = "rbxassetid://10734919503",
		pencil = "rbxassetid://10734919691",
		percent = "rbxassetid://10734919919",
		personstanding = "rbxassetid://10734920149",
		phone = "rbxassetid://10734921524",
		phonecall = "rbxassetid://10734920305",
		phoneforwarded = "rbxassetid://10734920508",
		phoneincoming = "rbxassetid://10734920694",
		phonemissed = "rbxassetid://10734920845",
		phoneoff = "rbxassetid://10734921077",
		phoneoutgoing = "rbxassetid://10734921288",
		piechart = "rbxassetid://10734921727",
		piggybank = "rbxassetid://10734921935",
		pin = "rbxassetid://10734922324",
		pinoff = "rbxassetid://10734922180",
		pipette = "rbxassetid://10734922497",
		pizza = "rbxassetid://10734922774",
		plane = "rbxassetid://10734922971",
		play = "rbxassetid://10734923549",
		playcircle = "rbxassetid://10734923214",
		plus = "rbxassetid://10734924532",
		pluscircle = "rbxassetid://10734923868",
		plussquare = "rbxassetid://10734924219",
		podcast = "rbxassetid://10734929553",
		pointer = "rbxassetid://10734929723",
		poundsterling = "rbxassetid://10734929981",
		power = "rbxassetid://10734930466",
		poweroff = "rbxassetid://10734930257",
		printer = "rbxassetid://10734930632",
		puzzle = "rbxassetid://10734930886",
		quote = "rbxassetid://10734931234",
		radio = "rbxassetid://10734931596",
		radioreceiver = "rbxassetid://10734931402",
		rectanglehorizontal = "rbxassetid://10734931777",
		rectanglevertical = "rbxassetid://10734932081",
		recycle = "rbxassetid://10734932295",
		redo = "rbxassetid://10734932822",
		redo2 = "rbxassetid://10734932586",
		refreshccw = "rbxassetid://10734933056",
		refreshcw = "rbxassetid://10734933222",
		refrigerator = "rbxassetid://10734933465",
		regex = "rbxassetid://10734933655",
		["repeat"] = "rbxassetid://10734933966",
		repeat1 = "rbxassetid://10734933826",
		reply = "rbxassetid://10734934252",
		replyall = "rbxassetid://10734934132",
		rewind = "rbxassetid://10734934347",
		rocket = "rbxassetid://10734934585",
		rockingchair = "rbxassetid://10734939942",
		rotate3d = "rbxassetid://10734940107",
		rotateccw = "rbxassetid://10734940376",
		rotatecw = "rbxassetid://10734940654",
		rss = "rbxassetid://10734940825",
		ruler = "rbxassetid://10734941018",
		russianruble = "rbxassetid://10734941199",
		sailboat = "rbxassetid://10734941354",
		save = "rbxassetid://10734941499",
		scale = "rbxassetid://10734941912",
		scale3d = "rbxassetid://10734941739",
		scaling = "rbxassetid://10734942072",
		scan = "rbxassetid://10734942565",
		scanface = "rbxassetid://10734942198",
		scanline = "rbxassetid://10734942351",
		scissors = "rbxassetid://10734942778",
		screenshare = "rbxassetid://10734943193",
		screenshareoff = "rbxassetid://10734942967",
		scroll = "rbxassetid://10734943448",
		search = "rbxassetid://10734943674",
		send = "rbxassetid://10734943902",
		separatorhorizontal = "rbxassetid://10734944115",
		separatorvertical = "rbxassetid://10734944326",
		server = "rbxassetid://10734949856",
		servercog = "rbxassetid://10734944444",
		servercrash = "rbxassetid://10734944554",
		serveroff = "rbxassetid://10734944668",
		settings = "rbxassetid://10734950309",
		settings2 = "rbxassetid://10734950020",
		share = "rbxassetid://10734950813",
		share2 = "rbxassetid://10734950553",
		sheet = "rbxassetid://10734951038",
		shield = "rbxassetid://10734951847",
		shieldalert = "rbxassetid://10734951173",
		shieldcheck = "rbxassetid://10734951367",
		shieldclose = "rbxassetid://10734951535",
		shieldoff = "rbxassetid://10734951684",
		shirt = "rbxassetid://10734952036",
		shoppingbag = "rbxassetid://10734952273",
		shoppingcart = "rbxassetid://10734952479",
		shovel = "rbxassetid://10734952773",
		showerhead = "rbxassetid://10734952942",
		shrink = "rbxassetid://10734953073",
		shrub = "rbxassetid://10734953241",
		shuffle = "rbxassetid://10734953451",
		sidebar = "rbxassetid://10734954301",
		sidebarclose = "rbxassetid://10734953715",
		sidebaropen = "rbxassetid://10734954000",
		sigma = "rbxassetid://10734954538",
		signal = "rbxassetid://10734961133",
		signalhigh = "rbxassetid://10734954807",
		signallow = "rbxassetid://10734955080",
		signalmedium = "rbxassetid://10734955336",
		signalzero = "rbxassetid://10734960878",
		siren = "rbxassetid://10734961284",
		skipback = "rbxassetid://10734961526",
		skipforward = "rbxassetid://10734961809",
		skull = "rbxassetid://10734962068",
		slack = "rbxassetid://10734962339",
		slash = "rbxassetid://10734962600",
		slice = "rbxassetid://10734963024",
		sliders = "rbxassetid://10734963400",
		slidershorizontal = "rbxassetid://10734963191",
		smartphone = "rbxassetid://10734963940",
		smartphonecharging = "rbxassetid://10734963671",
		smile = "rbxassetid://10734964441",
		smileplus = "rbxassetid://10734964188",
		snowflake = "rbxassetid://10734964600",
		sofa = "rbxassetid://10734964852",
		sortasc = "rbxassetid://10734965115",
		sortdesc = "rbxassetid://10734965287",
		speaker = "rbxassetid://10734965419",
		sprout = "rbxassetid://10734965572",
		square = "rbxassetid://10734965702",
		star = "rbxassetid://10734966248",
		starhalf = "rbxassetid://10734965897",
		staroff = "rbxassetid://10734966097",
		stethoscope = "rbxassetid://10734966384",
		sticker = "rbxassetid://10734972234",
		stickynote = "rbxassetid://10734972463",
		stopcircle = "rbxassetid://10734972621",
		stretchhorizontal = "rbxassetid://10734972862",
		stretchvertical = "rbxassetid://10734973130",
		strikethrough = "rbxassetid://10734973290",
		subscript = "rbxassetid://10734973457",
		sun = "rbxassetid://10734974297",
		sundim = "rbxassetid://10734973645",
		sunmedium = "rbxassetid://10734973778",
		sunmoon = "rbxassetid://10734973999",
		sunsnow = "rbxassetid://10734974130",
		sunrise = "rbxassetid://10734974522",
		sunset = "rbxassetid://10734974689",
		superscript = "rbxassetid://10734974850",
		swissfranc = "rbxassetid://10734975024",
		switchcamera = "rbxassetid://10734975214",
		sword = "rbxassetid://10734975486",
		swords = "rbxassetid://10734975692",
		syringe = "rbxassetid://10734975932",
		table = "rbxassetid://10734976230",
		table2 = "rbxassetid://10734976097",
		tablet = "rbxassetid://10734976394",
		tag = "rbxassetid://10734976528",
		tags = "rbxassetid://10734976739",
		target = "rbxassetid://10734977012",
		tent = "rbxassetid://10734981750",
		terminal = "rbxassetid://10734982144",
		terminalsquare = "rbxassetid://10734981995",
		textcursor = "rbxassetid://10734982395",
		textcursorinput = "rbxassetid://10734982297",
		thermometer = "rbxassetid://10734983134",
		thermometersnowflake = "rbxassetid://10734982571",
		thermometersun = "rbxassetid://10734982771",
		thumbsdown = "rbxassetid://10734983359",
		thumbsup = "rbxassetid://10734983629",
		ticket = "rbxassetid://10734983868",
		timer = "rbxassetid://10734984606",
		timeroff = "rbxassetid://10734984138",
		timerreset = "rbxassetid://10734984355",
		toggleleft = "rbxassetid://10734984834",
		toggleright = "rbxassetid://10734985040",
		tornado = "rbxassetid://10734985247",
		toybrick = "rbxassetid://10747361919",
		train = "rbxassetid://10747362105",
		trash = "rbxassetid://10747362393",
		trash2 = "rbxassetid://10747362241",
		treedeciduous = "rbxassetid://10747362534",
		treepine = "rbxassetid://10747362748",
		trees = "rbxassetid://10747363016",
		trendingdown = "rbxassetid://10747363205",
		trendingup = "rbxassetid://10747363465",
		triangle = "rbxassetid://10747363621",
		trophy = "rbxassetid://10747363809",
		truck = "rbxassetid://10747364031",
		tv = "rbxassetid://10747364593",
		tv2 = "rbxassetid://10747364302",
		type = "rbxassetid://10747364761",
		umbrella = "rbxassetid://10747364971",
		underline = "rbxassetid://10747365191",
		undo = "rbxassetid://10747365484",
		undo2 = "rbxassetid://10747365359",
		unlink = "rbxassetid://10747365771",
		unlink2 = "rbxassetid://10747397871",
		unlock = "rbxassetid://10747366027",
		upload = "rbxassetid://10747366434",
		uploadcloud = "rbxassetid://10747366266",
		usb = "rbxassetid://10747366606",
		user = "rbxassetid://10747373176",
		usercheck = "rbxassetid://10747371901",
		usercog = "rbxassetid://10747372167",
		userminus = "rbxassetid://10747372346",
		userplus = "rbxassetid://10747372702",
		userx = "rbxassetid://10747372992",
		users = "rbxassetid://10747373426",
		utensils = "rbxassetid://10747373821",
		utensilscrossed = "rbxassetid://10747373629",
		venetianmask = "rbxassetid://10747374003",
		verified = "rbxassetid://10747374131",
		vibrate = "rbxassetid://10747374489",
		vibrateoff = "rbxassetid://10747374269",
		video = "rbxassetid://10747374938",
		videooff = "rbxassetid://10747374721",
		view = "rbxassetid://10747375132",
		voicemail = "rbxassetid://10747375281",
		volume = "rbxassetid://10747376008",
		volume1 = "rbxassetid://10747375450",
		volume2 = "rbxassetid://10747375679",
		volumex = "rbxassetid://10747375880",
		wallet = "rbxassetid://10747376205",
		wand = "rbxassetid://10747376565",
		wand2 = "rbxassetid://10747376349",
		watch = "rbxassetid://10747376722",
		waves = "rbxassetid://10747376931",
		webcam = "rbxassetid://10747381992",
		wifi = "rbxassetid://10747382504",
		wifioff = "rbxassetid://10747382268",
		wind = "rbxassetid://10747382750",
		wraptext = "rbxassetid://10747383065",
		wrench = "rbxassetid://10747383470",
		x = "rbxassetid://10747384394",
		xcircle = "rbxassetid://10747383819",
		xoctagon = "rbxassetid://10747384037",
		xsquare = "rbxassetid://10747384217",
		zoomin = "rbxassetid://10747384552",
		zoomout = "rbxassetid://10747384679",
	}
end)()
local iconData = {
	Themes = themes,
	Info = info,
	Save = save,
	Settings = {},
	Connection = {},
	Instances = {},
	Elements = {},
	Options = {},
	Flags = {},
	Tabs = {},
	Icons = icons,
}
local ViewportSize = workspace.CurrentCamera.ViewportSize
local capturedScale = ViewportSize.Y / 450
local Settings = iconData.Settings
local Flags = iconData.Flags
local resultCallback
local handler
local function contCallback(instance, type)
	table.insert(iconData.Instances, {
		Instance = instance,
		Type = type,
	})

	return instance
end
function handler(parent, condition)
	if condition then
		table.foreach(condition, function(_, instance)
			instance.Parent = parent
		end)
	end

	return parent
end
function resultCallback(input, condition)
	if condition then
		table.foreach(condition, function(argument, secondaryArgument)
			input[argument] = secondaryArgument
		end)
	end

	return input
end
local function dataCallback(...)
	local parentData = { ... }

	if type(parentData) ~= "table" then
		return
	end

	local parent = Instance.new(parentData[1])

	if type(parentData[2]) == "table" then
		local condition = parentData[2]

		resultCallback(parent, condition)
		handler(parent, parentData[3])

		if parentData[3] then
			return parent
		end
	elseif typeof(parentData[2]) == "Instance" then
		parent.Parent = parentData[2]

		local condition = parentData[3]

		resultCallback(parent, condition)
		handler(parent, parentData[4])

		if not parentData[4] then
		end
	end

	
	applyUiFont(parent, false)

	return parent
end
pcall(function(argument)
	local secondaryReadfile = readfile

	if secondaryReadfile then
		secondaryReadfile = isfile and isfile(argument)
	end

	if secondaryReadfile then
		local httpService = HttpService
		local secondaryData = { readfile(argument) }
		local data = httpService:JSONDecode(unpackValues(secondaryData))

		if type(data) == "table" then
			if rawget(data, "UISize") then
				iconData.Save.UISize = data.UISize
			end

			if rawget(data, "TabSize") then
				iconData.Save.TabSize = data.TabSize
			end

			local condition = rawget(data, "Theme")

			if condition then
				condition = VerifyTheme(data.Theme)
			end

			if condition then
				iconData.Save.Theme = data.Theme
			end
		end
	end
end, "Nexus library V1.json")
local updateTextData = {
	InsertCallback = function(_, tertiaryArguments, tertiaryArgument)
		if type(tertiaryArgument) == "function" then
			table.insert(tertiaryArguments, tertiaryArgument)
		end

		return tertiaryArgument
	end,
	FireCallback = function(_, data, ...)
		for _, item in ipairs(data) do
			if type(item) == "function" then
				task.spawn(item, ...)
			end
		end
	end,
	ToggleVisible = function(_, secondaryArgument, visibleFlag)
		secondaryArgument.Visible = visibleFlag ~= nil and visibleFlag or secondaryArgument.Visible
	end,
	ToggleParent = function(_, instance, parentFlag)
		if Bool ~= nil then
			instance.Parent = Bool

			return
		end

		instance.Parent = not instance.Parent and parentFlag
	end,
	GetConnectionFunctions = function(_, searchableText, functionValueValue)
		return {
			Function = functionValueValue,
			Connected = true,
			Disconnect = function(self)
				if self.Connected then
					table.remove(searchableText, table.find(searchableText, self.Function))
					self.Connected = false
				end
			end,
			Fire = function(connectedArgument, ...)
				if connectedArgument.Connected then
					task.spawn(connectedArgument.Function, ...)
				end
			end,
		}
	end,
	GetCallback = function(_, optionData, tertiaryArgument)
		local dataOption = optionData[tertiaryArgument]

		if not dataOption then
			dataOption = optionData.Callback or function() end
		end

		local capturedDataOption = dataOption

		if type(capturedDataOption) == "table" then
			return {
				function(argument)
					capturedDataOption[1][capturedDataOption[2]] = argument
				end,
			}
		end

		return { capturedDataOption }
	end,
}
local vData = {}
local Connection = iconData.Connection
function Connection.FireConnection(_, instance, ...)
	local name = type(instance) == "string" and vData[instance]

	if not name then
		name = vData[instance.Name]
	end

	for _, item in pairs(name) do
		task.spawn(item, ...)
	end
end
(function(data)
	if type(data) ~= "table" then
		return
	end

	for _, name in ipairs(data) do
		local secondaryV = {}
		local secondaryArguments = {}

		Connection[name] = secondaryV
		vData[name] = secondaryArguments
		secondaryV.Name = name

		function secondaryV.Connect(_, secondaryArgument)
			if type(secondaryArgument) == "function" then
				table.insert(secondaryArguments, secondaryArgument)

				return updateTextData:GetConnectionFunctions(secondaryArguments, secondaryArgument)
			end
		end
		function secondaryV.Once(_, secondaryArgument)
			if type(secondaryArgument) == "function" then
				return (
					updateTextData:GetConnectionFunctions(secondaryArguments, function(...)
						task.spawn(secondaryArgument, ...);
						(nil):Disconnect()
					end)
				)
			end
		end
	end
end)({
	"FlagsChanged",
	"ThemeChanged",
	"FileSaved",
	"ThemeChanging",
	"OptionAdded",
})
local function isOptionValid(isOptionValidFlags)
	return type(isOptionValidFlags) == "string" and Flags[isOptionValidFlags] ~= nil
end
local function isNumberValid(isNumberValidFlags)
	return type(isNumberValidFlags) == "string" and Flags[isNumberValidFlags]
end
local function handleInstanceProperties(isInstancePropertiesFlags, expectedMembership)
	local isFlags = isInstancePropertiesFlags

	if isInstancePropertiesFlags then
		isFlags = expectedMembership ~= Flags[isInstancePropertiesFlags]

		if not isFlags then
			isFlags = type(expectedMembership) == "table"
		end
	end

	if isFlags then
		Flags[isInstancePropertiesFlags] = expectedMembership
		Connection:FireConnection("FlagsChanged", isInstancePropertiesFlags, expectedMembership)
	end
end
Connection.FlagsChanged:Connect(function(_, _)
	local ScriptFile = Settings.ScriptFile
	local flag = true

	if flag then
		flag = ScriptFile and writefile
	end

	if flag then
		task.wait(0.1)
		local success, result = pcall(function()
			return HttpService:JSONEncode(Flags)
		end)
		if success and pcall(writefile, ScriptFile, result) then
			Connection:FireConnection("FileSaved", "Script-Flags", ScriptFile, result)
		end
	end
end)
local parent = dataCallback("ScreenGui", CoreGui, {
	Name = "Nexus Library V1",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	IgnoreGuiInset = true,
	DisplayOrder = 999,
}, { dataCallback("UIScale", {
	Scale = capturedScale,
	Name = "Scale",
}) })

local function applyFontTree(root)
	applyUiFont(root, false)
	for _, d in ipairs(root:GetDescendants()) do
		applyUiFont(d, false)
	end
end
applyFontTree(parent)
parent.DescendantAdded:Connect(function(descendant)
	applyUiFont(descendant, false)
end)

local Sound = Instance.new("Sound", parent)
Sound.SoundId = "rbxassetid://1412830636"
Sound.Volume = 0.5
local function onActivated()
	Sound:Play()
end
task.spawn(function()
	task.wait(2)

	for _, descendant in pairs(parent:GetDescendants()) do
		if descendant:IsA("TextButton") or descendant:IsA("ImageButton") then
			descendant.Activated:Connect(onActivated)
		end
	end

	parent.DescendantAdded:Connect(function(descendant)
		local condition = descendant:IsA("TextButton")

		if not condition then
			condition = descendant:IsA("ImageButton")
		end

		if condition then
			task.wait(0.1)
			descendant.Activated:Connect(onActivated)
		end
	end)
end)
local Name = CoreGui:FindFirstChild(parent.Name)
if Name and Name ~= parent then
	Name:Destroy()
end
local function handleData(dataCallback)
	if type(dataCallback) == "function" then
		return dataCallback()
	end

	return dataCallback
end
local function secondaryHandler(guiObject, callback)
	guiObject.InputBegan:Connect(function(input)
		local isUserInputTypeTouch = input.UserInputType == Enum.UserInputType.MouseButton1

		if not isUserInputTypeTouch then
			isUserInputTypeTouch = input.UserInputType == Enum.UserInputType.Touch
		end

		if isUserInputTypeTouch then
			while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
				task.wait()
			end
		end

		callback()
	end)
end
local function handleSize(optionData)
	local tweenOption = optionData[1] or optionData.Instance
	local createConfigOption = optionData[2] or optionData.Prop
	local sizeOption = optionData[3] or optionData.NewVal
	local newOption = optionData[4] or (optionData.Time or 0.5)
	local sizeCondition = optionData[5] or (optionData.wait or false)
	local new = TweenInfo.new
	local Quint = Enum.EasingStyle.Quint
	local createSizeConfig = {
		[createConfigOption] = sizeOption,
	}
	local secondaryNew = new(newOption, Quint)
	local tween = TweenService:Create(tweenOption, secondaryNew, createSizeConfig)

	tween:Play()

	if sizeCondition then
		tween.Completed:Wait()
	end

	return tween
end
local function isDragInput(input)
	return input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch
end

local function isMoveInput(input)
	return input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch
end

local function MakeDraggable(moveObject, handle)
	handle = handle or moveObject
	pcall(function()
		moveObject.Active = true
		if handle:IsA("GuiButton") then
			handle.AutoButtonColor = false
			handle.Active = true
		end
	end)

	local dragging = false
	local dragStart
	local startPos

	handle.InputBegan:Connect(function(input)
		if not isDragInput(input) then
			return
		end
		dragging = true
		dragStart = input.Position
		startPos = moveObject.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end)

	local function applyDrag(input)
		if not dragging or not dragStart or not startPos then
			return
		end
		local difference = input.Position - dragStart
		moveObject.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + difference.X / math.max(capturedScale, 0.01),
			startPos.Y.Scale,
			startPos.Y.Offset + difference.Y / math.max(capturedScale, 0.01)
		)
	end

	handle.InputChanged:Connect(function(input)
		if isMoveInput(input) then
			applyDrag(input)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if isMoveInput(input) then
			applyDrag(input)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if isDragInput(input) then
			dragging = false
		end
	end)

	return moveObject
end

local function inputCallback(guiObject)
	resultCallback(guiObject, {
		Active = true,
		AutoButtonColor = false,
	})
	MakeDraggable(guiObject, guiObject)
	return guiObject
end
local function alternateHandler(theme)
	for k, _ in pairs(iconData.Themes) do
		if k == theme then
			return true
		end
	end
end
local function additionalHandler(argument, secondaryArgument)
	if writefile then
		local json = HttpService:JSONEncode(secondaryArgument)

		writefile(argument, json)
	end
end
local theme = iconData.Themes[iconData.Save.Theme]
local function fallbackHandler(argument, secondaryArgument)
	iconData.Elements[argument] = secondaryArgument
end
local function instancePropertiesCallback(argument, input, tertiaryArgument, ...)
	return (iconData.Elements[argument](input, tertiaryArgument, ...))
end
fallbackHandler("Corner", function(argument, uDim)
	local resultCallbackFunction = resultCallback
	local contCallbackFunction = dataCallback

	if not uDim then
		uDim = UDim.new(0, 15)
	end

	return (
		resultCallbackFunction(
			contCallbackFunction("UICorner", argument, {
				CornerRadius = uDim,
			}),
			props
		)
	)
end)
fallbackHandler("Stroke", function(argument, condition, ...)
	local color, thicknessFlag = ...
	local instanceCallback = resultCallback
	local contCallbackFunction = dataCallback
	if not color then
		color = theme["Color Stroke"]
	end
	local thickness = thicknessFlag or 1
	local instance = instanceCallback(
		contCallbackFunction("UIStroke", argument, {
			Color = color,
			Thickness = thickness,
			ApplyStrokeMode = "Border",
		}),
		condition
	)
	table.insert(iconData.Instances, {
		Instance = instance,
		Type = "Stroke",
	})

	return instance
end)
fallbackHandler("Button", function(argument, condition, ...)
	local data = { ... }
	local contCallbackFunction = contCallback
	local resultCallbackFunction = resultCallback
	local dataCallbackFunction = dataCallback
	local size = UDim2.fromScale(1, 1)
	local backgroundColor3 = theme["Color Hub 2"]
	local backgroundTransparencyResult = contCallbackFunction(
		resultCallbackFunction(
			dataCallbackFunction("TextButton", argument, {
				Text = "",
				Size = size,
				BackgroundColor3 = backgroundColor3,
				AutoButtonColor = false,
			}),
			condition
		),
		"Frame"
	)

	backgroundTransparencyResult.MouseEnter:Connect(function()
		backgroundTransparencyResult.BackgroundTransparency = 0.4
	end)
	backgroundTransparencyResult.MouseLeave:Connect(function()
		backgroundTransparencyResult.BackgroundTransparency = 0
	end)

	if data[1] then
		backgroundTransparencyResult.Activated:Connect(data[1])
	end

	applyUiFont(backgroundTransparencyResult, false)
	return backgroundTransparencyResult
end)
fallbackHandler("Gradient", function(argument, condition, ...)
	local instance = resultCallback(
		dataCallback("UIGradient", argument, {
			Color = theme["Color Hub 1"],
		}),
		condition
	)
	table.insert(iconData.Instances, {
		Instance = instance,
		Type = "Gradient",
	})

	return instance
end)
local function updateInstanceProperties(cont, desc, updateInstancePropertiesOption, size)
	local resultCallback = contCallback
	local contCallbackFunction = dataCallback
	local GothamMedium = Enum.Font.GothamMedium
	local textColor3 = theme["Color Text"]
	local dimensions = UDim2.new(1, -20)
	local secondaryDimensions = UDim2.new(0, 0, 0.5)
	local anchorPoint = Vector2.new(0, 0.5)
	local updateInstancePropertiesResult = resultCallback(
		contCallbackFunction("TextLabel", {
			Font = GothamMedium,
			TextColor3 = textColor3,
			Size = dimensions,
			AutomaticSize = "Y",
			Position = secondaryDimensions,
			AnchorPoint = anchorPoint,
			BackgroundTransparency = 1,
			TextTruncate = "AtEnd",
			TextSize = 10,
			TextXAlignment = "Left",
			Text = "",
			RichText = true,
		}),
		"Text"
	)
	applyUiFont(updateInstancePropertiesResult, true)
	local inputCallbackFunction = contCallback
	local dataCallbackFunction = dataCallback
	local Gotham = Enum.Font.Gotham
	local secondaryTextColor = theme["Color Dark Text"]
	local alternateDimensions = UDim2.new(1, -20)
	local additionalDimensions = UDim2.new(0, 12, 0, 15)
	local textResult = inputCallbackFunction(
		dataCallbackFunction("TextLabel", {
			Font = Gotham,
			TextColor3 = secondaryTextColor,
			Size = alternateDimensions,
			AutomaticSize = "Y",
			Position = additionalDimensions,
			BackgroundTransparency = 1,
			TextWrapped = true,
			TextSize = 8,
			TextXAlignment = "Left",
			Text = "",
			RichText = true,
		}),
		"DarkText"
	)
	applyUiFont(textResult, false)
	local labelHolderResult = instancePropertiesCallback("Button", cont, {
		Size = UDim2.new(1, 0, 0, 25),
		AutomaticSize = "Y",
		Name = "Option",
	})

	instancePropertiesCallback("Corner", labelHolderResult, UDim.new(0, 6))

	local labelHolderCallback = dataCallback
	local fallbackDimensions = UDim2.new(0, 10, 0)
	local secondaryAnchorPoint = Vector2.new(0, 0)
	local updateInstancePropertiesData = {
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
		Size = size,
		Position = fallbackDimensions,
		AnchorPoint = secondaryAnchorPoint,
	}
	local glowCallbackFunction = dataCallback
	local uDim = UDim.new(0, 2)
	local secondaryInstancePropertiesResult = glowCallbackFunction("UIListLayout", {
		SortOrder = "LayoutOrder",
		VerticalAlignment = "Center",
		Padding = uDim,
	})
	local frameCallbackFunction = dataCallback
	local paddingBottom = UDim.new(0, 5)
	local paddingTop = UDim.new(0, 5)

	LabelHolder = labelHolderCallback("Frame", labelHolderResult, updateInstancePropertiesData, {
		secondaryInstancePropertiesResult,
		frameCallbackFunction("UIPadding", {
			PaddingBottom = paddingBottom,
			PaddingTop = paddingTop,
		}),
		updateInstancePropertiesResult,
		textResult,
	})

	local data = {
		SetTitle = function(_, updateInstancePropertiesText)
			local updateInstancePropertiesFlag = type(updateInstancePropertiesText) == "string"

			if updateInstancePropertiesFlag then
				updateInstancePropertiesFlag = updateInstancePropertiesText:gsub(" ", ""):len() > 0
			end

			if updateInstancePropertiesFlag then
				updateInstancePropertiesResult.Text = updateInstancePropertiesText
			end
		end,
		SetDesc = function(_, updateInstancePropertiesText)
			local updateInstancePropertiesFlag = type(updateInstancePropertiesText) == "string"

			if updateInstancePropertiesFlag then
				updateInstancePropertiesFlag = updateInstancePropertiesText:gsub(" ", ""):len() > 0
			end

			if updateInstancePropertiesFlag then
				textResult.Visible = true
				textResult.Text = updateInstancePropertiesText
				LabelHolder.Position = UDim2.new(0, 10, 0)
				LabelHolder.AnchorPoint = Vector2.new(0, 0)

				return
			end

			textResult.Visible = false
			textResult.Text = ""
			LabelHolder.Position = UDim2.new(0, 10, 0.5)
			LabelHolder.AnchorPoint = Vector2.new(0, 0.5)
		end,
	}

	data:SetTitle(desc)
	data:SetDesc(updateInstancePropertiesOption)

	return labelHolderResult, data
end
local function nestedHandler(argument)
	if argument:IsA("Frame") then
		return "BackgroundColor3"
	end

	if argument:IsA("ImageLabel") then
		return "ImageColor3"
	end

	if argument:IsA("TextLabel") then
		return "TextColor3"
	end

	if argument:IsA("ScrollingFrame") then
		return "ScrollBarImageColor3"
	end

	if argument:IsA("UIStroke") then
		return "Color"
	end

	return ""
end
function iconData.GetIcon(self, secondaryArgument)
	local flag = type(secondaryArgument) ~= "string"
	if not flag then
		flag = secondaryArgument:find("rbxassetid://") or #secondaryArgument == 0
	end
	if flag then
		return secondaryArgument
	end
	local secondaryFlag
	local searchableText = string.lower(secondaryArgument):gsub("lucide", ""):gsub("-", "")
	if self.Icons[searchableText] then
		return self.Icons[searchableText]
	end
	local Icons = self.Icons
	local iconsResult
	for k, v in pairs(Icons) do
		if k == searchableText then
			return v
		end
		if not secondaryFlag and tostring(k):find(searchableText, 1, true) then
			secondaryFlag = v
		end
	end

	return secondaryFlag or searchableText
end
function iconData.SetTheme(_, secondaryTheme)
	if not alternateHandler(secondaryTheme) then
		return
	end

	iconData.Save.Theme = secondaryTheme
	additionalHandler("Nexus library V1.json", iconData.Save)
	theme = iconData.Themes[secondaryTheme]
	Connection:FireConnection("ThemeChanged", secondaryTheme)
	table.foreach(iconData.Instances, function(_, secondaryArgument)
		if secondaryArgument.Type == "Gradient" then
			secondaryArgument.Instance.Color = theme["Color Hub 1"]

			return
		end

		if secondaryArgument.Type == "Frame" then
			secondaryArgument.Instance.BackgroundColor3 = theme["Color Hub 2"]

			return
		end

		if secondaryArgument.Type == "Stroke" then
			secondaryArgument.Instance[nestedHandler(secondaryArgument.Instance)] = theme["Color Stroke"]

			return
		end

		if secondaryArgument.Type == "Theme" then
			secondaryArgument.Instance[nestedHandler(secondaryArgument.Instance)] = theme["Color Theme"]

			return
		end

		if secondaryArgument.Type == "Text" then
			secondaryArgument.Instance[nestedHandler(secondaryArgument.Instance)] = theme["Color Text"]

			return
		end

		if secondaryArgument.Type == "DarkText" then
			secondaryArgument.Instance[nestedHandler(secondaryArgument.Instance)] = theme["Color Dark Text"]

			return
		end

		if secondaryArgument.Type == "ScrollBar" then
			secondaryArgument.Instance[nestedHandler(secondaryArgument.Instance)] = theme["Color Theme"]
		end
	end)
end
function iconData.SetScale(_, scaleNumber)
	local scale = ViewportSize.Y / math.clamp(scaleNumber, 300, 2000)
	local Scale = parent.Scale

	capturedScale = scale
	Scale.Scale = scale
end
function iconData.MakeWindow(_, nameData)
	local name = nameData[1]
	if not name then
		name = nameData.Name

		if not name then
			name = nameData.Title or "Joo music"
		end
	end
	local text = nameData[2]
	if not text then
		text = nameData.SubTitle or "للاغاني"
	end
	Settings.ScriptFile = nameData[3] or (nameData.SaveFolder or false);
	(function()
		local ScriptFile = Settings.ScriptFile

		if type(ScriptFile) ~= "string" then
			return
		end

		if not readfile or not isfile then
			return
		end

		local success, secondaryResult = pcall(isfile, ScriptFile)

		if success and secondaryResult then
			local success, secondaryResult = pcall(readfile, ScriptFile)
			local capturedResult = secondaryResult

			if success then
				success = type(capturedResult) == "string"
			end

			if success then
				local success, secondaryResult = pcall(function()
					return HttpService:JSONDecode(capturedResult)
				end)

				if not (success and secondaryResult) then
				end
			end
		end
	end)()
	local _, _ = unpack(iconData.Save.UISize)
	local dialogContainerCallback = contCallback
	local contCallbackFunction = dataCallback
	local fallbackParent = parent
	local dimensions = UDim2.new(0, 475, 0, 300)
	local secondaryDimensions = UDim2.new(0.5, -190, 0.5, -110)
	local dialogContainer = dialogContainerCallback(
		contCallbackFunction("ImageButton", fallbackParent, {
			Size = dimensions,
			Position = secondaryDimensions,
			BackgroundColor3 = Color3.fromRGB(8, 8, 8),
			BackgroundTransparency = 0,
			AutoButtonColor = false,
			Active = true,
			Name = "Hub",
		}),
		"Main"
	)
	local dataCallbackFunction = dataCallback
	local alternateDimensions = UDim2.new(1, 0, 1, 0)
	local compactSquareSize = UDim2.new(0, 0, 0, 0)
	local input = dataCallbackFunction("ImageLabel", dialogContainer, {
		Name = "WindowBackground",
		Size = alternateDimensions,
		Position = compactSquareSize,
		BackgroundTransparency = 1,
		Image = "rbxthumb://type=Asset&id=126753882601126&w=420&h=420",
		ImageTransparency = 0,
		ScaleType = Enum.ScaleType.Crop,
		ZIndex = 1,
	})
	instancePropertiesCallback("Corner", input)
	instancePropertiesCallback("Gradient", dialogContainer, {
		Rotation = 45,
	})
	resultCallback(dialogContainer, {
		Active = true,
		AutoButtonColor = false,
	})
	local parentResult = instancePropertiesCallback("Corner", dialogContainer)
	local inputResult = dataCallback("Folder", dialogContainer, {
		Name = "Components",
	})
	local secondaryResult = dataCallback("Folder", parent, {
		Name = "Dropdown",
	})
	local runService = game:GetService("RunService")
	local glowCallbackFunction = dataCallback
	local size = UDim2.fromOffset(150, 150)
	local position = UDim2.fromScale(0.5, 0.5)
	local anchorPoint = Vector2.new(0.5, 0.5)
	local rotationResult = glowCallbackFunction("ImageLabel", dialogContainer, {
		Name = "GlowCircle",
		Size = size,
		Position = position,
		AnchorPoint = anchorPoint,
		BackgroundTransparency = 1,
		Image = "rbxthumb://type=Asset&id=131084234746851&w=420&h=420",
		ImageTransparency = 0,
		ScaleType = Enum.ScaleType.Fit,
		ZIndex = 2,
	})
	runService.Heartbeat:Connect(function(dt)
		rotationResult.Rotation = rotationResult.Rotation + 90 * dt
	end)
	local frameCallbackFunction = dataCallback
	local secondarySize = UDim2.fromOffset(24, 24)
	local additionalDimensions = UDim2.new(0, 2, 0, 0)
	frameCallbackFunction("ImageLabel", dialogContainer, {
		Name = "TopLeftGlow",
		Size = secondarySize,
		Position = additionalDimensions,
		BackgroundTransparency = 1,
		Image = "rbxthumb://type=Asset&id=108291140586700&w=420&h=420",
		ImageTransparency = 0,
		ScaleType = Enum.ScaleType.Fit,
		ZIndex = 10,
	})
	local guiObjectCallback = dataCallback
	local alternateSize = UDim2.fromOffset(25, 25)
	local fallbackDimensions = UDim2.new(1, -70, 0, -6)
	local GothamBold = Enum.Font.GothamBold
	local textColor3 = Color3.fromRGB(255, 255, 255)
	local guiObject = guiObjectCallback("TextButton", dialogContainer, {
		Name = "SizeButton",
		Size = alternateSize,
		Position = fallbackDimensions,
		BackgroundTransparency = 1,
		Text = "",
		TextSize = 18,
		Font = GothamBold,
		TextColor3 = textColor3,
		ZIndex = 50,
	})
	applyUiFont(guiObject, true)
	local inputCallbackFunction = dataCallback
	local additionalSize = UDim2.fromOffset(110, 130)
	local nestedDimensions = UDim2.new(1, -115, 0, 30)
	local backgroundColor3 = Color3.fromRGB(12, 12, 12)
	local updateVisibleResult = inputCallbackFunction("Frame", dialogContainer, {
		Name = "SizeMenu",
		Size = additionalSize,
		Position = nestedDimensions,
		BackgroundColor3 = backgroundColor3,
		Visible = false,
		ZIndex = 49,
	})
	dataCallback("UICorner", updateVisibleResult, {
		CornerRadius = UDim.new(0, 8),
	})
	local function handleVisible(visibleArgument, secondaryArgument)
		game:GetService("TweenService")
			:Create(dialogContainer, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				Size = UDim2.fromOffset(visibleArgument, secondaryArgument),
			})
			:Play()
	end
	local function updateVisible(
		updateVisibleText,
		secondaryArgument,
		updateVisibleArgument,
		secondarySecondaryArgument
	)
		local guiObjectCallback = dataCallback
		local visibleResult = updateVisibleResult
		local dimensions = UDim2.new(1, -10, 0, 25)
		local secondaryDimensions = UDim2.new(0, 5, 0, secondaryArgument)
		local backgroundColor3 = Color3.fromRGB(28, 28, 28)
		local Gotham = Enum.Font.Gotham
		local textColor3 = Color3.fromRGB(255, 255, 255)
		local guiObject = guiObjectCallback("TextButton", visibleResult, {
			Size = dimensions,
			Position = secondaryDimensions,
			BackgroundColor3 = backgroundColor3,
			Text = updateVisibleText,
			TextSize = 12,
			Font = Gotham,
			TextColor3 = textColor3,
			ZIndex = 51,
		})
		applyUiFont(guiObject, false)

		dataCallback("UICorner", guiObject, {
			CornerRadius = UDim.new(0, 6),
		})
		guiObject.MouseButton1Click:Connect(function()
			handleVisible(updateVisibleArgument, secondarySecondaryArgument)
			updateVisibleResult.Visible = false
		end)
	end
	updateVisible("صغير", 5, 350, 200)
	updateVisible("وسط", 35, 420, 250)
	updateVisible("كبير", 65, 550, 320)
	updateVisible("افتراضي", 95, 420, 250)
	guiObject.MouseButton1Click:Connect(function()
		updateVisibleResult.Visible = not updateVisibleResult.Visible
	end)
	local instance = dataCallback("Frame", inputResult, {
		Size = UDim2.new(1, 0, 0, 28),
		BackgroundTransparency = 1,
		Name = "Top Bar",
		ZIndex = 20,
		Active = true,
	})
	MakeDraggable(dialogContainer, instance)
	local timestamp = tick()
	local instanceCallback = contCallback
	local parentCallbackFunction = dataCallback
	local fallbackSize = UDim2.fromScale(0, 1)
	local secondaryAnchorPoint = Vector2.new(0, 1)
	local innerDimensions = UDim2.new(1, 5, 0.9)
	local secondaryText = '<font family="12187360881">' .. text .. "</font>"
	local secondaryTextColor = theme["Color Dark Text"]
	local absoluteSizeResult = instanceCallback(
		parentCallbackFunction("TextLabel", {
			Size = fallbackSize,
			AutomaticSize = "X",
			AnchorPoint = secondaryAnchorPoint,
			Position = innerDimensions,
			Text = secondaryText,
			RichText = true,
			TextColor3 = secondaryTextColor,
			BackgroundTransparency = 1,
			TextXAlignment = "Left",
			TextYAlignment = "Bottom",
			TextSize = 8,
			Name = "SubTitle",
		}),
		"DarkText"
	)
	applyUiFont(absoluteSizeResult, false)
	local resultCallbackFunction = dataCallback
	local nestedSize = UDim2.fromOffset(50, 12)
	local outerDimensions = UDim2.new(1, 5, 0.9)
	local alternateAnchorPoint = Vector2.new(0, 1)
	local alternateTextColor = theme["Color Theme"]
	local gothamBold = Enum.Font.GothamBold
	local secondaryParent = resultCallbackFunction("TextLabel", {
		Size = nestedSize,
		Position = outerDimensions,
		AnchorPoint = alternateAnchorPoint,
		BackgroundTransparency = 1,
		TextColor3 = alternateTextColor,
		Font = gothamBold,
		TextSize = 8,
		TextXAlignment = "Left",
		Text = "00:00:00",
		Name = "Timer",
	})
	applyUiFont(secondaryParent, true)
	local instanceCallbackFunction = contCallback
	local guiObjectCallbackFunction = dataCallback
	local previousDimensions = UDim2.new(0, 30, 0.5)
	local additionalAnchorPoint = Vector2.new(0, 0.5)
	local alternateText = '<font family="12187360881">' .. name .. "</font>"
	local additionalTextColor = theme["Color Text"]
	local textResult = instanceCallbackFunction(
		guiObjectCallbackFunction("TextLabel", instance, {
			Position = previousDimensions,
			AnchorPoint = additionalAnchorPoint,
			AutomaticSize = "XY",
			Text = alternateText,
			RichText = true,
			TextXAlignment = "Left",
			TextSize = 12,
			TextColor3 = additionalTextColor,
			BackgroundTransparency = 1,
			Name = "Title",
		}, {
			absoluteSizeResult,
			secondaryParent,
		}),
		"Text"
	)
	applyUiFont(textResult, true)
	task.spawn(function()
		while true do
			local parent = secondaryParent

			if parent then
				parent = secondaryParent.Parent
			end

			if not parent then
				break
			end

			local differenceNumber = tick()
			local secondaryMath = math
			local difference = differenceNumber - timestamp
			local textNumber = secondaryMath.floor(difference / 3600)
			local number = math.floor(difference % 3600 / 60)
			local secondaryTextNumber = math.floor(difference % 60)

			secondaryParent.Text = string.format("%02d:%02d:%02d", textNumber, number, secondaryTextNumber)
			secondaryParent.Position = UDim2.new(1, absoluteSizeResult.AbsoluteSize.X + 19, 0.9)
			task.wait(1)
		end
	end)
	local dialogContainerCallbackFunction = contCallback
	local labelHolderCallbackFunction = dataCallback
	local currentDimensions = UDim2.new(0, iconData.Save.TabSize, 1, -instance.Size.Y.Offset)
	local scrollBarImageColor3 = theme["Color Theme"]
	local nextDimensions = UDim2.new(0, 0, 1, 0)
	local fallbackAnchorPoint = Vector2.new(0, 1)
	local sourceDimensions = UDim2.new()
	local tabScrollOption = {
		Size = currentDimensions,
		ScrollBarImageColor3 = scrollBarImageColor3,
		Position = nextDimensions,
		AnchorPoint = fallbackAnchorPoint,
		ScrollBarThickness = 1.5,
		BackgroundTransparency = 1,
		ScrollBarImageTransparency = 0.2,
		CanvasSize = sourceDimensions,
		AutomaticCanvasSize = "Y",
		ScrollingDirection = "Y",
		BorderSizePixel = 0,
		Name = "Tab Scroll",
	}
	local callback = dataCallback
	local uDim = UDim.new(0, 10)
	local paddingRight = UDim.new(0, 10)
	local paddingTop = UDim.new(0, 10)
	local paddingBottom = UDim.new(0, 10)
	local secondaryInput = dialogContainerCallbackFunction(
		labelHolderCallbackFunction("ScrollingFrame", inputResult, tabScrollOption, {
			callback("UIPadding", {
				PaddingLeft = uDim,
				PaddingRight = paddingRight,
				PaddingTop = paddingTop,
				PaddingBottom = paddingBottom,
			}),
			dataCallback("UIListLayout", {
				Padding = UDim.new(0, 5),
			}),
		}),
		"ScrollBar"
	)
	local parentCallback = dataCallback
	local targetDimensions = UDim2.new(1, -secondaryInput.Size.X.Offset, 1, -instance.Size.Y.Offset)
	local nestedAnchorPoint = Vector2.new(1, 1)
	local dimensionsVariantA = UDim2.new(1, 0, 1, 0)
	local alternateParent = parentCallback("Frame", inputResult, {
		Size = targetDimensions,
		AnchorPoint = nestedAnchorPoint,
		Position = dimensionsVariantA,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Name = "Containers",
	})
	local updateInstancePropertiesResult = dataCallback("Frame", alternateParent, {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Name = "ThemeParticles",
		ZIndex = -5,
		ClipsDescendants = true,
	})
	local particleSize = {
		Min = 6,
		Max = 10,
	}
	local particleSpeed = {
		Min = 15,
		Max = 25,
	}
	local isUpdateInstancePropertiesYOffsetData = {
		MaxParticles = 30,
		SpawnRate = 0.1,
		ParticleSize = particleSize,
		ParticleSpeed = particleSpeed,
		ParticleLifetime = 6,
	}
	local updateInstancePropertiesData = {}
	local function updateBackgroundTransparency()
		if #updateInstancePropertiesData >= isUpdateInstancePropertiesYOffsetData.MaxParticles then
			return
		end

		local AbsoluteSize = updateInstancePropertiesResult.AbsoluteSize
		local randomResult = math.random(10, math.max(11, AbsoluteSize.X - 10))
		local updateBackgroundTransparencyNumber = AbsoluteSize.Y + 20
		local secondaryRandomResult = math.random(
			isUpdateInstancePropertiesYOffsetData.ParticleSize.Min,
			isUpdateInstancePropertiesYOffsetData.ParticleSize.Max
		)
		local speed = math.random(
			isUpdateInstancePropertiesYOffsetData.ParticleSpeed.Min,
			isUpdateInstancePropertiesYOffsetData.ParticleSpeed.Max
		)
		local originalColor = theme["Color Theme"]
		local frameCallback = dataCallback
		local updateBackgroundTransparencyResult = updateInstancePropertiesResult
		local size = UDim2.fromOffset(secondaryRandomResult, secondaryRandomResult)
		local position = UDim2.fromOffset(randomResult, updateBackgroundTransparencyNumber)
		local frame = frameCallback("Frame", updateBackgroundTransparencyResult, {
			Size = size,
			Position = position,
			BackgroundColor3 = originalColor,
			BackgroundTransparency = 0.2,
			BorderSizePixel = 0,
		})

		dataCallback("UICorner", frame, {
			CornerRadius = UDim.new(0.5, 0),
		})

		local glowCallback = dataCallback
		local dimensions = UDim2.new(1, 6, 1, 6)
		local secondaryDimensions = UDim2.new(0.5, 0, 0.5, 0)
		local anchorPoint = Vector2.new(0.5, 0.5)
		local glow = glowCallback("Frame", frame, {
			Size = dimensions,
			Position = secondaryDimensions,
			AnchorPoint = anchorPoint,
			BackgroundColor3 = originalColor,
			BackgroundTransparency = 0.7,
			ZIndex = -1,
		})

		dataCallback("UICorner", glow, {
			CornerRadius = UDim.new(0.5, 0),
		})

		local startTime = tick()
		local direction = Vector2.new(0, -speed)
		local updateBackgroundTransparencyData = {
			Frame = frame,
			Glow = glow,
			StartTime = startTime,
			Speed = speed,
			Direction = direction,
			OriginalColor = originalColor,
		}

		frame.BackgroundTransparency = 1
		glow.BackgroundTransparency = 1
		handleSize({
			frame,
			"BackgroundTransparency",
			0.2,
			0.8,
		})
		handleSize({
			glow,
			"BackgroundTransparency",
			0.7,
			0.8,
		})
		table.insert(updateInstancePropertiesData, updateBackgroundTransparencyData)
	end
	local function secondaryUpdateInstanceProperties()
		local _ = updateInstancePropertiesResult.AbsoluteSize

		for i = #updateInstancePropertiesData, 1, -1 do
			local secondaryI = i
			local glowResult = updateInstancePropertiesData[secondaryI]
			local updateInstancePropertiesNumber = tick() - glowResult.StartTime
			local isYOffset = updateInstancePropertiesNumber >= isUpdateInstancePropertiesYOffsetData.ParticleLifetime

			if not isYOffset then
				isYOffset = glowResult.Frame.Position.Y.Offset < -20
			end

			if isYOffset then
				handleSize({
					glowResult.Frame,
					"BackgroundTransparency",
					1,
					0.5,
				})
				handleSize({
					glowResult.Glow,
					"BackgroundTransparency",
					1,
					0.5,
				})
				task.spawn(function()
					task.wait(0.5)

					local Frame = glowResult.Frame

					if Frame then
						Frame = glowResult.Frame.Parent
					end

					if Frame then
						glowResult.Frame:Destroy()
					end
				end)
				table.remove(updateInstancePropertiesData, secondaryI)
			else
				local FramePosition = glowResult.Frame.Position
				local sum = FramePosition.Y.Offset + glowResult.Direction.Y * 0.016

				glowResult.Frame.Position = UDim2.fromOffset(FramePosition.X.Offset, sum)

				local quotient = updateInstancePropertiesNumber / isUpdateInstancePropertiesYOffsetData.ParticleLifetime

				if quotient > 0.8 then
					local updateInstancePropertiesNumber = 0.2 * (1 - (quotient - 0.8) / 0.2)

					glowResult.Frame.BackgroundTransparency = math.max(1 - updateInstancePropertiesNumber, 0.95)
				end
			end
		end
	end
	runService.Heartbeat:Connect(function()
		secondaryUpdateInstanceProperties()

		local isSpawnRate = tick() - 0 >= isUpdateInstancePropertiesYOffsetData.SpawnRate

		if isSpawnRate then
			isSpawnRate = dialogContainer.Visible
		end

		if isSpawnRate then
			updateBackgroundTransparency()
			tick()
		end
	end)
	local callbackFunction = inputCallback
	local glowCallback = dataCallback
	local secondaryCompactSquareSize = UDim2.new(0, 35, 0, 35)
	local Size = dialogContainer.Size
	local innerAnchorPoint = Vector2.new(0.8, 0.8)
	local alternateInput = callbackFunction(glowCallback("ImageButton", dialogContainer, {
		Size = secondaryCompactSquareSize,
		Position = Size,
		Active = true,
		AnchorPoint = innerAnchorPoint,
		BackgroundTransparency = 1,
		Name = "Control Hub Size",
	}))
	local secondaryInputCallback = inputCallback
	local frameCallback = dataCallback
	local dimensionsVariantB = UDim2.new(0, 20, 1, -30)
	local dimensionsVariantC = UDim2.new(0, secondaryInput.Size.X.Offset, 1, 0)
	local outerAnchorPoint = Vector2.new(0.5, 1)
	local inputData = {
		frameCallback("ImageButton", dialogContainer, {
			Size = dimensionsVariantB,
			Position = dimensionsVariantC,
			AnchorPoint = outerAnchorPoint,
			Active = true,
			BackgroundTransparency = 1,
			Name = "Control Tab Size",
		}),
	}
	local capturedInput = alternateInput
	local additionalInput = secondaryInputCallback(unpackValues(inputData))
	local function onGetPropertyChangedSignal()
		local Position = capturedInput.Position
		local position = additionalInput.Position

		capturedInput.Position =
			UDim2.fromOffset(math.clamp(Position.X.Offset, 430, 1000), (math.clamp(Position.Y.Offset, 200, 500)))
		additionalInput.Position = UDim2.new(0, math.clamp(position.X.Offset, 135, 250), 1, 0)
		secondaryInput.Size = UDim2.new(0, additionalInput.Position.X.Offset, 1, -instance.Size.Y.Offset)
		alternateParent.Size = UDim2.new(1, -secondaryInput.Size.X.Offset, 1, -instance.Size.Y.Offset)
		dialogContainer.Size = capturedInput.Position
	end
	capturedInput:GetPropertyChangedSignal("Position"):Connect(onGetPropertyChangedSignal)
	additionalInput:GetPropertyChangedSignal("Position"):Connect(onGetPropertyChangedSignal)
	secondaryHandler(capturedInput, function()
		if not Minimized then
			iconData.Save.UISize = {
				dialogContainer.Size.X.Offset,
				dialogContainer.Size.Y.Offset,
			}
			additionalHandler("Nexus library V5.json", iconData.Save)
		end
	end)
	secondaryHandler(additionalInput, function()
		iconData.Save.TabSize = secondaryInput.Size.X.Offset
		additionalHandler("Nexus library V5.json", iconData.Save)
	end)
	local additionalParent = dataCallback("Folder", instance, {
		Name = "Buttons",
	})
	local labelHolderCallback = dataCallback
	local alternateCompactSquareSize = UDim2.new(0, 14, 0, 14)
	local dimensionsVariantD = UDim2.new(1, -10, 0.5)
	local previousAnchorPoint = Vector2.new(1, 0.5)
	local activatedResult = labelHolderCallback("ImageButton", {
		Size = alternateCompactSquareSize,
		Position = dimensionsVariantD,
		AnchorPoint = previousAnchorPoint,
		BackgroundTransparency = 1,
		Image = "rbxassetid://10747384394",
		AutoButtonColor = false,
		Name = "Close",
		ZIndex = 60,
	})
	local imageResult = resultCallback(activatedResult:Clone(), {
		Position = UDim2.new(1, -35, 0.5),
		Image = "rbxassetid://10734896206",
		Name = "Minimize",
		ZIndex = 60,
	})
	handler(additionalParent, {
		activatedResult,
		imageResult,
	})
	local flag = false
	local savedWindowSize = dialogContainer.Size
	local data = {}
	function data.CloseBtn(_)
		data:Dialog({
			Title = "Joo music",
			Text = "هل تريد غلق سكربت joo music للاغاني؟",
			Options = {
				{
					"نعم",
					function()
						parent:Destroy()
					end,
				},
				{ "لا" },
			},
		})
	end
	function data.MinimizeBtn(_)
		if flag then
			imageResult.Image = "rbxassetid://10734896206"
			local restoreSize = savedWindowSize or UDim2.fromOffset(475, 300)
			handleSize({
				dialogContainer,
				"Size",
				restoreSize,
				0.25,
				true,
			})
			capturedInput.Visible = true
			additionalInput.Visible = true
			flag = false
			return
		end

		savedWindowSize = dialogContainer.Size
		imageResult.Image = "rbxassetid://10734924532"
		capturedInput.Visible = false
		additionalInput.Visible = false
		handleSize({
			dialogContainer,
			"Size",
			UDim2.fromOffset(dialogContainer.Size.X.Offset, 28),
			0.25,
			true,
		})
		flag = true
	end
	function data.Minimize(_)
		dialogContainer.Visible = not dialogContainer.Visible
	end
	function data.AddMinimizeButton(_, secondaryArgument)
		local guiObjectCallback = dataCallback
		local secondaryParent = parent
		local size = UDim2.fromOffset(35, 35)
		local position = UDim2.fromScale(0.15, 0.15)
		local backgroundColor3 = theme["Color Hub 2"]
		local guiObject = guiObjectCallback("ImageButton", secondaryParent, {
			Size = size,
			Position = position,
			BackgroundTransparency = 1,
			BackgroundColor3 = backgroundColor3,
			AutoButtonColor = false,
		})
		resultCallback(guiObject, {
			Active = true,
			AutoButtonColor = false,
		})
		MakeDraggable(guiObject, guiObject)
		local button = guiObject
		local corner
		local stroke
		if secondaryArgument.Corner then
			corner = instancePropertiesCallback("Corner", button)
			resultCallback(corner, secondaryArgument.Corner)
		end
		if secondaryArgument.Stroke then
			stroke = instancePropertiesCallback("Stroke", button)
			resultCallback(stroke, secondaryArgument.Corner)
		end
		resultCallback(button, secondaryArgument.Button)
		button.Activated:Connect(data.Minimize)

		return {
			Stroke = stroke,
			Corner = corner,
			Button = button,
		}
	end
	function data.Set(_, text, subTitleText)
		local flag = type(text) == "string"

		if flag then
			flag = type(subTitleText) == "string"
		end

		if flag then
			textResult.Text = '<font family="12187360881">' .. text .. "</font>"
			textResult.SubTitle.Text = '<font family="12187360881">' .. subTitleText .. "</font>"

			return
		end

		if type(text) == "string" then
			textResult.Text = '<font family="12187360881">' .. text .. "</font>"
		end
	end
	function data.Dialog(_, textData)
		if dialogContainer:FindFirstChild("Dialog") then
			return
		end
		if flag then
			data:MinimizeBtn()
		end
		local text = textData[1]
		if not text then
			text = textData.Title or "Dialog"
		end
		local secondaryText = textData[2]
		if not secondaryText then
			secondaryText = textData.Text or "This is a Dialog"
		end
		local option = textData[3]
		if not option then
			option = textData.Options or {}
		end
		local instanceCallback = dataCallback
		local size = UDim2.fromOffset(270, 162)
		local position = UDim2.fromScale(0.5, 0.5)
		local anchorPoint = Vector2.new(0.5, 0.5)
		local instanceData = {
			Active = true,
			Size = size,
			Position = position,
			AnchorPoint = anchorPoint,
		}
		local contCallbackFunction = contCallback
		local dataCallbackFunction = dataCallback
		local gothamBold = Enum.Font.GothamBold
		local dimensions = UDim2.new(1, 0, 0, 20)
		local textColor3 = theme["Color Text"]
		local secondaryPosition = UDim2.fromOffset(15, 5)
		local instanceResult = contCallbackFunction(
			dataCallbackFunction("TextLabel", {
				Font = gothamBold,
				Size = dimensions,
				Text = text,
				TextXAlignment = "Left",
				TextColor3 = textColor3,
				TextSize = 15,
				Position = secondaryPosition,
				BackgroundTransparency = 1,
			}),
			"Text"
		)
		applyUiFont(instanceResult, true)
		local inputCallbackFunction = contCallback
		local glowCallbackFunction = dataCallback
		local GothamMedium = Enum.Font.GothamMedium
		local secondaryDimensions = UDim2.new(1, -25)
		local secondaryTextColor = theme["Color Dark Text"]
		local alternatePosition = UDim2.fromOffset(15, 25)
		local input = instanceCallback("Frame", instanceData, {
			instanceResult,
			inputCallbackFunction(
				glowCallbackFunction("TextLabel", {
					Font = GothamMedium,
					Size = secondaryDimensions,
					AutomaticSize = "Y",
					Text = secondaryText,
					TextXAlignment = "Left",
					TextColor3 = secondaryTextColor,
					TextSize = 12,
					Position = alternatePosition,
					BackgroundTransparency = 1,
					TextWrapped = true,
				}),
				"DarkText"
			),
		})
		instancePropertiesCallback("Gradient", input, {
			Rotation = 270,
		})
		instancePropertiesCallback("Corner", input)
		local frameCallbackFunction = dataCallback
		local secondarySize = UDim2.fromScale(1, 0.35)
		local additionalPosition = UDim2.fromScale(0, 1)
		local secondaryAnchorPoint = Vector2.new(0, 1)
		local backgroundColor3 = theme["Color Hub 2"]
		local button = frameCallbackFunction(
			"Frame",
			input,
			{
				Size = secondarySize,
				Position = additionalPosition,
				AnchorPoint = secondaryAnchorPoint,
				BackgroundColor3 = backgroundColor3,
				BackgroundTransparency = 1,
			},
			{
				dataCallback("UIListLayout", {
					Padding = UDim.new(0, 10),
					VerticalAlignment = "Center",
					FillDirection = "Horizontal",
					HorizontalAlignment = "Center",
				}),
			}
		)
		local parentCallback = contCallback
		local parentCallbackFunction = dataCallback
		local secondaryParent = dialogContainer
		local secondaryBackgroundColor = theme["Color Hub 2"]
		local alternateDimensions = UDim2.new(1, 0, 1, 0)
		local alternateBackgroundColor = theme["Color Stroke"]
		local parent = parentCallback(
			parentCallbackFunction("Frame", secondaryParent, {
				BackgroundTransparency = 0.6,
				Active = true,
				BackgroundColor3 = secondaryBackgroundColor,
				Size = alternateDimensions,
				BackgroundColor3 = alternateBackgroundColor,
				Name = "Dialog",
			}),
			"Stroke"
		)
		parentResult:Clone().Parent = parent
		input.Parent = parent
		handleSize({
			input,
			"Size",
			UDim2.fromOffset(250, 150),
			0.2,
		})
		handleSize({
			input,
			"Transparency",
			0,
			0.15,
		})
		handleSize({
			parent,
			"Transparency",
			0.3,
			0.15,
		})
		local sizeNumber = 1
		local closeData = {}
		function closeData.Button(_, nameData)
			local name = nameData[1]

			if not name then
				name = nameData.Name

				if not name then
					name = nameData.Title or ""
				end
			end

			local option = nameData[2]

			if not option then
				option = nameData.Callback or function() end
			end

			sizeNumber += 1

			local input = instancePropertiesCallback("Button", button)

			instancePropertiesCallback("Corner", input)

			local resultCallbackFunction = resultCallback
			local gothamBold = Enum.Font.GothamBold
			local textColor3 = theme["Color Text"]

			resultCallbackFunction(input, {
				Text = name,
				Font = gothamBold,
				TextColor3 = textColor3,
				TextSize = 12,
			})
			applyUiFont(input, true)

			for _, child in pairs(button:GetChildren()) do
				if child:IsA("TextButton") then
					child.Size = UDim2.new(1 / sizeNumber, -((sizeNumber - 1) * 20 / sizeNumber), 0, 32)
				end
			end

			input.Activated:Connect(closeData.Close)
			input.Activated:Connect(option)
		end
		function closeData.Close(_)
			handleSize({
				input,
				"Size",
				UDim2.fromOffset(270, 162),
				0.2,
			})
			handleSize({
				parent,
				"Transparency",
				1,
				0.15,
			})
			handleSize({
				input,
				"Transparency",
				1,
				0.15,
				true,
			})
			parent:Destroy()
		end
		table.foreach(option, function(_, secondaryArgument)
			closeData:Button(secondaryArgument)
		end)

		return closeData
	end
	function data.SelectTab(_, secondaryArgument)
		if type(secondaryArgument) == "number" then
			iconData.Tabs[secondaryArgument].func:Enable()

			return
		end

		for _, item in pairs(iconData.Tabs) do
			if item.Cont == secondaryArgument.Cont then
				item.func:Enable()
			end
		end
	end
	local conts = {}
	function data.MakeTab(_, nameData, optionData)
		if type(nameData) == "table" then
			optionData = nameData
		end

		local name = optionData[1]

		if not name then
			name = optionData.Title or "Tab!"
		end

		local iconOption = optionData[2]

		if not iconOption then
			iconOption = optionData.Icon or ""
		end

		local Icon = iconData:GetIcon(iconOption)
		local flag = not Icon:find("rbxassetid://")

		if not flag then
			flag = Icon:gsub("rbxassetid://", ""):len() < 6
		end

		if flag then
			Icon = false
		end

		local parentResult = instancePropertiesCallback("Button", secondaryInput, {
			Size = UDim2.new(1, 0, 0, 24),
		})

		instancePropertiesCallback("Corner", parentResult)

		local contCallbackFunction = contCallback
		local dataCallbackFunction = dataCallback
		local dimensions = UDim2.new(1, not Icon and -15 or -25, 1)
		local position = UDim2.fromOffset(not Icon and 15 or 25)
		local GothamMedium = Enum.Font.GothamMedium
		local textColor3 = theme["Color Text"]
		local Left = Enum.TextXAlignment.Left
		local updateSizeResult = contCallbackFunction(
			dataCallbackFunction("TextLabel", parentResult, {
				Size = dimensions,
				Position = position,
				BackgroundTransparency = 1,
				Font = GothamMedium,
				Text = name,
				TextColor3 = textColor3,
				TextSize = 10,
				TextXAlignment = Left,
				TextTransparency = 0,
				TextTruncate = "AtEnd",
			}),
			"Text"
		)
		applyUiFont(updateSizeResult, false)
		local parentCallback = contCallback
		local glowCallbackFunction = dataCallback
		local secondaryDimensions = UDim2.new(0, 8, 0.5)
		local compactSquareSize = UDim2.new(0, 13, 0, 13)
		local anchorPoint = Vector2.new(0, 0.5)
		local image = Icon or ""
		local secondaryParent = parentCallback(
			glowCallbackFunction("ImageLabel", parentResult, {
				Position = secondaryDimensions,
				Size = compactSquareSize,
				AnchorPoint = anchorPoint,
				Image = image,
				BackgroundTransparency = 1,
				ImageTransparency = 0,
			}),
			"Text"
		)
		local ImageLabel = Instance.new("ImageLabel")

		ImageLabel.Parent = secondaryParent
		ImageLabel.Size = UDim2.new(2.2, 0, 2.2, 0)
		ImageLabel.Position = UDim2.new(-0.6, 0, -0.6, 0)
		ImageLabel.BackgroundTransparency = 1
		ImageLabel.Image = "rbxassetid://5028857084"
		ImageLabel.ImageColor3 = theme["Color Theme"]
		ImageLabel.ImageTransparency = 1
		ImageLabel.ZIndex = secondaryParent.ZIndex - 1

		local function updateSizeImage(image)
			local parent = secondaryParent

			if not image then
				image = ""
			end

			parent.Image = image
			handleSize({
				ImageLabel,
				"ImageTransparency",
				0.15,
				0.25,
			})
			handleSize({
				secondaryParent,
				"Size",
				UDim2.new(0, 16, 0, 16),
				0.25,
			})
			task.delay(0.25, function()
				handleSize({
					ImageLabel,
					"ImageTransparency",
					1,
					0.35,
				})
				handleSize({
					secondaryParent,
					"Size",
					UDim2.new(0, 13, 0, 13),
					0.35,
				})
			end)
		end

		local inputCallbackFunction = contCallback
		local frameCallbackFunction = dataCallback
		local secondaryCompactSquareSize = false

		if secondaryCompactSquareSize then
			secondaryCompactSquareSize = UDim2.new(0, 4, 0, 4)
		end

		if not secondaryCompactSquareSize then
			secondaryCompactSquareSize = UDim2.new(0, 4, 0, 13)
		end

		local alternateDimensions = UDim2.new(0, 1, 0.5)
		local secondaryAnchorPoint = Vector2.new(0, 0.5)
		local backgroundColor3 = theme["Color Theme"]
		local input = inputCallbackFunction(
			frameCallbackFunction("Frame", parentResult, {
				Size = secondaryCompactSquareSize,
				Position = alternateDimensions,
				AnchorPoint = secondaryAnchorPoint,
				BackgroundColor3 = backgroundColor3,
				BackgroundTransparency = 0,
			}),
			"Theme"
		)

		instancePropertiesCallback("Corner", input, UDim.new(0.5, 0))

		local parentCallbackFunction = contCallback
		local resultCallbackFunction = dataCallback
		local additionalDimensions = UDim2.new(1, 0, 1, 0)
		local fallbackDimensions = UDim2.new(0, 0, 1)
		local alternateAnchorPoint = Vector2.new(0, 1)
		local scrollBarImageColor3 = theme["Color Theme"]
		local nestedDimensions = UDim2.new()
		local secondaryName = ("Container %i [ %s ]"):format(#conts + 1, name)
		local contData = {
			Size = additionalDimensions,
			Position = fallbackDimensions,
			AnchorPoint = alternateAnchorPoint,
			ScrollBarThickness = 1.5,
			BackgroundTransparency = 1,
			ScrollBarImageTransparency = 0.2,
			ScrollBarImageColor3 = scrollBarImageColor3,
			AutomaticCanvasSize = "Y",
			ScrollingDirection = "Y",
			BorderSizePixel = 0,
			CanvasSize = nestedDimensions,
			Name = secondaryName,
		}
		local instanceCallbackFunction = dataCallback
		local paddingLeft = UDim.new(0, 10)
		local paddingRight = UDim.new(0, 10)
		local paddingTop = UDim.new(0, 10)
		local paddingBottom = UDim.new(0, 10)
		local cont = parentCallbackFunction(
			resultCallbackFunction("ScrollingFrame", contData, {
				instanceCallbackFunction("UIPadding", {
					PaddingLeft = paddingLeft,
					PaddingRight = paddingRight,
					PaddingTop = paddingTop,
					PaddingBottom = paddingBottom,
				}),
				dataCallback("UIListLayout", {
					Padding = UDim.new(0, 5),
				}),
			}),
			"ScrollBar"
		)

		table.insert(conts, cont)
		cont.Parent = alternateParent

		local function updateSize()
			if cont.Parent then
				return
			end

			for _, item in pairs(conts) do
				local updateSizeFlag = item:IsA("ScrollingFrame")

				if updateSizeFlag then
					updateSizeFlag = item ~= cont
				end

				if updateSizeFlag then
					item.Parent = nil
				end
			end

			cont.Parent = alternateParent
			cont.Size = UDim2.new(1, 0, 1, 150)
			table.foreach(iconData.Tabs, function(_, secondaryArgument)
				if secondaryArgument.Cont ~= cont then
					secondaryArgument.func:Disable()
				end
			end)

			if not IconBusy then
				IconBusy = true
				updateSizeImage(OpenIcon)
				task.delay(2, function()
					updateSizeImage(OriginalIcon)
					IconBusy = false
				end)
			end

			handleSize({
				cont,
				"Size",
				UDim2.new(1, 0, 1, 0),
				0.3,
			})
			handleSize({
				updateSizeResult,
				"TextTransparency",
				0,
				0.35,
			})
			handleSize({
				secondaryParent,
				"ImageTransparency",
				0,
				0.35,
			})
			handleSize({
				input,
				"Size",
				UDim2.new(0, 4, 0, 13),
				0.35,
			})
			handleSize({
				input,
				"BackgroundTransparency",
				0,
				0.35,
			})
		end

		parentResult.Activated:Connect(updateSize)

		local func = {}

		table.insert(iconData.Tabs, {
			TabInfo = {
				Name = name,
				Icon = Icon,
			},
			func = func,
			Cont = cont,
		})
		func.Cont = cont

		function func.Disable(_)
			cont.Parent = nil
			handleSize({
				updateSizeResult,
				"TextTransparency",
				0.3,
				0.35,
			})
			handleSize({
				secondaryParent,
				"ImageTransparency",
				0.3,
				0.35,
			})
			handleSize({
				input,
				"Size",
				UDim2.new(0, 4, 0, 4),
				0.35,
			})
			handleSize({
				input,
				"BackgroundTransparency",
				1,
				0.35,
			})
		end
		function func.Enable(_)
			updateSize()
		end
		function func.Visible(_, secondaryArgument)
			updateTextData:ToggleVisible(parentResult, secondaryArgument)
			updateTextData:ToggleParent(cont, secondaryArgument, alternateParent)
		end
		function func.Destroy(_)
			parentResult:Destroy()
			cont:Destroy()
		end
		function func.AddSection(_, nameData, condition)
			local name = type(nameData) == "string" and nameData
			if not name then
				name = nameData[1]

				if not name then
					name = nameData.Name

					if not name then
						name = nameData.Title or "Section"
					end
				end
			end
			local p124Image
			if condition then
				p124Image = condition.Image

				if not p124Image then
					p124Image = condition.Icon or condition[1]
				end

				if p124Image and not p124Image:find("rbxassetid://") then
					p124Image = iconData:GetIcon(p124Image)
				end
			end
			local visibleResult = dataCallback("Frame", cont, {
				Size = UDim2.new(1, 0, 0, not p124Image and 20 or 32),
				BackgroundTransparency = 1,
				Name = "Option",
			})
			if p124Image then
				local contCallbackFunction = dataCallback
				local compactSquareSize = UDim2.new(0, 16, 0, 16)
				local dimensions = UDim2.new(0, 5, 0.5)
				local anchorPoint = Vector2.new(0, 0.5)

				contCallbackFunction("ImageLabel", visibleResult, {
					Size = compactSquareSize,
					Position = dimensions,
					AnchorPoint = anchorPoint,
					BackgroundTransparency = 1,
					Image = p124Image,
				})

				local inputCallbackFunction = contCallback
				local dataCallbackFunction = dataCallback
				local gothamBold = Enum.Font.GothamBold
				local textColor3 = theme["Color Text"]
				local secondaryDimensions = UDim2.new(1, -28, 1, 0)
				local alternateDimensions = UDim2.new(0, 26)

				local lbl = inputCallbackFunction(
					dataCallbackFunction("TextLabel", visibleResult, {
						Font = gothamBold,
						Text = name,
						TextColor3 = textColor3,
						Size = secondaryDimensions,
						Position = alternateDimensions,
						BackgroundTransparency = 1,
						TextTruncate = "AtEnd",
						TextSize = 14,
						TextXAlignment = "Left",
					}),
					"Text"
				)
				applyUiFont(lbl, true)
			else
				local contCallbackFunction = contCallback
				local dataCallbackFunction = dataCallback
				local gothamBold = Enum.Font.GothamBold
				local textColor3 = theme["Color Text"]
				local dimensions = UDim2.new(1, -25, 1, 0)
				local secondaryDimensions = UDim2.new(0, 5)

				local lbl = contCallbackFunction(
					dataCallbackFunction("TextLabel", visibleResult, {
						Font = gothamBold,
						Text = name,
						TextColor3 = textColor3,
						Size = dimensions,
						Position = secondaryDimensions,
						BackgroundTransparency = 1,
						TextTruncate = "AtEnd",
						TextSize = 14,
						TextXAlignment = "Left",
					}),
					"Text"
				)
				applyUiFont(lbl, true)
			end
			local func = {}
			table.insert(iconData.Options, {
				type = "Section",
				Name = name,
				func = func,
			})
			function func.Visible(_, visible)
				if visible == nil then
					visibleResult.Visible = not visibleResult.Visible

					return
				end

				visibleResult.Visible = visible
			end
			function func.Destroy(_)
				visibleResult:Destroy()
			end
			function func.Set(_, dataCallback)
				if dataCallback then
				end
			end

			return func
		end
		function func.AddParagraph(_, optionData)
			local resultOption = optionData[1]

			if not resultOption then
				resultOption = optionData.Title or "Paragraph"
			end

			local option = optionData[2]

			if not option then
				option = optionData.Text or ""
			end

			local secondaryResult, alternateResult =
				updateInstanceProperties(cont, resultOption, option, UDim2.new(1, -20))
			local capturedResult = secondaryResult
			local secondaryCapturedResult = alternateResult

			return {
				Visible = function(_, ...)
					updateTextData:ToggleVisible(capturedResult, ...)
				end,
				Destroy = function(_)
					capturedResult:Destroy()
				end,
				SetTitle = function(_, dataCallback)
					secondaryCapturedResult:SetTitle(handleData(dataCallback))
				end,
				SetDesc = function(_, dataCallback)
					secondaryCapturedResult:SetDesc(handleData(dataCallback))
				end,
				Set = function(_, dataCallback, callback)
					if dataCallback and callback then
						secondaryCapturedResult:SetTitle(handleData(dataCallback))

						local capturedResult = secondaryCapturedResult
						local data = { handleData(callback) }

						capturedResult:SetDesc(unpackValues(data))

						return
					end

					if dataCallback then
						secondaryCapturedResult:SetDesc(handleData(dataCallback))
					end
				end,
			}
		end
		function func.AddButton(_, descData)
			local name = descData[1]

			if not name then
				name = descData.Name

				if not name then
					name = descData.Title or "Button!"
				end
			end

			local Desc = descData.Desc

			if not Desc then
				Desc = descData.Description or ""
			end

			local Callback = updateTextData:GetCallback(descData, 2)
			local image = descData.Icon or ""
			if image ~= "" and not tostring(image):find("rbxassetid://") then
				image = iconData:GetIcon(image) or image
			end
			local imageTransparency = descData.IconTransparency or 0
			local secondaryResult, alternateResult = updateInstanceProperties(cont, name, Desc, UDim2.new(1, -20))
			local capturedResult = secondaryResult
			local secondaryCapturedResult = alternateResult
			local leftIcon
			if image ~= "" then
				leftIcon = dataCallback("ImageLabel", capturedResult, {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(0, 8, 0.5),
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundTransparency = 1,
					Image = image,
					ImageTransparency = imageTransparency,
				})
			end
			local inputCallback = dataCallback
			local compactSquareSize = UDim2.new(0, 14, 0, 14)
			local dimensions = UDim2.new(1, -10, 0.5)
			local anchorPoint = Vector2.new(1, 0.5)
			local input = inputCallback("ImageLabel", capturedResult, {
				Size = compactSquareSize,
				Position = dimensions,
				AnchorPoint = anchorPoint,
				BackgroundTransparency = 1,
				Image = "rbxassetid://10709791437",
			})

			capturedResult.Activated:Connect(function()
				input.Image = "rbxassetid://10709769508"
				local Position = input.Position
				local productNumber = 0
				local connection
				connection = game:GetService("RunService").RenderStepped:Connect(function(dt)
					productNumber += dt

					local product = math.sin(productNumber * 40) * 3

					input.Position = Position + UDim2.new(0, product, 0, 0)

					if productNumber >= 1 then
						connection:Disconnect()
						input.Position = Position
						input.Image = "rbxassetid://10709791437"
					end
				end)
				updateTextData:FireCallback(Callback)
			end)

			return {
				Visible = function(_, ...)
					updateTextData:ToggleVisible(capturedResult, ...)
				end,
				Destroy = function(_)
					capturedResult:Destroy()
				end,
				Callback = function(_, ...)
					updateTextData:InsertCallback(Callback, ...)
				end,
				Set = function(_, secondaryArgument, tertiaryArgument)
					local flag = type(secondaryArgument) == "string"

					if flag then
						flag = type(tertiaryArgument) == "string"
					end

					if flag then
						secondaryCapturedResult:SetTitle(secondaryArgument)
						secondaryCapturedResult:SetDesc(tertiaryArgument)

						return
					end

					if type(secondaryArgument) == "string" then
						secondaryCapturedResult:SetTitle(secondaryArgument)

						return
					end
				end,
				SetIcon = function(_, img)
					if leftIcon then
						leftIcon.Image = img
					end
				end,
				SetTransparency = function(_, imageTransparency)
					if leftIcon then
						leftIcon.ImageTransparency = imageTransparency
					end
				end,
			}
		end
		function func.AddToggle(_, descData)
			local name = descData[1]
			if not name then
				name = descData.Name

				if not name then
					name = descData.Title or "Toggle"
				end
			end
			local Desc = descData.Desc
			if not Desc then
				Desc = descData.Description or ""
			end
			local Callback = updateTextData:GetCallback(descData, 3)
			local isFlags = descData[4] or (descData.Flag or false)
			local expectedMembership = descData[2] or (descData.Default or false)
			if isOptionValid(isFlags) then
				expectedMembership = isNumberValid(isFlags)
			end
			local secondaryResult, alternateResult = updateInstanceProperties(cont, name, Desc, UDim2.new(1, -38))
			local capturedResult = secondaryResult
			local secondaryCapturedResult = alternateResult
			local resultCallback = contCallback
			local contCallbackFunction = dataCallback
			local dimensions = UDim2.new(0, 35, 0, 18)
			local secondaryDimensions = UDim2.new(1, -10, 0.5)
			local anchorPoint = Vector2.new(1, 0.5)
			local backgroundColor3 = theme["Color Stroke"]
			local input = resultCallback(
				contCallbackFunction("Frame", capturedResult, {
					Size = dimensions,
					Position = secondaryDimensions,
					AnchorPoint = anchorPoint,
					BackgroundColor3 = backgroundColor3,
				}),
				"Stroke"
			)
			instancePropertiesCallback("Corner", input, UDim.new(0.5, 0))
			local dataCallbackFunction = dataCallback
			local alternateDimensions = UDim2.new(0.8, 0, 0.8, 0)
			local additionalDimensions = UDim2.new(0.5, 0, 0.5, 0)
			local secondaryAnchorPoint = Vector2.new(0.5, 0.5)
			local additionalResult = dataCallbackFunction("Frame", input, {
				BackgroundTransparency = 1,
				Size = alternateDimensions,
				Position = additionalDimensions,
				AnchorPoint = secondaryAnchorPoint,
			})
			local inputCallbackFunction = contCallback
			local glowCallbackFunction = dataCallback
			local compactSquareSize = UDim2.new(0, 12, 0, 12)
			local fallbackDimensions = UDim2.new(0, 0, 0.5)
			local alternateAnchorPoint = Vector2.new(0, 0.5)
			local secondaryBackgroundColor = theme["Color Theme"]
			local button = inputCallbackFunction(
				glowCallbackFunction("Frame", additionalResult, {
					Size = compactSquareSize,
					Position = fallbackDimensions,
					AnchorPoint = alternateAnchorPoint,
					BackgroundColor3 = secondaryBackgroundColor,
				}),
				"Theme"
			)
			instancePropertiesCallback("Corner", button, UDim.new(0.5, 0))
			local flag
			local function taskCallback(secondaryExpectedMembership)
				if flag then
					return
				end

				expectedMembership = secondaryExpectedMembership
				handleInstanceProperties(isFlags, expectedMembership)
				updateTextData:FireCallback(Callback, expectedMembership)

				if expectedMembership then
					handleSize({
						button,
						"Position",
						UDim2.new(1, 0, 0.5),
						0.25,
					})
					handleSize({
						button,
						"BackgroundTransparency",
						0,
						0.25,
					})
					handleSize({
						button,
						"AnchorPoint",
						Vector2.new(1, 0.5),
						0.25,
						Wait or false,
					})
				else
					handleSize({
						button,
						"Position",
						UDim2.new(0, 0, 0.5),
						0.25,
					})
					handleSize({
						button,
						"BackgroundTransparency",
						0.8,
						0.25,
					})
					handleSize({
						button,
						"AnchorPoint",
						Vector2.new(0, 0.5),
						0.25,
						Wait or false,
					})
				end

				flag = false
			end
			task.spawn(taskCallback, expectedMembership)
			capturedResult.Activated:Connect(function()
				taskCallback(not expectedMembership)
			end)

			return {
				Visible = function(_, ...)
					updateTextData:ToggleVisible(capturedResult, ...)
				end,
				Destroy = function(_)
					capturedResult:Destroy()
				end,
				Callback = function(_, ...)
					updateTextData:InsertCallback(Callback, ...)()
				end,
				Set = function(_, secondaryArgument, secondaryFlag)
					local condition = type(secondaryArgument) == "string"

					if condition then
						condition = type(secondaryFlag) == "string"
					end

					if condition then
						secondaryCapturedResult:SetTitle(secondaryArgument)
						secondaryCapturedResult:SetDesc(secondaryFlag)

						return
					end

					if type(secondaryArgument) == "string" then
						secondaryCapturedResult:SetTitle(secondaryArgument, false, true)

						return
					end

					if type(secondaryArgument) == "boolean" then
						if flag and secondaryFlag then
							repeat
								task.wait()
							until not flag
						end

						task.spawn(taskCallback, secondaryArgument)

						return
					end
				end,
			}
		end
		function func.AddDropdown(_, descData)
			local name = descData[1]
			if not name then
				name = descData.Name

				if not name then
					name = descData.Title or "Dropdown"
				end
			end
			local Desc = descData.Desc
			if not Desc then
				Desc = descData.Description or ""
			end
			local searchableText = descData[2]
			if not searchableText then
				searchableText = descData.Options or {}
			end
			local dataOption = descData[3]
			if not dataOption then
				dataOption = descData.Default or {}
			end
			local isInstancePropertiesFlags = descData[5] or (descData.Flag or false)
			local updateTextCondition = descData.MultiSelect or false
			local Callback = updateTextData:GetCallback(descData, 4)
			local alternateResult, _ = updateInstanceProperties(cont, name, Desc, UDim2.new(1, -180))
			local capturedResult = alternateResult
			local instanceCallback = contCallback
			local contCallbackFunction = dataCallback
			local dimensions = UDim2.new(0, 150, 0, 18)
			local secondaryDimensions = UDim2.new(1, -10, 0.5)
			local anchorPoint = Vector2.new(1, 0.5)
			local backgroundColor3 = theme["Color Stroke"]
			local input = instanceCallback(
				contCallbackFunction("Frame", capturedResult, {
					Size = dimensions,
					Position = secondaryDimensions,
					AnchorPoint = anchorPoint,
					BackgroundColor3 = backgroundColor3,
				}),
				"Stroke"
			)
			instancePropertiesCallback("Corner", input, UDim.new(0, 4))
			local resultCallback = contCallback
			local dataCallbackFunction = dataCallback
			local alternateDimensions = UDim2.new(0.85, 0, 0.85, 0)
			local secondaryAnchorPoint = Vector2.new(0.5, 0.5)
			local additionalDimensions = UDim2.new(0.5, 0, 0.5, 0)
			local gothamBold = Enum.Font.GothamBold
			local textColor3 = theme["Color Text"]
			local updateTextResult = resultCallback(
				dataCallbackFunction("TextLabel", input, {
					Size = alternateDimensions,
					AnchorPoint = secondaryAnchorPoint,
					Position = additionalDimensions,
					BackgroundTransparency = 1,
					Font = gothamBold,
					TextScaled = true,
					TextColor3 = textColor3,
					Text = "...",
				}),
				"Text"
			)
			applyUiFont(updateTextResult, true)
			local glowCallbackFunction = dataCallback
			local compactSquareSize = UDim2.new(0, 15, 0, 15)
			local fallbackDimensions = UDim2.new(0, -5, 0.5)
			local alternateAnchorPoint = Vector2.new(1, 0.5)
			local imageResult = glowCallbackFunction("ImageLabel", input, {
				Size = compactSquareSize,
				Position = fallbackDimensions,
				AnchorPoint = alternateAnchorPoint,
				Image = "rbxassetid://10709791523",
				BackgroundTransparency = 1,
			})
			local guiObjectCallback = dataCallback
			local additionalResult = secondaryResult
			local nestedDimensions = UDim2.new(1, 0, 1, 0)
			local guiObject = guiObjectCallback("TextButton", additionalResult, {
				Name = "AntiClick",
				Size = nestedDimensions,
				BackgroundTransparency = 1,
				Visible = false,
				Text = "",
			})
			local frameCallbackFunction = dataCallback
			local innerDimensions = UDim2.new(input.Size.X, 0, 0)
			local secondaryBackgroundColor = Color3.fromRGB(20, 20, 20)
			local additionalAnchorPoint = Vector2.new(0, 1)
			local button = frameCallbackFunction("Frame", guiObject, {
				Size = innerDimensions,
				BackgroundTransparency = 0.1,
				BackgroundColor3 = secondaryBackgroundColor,
				AnchorPoint = additionalAnchorPoint,
				Name = "DropdownFrame",
				ClipsDescendants = true,
				Active = true,
			})
			instancePropertiesCallback("Corner", button)
			instancePropertiesCallback("Stroke", button)
			instancePropertiesCallback("Gradient", button, {
				Rotation = 60,
			})
			local inputCallbackFunction = contCallback
			local parentCallbackFunction = dataCallback
			local scrollBarImageColor3 = theme["Color Theme"]
			local outerDimensions = UDim2.new(1, 0, 1, 0)
			local previousDimensions = UDim2.new()
			local resultData = {
				ScrollBarImageColor3 = scrollBarImageColor3,
				Size = outerDimensions,
				ScrollBarThickness = 1.5,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = previousDimensions,
				ScrollingDirection = "Y",
				AutomaticCanvasSize = "Y",
				Active = true,
			}
			local resultCallbackFunction = dataCallback
			local paddingLeft = UDim.new(0, 8)
			local paddingRight = UDim.new(0, 8)
			local paddingTop = UDim.new(0, 5)
			local paddingBottom = UDim.new(0, 5)
			local updateInstancePropertiesResult = inputCallbackFunction(
				parentCallbackFunction("ScrollingFrame", button, resultData, {
					resultCallbackFunction("UIPadding", {
						PaddingLeft = paddingLeft,
						PaddingRight = paddingRight,
						PaddingTop = paddingTop,
						PaddingBottom = paddingBottom,
					}),
					dataCallback("UIListLayout", {
						Padding = UDim.new(0, 4),
					}),
				}),
				"ScrollBar"
			)
			local updateAnchorPointNumber = 5
			local flag
			local function onGetPropertyChangedSignal()
				handleSize({
					imageResult,
					"Rotation",
					0,
					0.2,
				})
				handleSize({
					button,
					"Size",
					UDim2.new(0, 152, 0, 0),
					0.2,
					true,
				})
				handleSize({
					imageResult,
					"ImageColor3",
					Color3.fromRGB(255, 255, 255),
					0.2,
				})
				imageResult.Image = "rbxassetid://10709791523"
				guiObject.Visible = false
				flag = false
			end
			local function onActivated()
				local sumNumber = 0

				for _, child in pairs(updateInstancePropertiesResult:GetChildren()) do
					local isChildName = child:IsA("Frame")

					if not isChildName then
						isChildName = child.Name == "Option"
					end

					if isChildName then
						sumNumber += 1
					end
				end

				updateAnchorPointNumber = math.clamp(sumNumber, 0, 10) * 25 + 10

				if guiObject.Visible then
					guiObject.Visible = true
					handleSize({
						button,
						"Size",
						UDim2.fromOffset(152, updateAnchorPointNumber),
						0.2,
						true,
					})
				end
			end
			local function updateAnchorPoint()
				local AbsolutePosition = input.AbsolutePosition
				local AbsoluteSize = parent.AbsoluteSize
				local clampedValue = math.clamp(
					AbsolutePosition.X / capturedScale,
					0,
					AbsoluteSize.X / capturedScale - button.Size.X.Offset
				)
				local secondaryClampedValue =
					math.clamp(AbsolutePosition.Y / capturedScale, 0, AbsoluteSize.Y / capturedScale)
				local fromOffsetResult = UDim2.fromOffset(clampedValue, secondaryClampedValue)
				local updateAnchorPointResult = if not (AbsolutePosition.Y > AbsoluteSize.Y / 1.4)
					then not (updateAnchorPointNumber > 80) and 0 or 0.5
					else 1

				button.AnchorPoint = Vector2.new(0, updateAnchorPointResult)
				handleSize({
					button,
					"Position",
					fromOffsetResult,
					0.1,
				})
			end
			local optionData = type(dataOption) ~= "table" and { dataOption } or dataOption
			local updateInstancePropertiesData = {}
			local value = updateTextCondition and {}
			if not value then
				value = isOptionValid(isInstancePropertiesFlags) and isNumberValid(isInstancePropertiesFlags)
					or optionData[1]
			end
			local updateTextValue = value
			if updateTextCondition then
				for k, item in
					pairs(
						isOptionValid(isInstancePropertiesFlags) and isNumberValid(isInstancePropertiesFlags)
							or optionData
					)
				do
					local searchQuery = k
					local flag = type(searchQuery) == "string"

					if flag then
						flag = searchableText[searchQuery]

						if not flag then
							flag = table.find(searchableText, searchQuery)
						end
					end

					if flag then
						updateTextValue[searchQuery] = item
					elseif searchableText[item] then
						updateTextValue[item] = true
					end
				end
			end
			local function handler()
				handleInstanceProperties(
					isInstancePropertiesFlags,
					updateTextCondition and updateTextValue or tostring(updateTextValue)
				)
				updateTextData:FireCallback(Callback, updateTextValue)
			end
			local function updateText()
				if updateTextCondition then
					local ks = {}

					for k, item in pairs(updateTextValue) do
						if item then
							table.insert(ks, k)
						end
					end

					local textResult = updateTextResult
					local updateTextFlag = #ks > 0

					if updateTextFlag then
						updateTextFlag = table.concat(ks, ", ")
					end

					textResult.Text = updateTextFlag or "..."

					return
				end

				updateTextResult.Text = tostring(updateTextValue or "...")
			end
			local function secondaryHandleInstanceProperties()
				if updateTextCondition then
					for _, item in pairs(updateInstancePropertiesData) do
						local nodes = item.nodes
						local Stats = item.Stats

						handleSize({
							nodes[2],
							"BackgroundTransparency",
							not Stats and 0.8 or 0,
							0.35,
						})

						local instancePropertiesCallback = handleSize
						local instancePropertiesResult = nodes[2]
						local stats = Stats

						if Stats then
							stats = UDim2.fromOffset(4, 12)
						end

						if not stats then
							stats = UDim2.fromOffset(4, 4)
						end

						instancePropertiesCallback({
							instancePropertiesResult,
							"Size",
							stats,
							0.35,
						})
						handleSize({
							nodes[3],
							"TextTransparency",
							not Stats and 0.4 or 0,
							0.35,
						})
					end
				else
					for _, item in pairs(updateInstancePropertiesData) do
						local isVValue = item.Value == updateTextValue
						local nodes = item.nodes

						handleSize({
							nodes[2],
							"BackgroundTransparency",
							not isVValue and 1 or 0,
							0.35,
						})

						local instancePropertiesCallback = handleSize
						local instancePropertiesResult = nodes[2]
						local isInstancePropertiesVValue = isVValue

						if isVValue then
							isInstancePropertiesVValue = UDim2.fromOffset(4, 14)
						end

						if not isInstancePropertiesVValue then
							isInstancePropertiesVValue = UDim2.fromOffset(4, 4)
						end

						instancePropertiesCallback({
							instancePropertiesResult,
							"Size",
							isInstancePropertiesVValue,
							0.35,
						})
						handleSize({
							nodes[3],
							"TextTransparency",
							not isVValue and 0.4 or 0,
							0.35,
						})
					end
				end

				updateText()
			end
			local function secondaryUpdateInstanceProperties(str)
				if updateTextCondition then
					str.Stats = not str.Stats
					str.LastCB = tick()
					updateTextValue[str.Name] = str.Stats
					handler()
				else
					str.LastCB = tick()
					updateTextValue = str.Value
					handler()
				end

				secondaryHandleInstanceProperties()
			end
			local function alternateUpdateInstanceProperties(index, updateInstancePropertiesValue)
				local str = tostring(type(index) == "string" and index or updateInstancePropertiesValue)

				if updateInstancePropertiesData[str] then
					return
				end

				updateInstancePropertiesData[str] = {
					index = index,
					Value = updateInstancePropertiesValue,
					Name = str,
					Stats = false,
					LastCB = 0,
				}

				if updateTextCondition then
					local stats = updateTextValue[str]

					updateTextValue[str] = stats or false
					updateInstancePropertiesData[str].Stats = stats
				end

				local resultCallback = instancePropertiesCallback
				local button = updateInstancePropertiesResult
				local dimensions = UDim2.new(1, 0, 0, 21)
				local secondaryDimensions = UDim2.new(0, 0, 0.5)
				local anchorPoint = Vector2.new(0, 0.5)
				local nodesResult = resultCallback("Button", button, {
					Name = "Option",
					Size = dimensions,
					Position = secondaryDimensions,
					AnchorPoint = anchorPoint,
				})

				instancePropertiesCallback("Corner", nodesResult, UDim.new(0, 4))

				local contCallbackFunction = contCallback
				local dataCallbackFunction = dataCallback
				local alternateDimensions = UDim2.new(0, 1, 0.5)
				local compactSquareSize = UDim2.new(0, 4, 0, 4)
				local backgroundColor3 = theme["Color Theme"]
				local secondaryAnchorPoint = Vector2.new(0, 0.5)
				local input = contCallbackFunction(
					dataCallbackFunction("Frame", nodesResult, {
						Position = alternateDimensions,
						Size = compactSquareSize,
						BackgroundColor3 = backgroundColor3,
						BackgroundTransparency = 1,
						AnchorPoint = secondaryAnchorPoint,
					}),
					"Theme"
				)

				instancePropertiesCallback("Corner", input, UDim.new(0.5, 0))

				local inputCallbackFunction = contCallback
				local glowCallbackFunction = dataCallback
				local additionalDimensions = UDim2.new(1, 0, 1)
				local fallbackDimensions = UDim2.new(0, 10)
				local textColor3 = theme["Color Text"]
				local gothamBold = Enum.Font.GothamBold
				local secondaryInstancePropertiesResult = inputCallbackFunction(
					glowCallbackFunction("TextLabel", nodesResult, {
						Size = additionalDimensions,
						Position = fallbackDimensions,
						Text = str,
						TextColor3 = textColor3,
						Font = gothamBold,
						TextXAlignment = "Left",
						BackgroundTransparency = 1,
						TextTransparency = 0.4,
					}),
					"Text"
				)
				applyUiFont(secondaryInstancePropertiesResult, true)

				nodesResult.Activated:Connect(function()
					local secondaryStr = updateInstancePropertiesData[str]

					secondaryUpdateInstanceProperties(secondaryStr)
				end)
				updateInstancePropertiesData[str].nodes = {
					nodesResult,
					input,
					secondaryInstancePropertiesResult,
				}
			end
			local function secondaryHandler(k, strFlag)
				local str = tostring(type(k) == "string" and k or strFlag)

				if updateInstancePropertiesData[str] then
					if updateTextCondition then
						updateTextValue[str] = nil
					else
						updateTextValue = nil
					end

					updateInstancePropertiesData[str].nodes[1]:Destroy()
					table.clear(updateInstancePropertiesData[str])
					updateInstancePropertiesData[str] = nil
				end
			end
			local function alternateHandler(argument, condition)
				if condition then
					table.foreach(updateInstancePropertiesData, secondaryHandler)
				end

				table.foreach(argument, alternateUpdateInstanceProperties)
				handler()
				secondaryHandleInstanceProperties()
			end
			table.foreach(searchableText, alternateUpdateInstanceProperties)
			handler()
			secondaryHandleInstanceProperties()
			capturedResult.Activated:Connect(function()
				if flag then
					return
				end

				if guiObject.Visible then
					imageResult.Image = "rbxassetid://10709791523"
					handleSize({
						imageResult,
						"ImageColor3",
						Color3.fromRGB(255, 255, 255),
						0.2,
					})
					handleSize({
						button,
						"Size",
						UDim2.new(0, 152, 0, 0),
						0.2,
						true,
					})
					guiObject.Visible = false

					return
				end

				guiObject.Visible = true
				imageResult.Image = "rbxassetid://10709790948"
				handleSize({
					imageResult,
					"ImageColor3",
					theme["Color Theme"],
					0.2,
				})
				handleSize({
					button,
					"Size",
					UDim2.fromOffset(152, updateAnchorPointNumber),
					0.2,
					true,
				})
			end)
			guiObject.MouseButton1Down:Connect(onGetPropertyChangedSignal)
			guiObject.MouseButton1Click:Connect(onGetPropertyChangedSignal)
			dialogContainer:GetPropertyChangedSignal("Visible"):Connect(onGetPropertyChangedSignal)
			input:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateAnchorPoint)
			capturedResult.Activated:Connect(onActivated)
			updateInstancePropertiesResult.ChildAdded:Connect(onActivated)
			updateInstancePropertiesResult.ChildRemoved:Connect(onActivated)
			updateAnchorPoint()
			onActivated()

			return {
				Visible = function(_, ...)
					updateTextData:ToggleVisible(capturedResult, ...)
				end,
				Destroy = function(_)
					capturedResult:Destroy()
				end,
				Callback = function(_, ...)
					updateTextData:InsertCallback(Callback, ...)(updateTextValue)
				end,
				Add = function(_, ...)
					local data = { ... }

					if type(data[1]) == "table" then
						table.foreach(data[1], function(_, index)
							alternateUpdateInstanceProperties(index)
						end)

						return
					end

					table.foreach(data, function(_, index)
						alternateUpdateInstanceProperties(index)
					end)
				end,
				Remove = function(_, secondaryArgument)
					for k, item in pairs(updateInstancePropertiesData) do
						local secondaryK = k
						local isVName = type(secondaryArgument) == "number" and secondaryK == secondaryArgument

						if not isVName then
							isVName = item.Name == "Option"
						end

						if isVName then
							secondaryHandler(secondaryK, item.Value)
						end
					end
				end,
				Select = function(_, secondaryArgument)
				end,
				Set = function(_, argument, flag)
					if type(argument) == "table" then
						alternateHandler(argument, not flag)

						return
					end
				end,
			}
		end
		function func.Addsizedropdown(_)
			return func:AddDropdown({
				Name = "اختار حجم الواجهة",
				Options = {
					"صغيرة",
					"متوسطة",
					"كبيرة",
				},
				Default = "متوسطه",
				Callback = function(argument)
					if argument == "صغيرة" then
						dialogContainer.Size = UDim2.fromOffset(450, 300)

						return
					end

					if argument == "متوسطة" then
						dialogContainer.Size = UDim2.fromOffset(550, 380)

						return
					end

					if argument == "كبيرة" then
						dialogContainer.Size = UDim2.fromOffset(630, 440)
					end
				end,
			})
		end
		function func.AddSideDropdown(_)
			return func:AddDropdown({
				Name = "مكان قائمة التابات",
				Options = {
					"يسار",
					"يمين",
				},
				Default = "يسار",
				Callback = function(argument)
					if argument == "يسار" then
						secondaryInput.Position = UDim2.new(0, 0, 1, 0)
						secondaryInput.AnchorPoint = Vector2.new(0, 1)
						alternateParent.Position = UDim2.new(1, 0, 1, 0)
						alternateParent.AnchorPoint = Vector2.new(1, 1)

						return
					end

					if argument == "يمين" then
						secondaryInput.Position = UDim2.new(1, 0, 1, 0)
						secondaryInput.AnchorPoint = Vector2.new(1, 1)
						alternateParent.Position = UDim2.new(0, 0, 1, 0)
						alternateParent.AnchorPoint = Vector2.new(0, 1)
					end
				end,
			})
		end
		function func.AddInfoPlayer(_)
			local Players = game:GetService("Players")
			local runService = game:GetService("RunService")
			local localValuePlayer = Players.LocalPlayer
			local Frame = Instance.new("Frame")

			Frame.Parent = cont
			Frame.Size = UDim2.new(1, -20, 0, 160)
			Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
			Frame.BackgroundTransparency = 0.3
			Frame.BorderSizePixel = 0
			Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 18)

			local UIStroke = Instance.new("UIStroke")

			UIStroke.Parent = Frame
			UIStroke.Thickness = 1.6
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Color = Color3.new(1, 1, 1)

			local UIGradient = Instance.new("UIGradient")

			UIGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 120, 120)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
			})
			UIGradient.Parent = UIStroke
			runService.Heartbeat:Connect(function(dt)
				UIGradient.Rotation = (UIGradient.Rotation + 80 * dt) % 360
			end)

			local parent = Instance.new("Frame")

			parent.Parent = Frame
			parent.Size = UDim2.new(0, 78, 0, 78)
			parent.Position = UDim2.new(0, 16, 0.5, 0)
			parent.AnchorPoint = Vector2.new(0, 0.5)
			parent.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
			parent.BackgroundTransparency = 0.3
			parent.BorderSizePixel = 0
			Instance.new("UICorner", parent).CornerRadius = UDim.new(1, 0)

			local uiStroke = Instance.new("UIStroke")

			uiStroke.Parent = parent
			uiStroke.Thickness = 1.2
			uiStroke.Color = theme["Color Theme"]

			local imageLabel = Instance.new("ImageLabel")

			imageLabel.Parent = parent
			imageLabel.Size = UDim2.new(1, -6, 1, -6)
			imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			imageLabel.BackgroundTransparency = 1
			Instance.new("UICorner", imageLabel).CornerRadius = UDim.new(1, 0)
			imageLabel.Image = Players:GetUserThumbnailAsync(
				localValuePlayer.UserId,
				Enum.ThumbnailType.HeadShot,
				Enum.ThumbnailSize.Size180x180
			)

			local frame = Instance.new("Frame")

			frame.Parent = Frame
			frame.Position = UDim2.new(0, 110, 0, 12)
			frame.Size = UDim2.new(1, -125, 1, -24)
			frame.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
			frame.BackgroundTransparency = 0.3
			frame.BorderSizePixel = 0
			Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

			local secondaryUiStroke = Instance.new("UIStroke")

			secondaryUiStroke.Parent = frame
			secondaryUiStroke.Thickness = 1
			secondaryUiStroke.Color = theme["Color Stroke"]

			local TextLabel = Instance.new("TextLabel")

			TextLabel.Parent = frame
			TextLabel.Size = UDim2.new(1, -16, 1, -16)
			TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundTransparency = 1
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Center
			TextLabel.TextYAlignment = Enum.TextYAlignment.Center
			TextLabel.Font = Enum.Font.GothamBold
			TextLabel.TextSize = 13
			TextLabel.LineHeight = 1.1
			TextLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
			TextLabel.ZIndex = 2
			applyUiFont(TextLabel, true)

			local differenceNumber = os.time()

			runService.Heartbeat:Connect(function()
				local difference = os.time() - differenceNumber
				local textLabelNumber = math.floor(difference / 3600)
				local number = math.floor(difference % 3600 / 60)
				local remainder = difference % 60

				TextLabel.Text = "Welcome\n"
					.. localValuePlayer.DisplayName
					.. "\n@"
					.. localValuePlayer.Name
					.. "\nID: "
					.. localValuePlayer.UserId
					.. "\n"
					.. os.date("%d/%m/%Y")
					.. "\n"
					.. string.format("%02d:%02d:%02d", textLabelNumber, number, remainder)
					.. "\n"
					.. os.date("%H:%M:%S")
			end)

			return {
				Visible = function(_, ...)
					updateTextData:ToggleVisible(Frame, ...)
				end,
				Destroy = function(_)
					Frame:Destroy()
				end,
			}
		end
		function func.AddButtonTime(_, descData)
			local desc = descData[1]

			if not desc then
				desc = descData.Desc

				if not desc then
					desc = descData.Description or ""
				end
			end

			local Callback = updateTextData:GetCallback(descData, 2)
			local parent, secondaryResult = updateInstanceProperties(cont, desc, "00:00:00", UDim2.new(1, -20))
			local capturedParent = parent
			local capturedResult = secondaryResult
			local inputCallback = dataCallback
			local compactSquareSize = UDim2.new(0, 14, 0, 14)
			local dimensions = UDim2.new(1, -10, 0.5)
			local anchorPoint = Vector2.new(1, 0.5)
			local input = inputCallback("ImageLabel", capturedParent, {
				Size = compactSquareSize,
				Position = dimensions,
				AnchorPoint = anchorPoint,
				BackgroundTransparency = 1,
				Image = "rbxassetid://10709791437",
			})
			local differenceNumber = tick()

			task.spawn(function()
				while true do
					local parent = capturedParent

					if parent then
						parent = capturedParent.Parent
					end

					if not parent then
						break
					end

					local difference = tick() - differenceNumber
					local number = math.floor(difference / 3600)
					local secondaryNumber = math.floor(difference % 3600 / 60)
					local alternateNumber = math.floor(difference % 60)

					capturedResult:SetDesc(string.format("%02d:%02d:%02d", number, secondaryNumber, alternateNumber))
					task.wait(1)
				end
			end)
			capturedParent.Activated:Connect(function()
				updateTextData:FireCallback(Callback)
			end)

			return {
				Visible = function(_, ...)
					updateTextData:ToggleVisible(capturedParent, ...)
				end,
				Destroy = function(_)
					capturedParent:Destroy()
				end,
				Callback = function(_, ...)
					updateTextData:InsertCallback(Callback, ...)
				end,
				ResetTime = function(_)
					differenceNumber = tick()
				end,
			}
		end
		function func.AddButtonFPS(_, descData)
			local desc = descData[1]

			if not desc then
				desc = descData.Desc

				if not desc then
					desc = descData.Description or ""
				end
			end

			local Callback = updateTextData:GetCallback(descData, 2)
			local instanceResult, secondaryResult = updateInstanceProperties(cont, desc, "FPS: 0", UDim2.new(1, -20))
			local capturedInstanceResult = instanceResult
			local capturedResult = secondaryResult
			local runService = game:GetService("RunService")
			local capturedNumber = 0
			local number = tick()
			local secondaryNumber = 0

			runService.Heartbeat:Connect(function()
				local flag = not capturedInstanceResult

				if not flag then
					flag = not capturedInstanceResult.Parent
				end

				if flag then
					return
				end

				secondaryNumber += 1

				if tick() - number >= 1 then
					capturedNumber = secondaryNumber
					secondaryNumber = 0
					number = tick()
					capturedResult:SetDesc("FPS: " .. capturedNumber)
				end
			end)
			capturedInstanceResult.Activated:Connect(function()
				updateTextData:FireCallback(Callback)
			end)

			return {
				Visible = function(_, ...)
					updateTextData:ToggleVisible(capturedInstanceResult, ...)
				end,
				Destroy = function(_)
					capturedInstanceResult:Destroy()
				end,
				Callback = function(_, ...)
					updateTextData:InsertCallback(Callback, ...)
				end,
			}
		end
		function func.AddSlider(_, descData)
			local name = descData[1]

			if not name then
				name = descData.Name

				if not name then
					name = descData.Title or "Slider!"
				end
			end

			local Desc = descData.Desc

			if not Desc then
				Desc = descData.Description or ""
			end

			local quotientNumber = descData[2]

			if not quotientNumber then
				quotientNumber = descData.MinValue or (descData.Min or 10)
			end

			local number = descData[3]

			if not number then
				number = descData.MaxValue or (descData.Max or 100)
			end

			local updateTextNumber = descData[4] or (descData.Increase or 1)
			local Callback = updateTextData:GetCallback(descData, 6)
			local isFlags = descData[7] or (descData.Flag or false)
			local expectedMembership = descData[5] or (descData.Default or 25)

			if isOptionValid(isFlags) then
				expectedMembership = isNumberValid(isFlags)
			end

			local quotient = quotientNumber / updateTextNumber
			local secondaryQuotient = number / updateTextNumber
			local capturedQuotient = quotient
			local capturedNumber = secondaryQuotient
			local secondaryResult, alternateResult = updateInstanceProperties(cont, name, Desc, UDim2.new(1, -180))
			local capturedResult = secondaryResult
			local secondaryCapturedResult = alternateResult
			local resultCallback = dataCallback
			local dimensions = UDim2.new(0.45, 0, 1)
			local secondaryDimensions = UDim2.new(1)
			local anchorPoint = Vector2.new(1, 0)
			local instanceResult = resultCallback("TextButton", capturedResult, {
				Size = dimensions,
				Position = secondaryDimensions,
				AnchorPoint = anchorPoint,
				AutoButtonColor = false,
				Text = "",
				BackgroundTransparency = 1,
			})
			local instanceCallback = contCallback
			local contCallbackFunction = dataCallback
			local backgroundColor3 = theme["Color Stroke"]
			local alternateDimensions = UDim2.new(1, -20, 0, 6)
			local additionalDimensions = UDim2.new(0.5, 0, 0.5)
			local secondaryAnchorPoint = Vector2.new(0.5, 0.5)
			local input = instanceCallback(
				contCallbackFunction("Frame", instanceResult, {
					BackgroundColor3 = backgroundColor3,
					Size = alternateDimensions,
					Position = additionalDimensions,
					AnchorPoint = secondaryAnchorPoint,
				}),
				"Stroke"
			)

			instancePropertiesCallback("Corner", input)

			local inputCallbackFunction = contCallback
			local dataCallbackFunction = dataCallback
			local secondaryBackgroundColor = theme["Color Theme"]
			local size = UDim2.fromScale(0.3, 1)
			local button = inputCallbackFunction(
				dataCallbackFunction("Frame", input, {
					BackgroundColor3 = secondaryBackgroundColor,
					Size = size,
					BorderSizePixel = 0,
				}),
				"Theme"
			)

			instancePropertiesCallback("Corner", button)

			local inputCallback = dataCallback
			local fallbackDimensions = UDim2.new(0, 6, 0, 12)
			local alternateBackgroundColor = Color3.fromRGB(220, 220, 220)
			local position = UDim2.fromScale(0.3, 0.5)
			local alternateAnchorPoint = Vector2.new(0.5, 0.5)
			local secondaryInput = inputCallback("Frame", input, {
				Size = fallbackDimensions,
				BackgroundColor3 = alternateBackgroundColor,
				Position = position,
				AnchorPoint = alternateAnchorPoint,
				BackgroundTransparency = 0.2,
			})

			instancePropertiesCallback("Corner", secondaryInput)

			local parentCallbackFunction = contCallback
			local glowCallbackFunction = dataCallback
			local compactSquareSize = UDim2.new(0, 14, 0, 14)
			local additionalAnchorPoint = Vector2.new(1, 0.5)
			local nestedDimensions = UDim2.new(0, 0, 0.5)
			local textColor3 = theme["Color Text"]
			local FredokaOne = Enum.Font.FredokaOne
			local updateTextResult = parentCallbackFunction(
				glowCallbackFunction("TextLabel", instanceResult, {
					Size = compactSquareSize,
					AnchorPoint = additionalAnchorPoint,
					Position = nestedDimensions,
					BackgroundTransparency = 1,
					TextColor3 = textColor3,
					Font = FredokaOne,
					TextSize = 12,
				}),
				"Text"
			)
			applyUiFont(updateTextResult, true)
			local scaleResult = dataCallback("UIScale", updateTextResult)
			local instance = dataCallback("Frame", input, {
				Position = UDim2.new(0, 0, 0.5, 0),
				Visible = false,
			})

			local function updateSize(quotientNumber)
				local updateSizeNumber = math.floor(tonumber(quotientNumber * updateTextNumber) * 100) / 100
				local updateSizeResult = updateTextResult
				local updateSizeText = tostring(updateSizeNumber)

				expectedMembership = updateSizeNumber
				updateSizeResult.Text = updateSizeText
				updateTextData:FireCallback(Callback, expectedMembership)
			end
			local function onGetPropertyChangedSignal()
				button.Size = UDim2.new(secondaryInput.Position.X.Scale, 0, 1, 0)

				local XScale = secondaryInput.Position.X.Scale
				local floor = math.floor
				local updateSizeNumber = capturedNumber - capturedQuotient
				local number = floor(XScale * capturedNumber / capturedNumber * updateSizeNumber + capturedQuotient)

				updateSize(number)
			end

			instanceResult.MouseButton1Down:Connect(function()
				handleSize({
					secondaryInput,
					"Transparency",
					0,
					0.3,
				})
				cont.ScrollingEnabled = false

				while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
					task.wait()

					local quotient = (LocalPlayer:GetMouse().X - instance.AbsolutePosition.X) / input.AbsoluteSize.X

					secondaryInput.Position = UDim2.new(math.clamp(quotient, 0, 1), 0, 0.5, 0)
				end

				handleSize({
					secondaryInput,
					"Transparency",
					0.2,
					0.3,
				})
				cont.ScrollingEnabled = true
				handleInstanceProperties(isFlags, expectedMembership)
			end)

			function SetSlider(expectedMembership)
				if type(expectedMembership) ~= "number" then
					return
				end

				local product = capturedQuotient * updateTextNumber
				local number = capturedNumber * updateTextNumber
				local quotient = (expectedMembership - product) / (number - product)

				handleInstanceProperties(isFlags, expectedMembership)
				handleSize({
					secondaryInput,
					"Position",
					UDim2.fromScale(math.clamp(quotient, 0, 1), 0.5),
					0.3,
					true,
				})
			end

			SetSlider(expectedMembership)
			secondaryInput:GetPropertyChangedSignal("Position"):Connect(onGetPropertyChangedSignal)
			onGetPropertyChangedSignal()

			return {
				Set = function(_, callback, flag)
					if callback and flag then
						secondaryCapturedResult:SetTitle(callback)
						secondaryCapturedResult:SetDesc(flag)

						return
					end

					if type(callback) == "string" then
						secondaryCapturedResult:SetTitle(callback)

						return
					end

					if type(callback) == "function" then
						Callback = callback

						return
					end

					if type(callback) == "number" then
						SetSlider(callback)
					end
				end,
				Callback = function(_, ...)
					updateTextData:InsertCallback(Callback, ...)((tonumber(expectedMembership)))
				end,
				Visible = function(_, ...)
					updateTextData:ToggleVisible(capturedResult, ...)
				end,
				Destroy = function(_)
					capturedResult:Destroy()
				end,
			}
		end
		function func.AddTextBox(_, descData)
			local name = descData[1]

			if not name then
				name = descData.Name

				if not name then
					name = descData.Title or "Text Box"
				end
			end

			local Desc = descData.Desc

			if not Desc then
				Desc = descData.Description or ""
			end

			local flagOption = descData[2]

			if not flagOption then
				flagOption = descData.Default or ""
			end

			local placeholderText = descData[5]

			if not placeholderText then
				placeholderText = descData.PlaceholderText or "Input"
			end

			local clearTextOnFocus = descData[3] or (descData.ClearText or false)
			local Callback = updateTextData:GetCallback(descData, 4)
			local secondaryResult, _ = updateInstanceProperties(cont, name, Desc, UDim2.new(1, -38))
			local capturedResult = secondaryResult
			local resultCallback = contCallback
			local contCallbackFunction = dataCallback
			local dimensions = UDim2.new(0, 150, 0, 18)
			local secondaryDimensions = UDim2.new(1, -10, 0.5)
			local anchorPoint = Vector2.new(1, 0.5)
			local backgroundColor3 = theme["Color Stroke"]
			local input = resultCallback(
				contCallbackFunction("Frame", capturedResult, {
					Size = dimensions,
					Position = secondaryDimensions,
					AnchorPoint = anchorPoint,
					BackgroundColor3 = backgroundColor3,
				}),
				"Stroke"
			)

			instancePropertiesCallback("Corner", input, UDim.new(0, 4))

			local inputCallbackFunction = contCallback
			local dataCallbackFunction = dataCallback
			local alternateDimensions = UDim2.new(0.85, 0, 0.85, 0)
			local secondaryAnchorPoint = Vector2.new(0.5, 0.5)
			local additionalDimensions = UDim2.new(0.5, 0, 0.5, 0)
			local gothamBold = Enum.Font.GothamBold
			local textColor3 = theme["Color Text"]
			local updateTextResult = inputCallbackFunction(
				dataCallbackFunction("TextBox", input, {
					Size = alternateDimensions,
					AnchorPoint = secondaryAnchorPoint,
					Position = additionalDimensions,
					BackgroundTransparency = 1,
					Font = gothamBold,
					TextScaled = true,
					TextColor3 = textColor3,
					ClearTextOnFocus = clearTextOnFocus,
					PlaceholderText = placeholderText,
					Text = tostring(flagOption or ""),
				}),
				"Text"
			)
			applyUiFont(updateTextResult, true)
			local textData = {}

			local function updateText()
				local Text = updateTextResult.Text

				if Text:gsub(" ", ""):len() > 0 then
					if textData.OnChanging then
						Text = textData.OnChanging(Text) or Text
					end

					updateTextData:FireCallback(Callback, Text)
					updateTextResult.Text = Text
				end
			end

			updateTextResult.FocusLost:Connect(updateText)
			updateText()
			textData.OnChanging = false

			function textData.Visible(_, ...)
				updateTextData:ToggleVisible(capturedResult, ...)
			end
			function textData.Destroy(_)
				capturedResult:Destroy()
			end

			return textData
		end
		function func.AddDiscordInvite(_, descData)
			local name = descData[1]

			if not name then
				name = descData.Name

				if not name then
					name = descData.Title or "Discord"
				end
			end

			local Desc = descData.Desc

			if not Desc then
				Desc = descData.Description or ""
			end

			local image = descData[2]

			if not image then
				image = descData.Logo or ""
			end

			local text = descData[3]

			if not text then
				text = descData.Invite or ""
			end

			local capturedText = text
			local parentResult = dataCallback("Frame", cont, {
				Size = UDim2.new(1, 0, 0, 80),
				Name = "Option",
				BackgroundTransparency = 1,
			})
			local contCallbackFunction = dataCallback
			local dimensions = UDim2.new(1, 0, 0, 15)
			local secondaryDimensions = UDim2.new(0, 5)
			local textColor3 = theme["Color Theme"]
			local gothamBold = Enum.Font.GothamBold

			local titleLbl = contCallbackFunction("TextLabel", parentResult, {
				Size = dimensions,
				Position = secondaryDimensions,
				TextColor3 = textColor3,
				Font = gothamBold,
				TextXAlignment = "Left",
				BackgroundTransparency = 1,
				TextSize = 10,
				Text = capturedText,
			})
			applyUiFont(titleLbl, true)

			local parentCallback = contCallback
			local dataCallbackFunction = dataCallback
			local alternateDimensions = UDim2.new(1, 0, 0, 65)
			local anchorPoint = Vector2.new(0, 1)
			local additionalDimensions = UDim2.new(0, 0, 1)
			local backgroundColor3 = theme["Color Hub 2"]
			local parent = parentCallback(
				dataCallbackFunction("Frame", parentResult, {
					Size = alternateDimensions,
					AnchorPoint = anchorPoint,
					Position = additionalDimensions,
					BackgroundColor3 = backgroundColor3,
				}),
				"Frame"
			)

			instancePropertiesCallback("Corner", parent)

			local glowCallbackFunction = dataCallback
			local compactSquareSize = UDim2.new(0, 30, 0, 30)
			local secondaryCompactSquareSize = UDim2.new(0, 7, 0, 7)
			local input = glowCallbackFunction("ImageLabel", parent, {
				Size = compactSquareSize,
				Position = secondaryCompactSquareSize,
				Image = image,
				BackgroundTransparency = 1,
			})

			instancePropertiesCallback("Corner", input, UDim.new(0, 4))
			instancePropertiesCallback("Stroke", input)

			local nameLbl = dataCallback("TextLabel", parent, {
				Size = UDim2.new(1, -52, 0, 15),
				Position = UDim2.new(0, 44, 0, 7),
				Font = Enum.Font.GothamBold,
				TextColor3 = theme["Color Text"],
				TextXAlignment = "Left",
				BackgroundTransparency = 1,
				TextSize = 10,
				Text = name,
			})
			applyUiFont(nameLbl, true)

			local descLbl = dataCallback("TextLabel", parent, {
				Size = UDim2.new(1, -52, 0, 0),
				Position = UDim2.new(0, 44, 0, 22),
				TextWrapped = true,
				AutomaticSize = "Y",
				Font = Enum.Font.Gotham,
				TextColor3 = theme["Color Dark Text"],
				TextXAlignment = "Left",
				BackgroundTransparency = 1,
				TextSize = 8,
				Text = Desc,
			})
			applyUiFont(descLbl, false)

			local secondaryParent = dataCallback("TextButton", parent, {
				Size = UDim2.new(1, -14, 0, 16),
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.new(0.5, 0, 1, -7),
				Text = "Join",
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundColor3 = theme["Color Theme"],
			})
			applyUiFont(secondaryParent, true)

			instancePropertiesCallback("Corner", secondaryParent, UDim.new(0, 5))
			secondaryParent.Activated:Connect(function()
				if setclipboard then
					setclipboard(capturedText)
				end
				secondaryParent.Text = "Copied"
				task.wait(2)
				secondaryParent.Text = "Join"
			end)

			return {
				Destroy = function(_)
					parentResult:Destroy()
				end,
				Visible = function(_, ...)
					updateTextData:ToggleVisible(parentResult, ...)
				end,
			}
		end
		function func.AddImageUsers(_, secondaryArgument)
			local image = secondaryArgument.Background or ""
			local secondaryImage = secondaryArgument.Image1 or ""
			local alternateImage = secondaryArgument.Image2 or ""
			local additionalImage = secondaryArgument.Image3 or ""
			local option = secondaryArgument.Copy1 or ""
			local secondaryOption = secondaryArgument.Copy2 or ""
			local alternateOption = secondaryArgument.Copy3 or ""
			local resultCallback = dataCallback
			local parent = cont
			local dimensions = UDim2.new(1, 0, 0, 220)
			local backgroundColor3 = Color3.fromRGB(0, 0, 0)
			local borderColor3 = Color3.fromRGB(210, 210, 210)
			local secondaryResult = resultCallback("Frame", parent, {
				Size = dimensions,
				BackgroundColor3 = backgroundColor3,
				BorderColor3 = borderColor3,
				BorderSizePixel = 2,
			})

			dataCallback("UICorner", secondaryResult, {
				CornerRadius = UDim.new(0, 12),
			})

			local alternateResult = dataCallback("ImageLabel", secondaryResult, {
				Size = UDim2.new(1, 0, 0, 120),
				BackgroundTransparency = 1,
				Image = image,
			})

			dataCallback("UICorner", alternateResult, {
				CornerRadius = UDim.new(0, 12),
			})

			local function handler(vector, image, option)
				local alternateResult = dataCallback("ImageLabel", secondaryResult, {
					Size = UDim2.new(0, 60, 0, 60),
					Position = vector,
					BackgroundTransparency = 1,
					Image = image,
				})

				dataCallback("UICorner", alternateResult, {
					CornerRadius = UDim.new(1, 0),
				})

				local guiObjectCallback = dataCallback
				local additionalResult = secondaryResult
				local dimensions = UDim2.new(0, 70, 0, 28)
				local secondaryDimensions = UDim2.new(vector.X.Scale, vector.X.Offset - 5, 0, 150)
				local backgroundColor3 = Color3.fromRGB(28, 28, 28)
				local gothamBold = Enum.Font.GothamBold
				local textColor3 = Color3.fromRGB(255, 255, 255)
				local guiObject = guiObjectCallback("TextButton", additionalResult, {
					Size = dimensions,
					Position = secondaryDimensions,
					BackgroundColor3 = backgroundColor3,
					Text = "Copy",
					Font = gothamBold,
					TextSize = 14,
					TextColor3 = textColor3,
				})
				applyUiFont(guiObject, true)

				dataCallback("UICorner", guiObject, {
					CornerRadius = UDim.new(0, 6),
				})
				guiObject.MouseButton1Click:Connect(function()
					if setclipboard then
						setclipboard(option)
					end
				end)
			end

			handler(UDim2.new(0.2, -30, 0, 80), secondaryImage, option)
			handler(UDim2.new(0.5, -30, 0, 80), alternateImage, secondaryOption)
			handler(UDim2.new(0.8, -30, 0, 80), additionalImage, alternateOption)
		end

		return func
	end
	activatedResult.Activated:Connect(data.CloseBtn)
	imageResult.Activated:Connect(data.MinimizeBtn);
	(function(numberFlag)
		local createUiStrokeNumber = numberFlag or 80

		local function createUiStroke(parent, createUiStrokeFlag)
			if parent:FindFirstChildOfClass("UIStroke") then
				return
			end

			local UIStroke = Instance.new("UIStroke")

			UIStroke.Parent = parent
			UIStroke.Thickness = createUiStrokeFlag or 1.6
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Color = Color3.new(1, 1, 1)

			local UIGradient = Instance.new("UIGradient")

			UIGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(0.5, Color3.fromRGB(130, 130, 130)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
			})
			UIGradient.Parent = UIStroke
			runService.Heartbeat:Connect(function(dt)
				UIGradient.Rotation = (UIGradient.Rotation + createUiStrokeNumber * dt) % 360
			end)

			return UIStroke
		end

		createUiStroke(dialogContainer, 2)

		local function handler(parent)
			local condition = parent:IsA("Frame")

			if not condition then
				condition = parent:IsA("TextButton")

				if not condition then
					condition = parent:IsA("ImageButton")
				end
			end

			if condition then
				local UICorner = parent:FindFirstChildOfClass("UICorner")
				local UIStroke = parent:FindFirstChildOfClass("UIStroke")

				if UICorner then
					UICorner = not UIStroke
				end

				if UICorner then
					createUiStroke(parent, 1.4)
				end
			end

			for _, child in ipairs(parent:GetChildren()) do
				handler(child)
			end
		end

		handler(dialogContainer)
		dialogContainer.DescendantAdded:Connect(function(descendant)
			task.wait(0.1)
			applyUiFont(descendant, false)

			local isA = descendant:IsA("Frame")

			if not isA then
				isA = descendant:IsA("TextButton")

				if not isA then
					isA = descendant:IsA("ImageButton")
				end
			end

			if
				isA
				and (descendant:FindFirstChildOfClass("UICorner") and not descendant:FindFirstChildOfClass("UIStroke"))
			then
				createUiStroke(descendant, 1.4)
			end
		end)
	end)(80)

	return data
end
local secondaryResult = not ok
if not secondaryResult then
	if result then
		result = result.Status == "False"
	end

	secondaryResult = result
end
if secondaryResult then
	if game.CoreGui:FindFirstChild("LanguageSelectorHub") then
		game.CoreGui.LanguageSelectorHub:Destroy()
	end

	return
end
return iconData
