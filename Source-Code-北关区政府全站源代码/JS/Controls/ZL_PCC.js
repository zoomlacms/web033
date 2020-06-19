/*
*功能:省市县三级|四级联动,默认值:值
*<script src="http://code.zoomla.cn/Area.js"></script>
*/
function ZL_PCC(pid, cityid, countyid, stwon) {
    this.$province = $("#" + pid);
    this.$city = $("#" + cityid);
    this.$county = $("#" + countyid);
    this.$stown = $("#" + stwon);
    this.kvtype = 1;//1,值:值,2:键:值
    this.defProvince = "", this.defCity = "", this.defCounty = "", this.stwon = "";
}
ZL_PCC.prototype = {
    ProvinceInit: function () {
        var ref = this;
        ref.setOptions(ref.$province, AreaMod);
        if (!ref.$province || ref.$province.length < 1) return;
        var def = ref.isEmpty(ref.defProvince) ? ref.$province[0].options[0].value : ref.defProvince;
        ref.$province.val(def);
        ref.CityInit();
        ref.$province.change(function () { ref.CityInit(); });
        ref.defProvince = "";
    },
    CityInit: function () {
        var ref = this;
        ref.$city.html("");
        var arr = AreaMod.GetByID(ref.$province.find(":checked").data("id")).CityList;
        ref.setOptions(ref.$city, arr);
        var def = ref.isEmpty(ref.defCity) ? ref.$city[0].options[0].value : ref.defCity;
        ref.$city.val(def);
        ref.CountyInit();
        ref.$city.change(function () { ref.CountyInit(); });
        ref.defCity = "";
    },
    CountyInit: function () {
        var ref = this;
        ref.$county.html("");
        var arr = AreaMod.GetByID(ref.$province.find(":checked").data("id"))
            .CityList.GetByID(ref.$city.find(":checked").data("id")).CountyList;
        ref.setOptions(ref.$county, arr);
        if (ref.$county[0].options.length > 0) {
            var def = ref.isEmpty(ref.defCounty) ? ref.$county[0].options[0].value : ref.defCounty;
            ref.$county.val(def);
        }
        ref.STownInit();
        ref.$county.change(function () { ref.STownInit(); });
        ref.defCounty = "";
    },
    STownInit: function ()
    {
        var ref = this;
        if (!ref.$stown[0])
            return;
        ref.$stown.html("");
        var arr = AreaMod.GetByID(ref.$province.find(":checked").data("id"))
            .CityList.GetByID(ref.$city.find(":checked").data("id"))
            .CountyList.GetByID(ref.$county.find(":checked").data("id")).StownList;
        ref.setOptions(ref.$stown, arr);
        if (ref.$stown[0].options.length > 0) {
            var def = ref.isEmpty(ref.defStown) ? ref.$stown[0].options[0].value:ref.defStown;
            ref.$stown.val(def);
        }
    },
    SetDef: function () {
        //var arr = "北京,上海,天津,重庆,宁夏,西藏,新疆".split(',');
        this.defProvince = arguments[0];
        this.defCity = arguments[1];
        this.defCounty = arguments[2];
        this.defStown = arguments[3];
    },
    isEmpty: function (str)
    {
        if (!str || str == undefined || str == "null" || str == "") { return true; }
    },
    setOptions: function ($dp, arr) {
        var ref = this;
        if (!arr || !$dp) return;
        for (var i = 0; i < arr.length; i++) {
            switch (ref.kvtype) {
                case 1:
                    $dp.append("<option data-id='" + arr[i].ID + "' value='" + arr[i].Name + "'>" + arr[i].Name + "</option>");
                    break;
                case 2:
                    $dp.append("<option data-id='" + arr[i].ID + "' value='" + arr[i].ID + "'>" + arr[i].Name + "</option>");
                    break;
            }
        }//for end;
    }
}
Array.prototype.GetByID = function (v) {
    for (var i = 0; i < this.length; i++) {
        if (this[i].ID == v) return this[i];
    }
    return null;
}