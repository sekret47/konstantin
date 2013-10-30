<?php
/**
* @Copyright Copyright (C) 2010 VTEM . All rights reserved.
* @license GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @link     	http://www.vtem.net
**/
// no direct access
defined('_JEXEC') or die('Restricted access');
if(!defined('DS')){define('DS',DIRECTORY_SEPARATOR);}
// Include the syndicate functions only once
require_once (dirname(__FILE__).DS.'helper.php');
$imagePath 	= modVtemimageshowHelper::cleanDir($params->get( 'imagePath', 'images/stories/fruit' ));
$sortCriteria = $params->get( 'sortCriteria', 0);
$sortOrder = $params->get( 'sortOrder', 'asc');
$sortOrderManual = $params->get( 'sortOrderManual', '');
$width = $params->get( 'width', 650 );
$height = $params->get( 'height', 250 );
$slideID = 'imageshowid'.$module->id;
$autostart = $params->get('autostart', 0);
$pauseonhover = $params->get('pauseonhover', 1);
$navigationalign = $params->get('navigationalign', 'left');
$keyboard_move = $params->get('keyboard_move', 1);
$progressbar = $params->get('progressbar', 1);
$navigation = $params->get('navigation', 1);
$prev_next = $params->get( 'prev_next' );
$fx = $params->get( 'fx', 'fade' );
$slideSpeed = $params->get( 'slideSpeed', 3000 );
$target = $params->get( 'target', 0 ) ? "_blank" : "_self";
$css = $params->get('css');
$link_images = $params->get('link_images', 0);
$showcaption = $params->get('showcaption', 0);
$doc = JFactory::getDocument();
$customstyle = '#'.$slideID.' .container_skitter img,#'.$slideID.' .container_skitter .image,#'.$slideID.' .container_skitter .image a{width:100%;height:100%;display: block;}'.$css; 
$doc->addStyleDeclaration( $customstyle );
if($params->get('jquery', 1) == 1) $doc->addScript(JURI::root().'modules/mod_vtem_imageshow/js/jquery-1.7.2.min.js');
$doc->addStyleSheet(JURI::root().'modules/mod_vtem_imageshow/css/styles.css');
if (trim($sortOrderManual) != "")
	$images = explode(",", $sortOrderManual);
else
	$images = modVtemimageshowHelper::imageList($imagePath, $sortCriteria, $sortOrder);
require(JModuleHelper::getLayoutPath('mod_vtem_imageshow'));