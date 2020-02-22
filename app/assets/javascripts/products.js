$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div class="product_group">
                    <label class="label_field" style="background-color: white; height: 100px;" for="product_images_attributes_${num}_image">画像を追加</label>
                    <div class="js-file_group" data-id="${num}">
                      <input class="js-file" type="file" name="product[images_attributes][${num}][image]" id="product_images_attributes_${num}_image" style="display: none;">
                      <span class="js-remove">削除</span>
                    </div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img class="preview" data-id="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex =  $('.js-file_group:last').data('id');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $(document).on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('id');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-id="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else if($('.preview').length == 4) {
      $('.label_field').replaceWith(buildImg(targetIndex, blobUrl));
    } else {
      $('.label_field').replaceWith(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#previews').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)    

    }
  });

  $(document).on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('id');
    const hiddenCheck = $(`input[data-id="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().prev().remove();
    $(this).parent().remove();
    $(`img[data-id="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    // if ($('.js-file').length == 0) $('.preview').append(buildFileField(fileIndex[0]));
  });
});