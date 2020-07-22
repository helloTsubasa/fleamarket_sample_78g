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
  $('#children-category').append(childSelectHtml);
}

function appendGrandchildrenBox(insertHTML) {
  let grandchildSelectHtml = '';
  grandchildSelectHtml = 
    `<select class="category_form" id="grandchildren-form" name="item[category_id]">
       <option value="" data-category="" >選択してください</option>
       ${insertHTML}
      </select>`;
  $('#grandchildren-category').append(grandchildSelectHtml);
}

$(document).on("change","#parent-category", function() {
  let parentCategory =  $("#parent-form").val();
  if (parentCategory != "") {
    $.ajax( {
      type: 'GET',
      url: 'get_category_children',
      data: {
        parent_name: parentCategory 
        },
      dataType: 'json'
    })
    .done(function(children) {
      $("#children-category").empty();
      $("#grandchildren-category").empty();
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
  }
});

$(document).on('change', '#children-form', function() {
  let childId = $('#children-form option:selected').data('category');
  if (childId != ""){
    $.ajax({
      type: 'GET',
      url: 'get_category_grandchildren',
      data: {
         child_id: childId 
        },
      datatype: 'json'
    })
    .done(function(grandchildren) {
      if (grandchildren.length != 0) {
        $("#grandchildren-category").empty();
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
  }
});

$(document).on("change","#edit-children-form", function() {
  let childId =  $("#edit-children-form").val();
  if (childId != "") {
    $.ajax( {
      type: 'GET',
      url: 'get_category_grandchildren',
      data: {
         child_id: childId 
        },
      datatype: 'json'
    })
    .done(function(grandchildren) {
      if (grandchildren.length != 0) {
        $("#grandchildren-category").empty();
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
  }
});