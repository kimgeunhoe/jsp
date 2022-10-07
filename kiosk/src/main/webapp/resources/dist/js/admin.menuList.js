async function getMenuListFromServer(type) {
    try {
      const resp = await fetch('/mn/typelist/' + type);
      const menuList = await resp.json();
      return await menuList;
    } catch(error) {
      console.log(error);
    } 
  }
  
  function spreadList(result) {
    let div = document.getElementById('listbox');
    div.innerHTML = '';
    for (let i = 0; i < result.length; i++) {
      let html = '<div class="col-lg-3 col-md-4 col-sm-6 mix"><div class="featured__item"><div class="featured__item__pic set-bg">';
      html += `<img src="/images/${result[i].image }"></div><div class="featured__item__text"><h6>${result[i].name }</h6>`;
      html += `<h5>${result[i].price }원</h5></div><div class="blog__sidebar__item__tags"><a href="/ad/modify?name=${result[i].name }"`;
      html += `class="btn btn-outline-warning">수정</a><a href="/ad/remove?name=${result[i].name }" class="btn btn-outline-danger">삭제</a>`;
      html += '</div></div></div>';
      div.innerHTML += html;
    }
  }
  
  function printList(type) {
    getMenuListFromServer(type).then(result => {
      console.log(result);
      if(result.length>0) {
        spreadList(result);
      } else {
        let div = document.getElementById('listbox');
        div.innerHTML = 'List가 없습니다.'
      }
    });
  }

  document.addEventListener('click', (e) => {
    if(e.target.classList.contains('typeList')) {
      let type = e.target.dataset.type;
      printList(type);
    }
  });