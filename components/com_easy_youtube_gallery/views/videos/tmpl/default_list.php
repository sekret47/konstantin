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

  <div class="items-list">

                <?php foreach ($this->items as $item) {
              
						$link = JRoute::_( 'index.php?option=com_easy_youtube_gallery&view=video&id='.$item->id );
						$regex = "#(\.be/|/embed/|/v/|/watch\?v=)([A-Za-z0-9_-]{5,11})#";
						preg_match($regex,$item->url,$res);
						if($this->params->get('open')=='onpage')
							{
								$rel=$res[2].'?'.$hd.$rel.$showinfo.$controls;
							}
						elseif($this->params->get('open')=='lightbox')
							{
								$rel = 'lightbox';
								$link = 'http://www.youtube.com/watch?v='.$res[2];
							}
						?><div class="item">
								<div class="itemimg">
									<a href="<?php echo $link; ?>" rel="<?php echo $rel; ?>">
										<img src="http://img.youtube.com/vi/<?php echo $res[2];?>/1.jpg" alt="<?php echo $item->title; ?>" />
									</a>
								</div>
								<?php if($this->params->get('showtitles')){ ?>
									<h<?php echo $this->params->get('titleheading');?> class="itemtitle">
										<a href="<?php echo $link; ?>" rel="<?php echo $rel; ?>"><?php echo $item->title; ?></a>
										<?php if($this->params->get('showdesc')){ ?>
											<div class="desc"><p><?php echo $item->description; ?></p></div>
										<?php } ?>
								<?php echo '</h'.$this->params->get('titleheading').'>';?>
								<?php } ?>
							</div>
						<?php
					}
					?>	

    </div>