// JavaScript Document
window.addEvent('domready', function() {	
	
	$$('.item a').addEvent('click', function(){
		var mask = new Element('div', {
			'class': 'mask',
			'styles': {
				'display': 'block',
				'position':'fixed',
				'top':'0',
				'left':'0',
				'height':'100%',
				'width':'100%',
				'z-index':'2000000',
				'background': 'none repeat scroll 0 0 #000000',
				'opacity':'0.7'
			}
		});
		$$('body').grab(mask, 'top');
		var player = new Element('div', {
			'class': 'player',
			'styles': {
				'display': 'block',
				'position':'fixed',
				'top':'20%',
				'left':'50%',
				'height':'100px',
				'width':'100px',
				'z-index':'20000001',
				'background': 'none repeat scroll 0 0 #fff',
				'opacity':'0.7'
			}
		});
		mask.grab(player, 'top');
		 $$('.mask').addEvent('click', function(){this.dispose();});
		return false;
    });
	
});