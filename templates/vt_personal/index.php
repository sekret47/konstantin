<?php
/* Design by VTEM http://www.vtem.net  All Rights Reserved */
defined( '_JEXEC' ) or die( 'Restricted access' );
JHtml::_('behavior.framework', true);
include_once(JPATH_ROOT . "/templates/" . $this->template . '/vtemtools/default.php');
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>">
<?php 
include_once(JPATH_ROOT."/templates/".$this->template.'/vtemtools/css_var.php');
?>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<body id="vtem" class="<?php echo css_browser_selector().' '.$pageoption.' '.$pageview.' template-'.$TemplateStyle.' logo-'.$logo;?>">
	<div id="vt_body_wrapper">
      <div id="vt_main_wrapper">
		<div id="vt_wrapper" class="clearfix">
			<!-- /////////////////// HEADER LAYOUT ///////////////////////////////-->
			<div id="vt_header_section" class="vt_header_section clearfix">	
                  <div id="vt_drawer_head_top" class="vt_drawer_head_top clearfix">	
            		 <?php if ($this->countModules('drawer1 + drawer2 + drawer3 + drawer4 + drawer5 + drawer6 ')) : ?>
                      <div class="vt_wrapper_drawer clearfix">
                      <div class="vt_section clearfix">
                         <div id="vt_drawer" class="vt_drawer clearfix">
                              <?php echo VTEMShowModule('drawer', 'vt_xhtml', 6);?>
                         </div>
                      </div>   
                      </div>
                   <?php endif;?> 
                    <div class="vt_wrapper_header clearfix">
                    <div class="vt_section clearfix">			
                         <div id="vt_header" class="vt_header clearfix">
                             <?php echo VTEMShowModule('header', 'vt_xhtml', 6, 'header1');?>
                             <a class="button_top" href="#vtem"> back top </a>
                         </div>
                     </div>    
                     </div>   
                    <div class="vt_wrapper_top clearfix">
                    <div class="vt_section clearfix">
                     <div id="vt_top" class="vt_top clearfix">
                         <?php echo VTEMShowModule('top', 'vt_xhtml', 6, '', 'top1');?>
                     </div>
                     </div> 
                     </div>
                  </div>                                  
			</div> 
		   <!-- /////////////////// MAIN LAYOUT ///////////////////////////////-->
		   <div id="vt_main_section" class="vt_main_section clearfix">
           			
				   <?php if ($this->countModules('showcase1 + showcase2 + showcase3 + showcase4 + showcase5 + showcase6 ')) : ?>
                   	  <div class="vt_wrapper_showcase clearfix">	
						 <div id="vt_showcase" class="vt_showcase clearfix">
							  <?php echo VTEMShowModule('showcase', 'vt_xhtml', 6);?>     
						 </div>
                       </div>   
				   <?php endif;?>
                   
				   <?php if ($this->countModules('feature1 + feature2 + feature3 + feature4 + feature5 + feature6 ')) : ?>
				   
                      <div id="about" class="vt_wrapper_feature clearfix">
                      	<div class="vt_section clearfix">
						 <div id="vt_feature" class="vt_feature clearfix">

							  
						 </div> 
                         </div>
                      <div class="clr"></div>  			  
                      </div>   
				   <?php endif;?>
						<div id="vt_main_inside" class="clearfix">
                        <div class="vt_section clearfix">
                          <div id="vt_main_contaner" class="clearfix"> 

                              <?php if(($pageview == "wrapper") || ($Layout == "wf")) :
                                  echo '<div id="vt_full">';
                                  if($SystemMessages == 1) :
                                      echo '<jdoc:include type="message" />';
                                  endif;
                                  echo $component.'</div>';
                              else : // LEFT-BODY_RIGHT ////////////////
                                  if($this->countModules('left')) :
                                      echo '<div id="vt_nav_left" class="vt_auto_cols '.$navleft.' '.$leftfloat.'">'.$modleft.'</div>';
                                  endif;
                                  echo '<div id="vt_main_com" class="vt_auto_cols '.$contentwidth.' '.$bodyfloat.'">
													 <div class="vt_component_inside">';
                                  if($SystemMessages == 1) :
                                      echo '<jdoc:include type="message" />';
                                  endif;
                                  echo $component;
                                  if ($this->countModules('inset1 + inset2')) :
                                      echo '<div id="vt_inset" class="vt_inset clearfix">'.VTEMShowModule('inset', 'vt_xhtml', 2).'</div>';
                                  endif;
                                  echo ' </div>
												</div>';
                                  if($this->countModules('right')) :
                                      echo '<div id="vt_nav_right" class="vt_auto_cols '.$navright .' '. $rightfloat.'">'.$modright.'</div>';
                                  endif;
                                  // END LEFT-BODY_RIGHT ///////////////////////////
                              endif; ?>

                          </div>
                     </div>
					 <?php if ($this->countModules('utility1 + utility2 + utility3 + utility4 + utility5 + utility6 ')) : ?>
                       <div id="whatk2" class="vt_wrapper_utility clearfix">

                       <div class="bgfix_utility clearfix">
                       <div class="vt_section clearfix"> 
						 <div id="vt_utility" class="vt_utility clearfix">
               <div id="fre"><h3>Наши партнеры</h3></div>
								<?php echo VTEMShowModule('utility', 'vt_xhtml', 6);?>
                        </div> 
                       </div>
                       </div> 
                       </div>  
					<?php endif; ?> 
					<?php if ($this->countModules('bottom1 + bottom2 + bottom3 + bottom4 + bottom5 + bottom6 ')) : ?>
                       <div id="documents" class="vt_wrapper_bottom clearfix"> 
                       <div class="bgfix_bottom clearfix">
                       <div class="vt_section clearfix"> 
						 <div id="vt_bottom" class="vt_bottom clearfix">
								  <?php echo VTEMShowModule('bottom', 'vt_xhtml', 6);?>
						 </div>
                       </div>
                       </div> 
                       </div>  
					<?php endif; ?>  
                  </div>           
                </div>            
			<!-- /////////////////// FOOTER LAYOUT ///////////////////////////-->  
           
	<div id="vt_footer_section" class="vt_footer_section clearfix"> 
    <div class="vt_section clearfix">
        <div id="vt_wapper_footer"> 
           <?php if ($this->countModules('footer1 + footer2 + footer3 + footer4 + footer5 + footer6 ')) : ?>
                 <div id="vt_footer" class="vt_footer clearfix">
                        <?php echo VTEMShowModule('footer', 'vt_xhtml', 6);?>
                </div> 
           <?php endif; ?>
           
           <div class="wapper_copyright_gotop clearfix">
           <?php if ($this->countModules('copyright1 + copyright2 + copyright3 + copyright4 + copyright5 + copyright6 ')) : ?>
                 <div id="vt_copyright" class="vt_copyright clearfix">
                        <?php echo VTEMShowModule('copyright', 'vt_xhtml', 6);?>
                        <?php if($totop) echo '<div id="gotop"><p><a href="#vtem" title="Back to Top"><span>Go Top</span></a></p></div>';?>
                 </div>
           <?php endif; ?>
           <div class="clr"></div>
            <?php echo $vtcopyright;?> 
           </div>
       </div>  
     </div>     
	</div>
   </div>     
  </div>	   
</div>  
<?php include_once(JPATH_ROOT . "/templates/" . $this->template . '/vtemtools/debug.php');?>


</body>
</html>