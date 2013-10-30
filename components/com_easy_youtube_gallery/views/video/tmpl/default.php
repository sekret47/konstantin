<?php
/**
 * @version     1.0.0 alpha
 * @package     com_jc_video
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      moti <hagabay@gmail.com> - http://
 */

// no direct access
defined('_JEXEC') or die;
//print_r($this->params);
?>
<div class="jcvideo<?php echo $this->pageclass_sfx;?>">
	<?php if ($this->params->get('show_page_heading', 1)) : ?>
		<h1>
			<?php echo $this->escape($this->params->get('page_heading')); ?>
		</h1>
		<?php endif; ?>
		<?php if ( $this->params->get('menu_text')) : ?>
			<h2>
				<?php echo $this->escape($this->params->get('menu-anchor_title')); ?>
			</h2>
		<?php endif; ?>
		
	<?php if( $this->item ) : 
	$regex = "#(\.be/|/embed/|/v/|/watch\?v=)([A-Za-z0-9_-]{5,11})#";
	preg_match($regex,$this->item->url,$res);
	$width=$this->escape($this->params->get('playerW'))?$this->escape($this->params->get('playerW')):'560';
	$height=$this->escape($this->params->get('playerH'))?$this->escape($this->params->get('playerH')):'315';
	$allowfullscreen = $this->escape($this->params->get('full'))?'allowfullscreen':'';
	$hd=$this->escape($this->params->get('hd'))?'HD=1':'HD=0';
	$rel=$this->escape($this->params->get('info'))?';rel=1':';rel=0';
	$showinfo = $this->escape($this->params->get('info'))?';showinfo=1':';showinfo=0';
	$controls = $this->escape($this->params->get('controls'))?'':';controls=0';
	?>

    <div class="item_fields">
                   <h2> <?php echo $this->item->title; ?></h2>
				   <br/>
        <iframe width="<?php echo $width; ?>" height="<?php echo $height; ?>" src="http://www.youtube.com/embed/<?php echo $res[2]; ?>?<?php echo $hd.$rel.$showinfo.$controls;?>" frameborder="0" <?php echo $allowfullscreen;?>  ></iframe>
   <br />
                    <?php echo $this->item->description; ?>
        
    </div>

<?php endif; ?>
	
</div>
<div style="text-align:center; font-size:10px; opacity:0.6; margin:5px auto; width:100%;" ><a href="http://extensioncook.com">extensioncook</a></div>

