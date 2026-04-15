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
  <button class="tab" onclick="openTab('wiki', this)">Вики</button>
</div>

<div id="sheet" class="panel show">
  <div class="top-grid">
    <input placeholder="Имя персонажа">
    <input placeholder="Класс">
    <input placeholder="Раса">
    <input placeholder="Уровень">
  </div>

  <div class="main-grid">
    <div class="card">
      <h3>Характеристики</h3>
      <label>Сила <input type="number"></label>
      <label>Ловкость <input type="number"></label>
      <label>Телосложение <input type="number"></label>
      <label>Интеллект <input type="number"></label>
      <label>Мудрость <input type="number"></label>
      <label>Харизма <input type="number"></label>
    </div>

    <div class="card">
      <h3>Бой</h3>
      <label>КД <input type="number"></label>
      <label>Инициатива <input type="number"></label>
      <label>Скорость <input type="number"></label>
      <label>Текущие хиты <input type="number"></label>
      <label>Макс. хиты <input type="number"></label>
    </div>

    <div class="card">
      <h3>Навыки</h3>
      <label><input type="checkbox"> Акробатика</label>
      <label><input type="checkbox"> Атлетика</label>
      <label><input type="checkbox"> История</label>
      <label><input type="checkbox"> Магия</label>
      <label><input type="checkbox"> Восприятие</label>
      <label><input type="checkbox"> Скрытность</label>
    </div>
  </div>

  <div class="bottom-grid">
    <div class="card">
      <h3>Оружие</h3>
      <textarea></textarea>
    </div>
    <div class="card">
      <h3>Особенности и заметки</h3>
      <textarea></textarea>
    </div>
  </div>
</div>

<div id="wiki" class="panel">
  <div class="card">
    <h3>Вики</h3>
    <p>Здесь позже можно добавить подвкладки: Расы, Классы, Заклинания.</p>
  </div>
</div>

<script>
function openTab(id, btn){
  document.querySelectorAll('.panel').forEach(p=>p.classList.remove('show'));
  document.querySelectorAll('.tab').forEach(t=>t.classList.remove('active'));
  document.getElementById(id).classList.add('show');
  btn.classList.add('active');
}
</script>
</body>
</html>