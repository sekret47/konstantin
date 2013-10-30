<?php
/**
 * @version     1.0.0
 * @package     com_easy_youtube_gallery
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      moti <joomlacook@gmail.com> - http://www.extensioncook.com/
 */

// No direct access
defined('_JEXEC') or die;

$allowfullscreen = $this->escape($this->params->get('full'))?'allowfullscreen':'';
	$hd=$this->escape($this->params->get('hd'))?'HD=1':'HD=0';
	$rel=$this->escape($this->params->get('info'))?';rel=1':';rel=0';
	$showinfo = $this->escape($this->params->get('info'))?';showinfo=1':';showinfo=0';
	$controls = $this->escape($this->params->get('controls'))?'':';controls=0';
	?>

<div class="items-lightbox">

            <ul class="videoitems_list">
                
    <?php foreach ($this->items as $item) {
			$regex = "#(\.be/|/embed/|/v/|/watch\?v=)([A-Za-z0-9_-]{5,11})#";
			preg_match($regex,$item->url,$res);	
			$rel='';
			$link = JRoute::_( 'index.php?option=com_easy_youtube_gallery&view=video&id='.$item->id );
			if($this->params->get('open')=='onpage')
					{
						$rel=$res[2].'?'.$hd.$rel.$showinfo.$controls;
					}
				elseif($this->params->get('open')=='lightbox')
				{
					$rel = 'lightbox';
					$link = 'http://www.youtube.com/watch?v='.$res[2].'?'.$hd.$rel.$showinfo.$controls;
				}
						
						echo '<li class="item"><a rel="'.$rel.'" href="'.$link.'" title="'.$item->title.'" ><img src="http://img.youtube.com/vi/'.$res[2].'/1.jpg" alt="'.$item->title.'"/><br/>';
						if($this->params->get('showtitles')) 
							echo '<h'.$this->params->get('titleheading').'>'.$item->title.'</h'.$this->params->get('titleheading').'>';
						echo '</a></li>';
						
					} ?>
            
            </ul>

    </div>
