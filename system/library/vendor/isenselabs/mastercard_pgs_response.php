<?php

namespace vendor\isenselabs;

class Mastercard_PGS_Response extends \Response {
    private $redirect_url;
    private $success_message;
    private $registry;

    public function __construct(&$registry, $redirect_url, $success_message = '') {
        $this->registry = $registry;
        $this->redirect_url = $redirect_url;
        $this->success_message = $success_message;
    }

    public function redirect($url, $status = 302) {
        $this->overrideSuccessMessage();
        header('Location: ' . str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $this->redirect_url), true, $status);
        exit();
    }

    private function overrideSuccessMessage() {
        if ($this->success_message) {
            $this->registry->get('session')->data['success'] = $this->success_message;
        }
    }
}