var swipe = function(obj, ev, callback) {

	//ev：down/up/left/right

	var cbk = callback || function(){};

	bindSwipeEvent(obj ,ev ,cbk);

};

function bindSwipeEvent(obj, ev, cbk) {
	var startX,startY,endX,endY,scrollX,scrollY;
	var screenHeight = window.screen.availHeight, // 屏幕可用工作区高度
		pageHeight = document.body.scrollHeight ; // 网页正文全文高

	obj.addEventListener('touchstart',function(e) {
		var touch = e.touches[0], //获取第一个触点
			x = parseInt(touch.pageX) || parseInt(touch.clientX), //页面触点X坐标
		    y = parseInt(touch.pageY) || parseInt(touch.clientY); //页面触点Y坐标
		//记录触点初始位置
		startX = x;
		startY = y;
	});
	obj.addEventListener('touchmove',function(e) {
		var touch = e.touches[0],
			x = parseInt(touch.pageX) || parseInt(touch.clientX),
		    y = parseInt(touch.pageY) || parseInt(touch.clientY);
		endX = x;
		endY = y;
	});
	obj.addEventListener('touchend',function(e) {
		touchendFunc(ev, cbk);
	});
	//Android
	obj.addEventListener('touchcancel',function(e) {
		touchendFunc(ev, cbk);
	});

	function touchendFunc(ev, cbk) {
		scrollX = document.documentElement.scrollLeft || document.body.scrollLeft; // 网页被卷去的高
		scrollY = document.documentElement.scrollTop || document.body.scrollTop; // 网页被卷去的高

    	
		if(scrollX <=0 && startX - endX > 10 && Math.abs(startY - endY) < 10) {
    		// console.log('左滑');
    		if(ev === 'left' && Math.abs(startY - endY) < Math.abs(startX - endX)) {
    			cbk();
    		}
    	}
    	if(scrollX <=0 && endX - startX > 10 && Math.abs(startY - endY) < 10) {
    		// console.log('右滑');
    		if(ev === 'right' && Math.abs(startY - endY) < Math.abs(startX - endX)) {
    			cbk();
    		}
    	}
		if(scrollY <= 0 && endY - startY > 0) {
    		// console.log('下拉');
		    if(ev === 'down' && Math.abs(startY - endY) > Math.abs(startX - endX)) {
			  	cbk();
		  	}
		}
		if(screenHeight + scrollY >= pageHeight && startY - endY > 0) {
			// console.log('上拉');
			if(ev === 'up' && Math.abs(startY - endY) > Math.abs(startX - endX)) {
		  		cbk();
			}
		}
	}
};

module.exports = {
  swipe: swipe
};



















