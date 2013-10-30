<?php

/**
 * @version     1.0.0
 * @package     com_easy_youtube_gallery
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      moti <joomlacook@gmail.com> - http://www.extensioncook.com/
 */
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Easy_youtube_gallery records.
 */
class Easy_youtube_galleryModelVideos extends JModelList {

    /**
     * Constructor.
     *
     * @param    array    An optional associative array of configuration settings.
     * @see        JController
     * @since    1.6
     */
    public function __construct($config = array()) {
        parent::__construct($config);
    }

    /**
     * Method to auto-populate the model state.
     *
     * Note. Calling getState in this method will result in recursion.
     *
     * @since	1.6
     */
    protected function populateState($ordering = null, $direction = null) {
        
        // Initialise variables.
        $app = JFactory::getApplication();
		$params = $app->getParams();
		
        // List state information
        $limit = $app->getUserStateFromRequest('global.list.limit', 'limit', $app->getCfg('list_limit'));
        $this->setState('list.limit', $limit);

        $limitstart = JFactory::getApplication()->input->getInt('limitstart', 0);
        $this->setState('list.start', $limitstart);
        
        
		if(empty($ordering)) {
			$ordering = 'a.ordering';
		}
        
        // List state information.
        parent::populateState($ordering, $direction);
    }

	protected function getData() 
	  {
		// if data hasn't already been obtained, load it
		if (empty($this->_data)) {
			$query = $this->_buildQuery();
			$this->_data = $this->_getList($query, $this->getState('limitstart'), $this->getState('limit'));	
		}
		return $this->_data;
	  }
	  
    /**
     * Build an SQL query to load the list data.
     *
     * @return	JDatabaseQuery
     * @since	1.6
     */
    protected function getListQuery() {
        // Create a new query object.
        $db = $this->getDbo();
        $query = $db->getQuery(true);

        // Select the required fields from the table.
        $query->select(
                $this->getState(
                        'list.select', 'a.*'
                )
        );
        
        $query->from('`#__ec_video_items` AS a');
        if(JRequest::getVar('mycategory'))
			$query->where('catid ='.JRequest::getVar('mycategory'));

    // Join over the users for the checked out user.
    $query->select('uc.name AS editor');
    $query->join('LEFT', '#__users AS uc ON uc.id=a.checked_out');
    
		// Join over the created by field 'created_by'
		$query->select('created_by.name AS created_by');
		$query->join('LEFT', '#__users AS created_by ON created_by.id = a.created_by');

    // Filter by published state
    $published = $this->getState('filter.state');
    if (is_numeric($published)) {
        $query->where('a.state = '.(int) $published);
    } else {
        $query->where('(a.state = 1)');
    }
    

		// Filter by search in title
		$search = $this->getState('filter.search');
		if (!empty($search)) {
			if (stripos($search, 'id:') === 0) {
				$query->where('a.id = '.(int) substr($search, 3));
			} else {
				$search = $db->Quote('%'.$db->escape($search, true).'%');
                $query->where('( a.catid LIKE '.$search.'  OR  a.title LIKE '.$search.' )');
			}
		}
        
		 $app = JFactory::getApplication();
		$params = $app->getParams();
		$this->setState('list.limit',  $params->get('itemsonpage'));
		if(JRequest::getVar('limitstart'))
		{
		$this->setState('list.start',  JRequest::getVar('limitstart'));
		}

		//Filtering catid

		//Filtering title        
        
        return $query;
    }
	
	public function &getCategory(){
		if(!JRequest::getVar('mycategory'))
			return '0';
		$db = $this->getDbo();
        $query = $db->getQuery(true);
		$query->select('*');
        $query->from('`#__categories` AS a');
		$query->where('id ='.JRequest::getVar('mycategory'));
		 $db->setQuery($query);
         $data = $db->loadObject();
		 return $data;
	}
	
	public function &getItem()
	{
		if(JRequest::getVar('defaultvideo')=='0')
			return 0;
		
		if (!isset($this->_item)) {

                        $db = $this->getDbo();
                        $query = $db->getQuery(true);

                        $query->select($this->getState(
                                'item.select', 'a.*'
                                )
                        );
                        $query->from('#__ec_video_items AS a');
                        
                        $query->where('a.id = '. (int)JRequest::getVar('defaultvideo'));

                        // Filter by published state.
                        $published = $this->getState('filter.published');
                        $archived = $this->getState('filter.archived');

                        if (is_numeric($published)) {
                                $query->where('(a.state = ' . (int) $published . ' OR a.state =' . (int) $archived . ')');
                        }

                        $db->setQuery($query);

                        $data = $db->loadObject();

                        if ($error = $db->getErrorMsg()) {
                                JError::raiseError(404, $error);
                                return false;
                        }

                        $this->_item = $data;
			
		}

		return $this->_item;
	}
}
