<?php
/**
 * @version     1.0.0
 * @package     com_yt_video
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      moti <hagabay@gmail.com> - http://
 */


// no direct access
defined('_JEXEC') or die;
JHtml::_('behavior.framework', true);
$document =& JFactory::getDocument();
$document->addStyleSheet(JURI::base() . 'components/com_easy_youtube_gallery/assest/css/style.css');

$allowfullscreen = $this->escape($this->params->get('full'))?'allowfullscreen':'';
	$hd=$this->escape($this->params->get('hd'))?'HD=1':'HD=0';
	$rel=$this->escape($this->params->get('info'))?';rel=1':';rel=0';
	$showinfo = $this->escape($this->params->get('info'))?';showinfo=1':';showinfo=0';
	$controls = $this->escape($this->params->get('controls'))?'':';controls=0';
	
if($this->params->get('open')=='onpage')
	{
		$document->addScript(JURI::base() . 'components/com_easy_youtube_gallery/assest/js/jcTv.js');
		$rel = '';
	}
elseif($this->params->get('open')=='lightbox')
	{
		$document->addStyleSheet(JURI::base() . 'components/com_easy_youtube_gallery/assest/css/mediaboxAdv-Minimal.css');
		//print_r($_SERVER['HTTP_USER_AGENT']);
		if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 8.0') )
			$document->addScript(JURI::base() . 'components/com_easy_youtube_gallery/assest/js/mediaboxAdvIE8.js');
		else
			$document->addScript(JURI::base() . 'components/com_easy_youtube_gallery/assest/js/mediaboxAdv.js');
	}

?>
<div class="jcvideo<?php echo $this->pageclass_sfx;?>">
	<?php if ($this->params->get('show_page_heading')) : ?>
		<h1>
			<?php echo $this->params->get('page_heading'); ?>
		</h1>
		<?php endif; ?>
	
		<?php if ($this->params->get('show_category_title', 1) or $this->params->get('page_subheading')) : ?>
		<h2>
			<?php echo $this->params->get('page_subheading'); ?>
			<?php if ($this->params->get('show_category_title')) { 
		
			?>
				<span class="subheading-category"><?php echo $this->category->title;?></span>
			<?php } ?>
		</h2>
	<?php endif; ?>
	
	

<?php 

 	if(JRequest::getVar('defaultvideo')) {
		?><div id="videoOnPage" style="display:block;"><?php echo $this->loadTemplate('item'); ?></div><?php
	}
	else 
	{
		?><div id="videoOnPage" style="display:none;"><?php echo $this->loadTemplate('item'); ?></div><?php
	}
	if($this->items) {
		echo $this->loadTemplate($this->params->get('mylayout'));
	}
	?>
 

     <div class="pagination">
        <?php if ($this->params->def('show_pagination_results', 1)) : ?>
            <p class="counter">
                <?php echo $this->pagination->getPagesCounter(); ?>
            </p>
        <?php endif; ?>
        <?php echo $this->pagination->getPagesLinks(); ?>
    </div>

<div style="text-align:center; font-size:10px; float:right; opacity:0.6; margin:5px auto; width:100%; " ><a href="http://extensioncook.com">extensioncook</a></div>

</div>
