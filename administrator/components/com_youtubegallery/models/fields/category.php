<?php
/**
 * YoutubeGallery
 * @version 3.5.3
 * @author DesignCompass corp< <support@joomlaboat.com>
 * @link http://www.joomlaboat.com
 * @GNU General Public License
 **/


// No direct access to this file
defined('_JEXEC') or die;
 
// import the list field type
jimport('joomla.form.helper');
JFormHelper::loadFieldClass('list');
 
/**
 * YoutubeGallery Form Field class for the Youtube Gallery component
 */
class JFormFieldCategory extends JFormFieldList
{
        /**
         * The field type.
         *
         * @var         string
         */
        protected $type = 'Category';
 
        /**
         * Method to get a list of options for a list input.
         *
         * @return      array           An array of JHtml options.
         */
        protected function getOptions() 
        {
                $db = JFactory::getDBO();
                $query = $db->getQuery(true);
                $query->select('id,categoryname');
                $query->from('#__youtubegallery_categories');
                $db->setQuery((string)$query);
                $messages = $db->loadObjectList();
                $options = array();
                
                $options[] = JHtml::_('select.option', 0, JText::_( 'COM_YOUTUBEGALLERY_SELECT_CATEGORY' ));
                
                if ($messages)
                {
                        foreach($messages as $message) 
                        {
                                $options[] = JHtml::_('select.option', $message->id, $message->categoryname);
                                
                        }
                }
                $options = array_merge(parent::getOptions(), $options);
                return $options;
        }
}
