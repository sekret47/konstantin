<!DOCTYPE html>
<?php 

/**
 * @package     Sven.Bluege
 * @subpackage  com_eventgallery
 *
 * @copyright   Copyright (C) 2005 - 2013 Sven Bluege All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

// no direct access
defined('_JEXEC') or die('Restricted access'); 

$title = "";
if (strlen($this->model->folder->description)>0) {
	$title .= $this->model->folder->description;
} else {
	$title .= $this->model->file->folder;
}

$title .= ' - ';

if (strlen($this->model->file->title)>0) {
	$title .= $this->model->file->title;
} else {
	$title .= $this->model->file->file;
}

$imageurl = JURI::base().'images/eventgallery/'.$this->model->file->folder.'/'.$this->model->file->file;
// handle picasa images
if (strpos($this->model->file->folder,'@')>0) {
	$imageurl = $this->model->file->getImageUrl(600, 600, true);
}

?><html>
	<head prefix="og: http://ogp.me/ns#">
		
		<meta property="og:image" content="<?php echo  $imageurl; ?>"/>
		<meta property="og:url" content="<?php echo JRoute::_('index.php?option=com_eventgallery&view=singleimage&format=raw&folder='.$this->model->file->folder.'&file='.$this->model->file->file, null, -1)?>"/>
		<meta property="og:title" content="<?php echo $title ?>"/>
		<link rel="image_src" type="image/jpeg" href="<?php echo $imageurl; ?>"/>
		<title><?php echo $title ?></title>
	</head>
	<body>
		<a href="<?php echo JRoute::_('index.php?option=com_eventgallery&view=event&folder='.$this->model->file->folder)?>">
		<img src="<?php echo  $this->model->file->getImageUrl(600, 600, false) ?>">
		</a>
	</body>
</html>