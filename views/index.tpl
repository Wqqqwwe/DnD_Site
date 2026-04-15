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
        <input id="str" type="number" value="10">

      </div>
      <div class="stat-line">
        <span>Ловкость</span>
        <input id="dex" type="number" value="10">

      </div>
      <div class="stat-line">
        <span>Телосложение</span>
        <input id="con" type="number" value="10">

      </div>
      <div class="stat-line">
        <span>Интеллект</span>
        <input id="int" type="number" value="10">

      </div>
      <div class="stat-line">
        <span>Мудрость</span>
        <input id="wis" type="number" value="10">

      </div>
      <div class="stat-line">
        <span>Харизма</span>
        <input id="cha" type="number" value="10">

      </div>
    </div>
    <div class="card skills">

    <h3>Навыки</h3>

    <div class="stat-line">
      <span>Атлетика</span>
      <input id="str1" value="0" type="number">
      <button onclick="rollSkill('str1','str')">🎲</button>
      <div id="str1_res"></div>
    </div>

    <div class="stat-line">
      <span>Акробатика</span>
      <input id="agl1" value="0" type="number">
      <button onclick="rollSkill('agl1','dex')">🎲</button>
      <div id="agl1_res"></div>
    </div>

    <div class="stat-line">
      <span>Скрытность</span>
      <input id="agl2" value="0" type="number">
      <button onclick="rollSkill('agl2','dex')">🎲</button>
      <div id="agl2_res"></div>
    </div>

    <div class="stat-line">
      <span>История</span>
      <input id="int1" value="0" type="number">
      <button onclick="rollSkill('int1','int')">🎲</button>
      <div id="int1_res"></div>
    </div>

    <div class="stat-line">
      <span>Восприятие</span>
      <input id="wis1" value="0" type="number">
      <button onclick="rollSkill('wis1','wis')">🎲</button>
      <div id="wis1_res"></div>
    </div>

    <div class="stat-line">
      <span>Убеждение</span>
      <input id="cha1" value="0" type="number">
      <button  onclick="rollSkill('cha1','cha')">🎲</button>
      <div id="cha1_res"></div>
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