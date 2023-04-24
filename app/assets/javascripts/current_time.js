function set2(num) {
  // 桁数が1桁だったら先頭に0を加えて2桁に調整する
  let ret;
  if (num < 10) { ret = "0" + num; }
  else { ret = num; }
  return ret;
}
function showClock() {
  const nowTime = new Date(); //現在日時
  const nowHour = set2(nowTime.getHours()); //時間
  const nowMin = set2(nowTime.getMinutes()); //分
  const nowSec = set2(nowTime.getSeconds()); //秒
  const msg = nowHour + "時" + nowMin + "分" + nowSec + "秒";
  document.getElementById("showTime").innerHTML = msg;
}
setInterval('showClock()', 1000);
