$(document).on('turbolinks:load', ()=>{
  const buildFileField = (index)=>{
    const html = `<div data-index="${index}" class="image_file">
                    <input class="image_form" type=file
                    name="item[images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image">
                    <span class="image_remove">削除</span>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.image_form:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.image_box').on('change', '.image_form', function(e){
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('.image_box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });
  $('.image_box').on('click', '.image_remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.image_form').length == 0) $('.image_box').append(buildFileField(fileIndex[0]));
  });
});