<?php 

/**
 * @package     Sven.Bluege
 * @subpackage  com_eventgallery
 *
 * @copyright   Copyright (C) 2005 - 2013 Sven Bluege All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die('Restricted access'); 

?>

<form method="POST" name="adminForm" id="adminForm">
	<input type="hidden" name="task" value="" />
</form>

<style>
 div#documentation {
	color:#444;
	font-family:Georgia, Palatino, 'Palatino Linotype', Times, 'Times New Roman',
	          "Hiragino Sans GB", "STXihei", "微软雅黑", serif;
	font-size:12px;
	line-height:1.5em;
	background:#fefefe;
	max-width: 45em;
	margin: 10px auto;
	padding: 1em;
}

#documentation a{ color: #0645ad; text-decoration:none;}
#documentation a:visited{ color: #0b0080; }
#documentation a:hover{ color: #06e; }
#documentation a:active{ color:#faa700; }
#documentation a:focus{ outline: thin dotted; }
#documentation a:hover, #documentation a:active{ outline: 0; }

#documentation span.backtick {
  border:1px solid #EAEAEA;
  border-radius:3px;
  background:#F8F8F8;
  padding:0 3px 0 3px;
}

::-moz-selection{background:rgba(255,255,0,0.3);color:#000}
::selection{background:rgba(255,255,0,0.3);color:#000}

#documentation a::-moz-selection{background:rgba(255,255,0,0.3);color:#0645ad}
#documentation a::selection{background:rgba(255,255,0,0.3);color:#0645ad}

#documentation p{
margin:1em 0;
}

#documentation img{
max-width:100%;
}

#documentation h1,#documentation h2,#documentation h3,#documentation h4,#documentation h5,#documentation h6{
font-weight:normal;
color:#111;
line-height:1em;
}
#documentation h4,#documentation h5,#documentation h6{ font-weight: bold; }
#documentation h1{ font-size:2.5em; }
#documentation h2{ font-size:2em; border-bottom:1px solid silver; padding-bottom: 5px; }
#documentation h3{ font-size:1.5em; }
#documentation h4{ font-size:1.2em; }
#documentation h5{ font-size:1em; }
#documentation h6{ font-size:0.9em; }

#documentation blockquote{
color:#666666;
margin:0;
padding-left: 3em;
border-left: 0.5em #EEE solid;
}
#documentation hr { display: block; height: 2px; border: 0; border-top: 1px solid #aaa;border-bottom: 1px solid #eee; margin: 1em 0; padding: 0; }


#documentation pre , #documentation code, #documentation kbd, #documentation samp { 
  color: #000; 
  font-family: monospace; 
  font-size: 0.88em; 
  border-radius:3px;
  background-color: #F8F8F8;
  border: 1px solid #CCC; 
}
#documentation pre { white-space: pre; white-space: pre-wrap; word-wrap: break-word; padding: 5px 12px;}
#documentation pre code { border: 0px !important; padding: 0;}
#documentation code { padding: 0 3px 0 3px; }

#documentation b, #documentation strong { font-weight: bold; }

#documentation dfn { font-style: italic; }

#documentation ins { background: #ff9; color: #000; text-decoration: none; }

#documentation mark { background: #ff0; color: #000; font-style: italic; font-weight: bold; }

#documentation sub, #documentation sup { font-size: 75%; line-height: 0; position: relative; vertical-align: baseline; }
#documentation sup { top: -0.5em; }
#documentation sub { bottom: -0.25em; }

#documentation ul, #documentation ol { margin: 1em 0; padding: 0 0 0 2em; }
#documentation li p:last-child { margin:0 }
#documentation dd { margin: 0 0 0 2em; }

#documentation img { border: 0; -ms-interpolation-mode: bicubic; vertical-align: middle; }

#documentation table { border-collapse: collapse; border-spacing: 0; }
#documentation td { vertical-align: top; }

@media only screen and (min-width: 480px) {
div#documentation {font-size:14px;}
}

@media only screen and (min-width: 768px) {
div#documentation {font-size:16px;}
}

@media print {
  * { background: transparent !important; color: black !important; filter:none !important; -ms-filter: none !important; }
  #documentation {font-size:12pt; max-width:100%; outline:none;}
  #documentation a, #documentation a:visited { text-decoration: underline; }
  #documentation hr { height: 1px; border:0; border-bottom:1px solid black; }
  #documentation a[href]:after { content: " (" attr(href) ")"; }
  #documentation abbr[title]:after { content: " (" attr(title) ")"; }
  #documentation .ir a:after, #documentation a[href^="javascript:"]:after, a[href^="#"]:after { content: ""; }
  #documentation pre, #documentation blockquote { border: 1px solid #999; padding-right: 1em; page-break-inside: avoid; }
  #documentation tr, #documentation img { page-break-inside: avoid; }
  #documentation img { max-width: 100% !important; }
  @page :left { margin: 15mm 20mm 15mm 10mm; }
  @page :right { margin: 15mm 10mm 15mm 20mm; }
  #documentation p, #documentation h2, #documentation h3 { orphans: 3; widows: 3; }
  #documentation h2, #documentation h3 { page-break-after: avoid; }
}

</style>

<div id="documentation">
<?php
	 require_once JPATH_COMPONENT.'/helpers/php_markdown_extra/markdown.php';
   require_once JPATH_COMPONENT.'/helpers/php_markdown_extra/MarkdownExtra.php';


   use \Michelf\MarkdownExtra;
	 $my_html = MarkdownExtra::defaultTransform(file_get_contents(JPATH_COMPONENT."/doc/readme.md"));;

	 //fix links
	 $search  = '<img src="img/';
	 $replace = '<img src="'.JURI::base().'components/com_eventgallery/doc/img/';
	 $my_html = str_replace($search, $replace, $my_html);
	


	 echo $my_html;
?>
</div>

