async function getMenuListFromServer(type) {
  try {
    const resp = await fetch('/mn/typelist/' + type);
    const menuList = await resp.json();
    return await menuList;
  } catch (error) {
    console.log(error);
  }
}

function spreadList(result) {
  let div = document.getElementById('listbox');
  div.innerHTML = '';
  for (let i = 0; i < result.length; i++) {
    let html = '<div class="col-lg-3 col-md-4 col-sm-6 mix"><div class="featured__item"><div class="featured__item__pic set-bg">';
    html += `<img src="/images/${result[i].image}" class="tab ${result[i].type }" data-name="${result[i].name }" data-price="${result[i].price }"></div>`;
    html += `<div class="featured__item__text"><h6>${result[i].name}</h6><h5>${result[i].price}원</h5></div></div></div>`;
    div.innerHTML += html;
  }
}

function printList(type) {
  getMenuListFromServer(type).then(result => {
    if (result.length > 0) {
      spreadList(result);
    } else {
      let div = document.getElementById('listbox');
      div.innerHTML = 'List가 없습니다.'
    }
  });
}

document.addEventListener('click', (e) => {
  if (e.target.classList.contains('typeList')) {
    printList(e.target.dataset.type);
  }
  if (e.target.classList.contains('tab')) {
    n = e.target.dataset.name;
    p = parseInt(e.target.dataset.price);
    if(e.target.classList.contains('coffee')) {
      document.querySelector('.modal').style.display = 'block';
    } else {
      list.push({name: n, price: p, cnt: 1});
      spreadOrderList();
    }
  }
  if(e.target.classList.contains('add')) {
    if(document.getElementById('ice').classList.contains('btn-primary')) {
      document.getElementById('ice').classList.replace('btn-primary', 'btn-outline-primary');
    }
    if(document.getElementById('hot').classList.contains('btn-danger')) {
      document.getElementById('hot').classList.replace('btn-danger', 'btn-outline-danger');
    }
    n += '(' + temp;
    if(document.getElementById('size').classList[1]=='btn-success') {
      p += 500;
      n += ', 사이즈 업';
      document.getElementById('size').classList.replace('btn-success', 'btn-outline-success');
    }
    if(document.getElementById('shot').classList[1]=='btn-success') {
      n += ', 샷 추가';
      p += 500;
      document.getElementById('shot').classList.replace('btn-success', 'btn-outline-success');
    }
    if(document.getElementById('syrup').classList[1]=='btn-success') {
      n += ', 시럽 추가';
      document.getElementById('syrup').classList.replace('btn-success', 'btn-outline-success');
    }
    n += ')';
    list.push({name: n, price: p, cnt: 1});
    document.querySelector('.modal').style.display = 'none';
    spreadOrderList();
  }
  if(e.target.classList.contains('cancel')) {
    document.querySelector('.modal').style.display = 'none';
  }
  if(e.target.classList.contains('icon_close')) {
    let tr = e.target.closest('tr');
    list.splice(tr.dataset.num, 1);
    spreadOrderList();
  }
  if(e.target.classList.contains('qtybtn')) {
    let tr = e.target.closest('tr');
    if(e.target.classList[0]=='dec') {
      if(document.getElementById('input'+tr.dataset.num).value>1) {
        list[tr.dataset.num].cnt = --document.getElementById('input'+tr.dataset.num).value;
      }
    }
    else if(e.target.classList[0]=='inc') {
      list[tr.dataset.num].cnt = ++document.getElementById('input'+tr.dataset.num).value;
    }
    spreadOrderList();
  }
  if(e.target.classList.contains('primary-btn')) {
    alert('주문내역\n' + orderStr + '총 ' + total + '원');
  }
});

function spreadOrderList() {
  let table = document.getElementById('orderList');
  let html = "";
  total = 0;
  orderStr = "";
  for (let i = 0; i < list.length; i++) {
    html += `<tr data-num=${i}><td class="shoping__cart__item"><h5>${list[i].name}</h5></td><td class="shoping__cart__price">${list[i].price}원</td>`;
    html += `<td class="shoping__cart__quantity"><div class="quantity"><div class="pro-qty"><span class="dec qtybtn">-</span><input type="text" id="input${i}" value="${list[i].cnt}" min="1"><span class="inc qtybtn">+</span></div></div></td>`;
    html += `<td class="shoping__cart__total">${list[i].price*list[i].cnt}원</td><td class="shoping__cart__item__close"><span class="icon_close"></span>`;
    html += '</td></tr>';
    total += list[i].price*list[i].cnt;
    orderStr += `${list[i].name} ${list[i].cnt}개 ${list[i].price*list[i].cnt}원 \n`;
  }
  table.innerHTML = html;
  document.getElementById('totalprice').innerText = total + '원';
}

document.getElementById('ice').addEventListener('click', () => {
  temp = 'ice';
  if(document.getElementById('ice').classList.contains('btn-outline-primary')) {
    document.getElementById('ice').classList.replace('btn-outline-primary', 'btn-primary');
  }
  if(document.getElementById('hot').classList.contains('btn-danger')) {
    document.getElementById('hot').classList.replace('btn-danger', 'btn-outline-danger');
  }
});

document.getElementById('hot').addEventListener('click', () => {
  temp = 'hot';
  if(document.getElementById('hot').classList.contains('btn-outline-danger')) {
    document.getElementById('hot').classList.replace('btn-outline-danger', 'btn-danger');
  }
  if(document.getElementById('ice').classList.contains('btn-primary')) {
    document.getElementById('ice').classList.replace('btn-primary', 'btn-outline-primary');
  }
});

document.getElementById('size').addEventListener('click', () => {
  if(document.getElementById('size').classList.contains('btn-outline-success')) {
    document.getElementById('size').classList.replace('btn-outline-success', 'btn-success');
  } else if(document.getElementById('size').classList.contains('btn-success')) {
    document.getElementById('size').classList.replace('btn-success', 'btn-outline-success');
  }
});

document.getElementById('shot').addEventListener('click', () => {
  if(document.getElementById('shot').classList.contains('btn-outline-success')) {
    document.getElementById('shot').classList.replace('btn-outline-success', 'btn-success');
  } else if(document.getElementById('shot').classList.contains('btn-success')) {
    document.getElementById('shot').classList.replace('btn-success', 'btn-outline-success');
  }
});

document.getElementById('syrup').addEventListener('click', () => {
  if(document.getElementById('syrup').classList.contains('btn-outline-success')) {
    document.getElementById('syrup').classList.replace('btn-outline-success', 'btn-success');
  } else if(document.getElementById('syrup').classList.contains('btn-success')) {
    document.getElementById('syrup').classList.replace('btn-success', 'btn-outline-success');
  }
});

let list = [];
let total = 0;
let orderStr = "";
let temp = 'hot';
let n = '';
let p = 0;