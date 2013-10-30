// JavaScript Document
window.addEvent('domready', function() {
    document.getElementById('right-arr').addEvent('click', function(){
		var itemsMargin = document.getElementById('items-channel').getStyle('margin-left').slice(0,-2);
		if(itemsMargin > -(parseInt(document.getElementById('items-channel').getStyle('width').slice(0,-2)))+parseInt(document.getElementById('channel').getStyle('width').slice(0,-2))){
			document.getElementById('items-channel').set('tween', {duration: 'long'});
    		document.getElementById('items-channel').tween('margin-left', itemsMargin-160+'px');
		}
    });
	document.getElementById('left-arr').addEvent('click', function(){
    	var itemsMargin = document.getElementById('items-channel').getStyle('margin-left').slice(0,-2);
		if(itemsMargin < 0){
			document.getElementById('items-channel').set('tween', {duration: 'long'});
    		document.getElementById('items-channel').tween('margin-left', (parseInt(itemsMargin)+160)+'px');
		}
    });
	var channelSixeX = document.getElementById('channel-wrapper').getSize().x - (document.getElementById('right-arr').getSize().x + document.getElementById('left-arr').getSize().x);
	var marginLeft = (channelSixeX%160)/2;
	channelSixeX = channelSixeX - channelSixeX%160;
	document.getElementById('channel').setStyle('width', channelSixeX+'px');
	document.getElementById('channel').setStyle('margin-left', marginLeft+'px');
	
	
});