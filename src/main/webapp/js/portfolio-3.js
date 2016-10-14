
var portfolio = function() {
    "use strict";
    return {
        init: function(){
        	initPortfolio();
        },
        destroy: function(){
        	$('#js-grid-lightbox-gallery').cubeportfolio('destroy')
        }
    }
} ()

function initPortfolio() {
	$('#js-grid-lightbox-gallery').cubeportfolio({
	    filters: '#js-filters-lightbox-gallery1, #js-filters-lightbox-gallery2',
	    loadMore: '#js-loadMore-lightbox-gallery',
	    loadMoreAction: 'click',
	    layoutMode: 'grid',
	    mediaQueries: [{
	        width: 1500,
	        cols: 5
	    }, {
	        width: 1100,
	        cols: 4
	    }, {
	        width: 800,
	        cols: 3
	    }, {
	        width: 480,
	        cols: 2
	    }, {
	        width: 320,
	        cols: 1
	    }],
	    defaultFilter: '*',
	    animationType: 'rotateSides',
	    gapHorizontal: 10,
	    gapVertical: 10,
	    gridAdjustment: 'responsive',
	    caption: 'zoom',
	    displayType: 'sequentially',
	    displayTypeSpeed: 100,
	
	    // lightbox
	    lightboxDelegate: '.cbp-lightbox',
	    lightboxGallery: true,
	    lightboxTitleSrc: 'data-title',
	    lightboxCounter: '<div class="cbp-popup-lightbox-counter">{{current}} of {{total}}</div>',
	
	    // singlePageInline
	    singlePageInlineDelegate: '.cbp-singlePageInline',
	    singlePageInlinePosition: 'below',
	    singlePageInlineInFocus: true,
	    singlePageInlineCallback: function(url, element) {
	        // to update singlePageInline content use the following method: this.updateSinglePageInline(yourContent)
	        var t = this;
	
	        $.ajax({
	                url: url,
	                type: 'GET',
	                dataType: 'json',
	                timeout: 10000
	            })
	            .done(function(result) {
	            	//console.log(result)
	            	console.log(parseImageInfo(result.data));
	                t.updateSinglePageInline(parseImageInfo(result.data));
	
	            })
	            .fail(function() {
	                t.updateSinglePageInline('AJAX Error! Please refresh the page!');
	                });
        },
    });
}
function parseImageInfo(data){
	// data = data.id;
	console.log(data.id);
	var html = '<div class="cbp-l-inline">';
	html += '<div class="cbp-l-inline-left">'
		+ '<img src="http://image.pekingmemory.cn/' + data.thumbnailId + '" />'
		+ '</div>'
		+ '<div class="cbp-l-inline-right">'
		+ '<div class="cbp-l-inline-title">' + data.title + '</div>'
		+ '<div class="cbp-l-inline-subtitle">拍摄日期: ' + data.date + '</div>'
		+ '<div class="cbp-l-inline-subtitle">来源: ' + checkNoneAttr(data.source) + '</div>'
		+ '<div class="cbp-l-inline-subtitle">责任者: ' + checkNoneAttr(data.creator) + '</div>'
		+ '<div class="cbp-l-inline-desc">' + data.description + '</div>'
		+ '<div class="cbp-l-inline-button"><a href="./visitor/check/'+ data.id +'" type="button" target="_blank" class="btn btn-success">我要纠错</a>&nbsp;<a href="./visitor/meta/'+ data.id +'" type="button" target="_blank" class="btn btn-success"><i class="fa fa-file-photo-o"></i>&nbsp; 更多信息</a></div>'
		+ '</div>'
		+ '</div>';
	return html;
}

function checkNoneAttr(attr){
	if(attr=='') {
		return '暂缺';
	} else {
		return attr;
	}
}


