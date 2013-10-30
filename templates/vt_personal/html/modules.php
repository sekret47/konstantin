<?php
/**
 * @copyright	Copyright (C) 2008 - 2009  All rights reserved.
 * @license		
 */
// no direct access
defined('_JEXEC') or die('Restricted access');
/*
 * Module chrome for rendering the module in a slider
 */
function modChrome_vt_xhtml($module, &$params, &$attribs)
{
	if (!empty ($module->content)) : ?>
		<div class="vt_moduletable clearfix moduletable<?php echo $params->get('moduleclass_sfx'); ?>">
        <div class="vt_box clearfix">
		<?php if ($module->showtitle != 0) : ?>
			<h3><span class="vt_heading1"><span class="vt_heading2"><?php echo $module->title; ?></span></span></h3>
		<?php endif; ?>
			<?php echo $module->content; ?>
         </div>   
		</div>
	<?php endif;
}
function modChrome_vt_rounded($module, &$params, &$attribs)
{
	if (!empty ($module->content)) : ?>
		<div class="vt_module clearfix module<?php echo $params->get('moduleclass_sfx'); ?>">
		<?php if ($module->showtitle != 0) : ?>
			<h3><span class="vt_heading1"><span class="vt_heading2"><?php echo $module->title; ?></span></span></h3>
		<?php endif; ?>
			<div class="vt_module_content"><?php echo $module->content; ?></div>
        </div>
	<?php endif;
}
?>