function openTab(id, btn){
  document.querySelectorAll('.panel').forEach(p=>p.classList.remove('show'));
  document.querySelectorAll('.tab').forEach(t=>t.classList.remove('active'));
  document.getElementById(id).classList.add('show');
  btn.classList.add('active');
}

function openWiki(){
  fetch('/wiki')
    .then(r => r.text())
    .then(html => {
      document.getElementById("wiki").innerHTML = html;
    });
}