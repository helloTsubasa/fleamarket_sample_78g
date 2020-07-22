$(document).on('turbolinks:load', ()=>{
  const buildFileField = (index)=>{
    const html = `<div data-index="${index}" class="image_file" id="image_file_${index}">
                    <label for="item_images_attributes_${index}_image">
                      <div class="image_file__field" id="image_file_${index}"></div>
                      <input class="image_form" type=file
                      name="item[images_attributes][${index}][image]"
                      id="item_images_attributes_${index}_image">
                    </label>
                  </div>`;
    return html;
  }
  const buildEditFileField = (index)=>{
    const html = `<div data-index="${index}" class="image_file" id="image_file_${index}">
                    <label for="item_images_attributes_${index}_image">
                      <div class="image_file__field" id="image_file_${index}"></div>
                      <input class="image_edit_form" type=file
                      name="item[images_attributes][${index}][image]"
                      id="item_images_attributes_${index}_image">
                    </label>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}" class="image_view">
                    <div class="image_src">
                      <img data-index="${index}" src="${url}" width="100px" height="100px">
                    </div>
                    <div class="image_remove">削除</div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.image_form:last').data('index');
  fileIndex.splice(0, lastIndex);
  let fileEditIndex = [11,12,13,14,15,16,17,18,19,20]
  lastEditIndex = $('.image_view:last').data('index');
  fileEditIndex.splice(0, lastEditIndex);

  $('.hidden-destroy').hide();

  $('.image_box').on('change', '.image_form', function(e){
    const targetIndex = $(this).parent().parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('.image_file').css('display', 'none');
      $('.image_box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('.image_box').on('change', '.image_edit_form', function(e){
    const targetIndex = $(this).parent().parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('.image_file').css('display', 'none');
      $('.image_box').append(buildEditFileField(fileEditIndex[0] + 1));
      console.log(fileEditIndex[0]);
      fileEditIndex.shift();
      fileEditIndex.push(fileEditIndex[fileEditIndex.length - 1] + 1);
    }
  });

  $('#previews').on('click', '.image_remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`#item_images_attributes_${targetIndex}__destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    console.log($(this).parent());
    $(`img[data-index="${targetIndex}"]`).remove();
    $(`div[data-index="${targetIndex}"]`).remove();
  
    if ($('.image_form').length == 0) $('.image_box').append(buildFileField(fileIndex[0]));
  });
});