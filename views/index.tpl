<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>D&D Sheet</title>
<link rel="stylesheet" href="/static/style.css">
</head>

<body>

<!-- ВКЛАДКИ -->
<div class="tabs">
  <button class="tab active" onclick="openTab('sheet', this)">Анкета</button>
  <button class="tab" onclick="openTab('skills', this)">Навыки</button>
  <button class="tab" onclick="loadWiki(this)">Вики</button>
</div>

<!-- ================= АНКЕТА ================= -->
<div id="sheet" class="panel show">

  <div class="top-grid">
    <input placeholder="Имя">
    <input placeholder="Класс">
    <input placeholder="Раса">
    <input type="number" placeholder="Уровень">
    <input type="number" placeholder="Опыт">
  </div>

  <div class="main-grid">


    <div class="card stats">
      <h3>Характеристики</h3>
      <div class="stat-line">
        <span>Сила</span>
        <input id="str" type="number" value="10">
        <button onclick="rollSave('str')">🎲</button>
        <div id="str_save"></div>
      </div>
      <div class="stat-line">
        <span>Ловкость</span>
        <input id="dex" type="number" value="10">
        <button onclick="rollSave('dex')">🎲</button>
        <div id="dex_save"></div>
      </div>
      <div class="stat-line">
        <span>Телосложение</span>
        <input id="con" type="number" value="10">
        <button onclick="rollSave('con')">🎲</button>
        <div id="con_save"></div>
      </div>
      <div class="stat-line">
        <span>Интеллект</span>
        <input id="int" type="number" value="10">
        <button onclick="rollSave('int')">🎲</button>
        <div id="int_save"></div>
      </div>
      <div class="stat-line">
        <span>Мудрость</span>
        <input id="wis" type="number" value="10">
        <button onclick="rollSave('wis')">🎲</button>
        <div id="wis_save"></div>
      </div>
      <div class="stat-line">
        <span>Харизма</span>
        <input id="cha" type="number" value="10">
        <button onclick="rollSave('cha')">🎲</button>
        <div id="cha_save"></div>
      </div>
    </div>
    <div class="card skills">

    <h3>Навыки</h3>

    <div class="skill-row">
      <span>Атлетика</span>
      <input type="number">
    </div>

    <div class="skill-row">
      <span>Акробатика</span>
      <input type="number">
    </div>

    <div class="skill-row">
      <span>Скрытность</span>
      <input type="number">
    </div>

    <div class="skill-row">
      <span>История</span>
      <input type="number">
    </div>

    <div class="skill-row">
      <span>Восприятие</span>
      <input type="number">
    </div>

    <div class="skill-row">
      <span>Убеждение</span>
      <input type="number">
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


function mod(v){
  return Math.floor((v - 10) / 2);
}


function rollSave(stat){
  const val = parseInt(document.getElementById(stat).value) || 10;
  const bonus = mod(val);

  const box = document.getElementById(stat + "_save");

  const interval = setInterval(() => {
    box.innerText = "🎲 " + Math.floor(Math.random() * 21);
  }, 50);

  setTimeout(() => {
    clearInterval(interval);

    const roll = Math.floor(Math.random() * 21);
    const total = roll + bonus;

    box.innerText = `🎲 ${roll} + ${bonus} = ${total}`;
  }, 2000);
}
</script>

</body>
</html>