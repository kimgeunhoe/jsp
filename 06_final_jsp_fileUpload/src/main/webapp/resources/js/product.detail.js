async function getReplyListFromServer(pno) {
  try {
    const resp = await fetch('/rp/list/' + pno);
    const rpList = await resp.json();
    return await rpList;
  } catch(error) {
    console.log(error);
  } 
}

function spreadReplyList(result) {
  let div = document.getElementById('accordionExample');
  div.innerHTML = '';
  for (let i = 0; i < result.length; i++) {
    let html = '<div class="accordion-item">';
    html += `<h2 class="accordion-header" id="heading${i}">`;
    html += '<button class="accordion-button" type="button"';
    html += `data-bs-toggle="collapse" data-bs-target="#collapse${i}"`;
    html += `aria-expanded="true" aria-controls="collapse${i}">${result[i].rno}, ${result[i].pno}, ${result[i].replier}</button></h2>`
    html += `<div id="collapse${i}" class="accordion-collapse collapse show"`;
    html += `aria-labelledby="heading${i}" data-bs-parent="#accordionExample">`;
    html += `<div class="accordion-body">`;
    html += `<button type="button" data-rno="${result[i].rno}" class="btn btn-sm btn-outline-warning rpModBtn">%</button>`
    html += `<button type="button" data-rno="${result[i].rno}" class="btn btn-sm btn-outline-danger rpDelBtn">X</button>`
    html += `<input type="text" class="form-control" id="rpText" value="${result[i].reply}">`;
    html += `${result[i].mod_at}`;
    html += '</div></div></div>';
    div.innerHTML += html;
  }
}

function printReplyList(pno) {
  getReplyListFromServer(pno).then(result => {
    console.log(result);
    if(result.length>0) {
      spreadReplyList(result);
    } else {
      let div = document.getElementById('accordionExample');
      div.innerHTML = 'Reply가 없습니다.'
    }
  });
}
async function updateReplyToServer(rnoVal, rpText) {
  try {
    const url = '/rp/modify';
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify({rno: rnoVal, reply: rpText})
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

async function removeReplyFromServer(rnoVal) {
  try {
    const url = '/rp/remove/'+rnoVal;
    const config = {
      method: 'post'
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

document.addEventListener('click', (e) => {
  if(e.target.classList.contains('rpModBtn')) {
    let rnoVal = e.target.dataset.rno;
    let div = e.target.closest('div');
    let rpText = div.querySelector('#rpText').value;
    updateReplyToServer(rnoVal, rpText).then(result => {
      if(result>0) {
        alert("리플 수정 성공");
        printReplyList(pnoVal);
      }
    });
  }
  if(e.target.classList.contains('rpDelBtn')) {
    let rnoVal = e.target.dataset.rno;
    removeReplyFromServer(rnoVal).then(result => {
      if(result>0) {
        alert("리플 삭제 성공");
        printReplyList(pnoVal);
      }
    });
  }
});

async function postReplyToServer(rpData){
  try {
    const url = "/rp/post";
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify(rpData)
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch(error) {
    console.log(error);
  }
}

document.getElementById('rpAddBtn').addEventListener('click', () => {
  const rpText = document.getElementById('rpText').value;
  if(rpText==null || rpText == '') {
    alert('리플 내용을 입력해주세요');
    return false;
  }
  else {
    let rpData = {
      pno: pnoVal,
      replier: document.getElementById('rpWriter').innerText,
      reply: rpText
    };
    postReplyToServer(rpData).then(result => {
      if(result>0) {
        alert('리플 등록 성공');
        document.getElementById('rpText').value = "";
      }
      printReplyList(rpData.pno);
    })
  }
})
