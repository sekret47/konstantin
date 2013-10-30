<?php
/**
* @Copyright Copyright (C) 2010 VTEM . All rights reserved.
* @license GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @link     	http://www.vtem.net
**/
// no direct access
defined('_JEXEC') or die('Restricted access');
$navoption = '';
switch ($navigation) {
    case "dots":
        $navoption = 'dots: true, numbers: false, preview: false, thumbs: false';
        break;
    case "dotspreview":
        $navoption = 'dots: true, numbers: false, preview: true, thumbs: false';
        break;
    case "numbers":
        $navoption = 'dots: false, numbers: true, preview: false, thumbs: false';
        break;
	case "thumbs":
        $navoption = 'dots: false, numbers: false, preview: false, thumbs: true';
        break;
	case "none":
        $navoption = 'dots: false, numbers: false, preview: false, thumbs: false';
        break;
}
?>
<div class="vtem-skitter-module<?php echo $params->get('moduleclass_sfx'); ?>">
	<script type="text/javascript" src="<?php echo JURI::root();?>modules/mod_vtem_imageshow/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="<?php echo JURI::root();?>modules/mod_vtem_imageshow/js/jquery.skitter.js"></script>
    <script type="text/javascript">
    var vtemimageshow = jQuery.noConflict();
    jQuery(document).ready(function(){
    jQuery('#<?php echo $slideID;?>').skitter({
              auto_play: <?php echo $autostart;?>,
              interval: <?php echo $slideSpeed;?>,
              animation: '<?php echo $fx;?>',
              navigation: <?php echo $prev_next;?>,
              stop_over: <?php echo $pauseonhover;?>,
              numbers_align: '<?php echo $navigationalign;?>',
              enable_navigation_keys: <?php echo $keyboard_move;?>,
              progressbar: <?php echo $progressbar;?>,
              label: <?php echo $showcaption;?>,
              width: '<?php echo $width;?>',
              height: '<?php echo $height;?>',
              minHeight: '',
              <?php echo $navoption;?>
    });
    });
    </script>
    <div id="<?php echo $slideID;?>" class="vtem_image_show box_skitter box_skitter_large vtemskiter<?php echo $navigation;?>">
        <ul class="skitter-data">
			<?php
            foreach($images as $key => $img):
              $vttitles = explode(";",$params->get('imagetitle'));
              $vttitle = (isset($vttitles[$key])) ? $vttitles[$key] : '';
              $vtcontents = explode(";",$params->get('imagecontent'));
              $vtcontent = (isset($vtcontents[$key])) ? $vtcontents[$key] : '';
              $vtlinks = explode(";",$params->get('urls'));
              $vtlink = (isset($vtlinks[$key])) ? $vtlinks[$key] : '';
            ?>
              <li class="vtem-image-feature">
                <?php if($link_images == 1) {echo "<a href='".$vtlink."' target='".$target."'>";}
                echo '<img class="vtem-carousel-image" src="'.JURI::root().$imagePath.$img.'" alt="VTEM Image Show" />';
                if($link_images == 1) echo "</a>";
                if($showcaption == 1){
                   echo '<div class="label_text">
					 <div class="vtem_imagesshow_intro">
						<h4 class="vtemimageshow_title">'.trim($vttitle).'</h4>
						<div class="vtemimageshow_content">'.trim($vtcontent).'</div>	 
					 </div></div>';
                }
                ?>
              </li>
            <?php endforeach;?>
        </ul>
    </div>
    <div class="line_shadow"></div>
</div>