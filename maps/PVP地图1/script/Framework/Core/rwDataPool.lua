--#region rwDataPool.lua
--Descript: 全局表
--Creater: 甘嘉诚
--CreateDate:2024.9.23
--#endregion


--[[
    rw开头,非Module全局表。
    大写字母开头,Module全局表。
]]


--存储玩家技能属性的全局表。
tAbilityAttr = {}

--全局单位固定属性表。
AttrBoost = {}

--全局技能属性表。
AbilityAttr = {}


--全局工具函数表。
rwAllToolsFunc = {}






--#region Work

--玩家属性操作全局函数表。
rwAllToolsFunc = {}

--全局PVP宝箱存储表。
rwAllPVPBox = {}
--[[
    rwAllPVPBox[nAreaId] = {}
    rwAllPVPBox[nAreaId][1] = {}
    rwAllPVPBox[nAreaId][1]["Id"] = nNum
    rwAllPVPBox[nAreaId][1]["Type"] = nNum
    rwAllPVPBox[nAreaId][1]["Point"] = uPoint
    rwAllPVPBox[nAreaId][1]["IsLife"] =  1 表示存活 ；0 表示死亡。
    ..
]]

--全局AI名字表。
rwAllAIName = {
    "Admirind",
"Aerum",
"Akvum",
"Ambrofaltkhawsen",
"Ameblo",
"Amik",
"Amomian",
"Arbar",
"Barbarkor",
"Bier",
"Bird",
"Biterlif",
"Bondno",
"Bravul",
"Burlu",
"Butik",
"Celum",
"Chener",
"Chipen",
"Delolmo",
"Devum",
"Domet",
"Ehhum",
"Emilan",
"Enhhoran",
"Esper",
"Estrum",
"Fajrer",
"Famili",
"Fesanan",
"Filopator",
"Fiskan",
"Flugil",
"Garan",
"Geralan",
"Gimik",
"Glaving",
"Grinhilt",
"Gust",
"Gharden",
"Hakil",
"Hark",
"Haska",
"Heldan",
"Herb",
"Homar",
"Horbek",
"Hhorum",
"Inkuj",
"Interes",
"Irlan",
"Ivens",
"Jablich",
"Jagu",
"Jarum",
"Junul",
"Jhurnal",
"Kamino",
"Kandeling",
"Kanjas",
"Karlan",
"Klub",
"Kodlar",
"Korjas",
"Kovert",
"Kradan",
"Kredeblo",
"Kruf",
"Kudril",
"Kuirej",
"Kunul",
"Kuvan",
"Kvarop",
"Laget",
"Lamris",
"Land",
"Libret",
"Loghej",
"Lumstel",
"Makavel",
"Maksipes",
"Marban",
"Marist",
"Marsaus",
"Marum",
"Mehhkaprad",
"Memorind",
"Montum",
"Montril",
"Nakan",
"Nomum",
"Oktoped",
"Ostum",
"Paner",
"Panum",
"Pentium",
"Pentrist",
"Pepian",
"Pilk",
"Piruj",
"Pluming",
"Plumuj",
"Pluver",
"Pomuj",
"Preghej",
"Pulver",
"Rafnil",
"Ralfan",
"Rastagan",
"Razil",
"Regnestrum",
"Regum",
"Richul",
"Rukspin",
"Sabler",
"Saghulo",
"Sagum",
"Saist",
"Skatol",
"Stelum",
"Suker",
"Shlosil",
"Shuist",
"Tander",
"Terikan",
"Tipum",
"Traman",
"Tranchil",
"Travis",
"Urbum",
"Vendej",
"Verdajh",
"Verum",
"Vilanan",
"Vinberuj",
"Vishon",
"Vort",
"Zerkos",
"Zijat",
"Zorajan",
"adams",
"anderson",
"arnold",
"baker",
"bell",
"campbell",
"carter",
"cecil",
"charles",
"christian",
"dale",
"david",
"clark",
"clive",
"cook",
"duncan",
"eddy",
"edward",
"evelyn",
"fergus",
"garcia",
"gary",
"george",
"gerard",
"giles",
"green",
"griffin",
"hall",
"harris",
"hill",
"jackson",
"james",
"ja",
"joyce",
"keith",
"kirk",
"lee",
"leonard",
"leslie",
"lester",
"lewis",
"may",
"murphy",
"nelson",
"oliver",
"owen",
"percy",
"peters",
"quick",
"raphael",
"rodney",
"rose",
"rupert",
"scott",
"shelley",
"smith",
"taylor",
"tuener",
"walker",
"warren",
"Williams",
"Smith",

} 


--#endregion