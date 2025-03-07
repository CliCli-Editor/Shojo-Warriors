--#region rwAllRequire.lua
--Descript: 全局require文件，有新增文件要加在这里。
--Creater: 甘嘉诚
--CreateDate:2024.9.23
--#endregion


--全局require表。
rwAllRequire = {
--Core
    rwAllToolsFunc = require("Framework.Core.rwAllToolsFunc"),





--module
    AbilityAttr = require("Framework.Module.AbilityAttr"),
    AttrBoost = require("Framework.Module.AttrBoost"),
    CreatUnitInArea = require("Framework.Module.CreatUnitInArea"),







--work
    UnitAttrCtrl = require("Framework.Work.UnitAttrCtrl"),
    UnitCtrl = require("Framework.Work.UnitCtrl"),
    GameTools = require("Framework.Work.GameTools")


}





return rwAllRequire