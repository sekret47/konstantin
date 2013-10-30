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
jimport('joomla.application.component.controllerform');

 
 
/**
 * YoutubeGallery - themeimport Controller
 */

class YoutubeGalleryControllerThemeImport extends JControllerForm
{


	function upload()
	{
		$model = $this->getModel('themeimport');
		$msg='';
		if($model->upload_theme($msg))
		{
			$msg = JText::_( 'COM_YOUTUBEGALLERY_THEME_IMPORTED_SUCCESSFULLY' );
			$link 	= 'index.php?option=com_youtubegallery&view=themelist';
			$this->setRedirect($link, $msg);
		}
		else
		{
			if($msg=='')
				$msg = JText::_( 'COM_YOUTUBEGALLERY_THEME_FILE_CORRUPTED_OR_NO_PERMISSION' );
				
			$link 	= 'index.php?option=com_youtubegallery&view=themeimport';
			$this->setRedirect($link, $msg,'error');
		}
	}
	
	function cancel()
	{
		$this->setRedirect( 'index.php?option=com_youtubegallery&view=themelist');
	}


}
