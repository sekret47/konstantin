jQuery(document).ready(function() {
		  jQuery('.drawer').parent().addClass("vt_poswidth drawerwidth");
		  jQuery('.vtheader').parent().addClass("vt_poswidth headerwidth");
		  jQuery('.top').parent().addClass("vt_poswidth topwidth");
		  jQuery('.showcase').parent().addClass("vt_poswidth showcasewidth");
		  jQuery('.feature').parent().addClass("vt_poswidth featurewidth");
		  jQuery('.utility').parent().addClass("vt_poswidth utilitywidth");
		  jQuery('.bottom').parent().addClass("vt_poswidth bottomwidth");
		  jQuery('.footer').parent().addClass("vt_poswidth footerwidth");
		  jQuery('.copyright').parent().addClass("vt_poswidth copyrightwidth");
		  jQuery('.leftright').parent().addClass("leftright");
		  
		  jQuery('.drawerwidth.controls').parent().addClass("vt_poswidth drawerwidth");
		  jQuery('.headerwidth.controls').parent().addClass("vt_poswidth headerwidth");
		  jQuery('.topwidth.controls').parent().addClass("vt_poswidth topwidth");
		  jQuery('.showcasewidth.controls').parent().addClass("vt_poswidth showcasewidth");
		  jQuery('.featurewidth.controls').parent().addClass("vt_poswidth featurewidth");
		  jQuery('.utilitywidth.controls').parent().addClass("vt_poswidth utilitywidth");
		  jQuery('.bottomwidth.controls').parent().addClass("vt_poswidth bottomwidth");
		  jQuery('.footerwidth.controls').parent().addClass("vt_poswidth footerwidth");
		  jQuery('.copyrightwidth.controls').parent().addClass("vt_poswidth copyrightwidth");
		  jQuery('.in.collapse').parent().addClass("vt_active");
		  
		  jQuery('#jform_params_drawertype').each(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.drawerwidth').slideDown();}else{jQuery('.drawerwidth').hide();}});});	
		  jQuery('#jform_params_drawertype').change(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.drawerwidth').slideDown();}else{jQuery('.drawerwidth').hide();}});});	
			 
		  jQuery('#jform_params_headertype').each(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.headerwidth').slideDown();}else{jQuery('.headerwidth').hide();}});});	
		  jQuery('#jform_params_headertype').change(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.headerwidth').slideDown();}else{jQuery('.headerwidth').hide();}});});
			
		  jQuery('#jform_params_toptype').each(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.topwidth').slideDown();}else{jQuery('.topwidth').hide();}});});	
		  jQuery('#jform_params_toptype').change(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.topwidth').slideDown();}else{jQuery('.topwidth').hide();}});});
		  
		  jQuery('#jform_params_showcasetype').each(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.showcasewidth').slideDown();}else{jQuery('.showcasewidth').hide();}});});	
		  jQuery('#jform_params_showcasetype').change(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.showcasewidth').slideDown();}else{jQuery('.showcasewidth').hide();}});});
		  
		  jQuery('#jform_params_featuretype').each(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.featurewidth').slideDown();}else{jQuery('.featurewidth').hide();}});});	
		  jQuery('#jform_params_featuretype').change(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.featurewidth').slideDown();}else{jQuery('.featurewidth').hide();}});});
		  
		  jQuery('#jform_params_utilitytype').each(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.utilitywidth').slideDown();}else{jQuery('.utilitywidth').hide();}});});	
		  jQuery('#jform_params_utilitytype').change(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.utilitywidth').slideDown();}else{jQuery('.utilitywidth').hide();}});});
		  
		  jQuery('#jform_params_bottomtype').each(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.bottomwidth').slideDown();}else{jQuery('.bottomwidth').hide();}});});	
		  jQuery('#jform_params_bottomtype').change(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.bottomwidth').slideDown();}else{jQuery('.bottomwidth').hide();}});});
		  
		  jQuery('#jform_params_footertype').each(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.footerwidth').slideDown();}else{jQuery('.footerwidth').hide();}});});	
		  jQuery('#jform_params_footertype').change(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.footerwidth').slideDown();}else{jQuery('.footerwidth').hide();}});});
		  
		  jQuery('#jform_params_copyrighttype').each(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.copyrightwidth').slideDown();}else{jQuery('.copyrightwidth').hide();}});});	
		  jQuery('#jform_params_copyrighttype').change(function(){currentValue = jQuery(this).val();jQuery(this).find("option").each(function(index,Element){if(jQuery(Element).val() == currentValue){jQuery('.copyrightwidth').slideDown();}else{jQuery('.copyrightwidth').hide();}});});
		  
});