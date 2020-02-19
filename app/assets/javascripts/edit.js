$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<input data-id="${num}" class="file_field" type="file" name="product[images_attributes][${num}][image]" id="product_images_attributes_${num}_image">`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-id="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex =  $('.js-file_group:last').data('id');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('input').on('change', 'js-remove', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-id="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('img:last').after(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.edit-sub_image__ultext').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)     
    }
  });

  $('.js-remove').on('click', function() {
    const targetIndex = $(this).parent().data('id');
    const hiddenCheck = $(`input[data-id="${targetIndex}"].hidden-destroy`);
    debugger
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).prev().remove();
    $(this).remove();
    // $(`img[data-id="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('input').length == 0) $('.edit-first_content').append(buildFileField(fileIndex[0]));
  });
});