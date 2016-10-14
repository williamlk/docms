/**
 * 
 */
var ComingSoon = function() {
	return {
		init : function() {
			var e = new Date;
			e = new Date(e.getFullYear() + 1, 0, 26), $.backstretch([
					"./img/visitor/login-bg1.jpg",
					"./img/visitor/login-bg2.jpg",
					"./img/visitor/login-bg3.jpg",
					"./img/visitor/login-bg4.jpg" ], {
				fade : 1e3,
				duration : 1e4
			})
		}
	}
}();
jQuery(document).ready(function() {
	ComingSoon.init()
});