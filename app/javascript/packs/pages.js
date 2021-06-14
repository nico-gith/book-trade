/* global $*/
$(function () {
  //ページ内スクロール
  $('a[href^="#"]').on("click", function () {
    var href = $(this).attr("href");
    //未作成アプリに対するリンク移動させないための処理
    if (href == "##"){
      return false;
    }
    var target = $(href == "#" || href == "" ? "html" : href);
    var position = target.offset().top;
    $("html, body").animate({ scrollTop: position }, 300, "swing");
    return false;
  });
  
  //ナビバースクロール時にナビバー固定
  //スクロールすると上部に固定させるための設定を関数でまとめる
  function FixedAnime() {
	var headerH = $('.header').outerHeight(true);
	var scroll = $(window).scrollTop();
	if (scroll >= headerH){//headerの高さ以上になったら
			$('.hnav').addClass('fixed');
			$('.hnav-list').addClass('fix-background');
		}else{
			$('.hnav').removeClass('fixed');
			$('.hnav-list').removeClass('fix-background');
		}
  }
  // 画面をスクロールをしたら動かしたい場合の記述
  $(window).scroll(function () {
	  FixedAnime();/* スクロール途中からヘッダーを出現させる関数を呼ぶ*/
  });

  // ページが読み込まれたらすぐに動かしたい場合の記述
  $(window).on('load', function () {
	FixedAnime();/* スクロール途中からヘッダーを出現させる関数を呼ぶ*/
  });

});
