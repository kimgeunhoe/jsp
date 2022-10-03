async function getCommentListFromServer(bno) {
  try {
    const resp = await fetch('/cmt/list/' + bno);
    const cmtList = await resp.json();
    return await cmtList;
  } catch(error) {
    console.log(error);
  } 
}

function spreadCommentList(result) {
  let div = document.getElementById('accordionExample');
  div.innerHTML = '';
  for (let i = 0; i < result.length; i++) {
    let html = '<div class="accordion-item">';
    html += `<h2 class="accordion-header" id="heading${i}">`;
    html += '<button class="accordion-button" type="button"';
    html += `data-bs-toggle="collapse" data-bs-target="#collapse${i}"`;
    html += `aria-expanded="true" aria-controls="collapse${i}">${result[i].cno}, ${result[i].bno}, ${result[i].writer}</button></h2>`
    html += `<div id="collapse${i}" class="accordion-collapse collapse show"`;
    html += `aria-labelledby="heading${i}" data-bs-parent="#accordionExample">`;
    html += `<div class="accordion-body">`;
    html += `<button type="button" data-cno="${result[i].cno}" class="btn btn-sm btn-outline-warning cmtModBtn">%</button>`
    html += `<button type="button" data-cno="${result[i].cno}" class="btn btn-sm btn-outline-danger cmtDelBtn">X</button>`
    html += `<input type="text" class="form-control" id="cmtText" value="${result[i].content}">`;
    html += `${result[i].mod_at}`;
    html += '</div></div></div>';
    div.innerHTML += html;
  }
}

function printCommentList(bno) {
  getCommentListFromServer(bno).then(result => {
    console.log(result);
    if(result.length>0) {
      spreadCommentList(result);
    } else {
      let div = document.getElementById('accordionExample');
      div.innerHTML = 'Comment가 없습니다.'
    }
  });
}
async function updateCommentToServer(cnoVal, cmtText) {
  try {
    const url = '/cmt/modify';
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify({cno: cnoVal, content: cmtText})
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

async function removeCommentFromServer(cnoVal) {
  try {
    const url = '/cmt/remove/'+cnoVal;
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
  if(e.target.classList.contains('cmtModBtn')) {
    let cnoVal = e.target.dataset.cno;
    // let cmtText = e.target.next().value;
    let div = e.target.closest('div');
    let cmtText = div.querySelector('#cmtText').value;
    updateCommentToServer(cnoVal, cmtText).then(result => {
      if(result>0) {
        alert("댓글 수정 성공");
        printCommentList(bnoVal);
      }
    });
  }
  if(e.target.classList.contains('cmtDelBtn')) {
    let cnoVal = e.target.dataset.cno;
    removeCommentFromServer(cnoVal).then(result => {
      if(result>0) {
        alert("댓글 삭제 성공");
        printCommentList(bnoVal);
      }
    });
  }
});

async function postCommentToServer(cmtData){
  try {
    const url = "/cmt/post";
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify(cmtData)
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch(error) {
    console.log(error);
  }
}

document.getElementById('cmtAddBtn').addEventListener('click', () => {
  const cmtText = document.getElementById('cmtText').value;
  if(cmtText==null || cmtText == '') {
    alert('댓글 내용을 입력해주세요');
    return false;
  }
  else {
    let cmtData = {
      bno: bnoVal,
      writer: document.getElementById('cmtWriter').innerText,
      content: cmtText
    };
    postCommentToServer(cmtData).then(result => {
      if(result>0) {
        alert('댓글 등록 성공');
        document.getElementById('cmtText').value = "";
      }
      printCommentList(cmtData.bno);
    })
  }
})

async function removeFileFromServer(fileData) {
  try {
    const url = "/file/remove";
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: JSON.stringify(fileData)
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch(error) {
    console.log(error);
  }
};

document.getElementById('fileDelBtn').addEventListener('click', () => {
  const imgTag = document.getElementById('imgFile');
  const imgFullName = imgTag.getAttribute('src');
  const imgFileName = imgFullName.substring(imgFullName.lastIndexOf('/')+1);
  console.log(imgFileName);
  
  const fileData = {
    bno: bnoVal,
    img_file: imgFileName
  };

  removeFileFromServer(fileData).then(result => {
    if(result>0) {
      alert('이미지 삭제 성공');
    }
  });
});