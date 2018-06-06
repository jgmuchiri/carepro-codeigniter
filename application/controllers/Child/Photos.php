<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Photos extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        setRedirect();
        allow('admin,manager,staff,parent');
        $this->module = 'modules/child/photos/';
        $this->my_child = array();
        $this->load->model('My_photos', 'photos');
    }

    function index()
    {
        $child = $this->child->first($this->uri->segment(2));
        $this->my_child = $child;
        $photos = $this->photos->albums('photos',$child->id,'album');
        $method = $this->uri->segment(4);
        $param = $this->uri->segment(5);
        if($method !== null) {
            if(method_exists($this, $method)) {
                if($param == null) {
                    $this->$method();
                } else {
                    $this->$method($param);
                }
            } else {
                return show_404();
            }
        } else {
            page($this->module.'index', compact('child', 'photos'));
        }
    }

    function store()
    {
        echo $this->photos->store($this->uri->segment(2), 'album');
    }

    function incident()
    {
        echo $this->photos->storeIncidentPhotos($this->uri->segment(2));
    }

    function destroy()
    {
        $photo = $this->db->where('id', $this->input->post('id'))->get('photos')->row();
        @unlink('./assets/uploads/photos/'.$photo->name);
        if($this->db->where('id', $this->input->post('id'))->delete('photos')) {
            echo 'success';
            return;
        }
        echo 'error';
    }
    function destroyIncidentPhotos(){
        $photo = $this->db->where('id', $this->input->post('id'))->get('child_incident_photos')->row();
        @unlink('./assets/uploads/photos/'.$photo->photo);
        if($this->db->where('id', $this->input->post('id'))->delete('child_incident_photos')) {
            echo 'success';
            return;
        }
        echo 'error';
    }
}