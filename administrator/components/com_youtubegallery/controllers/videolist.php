<?php
/**
 * YoutubeGallery
 * @version 3.5.3
 * @author DesignCompass corp< <support@joomlaboat.com>
 * @link http://www.joomlaboat.com
 * @GNU General Public License
 **/


// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
// import Joomla controllerform library
jimport('joomla.application.component.controlleradmin');
 


/**
 * YoutubeGallery - VideoList Controller
 */

class YoutubeGalleryControllerVideoList extends JControllerAdmin
{
		function display()
		{
				//echo 'sss';
				//die;
				JRequest::setVar( 'view', 'videoylist');
				parent::display();
		}

        
		function cancel()
		{
				//echo 'Cancel';
				$this->setRedirect( 'index.php?option=com_youtubegallery');
				//die;
		}
/*
		function close()
		{
				$this->setRedirect( 'index.php?option=com_youtubegallery');
				echo 'Close';
				die;
		}
*/
}

?>