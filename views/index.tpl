<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>D&D Sheet</title>
<link rel="stylesheet" href="/static/style.css">
</head>

<body>
<div class="tabs">
  <button class="tab active" onclick="openTab('sheet', this)">Анкета</button>

  <button class="tab" onclick="loadWiki(this)">Вики</button>
</div>

<div id="sheet" class="panel show">
  <div class="top-grid">
    <input id="user" placeholder="Имя">
    <input id="user" placeholder="Класс">
    <input id="user" placeholder="Раса">
    <input id="user" placeholder="Происхождение">
    <input id="user" type="number" placeholder="Уровень">
    <input id="user" type="number" placeholder="Опыт">
  </div>

  <div class="main-grid">


    <div class="card stats">
      <h3>Характеристики</h3>
      <div class="stat-line">
        <span>Сила</span>
        <input id="str" style="padding-left: 5px;" type="number" value="10">

      </div>
      <div class="stat-line">
        <span>Ловкость</span>
        <input id="dex" style="padding-left: 5px;" type="number" value="10">

      </div>
      <div class="stat-line">
        <span style="padding-right: 5px;">Телослож.</span>
        <input id="con" style="padding-left: 5px;" type="number" value="10">

      </div>
      <div class="stat-line">
        <span style="padding-right: 5px;">Интеллект</span>
        <input id="int" style="padding-left: 5px;" type="number" value="10">

      </div>
      <div class="stat-line">
        <span style="padding-right: 5px;">Мудрость</span>
        <input id="wis" style="padding-left: 5px;" type="number" value="10">

      </div>
      <div class="stat-line">
        <span style="padding-right: 5px;">Харизма</span>
        <input id="cha" style="padding-left: 5px;" type="number" value="10">

      </div>
    </div>
    <div class="card skills" style="font-size: 14px;">

    <h3>Навыки</h3>
      
      <div class="stat-line">
        <span style="padding-right: 5px;">Атлетика</span>
        <input style="padding-left: 5px;" id="str1" value="0" type="number">
        <button onclick="rollSkill('str1','str')">🎲</button>
        <div id="str1_res"></div>
      </div>

      <div class="stat-line">
        <span style="padding-right: 5px;">Акробатика</span>
        <input style="padding-left: 5px;" id="agl1" value="0" type="number">
        <button onclick="rollSkill('agl1','dex')">🎲</button>
        <div id="agl1_res"></div>
      </div>

      <div class="stat-line">
        <span style="padding-right: 5px;">Скрытность</span>
        <input style="padding-left: 5px;" id="agl2" value="0" type="number">
        <button onclick="rollSkill('agl2','dex')">🎲</button>
        <div id="agl2_res"></div>
      </div>

      <div class="stat-line">
        <span style="padding-right: 5px;">История</span>
        <input style="padding-left: 5px;" id="int1" value="0" type="number">
        <button onclick="rollSkill('int1','int')">🎲</button>
        <div id="int1_res"></div>
      </div>

      <div class="stat-line">
        <span style="padding-right: 5px;">Восприятие</span>
        <input style="padding-left: 5px;" id="wis1" value="0" type="number">
        <button onclick="rollSkill('wis1','wis')">🎲</button>
        <div id="wis1_res"></div>
      </div>

      <div class="stat-line">
        <span >Убеждение</span>
        <input style="padding-left: 5px;" id="cha1" value="0" type="number">
        <button  onclick="rollSkill('cha1','cha')">🎲</button>
        <div id="cha1_res"></div>
      </div>
    </div>

  </div>
    <div class="card">
      <h3>Инвентарь</h3>
      <textarea></textarea>
    </div>
    <div class="card">
      <h3>Оружие</h3>
      <textarea></textarea>
    </div>
  </div>
</div>


<div id="wiki" class="panel"></div>

<script>
function openTab(id, btn){
  document.querySelectorAll('.panel').forEach(p => p.classList.remove('show'));
  document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
  document.getElementById(id).classList.add('show');
  btn.classList.add('active');
}

function loadWiki(btn){
  fetch('/wiki')
    .then(r => r.text())
    .then(html => {
      document.getElementById('wiki').innerHTML = html;
      openTab('wiki', btn);
    });
}

function getStat(stat){
  return parseInt(document.getElementById(stat).value) || 10;
}

function getMod(stat){
  return Math.floor((stat - 10) / 2);
}

function getSkillBonus(id){
  return parseInt(document.getElementById(id).value) || 0;
}

function rollSkill(skillId, stat){
  const statValue = getStat(stat);
  const statMod = getMod(statValue);
  const skillBonus = getSkillBonus(skillId);
  const totalBonus = statMod + skillBonus;
  const box = document.getElementById(skillId + "_res");
  const interval = setInterval(() => {
    box.innerText = "🎲 " + Math.floor(Math.random() * 21);
  }, 50);

  setTimeout(() => {
    clearInterval(interval);
    const roll = Math.floor(Math.random() * 21);
    const total = roll + totalBonus;
    let text = `🎲 ${roll} + (${statMod}) + (${skillBonus}) = (${total})`;
    box.innerText = text;
  }, 2000);
}
</script>

</body>
</html>