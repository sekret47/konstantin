// JavaScript Document
window.addEvent('domready', function() {
    $$('.item a').addEvent('click', function(){
		document.getElementById('item_fields').fade('out');
		var emptyVideo = document.getElementById('item_fields').getElement('iframe');
		emptyVideo.set('src','http://www.youtube.com/embed/'+this.get('rel'));
		document.getElementById('item_fields').fade('in');
		document.getElementById('videoOnPage').tween('display', 'block');
		//alert(this.get('rel'));
		return false;
    });
	
});