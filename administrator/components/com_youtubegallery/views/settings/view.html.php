<?php
/**
 * YoutubeGallery Joomla! 2.5 Native Component
 * @version 3.5.3
 * @author DesignCompass corp< <support@joomlaboat.com>
 * @link http://www.joomlaboat.com
 * @GNU General Public License
 **/

// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
// import Joomla view library
jimport('joomla.application.component.view');

 
/**
 * Youtube Gallery Theme Export View
 */
class YoutubeGalleryViewSettings extends JView
{
        /**
         * display method of Youtube Gallery view
         * @return void
         */

        public function display($tpl = null) 
        {
                
                // Set the toolbar
                $this->addToolBar();
                parent::display($tpl);
                
        }

        protected function addToolBar() 
        {
                //JRequest::setVar('hidemainmenu', true);
                
                JToolBarHelper::title(JText::_('Settings'));
                JToolBarHelper::apply('settings.apply');
                
                JToolBarHelper::cancel('settings.cancel', 'JTOOLBAR_CLOSE');
        }
       
    
}


?>