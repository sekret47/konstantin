<?php
/**
 * Youtube Gallery Joomla! 2.5 Native Component
 * @version 3.5.3
 * @author DesignCompass corp <support@joomlaboat.com>
 * @link http://www.joomlaboat.com
 * @GNU General Public License
 **/


// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
// import joomla controller library
jimport('joomla.application.component.controller');
 
 
 
 
$controllerName = JRequest::getCmd( 'view', 'linkslist' );


switch($controllerName)
{
	case 'linkslist':
	
		JSubMenuHelper::addEntry(JText::_('Video Lists'), 'index.php?option=com_youtubegallery&view=linkslist', true);
		JSubMenuHelper::addEntry(JText::_('Themes'), 'index.php?option=com_youtubegallery&view=themelist', false);
		JSubMenuHelper::addEntry(JText::_('Categories'), 'index.php?option=com_youtubegallery&view=categories', false);
		JSubMenuHelper::addEntry(JText::_('Settings'), 'index.php?option=com_youtubegallery&view=settings&layout=edit', false);
	break;

	case 'themelist':
		
		JSubMenuHelper::addEntry(JText::_('Video Lists'), 'index.php?option=com_youtubegallery&view=linkslist', false);
		JSubMenuHelper::addEntry(JText::_('Themes'), 'index.php?option=com_youtubegallery&view=themelist', true);
		JSubMenuHelper::addEntry(JText::_('Categories'), 'index.php?option=com_youtubegallery&view=categories', false);
		JSubMenuHelper::addEntry(JText::_('Settings'), 'index.php?option=com_youtubegallery&view=settings&layout=edit', false);
	break;

	case 'categories':
		
		JSubMenuHelper::addEntry(JText::_('Video Lists'), 'index.php?option=com_youtubegallery&view=linkslist', false);
		JSubMenuHelper::addEntry(JText::_('Themes'), 'index.php?option=com_youtubegallery&view=themelist', false);
		JSubMenuHelper::addEntry(JText::_('Categories'), 'index.php?option=com_youtubegallery&view=categories', true);
		JSubMenuHelper::addEntry(JText::_('Settings'), 'index.php?option=com_youtubegallery&view=settings&layout=edit', false);
	break;

	case 'settings':
		
		JSubMenuHelper::addEntry(JText::_('Video Lists'), 'index.php?option=com_youtubegallery&view=linkslist', false);
		JSubMenuHelper::addEntry(JText::_('Themes'), 'index.php?option=com_youtubegallery&view=themelist', false);
		JSubMenuHelper::addEntry(JText::_('Categories'), 'index.php?option=com_youtubegallery&view=categories', false);
		JSubMenuHelper::addEntry(JText::_('Settings'), 'index.php?option=com_youtubegallery&view=settings&layout=edit', true);
	break;

}
 
 

$controller = JController::getInstance('youtubeGallery');

// Perform the Request task
$controller->execute( JRequest::getCmd('task'));
$controller->redirect();

?>