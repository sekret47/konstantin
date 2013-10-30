<?php
defined('_JEXEC') or die('Restricted access');
///  Renderer modules  //////////////////////////////////////////////////////////////////////////////////////////
function VTEMShowModule($name, $style, $modnumber, $logopos = '', $menupos = ''){
	$modmodule = $modstep = $modwidthmanual = $showlogo = '';
	$countmodule = 0;
	jimport( 'joomla.application.module.helper' );
	$customParams = JFactory::getApplication()->getTemplate(true)->params;
	$doc = JFactory::getDocument();
	$app = JFactory::getApplication();
	
	//// MENU /////////////////////////////////////////////////
	$custommenu = $customParams->get("custommenu", 0);
	$menu_name = $customParams->get("menutype", "mainmenu");
	$menustyle = $customParams->get("menustyle", 1);
	$startLevel = $customParams->get("startLevel", 0);
	$endLevel = $customParams->get("endLevel", 10);
	$mootransition = $customParams->get("mootransition", 'Quad');
	$renderer	= $doc->loadRenderer( 'module' );
	$options	 = array( 'style' => "raw" );
	$module = JModuleHelper::getModule( 'mod_menu', '$menu_name' );
	$modulem = JModuleHelper::getModule( 'mod_menu', '$menu_name' );
	$vtemmainmenu = false; $subnav = false; $sidenav = false;
	if($menustyle == 1){$menustyle1 = "_vtem_nav";}else{$menustyle1 = "_vtem_dropline";}
	$module->params	= "menutype=$menu_name\nshowAllChildren=1\nstartLevel=$startLevel\nendLevel=$endLevel\nclass_sfx=$menustyle1";
	$modulem->params	= "menutype=$menu_name\nshowAllChildren=1\nstartLevel=$startLevel\nendLevel=$endLevel\nclass_sfx=-mobi";
	if($custommenu == 0){
	$vtemmainmenu = '<div id="vt_main_menu" class="vt_menufix clearfix"><div id="vtem_menu" class="mlmenu plus '.$mootransition.'">' .$renderer->render( $module, $options ).'</div>';
	$vtemmainmenu .= '<a href="#vtem_menu_mobile" class="vtemdrildown vtemdrillround" id="vtflatmenu">Mobile menu</a><div id="vtem_menu_mobile" class="hidden vt_drilldown_menu" style="display:none;">' .$renderer->render( $modulem, $options ).'</div></div>';
	}else{
	$vtemmainmenu = '';
	}
	
	//// LOGO /////////////////////////////////////////////////
	if($customParams->get('logo') == 1){
			$showlogo .= '<a id="vt_logo" href="'.JURI::root().'"><h1>'.$customParams->get('logotext').'</h1><span>'.$customParams->get('slogan').'</span></a>';
	}else{
			$showlogo .= '<a id="vt_logo" href="'.JURI::root().'"><img src="templates/'.$app->getTemplate().'/css/styles/vt_logo_'.$customParams->get('TemplateStyle').'.png" alt="VTEM Logo" /></a>';
	}
	
	//// MODULES /////////////////////////////////////////////////
	for ($i = 1; $i <= $modnumber; $i++) {
	   if (count(JModuleHelper::getModules($name.$i)) || $logopos == ($name.$i) || $menupos == ($name.$i)) $countmodule += 1;
	   if ($customParams->get($name.'type') == 0){
		   $modwidthmanual .= '.'.$name.'manual'.$i.'{width:'.$customParams->get($name.'manual'.$i).'% !important;}';
	   }
	}
	switch ($countmodule) {
		case 1: $modulewidth = "vt_width100"; $modwidthmanual .= ".vt_width100{width:100% !important;}"; break;
		case 2: $modulewidth = "vt_width50"; $modwidthmanual .= ".vt_width50{width:50% !important;}"; break;
		case 3: $modulewidth = "vt_width33"; $modwidthmanual .= ".vt_width33{width:33.33% !important;}"; break;	
		case 4: $modulewidth = "vt_width25"; $modwidthmanual .= ".vt_width25{width:25% !important;}"; break;
		case 5: $modulewidth = "vt_width20"; $modwidthmanual .= ".vt_width20{width:20% !important;}"; break;	
		case 6: $modulewidth = "vt_width16"; $modwidthmanual .= ".vt_width16{width:16.66% !important;}";break;		
		default: $modulewidth = "";
	}
	$doc->addStyleDeclaration($modwidthmanual);
	for ($i = 1; $i <= $modnumber; $i++) {
	    if($i > 1) $modstep ='separator_'.$name;
		if ($customParams->get($name.'type') == 1) $modulewidth = $modulewidth; else $modulewidth = $name.'manual'.$i;
		if (count(JModuleHelper::getModules($name.$i)) || $logopos == ($name.$i) || $menupos == ($name.$i)) :
            $modmodule .='<div class="'.$modulewidth.' '.$modstep.' floatleft">';
				if($logopos == ($name.$i)){
					$modmodule .='<div class="vt_module_inside">'.$showlogo.'<jdoc:include type="modules" name="'.$name.$i.'" style="'.$style.'" /></div>';
				}
				if($menupos == ($name.$i)){
					$modmodule .='<div class="vt_module_inside defaultmenu">'.$vtemmainmenu.'<jdoc:include type="modules" name="'.$name.$i.'" style="'.$style.'" /></div>';
				}
				if (count(JModuleHelper::getModules($name.$i)) && $logopos != ($name.$i) && $menupos != ($name.$i)){
					$modmodule .='<div class="vt_module_inside"><jdoc:include type="modules" name="'.$name.$i.'" style="'.$style.'" /></div>';
				}
			$modmodule .='</div>';
		endif;
	}
return $modmodule;
}

