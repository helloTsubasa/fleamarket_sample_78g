function appendOption(category) {
  let html = 
    `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
  return html;
}

function appendChildrenBox(insertHTML) {
  let childSelectHtml = '';
  childSelectHtml = 
    `<select class="category_form" id="children-form">
       <option value="" data-category="" >選択してください</option>
       ${insertHTML}
      </select>`;
    //  <i class = "fa a-chevron-down"></i>
  $('#children-category').append(childSelectHtml);
}

function appendGrandchildrenBox(insertHTML) {
  let grandchildSelectHtml = '';
  grandchildSelectHtml = 
    `<select class="category_form" id="grandchildren-form" name="item[category_id]">
       <option value="" data-category="" >選択してください</option>
       ${insertHTML}
      </select>`;
    //  <i class = "fa fa-chevron-down"></i>`
  $('#grandchildren-category').append(grandchildSelectHtml);
}

$(document).on("change","#parent-category", function() {
  //選択された親カテゴリーの名前取得 → コントローラーに送る
  let parentCategory =  $("#parent-form").val();
  if (parentCategory != "") {
    $.ajax( {
      type: 'GET',
      url: 'get_category_children',
      data: { parent_name: parentCategory },
      dataType: 'json'
    })
    .done(function(children) {
      //親カテゴリーが変更されたら、子/孫カテゴリー、サイズを削除し、初期値にする
      $("#children-category").empty();
      $("#grandchildren-category").empty();
      $('.size_area').val('');
      $('#size_area').css('display', 'none');
      let insertHTML = '';
      children.forEach(function(child) {
        insertHTML += appendOption(child);
      });
      appendChildrenBox(insertHTML);
    })
    .fail(function() {
      alert('error：子カテゴリーの取得に失敗');
    })
  }else{
    $("#children-category").empty();
    $("#grandchildren-category").empty();
    $('.size_area').val('');
    $('#size_area').css('display', 'none');
  }
});

//子カテゴリー選択によるイベント発火
$(document).on('change', '#children-form', function() {
  let childId = $('#children-form option:selected').data('category');
  if (childId != ""){
    $.ajax({
      url: 'get_category_grandchildren',
      type: 'GET',
      data: { child_id: childId },
      datatype: 'json'
    })
    .done(function(grandchildren) {
      if (grandchildren.length != 0) {
        $("#grandchildren-category").empty();
        $('.size_area').val('');
        $('#size_area').css('display', 'none');
        let insertHTML = '';
        grandchildren.forEach(function(grandchild) {
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      }
    })
    .fail(function() {
      alert('error:孫カテゴリーの取得に失敗');
    })
  }else{
    $("#grandchildren-category").empty();
    $('.size_area').val('');
    $('#size_area').css('display', 'none');      
  }
});

$(document).on('change', '#grandchildren-form', function() {
  let grandchildId = $('#grandchildren-category option:selected').data('category');
  if (grandchildId != "") {
    $('.size_area').val('');
    $('#size_area').css('display', 'block');
  } else {
    $('.size_area').val('');
    $('#size_area').css('display', 'none');
  }
});