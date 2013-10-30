<?php
defined( '_JEXEC' ) or die( 'Restricted index access' );
$TemplateStyle = $Default_TemplateStyle;
$Layout = $Default_Layout;
$mainurl = $_SERVER['PHP_SELF'] . rebuildQueryString($vtem_temp);
foreach ($vtem_temp as $tprop) {
    $vtem_session = JFactory::getSession();
    if ($vtem_session->get($cookie_prefix.$tprop)) {
        $$tprop = $vtem_session->get($cookie_prefix.$tprop);
    } elseif (isset($_COOKIE[$cookie_prefix. $tprop])) {
    	$$tprop = JRequest::getVar($cookie_prefix. $tprop, '', 'COOKIE', 'STRING');
    }    
}
function rebuildQueryString($vtem_temp) {
  if (!empty($_SERVER['QUERY_STRING'])) {
      $parts = explode("&", $_SERVER['QUERY_STRING']);
      $newParts = array();
      foreach ($parts as $val) {
          $val_parts = explode("=", $val);
          if (!in_array($val_parts[0], $vtem_temp)) {
            array_push($newParts, $val);
          }
      }
      if (count($newParts) != 0) {
          $qs = implode("&amp;", $newParts);
      } else {
          return "?";
      }
      return "?" . $qs . "&amp;";
  } else {
      return "?";
  } 
}
////////////////////////////////// Select Layouts /////////////////////////////////////////////////////
if(($this->countModules('right and left') && ($Layout == "lbr")) || ($this->countModules('right and left') && ($Layout == "brl")) || ($this->countModules('right and left') && ($Layout == "lrb"))) :
$modleft = '<div class="vt_module_inside"><jdoc:include type="modules" name="left" style="vt_xhtml" /></div>';
$modright = '<div class="vt_module_inside"><jdoc:include type="modules" name="right" style="vt_xhtml" /></div>';
$component = '<jdoc:include type="component" />';
$navleft = "navleft";
$navright = "navright";
$contentwidth = "contentwidth";
else :
if(($this->countModules('right') && ($Layout == "br")) || ($this->countModules('right') && ($Layout == "lbr")) || ($this->countModules('right') && ($Layout == "brl")) || ($this->countModules('right') && ($Layout == "lrb"))) :
$modleft = '&nbsp;';
$modright = '<div class="vt_module_inside"><jdoc:include type="modules" name="right" style="vt_xhtml" /></div>';
$component = '<jdoc:include type="component" />';
$navright = "navright1";
$contentwidth = "contentwidthr";
$navleft = "none";
else :
if(($this->countModules('left') && ($Layout == "lb")) || ($this->countModules('left') && ($Layout == "lbr")) || ($this->countModules('left') && ($Layout == "brl")) || ($this->countModules('left') && ($Layout == "lrb"))) :
$modleft = '<div class="vt_module_inside"><jdoc:include type="modules" name="left" style="vt_xhtml" /></div>';
$modright = '&nbsp;';
$component = '<jdoc:include type="component" />';
$navleft = "navleft1";
$contentwidth = "contentwidthl";
$navright = "none";
else :
if(($Layout == "wf") || (!$this->countModules('right and left') && ($Layout == "lbr")) || (!$this->countModules('right and left') && ($Layout == "brl")) || (!$this->countModules('right and left') && ($Layout == "lrb")) || (!$this->countModules('right') && ($Layout == "br")) || (!$this->countModules('left') && ($Layout == "lb"))) :
$modleft = '&nbsp;';
$modright = '&nbsp;';
$component = '<jdoc:include type="component" />';
$navright = "none";
$navleft = "none";
$contentwidth = "widthmain100";
endif;
endif;
endif;
endif;
if($Layout == "lbr" || $Layout == "lb") :
$leftfloat = "floatleft";
$rightfloat = "floatright";
$bodyfloat = "floatleft";
endif;
if($Layout == "brl" || $Layout == "br") :
$leftfloat = "floatright";
$rightfloat = "floatright";
$bodyfloat = "floatleft";
endif;
if($Layout == "lrb") :
$leftfloat = "floatleft";
$rightfloat = "floatleft";
$bodyfloat = "floatright";
endif;
?>