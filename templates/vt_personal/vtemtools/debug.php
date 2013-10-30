<script type="text/javascript" src="<?php echo $template_baseurl.'/vtemtools/menus/fg.menu.js';?>"></script>
<script type="text/javascript">
var vtemdrilldownm = jQuery.noConflict();jQuery(document).ready(function(){jQuery("#vtflatmenu").menu({content: jQuery("#vtflatmenu").next().html(),crumbDefaultText: ""});});

////////////////EQUA COLUNMS /////////////////
var Equalizer = new Class({
initialize: function(elements) {
this.elements = $$(elements);
},
equalize: function(hw) {
if(!hw) { hw = 'height'; }
var max = 0,
//prop = (typeof document.body.style.maxHeight != 'undefined' ? 'min-' : '') + hw; //ie6 ftl
prop = (typeof document.body.style.maxHeight != 'undefined' ? '' : '') + hw; //ie6 ftl
offset = 'offset' + hw.capitalize();
this.elements.each(function(element,i) {
var calc = element[offset];
if(calc > max) { max = calc; }
},this);
this.elements.each(function(element,i) {
element.setStyle(prop,max - (element[offset] - element.getStyle(hw).toInt()));
});
return max;
}
});
///////////////////////////////////////////////////////////////

/*function fixHeight1 () {
var equalizer1 = new Equalizer("#vt_footer .vt_moduletable").equalize("height");
}
window.addEvent ("load", function () {
fixHeight1.delay (300);
}); */

function fixHeight2 () {
var equalizer2 = new Equalizer("#vt_utility .vt_moduletable .vt_box").equalize("height");
}
window.addEvent ("load", function () {
fixHeight2.delay (300);
}); 


</script>
<?php 
if ($this->countModules('debug')) { ?>
<div id="vt_debug"><jdoc:include type="modules" name="debug" style="none"  /></div>
<?php } 
if($GoogleAnalytics == 1){
      echo '<script type="text/javascript">
			var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
			document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));
			</script>
			<script type="text/javascript">
			try {
			var pageTracker = _gat._getTracker("'.$gacode.'");
			pageTracker._trackPageview();
			} catch(err) {}</script>
			';
}
?>