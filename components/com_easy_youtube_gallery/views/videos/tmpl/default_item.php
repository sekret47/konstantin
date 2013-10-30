<?php
/**
 * @version     1.0.0 alpha
 * @package     com_easy_youtube_gallery
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      moti <hagabay@gmail.com> - http://
 */

// no direct access
defined('_JEXEC') or die;
//print_r($this->params);
?>
<div class="jcvideo-item">
	<?php if( $this->item ) {
			$regex = "#(\.be/|/embed/|/v/|/watch\?v=)([A-Za-z0-9_-]{5,11})#";
			preg_match($regex,$this->item->url,$res);
			$key = $res[2];
		}
		else 
			$key='';
	$width=$this->escape($this->params->get('playerW'))?$this->escape($this->params->get('playerW')):'560';
	$height=$this->escape($this->params->get('playerH'))?$this->escape($this->params->get('playerH')):'315';
	$allowfullscreen = $this->escape($this->params->get('full'))?'allowfullscreen':'';
	$hd=$this->escape($this->params->get('hd'))?'HD=1':'HD=0';
	$rel=$this->escape($this->params->get('info'))?';rel=1':';rel=0';
	$showinfo = $this->escape($this->params->get('info'))?';showinfo=1':';showinfo=0';
	$controls = $this->escape($this->params->get('controls'))?'':';controls=0';
	?>

    <div class="item_fields" id="item_fields">
       <iframe width="<?php echo $width; ?>" height="<?php echo $height; ?>" src="http://www.youtube.com/embed/<?php echo $key; ?>?<?php echo $hd.$rel.$showinfo.$controls;?>" frameborder="0"   ></iframe>
  		 <br />  
		
    </div>

</div>
