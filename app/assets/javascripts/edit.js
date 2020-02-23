$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div class="js-file_group" data-index="${num}">
                    <input type="file" name="product[images_attributes][${num}][image]" id="image" class="js-file">
                    <span class="js-remove">削除</span>
                  </div>
                  `;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img class="preview_image" id="preview_image_id_${index}" data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex =  $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $(document).on('change', '#image', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else if ($('.js-file').length == 5) {
      $(`#preview_image_id_${targetIndex - 1}`).after(buildImg(targetIndex, blobUrl));
      debugger
    } else {
      // fileIndexの先頭の数字を使ってinputを作る
      $('.edit-first_content_image').append(buildFileField(fileIndex[0]));
      $(`#preview_image_id_${targetIndex - 1}`).after(buildImg(targetIndex, blobUrl));     
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)  
     }
  });

  $(document).on('change', '.input_btn', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $(`#preview_image_id_${targetIndex}`).replaceWith(buildImg(targetIndex, blobUrl));    
     }
  });

  $(document).on('click', '.js-remove',function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).closest('.js-file_group').remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file_group').length == 0) $('.edit-first_content_image').append(buildFileField(fileIndex[0]));
  });
});