<?php

defined('BASEPATH') or exit('No direct script access allowed');
/*
 * myIgniter basic config
 *
 * Author : Asrul Hanafi
 * Email : hanafi.asrul@gmail.com
 */

// Site
$config['site'] = [
    'title' => 'Sketsa.net CMS', // Default Title entire page
    'favicon' => 'assets/img/favicon-96x96.png', // Default Favicon
    'logo' => 'assets/img/logo/myIgniter.png' // Default Logo
];

// Template
$config['template'] = [
    'front_template' => 'template/front_template', // Default front template
    'backend_template' => 'template/admin_template', // Default backend template
    'auth_template' => 'template/auth_template' // Default auth template
];

// Auth view
$config['view'] = [
    'login' => 'auth/login', // Default login view template
    'register' => 'auth/register', // Defaul register view template
    'forgot_password' => 'auth/forgot_password', // Default forgot password view template
    'reset_password' => 'auth/reset_password' // Default reset password view template
];

// Route
$config['route'] = [
    'default_page' => 'home', // Default first page route
    'login_success' => 'page/home' // Default redirect after success logedin
];

// Email Configuration
$config['email_config'] = [ 
    'protocol' => 'smtp',
    'smtp_host' => 'mail.kotaxdev.co',
    'smtp_user' => 'support@kotaxdev.co',
    'smtp_pass' => '',
    'smtp_port' => 587,
    'mailtype' => 'html',
    'charset' => 'iso-8859-1'
];

// Debugbar
$config['debugbar'] = false; // True show debugbar