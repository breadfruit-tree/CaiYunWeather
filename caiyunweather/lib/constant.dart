///假定的数据来源
var shareList = [
  {
    "image": "images/ssdk_oks_classic_qq.png",
    "title": "QQ",
  },
  {
    "image": "images/ssdk_oks_classic_qzone.png",
    "title": "QQ空间",
  },
  {
    "image": "images/ssdk_oks_classic_sinaweibo.png",
    "title": "微博",
  },
  {
    "image": "images/ssdk_oks_classic_wechat.png",
    "title": "微信",
  },
  {
    "image": "images/ssdk_oks_classic_wechatmoments.png",
    "title": "朋友圈",
  },
];
var weatherStatus = [
  {"image": "images/map_layer_temp.png", "title": "体感", "tag": "-2°"},
  {"image": "images/icon_windpower.png", "title": "风", "tag": "北风3级"},
  {"image": "images/push_icon_humidity.png", "title": "湿度", "tag": "65%"},
];
var weatherReportList = [
  {
    "image": "images/skyicon_partly_cloud_widget.png",
    "title": "昨天",
    "temp": "3°~20°",
    "tag": "轻度"
  },
  {
    "image": "images/skyicon_partly_cloud_night_widget.png",
    "title": "今天",
    "temp": "2°~7°",
    "tag": "良"
  },
  {
    "image": "images/skyicon_cloud.png",
    "title": "明天",
    "temp": "1°-8°",
    "tag": "优秀"
  },
];

///加上final关键字之后，使得后面页面的改动会影响首页。
final List<Map<String, dynamic>> lifeList = [
  {"image": "images/life_index_airconditioner.png", "title": "空调", "tag": "适合"},
  {"image": "images/life_index_allergy.png", "title": "过敏", "tag": "不适合"},
  {"image": "images/life_index_angling.png", "title": "垂钓", "tag": "适合"},
  {"image": "images/life_index_dating.png", "title": "约会", "tag": "不适合"},
  {"image": "images/life_index_drink.png", "title": "啤酒", "tag": "适合"},
  {"image": "images/life_index_drying.png", "title": "晾晒", "tag": "不适合"},
  {"image": "images/life_index_heatstrole.png", "title": "中暑", "tag": "适合"},
  {"image": "images/life_index_limit.png", "title": "限行", "tag": "不适合"},
  {"image": "images/life_index_rain_gear.png", "title": "雨具", "tag": "适合"},
  {
    "image": "images/life_index_road_condition.png",
    "title": "路况",
    "tag": "不适合"
  },
  {"image": "images/life_index_sport.png", "title": "运动", "tag": "不适合"},
  {"image": "images/life_index_travel.png", "title": "旅游", "tag": "不适合"},
].toList();


var reorderList = [
  {"title": "短临降雨预报","ps": "", "isSelected": true},
  {"title": "实时天气","ps": "该卡片仅在地图模式下展示", "isSelected": true},
  {"title": "今明天气","ps": "", "isSelected": true},
  {"title": "活动卡片","ps": "该卡片仅在地图模式下展示", "isSelected": false},
  {"title": "逐小时预报","ps": "建议与15日预报联动查看", "isSelected": true},
  {"title": "15日预报","ps": "", "isSelected": true},
  {"title": "专业数据","ps": "", "isSelected": false},
  {"title": "生活指数","ps": "", "isSelected": false},
  {"title": "日出日落","ps": "", "isSelected": false},
];

///当前未添加的卡片信息
var unInsertList = [];