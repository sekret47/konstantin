<?php
/**
 * @version     1.0.0
 * @package     com_easy_youtube_gallery
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      moti <joomlacook@gmail.com> - http://www.extensioncook.com/
 */

// no direct access
defined('_JEXEC') or die;

JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
JHtml::_('behavior.keepalive');
// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet('components/com_easy_youtube_gallery/assets/css/easy_youtube_gallery.css');
?>
<script type="text/javascript">
	Joomla.submitbutton = function(task)
	{
		if (task == 'video.cancel' || document.formvalidator.isValid(document.id('video-form'))) {
			Joomla.submitform(task, document.getElementById('video-form'));
		}
		else {
			alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED'));?>');
		}
	}
	var userThumb='';
	var selectedThumb;
	 var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
   
	function thumb() {
		userThumb = document.getElementById('jform_thumb').get('value');
    	if (userThumb)
			selectedThumb= "<?php echo JURI::root();?>"+userThumb;
		else 
			{
				if(document.getElementById('jform_url').get('value'))
				{
					 var match = document.getElementById('jform_url').get('value').match(regExp);
   							 if (match&&match[7]){
							 
							 keyVideo = match[7];
      						 selectedThumb= "http://img.youtube.com/vi/"+keyVideo+"/"+document.getElementById('jform_youtubethumb').get('value')+".jpg"; 
    							}
	
					
					
				}
			}
		if(selectedThumb)
			{
			var myImg = new Element('img', {
				'src': selectedThumb,
				'class': 'myImg',
				'styles': {
					'width' : '100px',
					'display': 'block',
					'border': '0px solid black'
					}
			});
			$('selectedThumb').empty();
			myImg.inject('selectedThumb');
		}
		if(document.getElementById('jform_url').get('value'))
		{
			for(var i=0;i<4;i++)
				{
					var myImg = new Element('img', {
					'src': 'http://img.youtube.com/vi/'+keyVideo+'/'+i+'.jpg',
					'class': 'myImg',
					'styles': {
						'width' : '120px',
						'display': 'block',
						'border': '0px solid black'
						}
					});
				$('thumb'+i).empty();
				myImg.inject('thumb'+i);
			}
		}
	}
	
	window.addEvent('domready',thumb);
	window.addEvent('domready', function() {
		$('jform_url').addEvent('blur', thumb);
		$('jform_youtubethumb').addEvent('change', thumb);
		$('jform_thumb').addEvent('change', thumb);
		$('thumb0').addEvent('click', function(){
			$('jform_youtubethumb').set('value','0');
			$('jform_youtubethumb').fireEvent('change')
		});
		$('thumb1').addEvent('click', function(){
			$('jform_youtubethumb').set('value','1');
			$('jform_youtubethumb').fireEvent('change')
		});
		$('thumb2').addEvent('click', function(){
			$('jform_youtubethumb').set('value','2');
			$('jform_youtubethumb').fireEvent('change')
		});
		$('thumb3').addEvent('click', function(){
			$('jform_youtubethumb').set('value','3');
			$('jform_youtubethumb').fireEvent('change')
		});
	});
</script>

<form action="<?php echo JRoute::_('index.php?option=com_easy_youtube_gallery&layout=edit&id='.(int) $this->item->id); ?>" method="post" name="adminForm" id="video-form" class="form-validate">
	<div class="width-60 fltlft">
		<fieldset class="adminform">
			<legend><?php echo JText::_('COM_EASY_YOUTUBE_GALLERY_LEGEND_VIDEO'); ?></legend>
			<ul class="adminformlist">
                
				<li><?php echo $this->form->getLabel('id'); ?>
				<?php echo $this->form->getInput('id'); ?></li>
				
				<li style="display:none;"><?php echo $this->form->getLabel('catid'); ?>
				<?php echo $this->form->getInput('catid'); ?></li>
				<li><?php echo $this->form->getLabel('title'); ?>
				<?php echo $this->form->getInput('title'); ?></li>
				<li><?php echo $this->form->getLabel('url'); ?>
			<?php echo $this->form->getInput('url'); ?><input name="update" type="button" value="update" /></li>
			<li><?php echo $this->form->getLabel('state'); ?>
				<?php echo $this->form->getInput('state'); ?></li>
				<li><label><?php echo JText::_('COM_EASY_YOUTUBE_GALLERY_SELECTED_THUMB'); ?></label>
				<div id="selectedThumb">insert url</div>
			</li>
				
				<li><?php echo $this->form->getLabel('description'); ?>
				<?php echo $this->form->getInput('description'); ?></li>
				


            </ul>
		</fieldset>
		<fieldset class="thumb">
		<legend><?php echo JText::_('COM_EASY_YOUTUBE_GALLERY_THUMB'); ?></legend>
		<ul class="adminformlist">
			<li><?php echo $this->form->getLabel('thumb'); ?>
			<?php echo $this->form->getInput('thumb'); ?></li>
			<li><?php echo $this->form->getLabel('youtubethumb'); ?>
			<?php echo $this->form->getInput('youtubethumb'); ?></li>
			<li>
			<?php 
				//$regex = "#(\.be/|/embed/|/v/|/watch\?v=)([A-Za-z0-9_-]{5,11})#";
				//preg_match($regex,$this->form->getInput('url'),$ytkey);
				//print_r($ytkey);
			?>
			
			<table width="200" border="0" style="text-align:center">
			  <tr>
				<td><div id="thumb0"></div><br />0</td>
				<td><div id="thumb1"></div><br />1</td>
				<td><div id="thumb2"></div><br />2</td>
				<td><div id="thumb3"></div><br />3</td>
			  </tr>
			</table>
			</li>
            

           </ul>	
		</fieldset>
	</div>


	<input type="hidden" name="task" value="" />
	<?php echo JHtml::_('form.token'); ?>
	<div class="clr"></div>

    <style type="text/css">
        /* Temporary fix for drifting editor fields */
        .adminformlist li {
            clear: both;
        }
    </style>
</form>