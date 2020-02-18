$(function(){
  function appendOption(category){
    var html = `<option value = "${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
      childSelectHtml = `
                        <select class="category_select-box" id="child_category" name="product[category_id]">
                        <option value="---">---</option>
                        ${insertHTML}
                        </select>
                        </div>
                        <div class= 'product_select-grandchildren'>
                        </div>
                        </div>`;
    $('.product_select-children').append(childSelectHtml);
  }
  function appendgrandChildrenBox(insertHTML){
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `
                              <select class="category_select-box" id="grandchild_category" name="product[category_id]">
                              <option value="---">---</option>
                              ${insertHTML} 
                              </select>
                              </div>
                              <div class= 'product_select-grandchildren'>
                              </div>
                              </div>`;
    $('.product_select-grandchildren').append(grandchildrenSelectHtml);
  }

  $(document).on('change','#category_select', function(){
    var productcategory = document.getElementById('category_select').value;
    if (productcategory != ''){
      $.ajax({
        url:'category_children',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
      .done(function(children){
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
        $(document).on('change','#category_select', function(){
          $('#child_category').remove();
          $('#grandchild_category').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });

  $(document).on('change', '#child_category', function(){
    var productcategory = document.getElementById('child_category').value;
    if (productcategory != ''){
      $.ajax({
        url:'category_grandchildren',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
      .done(function(grandchildren){
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendgrandChildrenBox(insertHTML);
        $(document).on('change', '#child_category', function(){
          $('#grandchild_category').remove;
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });
});