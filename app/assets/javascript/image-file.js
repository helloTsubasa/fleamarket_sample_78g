$(document).on('turbolinks:load', ()=>{
  const buildFileField = (index)=>{
    const html = `<div data-index="${index}" class="image_file">
                    <input class="image_form" type=file
                    name="item[images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image">
                    <div class="image_remove">削除</div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.image_box').on('change', '.image_form', function(e){
    $('.image_box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });
  $('.image_box').on('click', '.image_remove', function() {
    $(this).parent().remove();
    if ($('.image_form').length == 0) $('.image_box').append(buildFileField(fileIndex[0]));
  });
});