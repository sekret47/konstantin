<?php
/**
 * @version     1.0.0
 * @package     com_easy_youtube_gallery
 * @copyright   Copyright (C) 2012. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      moti <joomlacook@gmail.com> - http://www.extensioncook.com/
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Video controller class.
 */
class Easy_youtube_galleryControllerVideo extends JControllerForm
{

    function __construct() {
        $this->view_list = 'videos';
        parent::__construct();
    }

}