///  Cookies  //////////////////////////////////////////////////////////////////////////////////////////
$cookie_prefix = "vt_personal";
$cookie_time = time()+30000000;
$vtem_temp = array('TemplateStyle','Layout');
foreach ($vtem_temp as $tprop) {
    $vtem_session = JFactory::getSession();
	
	if (isset($_REQUEST[$tprop])) {
	    $$tprop = JRequest::getString($tprop, null, 'get');
    	$vtem_session->set($cookie_prefix.$tprop, $$tprop);
    	setcookie ($cookie_prefix. $tprop, $$tprop, $cookie_time, '/', false);   
    	global $$tprop; 
    }
}
$pageview = JRequest::getVar('view', '');
$pageoption = JRequest::getVar('option', '');
$template_baseurl				= $this->baseurl . '/templates/' . $this->template;
$Default_TemplateStyle 			= $this->params->get("TemplateStyle", "style1");
$Default_Layout			= $this->params->get("layout", "lbr");
$copyright = $this->params->get("copyright", 1);
$SystemMessages = $this->params->get("SystemMessages", 1);
$IE6Warning = $this->params->get("IE6Warning", 1);
$GoogleAnalytics = $this->params->get("GoogleAnalytics", 0);
$gacode = $this->params->get("gacode", 'UA-17014902-1');
$logo = $this->params->get("logo", 0);

//LAYOUT
$templatewidth = $this->params->get("templatewidth", 980);
$leftwidth = $this->params->get("leftwidth", 25);
$rightwidth = $this->params->get("rightwidth", 24);
//FEATURES
$fontfamily = $this->params->get("fontfamily", 'Arial, Helvetica, sans-serif');
$fontsize = $this->params->get("fontsize", '12px');
$totop = $this->params->get("totop", 1);
$responsive = $this->params->get("responsive", 1);
$PageSuffix = $this->params->get("PageSuffix", 1);
$jquery = $this->params->get("jquery", 0);
$webfont = $this->params->get("webfont", 0);
$googlefont = $this->params->get("googlefont", 'no');
$googlefontelements = $this->params->get("googlefontelements", 'h3');

$googlefont1 = '';
if($googlefont != "no" && $webfont == 1) $googlefont1 .= $googlefontelements."{font-family:'".$googlefont."', sans-serif;}";

$document	= JFactory::getDocument();
$document->addStyleSheet($template_baseurl.'/vtemtools/menus/css/style.css');
$document->addStyleDeclaration('.floatleft{float:left;}.floatright{float:right;}.none{display:none !important; visibility:hidden !important;}.navleft,.navleft1{width:'.$leftwidth.'% !important;}.navright,.navright1{width:'.$rightwidth.'% !important;}.contentwidthr{width:'.(100 - $rightwidth).'% !important;}.contentwidthl{width:'.(100 - $leftwidth).'% !important;}.contentwidth{width:'.(100 - ($leftwidth+$rightwidth)).'% !important;}.vt_section{width:'.$templatewidth.'px !important}body#vtem{font-family:'.$fontfamily.' !important; font-size:'.$fontsize.' !important;}'.$googlefont1);
if ($this->params->get("menustyle") == 1) $document->addScript($template_baseurl.'/vtemtools/menus/vtem_menu.js');
if ($jquery == 1) $document->addScript($template_baseurl.'/vtemtools/widgets/jquery-1.7.2.min.js');
if(!defined('DS')){define('DS',DIRECTORY_SEPARATOR);}
require_once (dirname(__FILE__).DS.'switcher.php');
require_once (dirname(__FILE__).DS.'css_browser_selector.php');
?>