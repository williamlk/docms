/*
	SuperBox v1.0.0
	by Todd Motto: http://www.toddmotto.com
	Latest version: https://github.com/toddmotto/superbox
	
	Copyright 2013 Todd Motto
	Licensed under the MIT license
	http://www.opensource.org/licenses/mit-license.php

	SuperBox, the lightbox reimagined. Fully responsive HTML5 image galleries.
*/
;(function($) {
		
	$.fn.SuperBox = function(options) {
		
		var superbox      = $('<div class="superbox-show" style="display:none"></div>');
		var superboximg   = $('<img src="img/sample/compressed_2.jpg" class="superbox-current-img">');
		var superboxdesp = $('<div class="img-details-container">' +
				'<div class="img-details">' +
				'<p class="title-row">' +
					'<span class="name">题名</span>' +
					'<span class="value">天安门</span>' +
				'</p>'+
				'<p class="time-row">' +
					'<span class="name">年份</span>' +
					'<span class="value">1957</span>' +
				'</p>' +
				'<p class="origin-row">' +
					'<span class="name">来源</span>' +
					'<span class="value">维基百科</span>' +
				'</p>' +
				'<p class="right-row">' +
					'<span class="name">责任者</span>' +
					'<span class="value">刘小超</span>' +
				'</p>' +
				'<p class="desp-row">' +
					'<span class="name">描述</span>' +
					'<span class="value">Markdown 的目标是实现「易读易写」。可读性，无论如何，都是最重要的。一份使用 Markdown 格式撰写的文件应该可以直接以纯文本发布，并且看起来不会像是由许多标签或是格式指令所构成。Markdown 语法受到一些既有 text-to-HTML 格式的影响，包括 Setext、atx、Textile、reStructuredText、Grutatext 和 EtText，而最大灵感来源其实是纯文本电子邮件的格式。</span>' +
				'</p>' +
			'</div> ' +
		'</div>');
		var $triangle = $('<div class="triangle"></div>');
		
		superbox.append(superboximg);
		superbox.append(superboxdesp);
		superbox.append($triangle);
		
		return this.each(function() {
			
			$('.superbox-list').click(function() {
		
				var currentimg = $(this).find('img.super-box');
				
				if($('.superbox-current-img').css('opacity') == 0) {
					$('.superbox-current-img').animate({opacity: 1});
				}
				
				if ($(this).next().hasClass('superbox-show')) {
					if(superbox.is(':hidden')){
						$(superbox).slideDown();
					} else {
						$(superbox).slideUp();
					}
				} else {
					superbox.insertAfter(this);
					$(superbox).slideDown();
					$triangle.css('left', currentimg.position().left + currentimg.width()/2 - superbox.position().left+ 'px');
				}
				$('.ui.dimmer.modals').animate({
					scrollTop: currentimg.position().top - $('#super-modal').position().top
				}, 'medium');
			
			});
						
		});
	};
})(jQuery);