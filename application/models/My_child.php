<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class My_child extends CI_Model
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('My_parent', 'parent');

    }

    function first($id)
    {
        return $this->db->where('id', $id)->get('children')->row();
    }
    /*
     * set child id session to be used in this instance
     * @params none
     * @return int
     */
    /*
     * getAllChildren
     */
    function children()
    {
        return $this->db->get('children');
    }

    function child($id = null)
    {
        return $this->db->where('id', $id)->get('children')->row();
    }


    /**
     * @param $child_id
     * @return mixed|object
     */
    function getParents($child_id)
    {
        $this->db->where('child_parents.child_id', $child_id);
        $this->db->select('*');
        $this->db->from('users');
        $this->db->join('child_parents', 'child_parents.user_id=users.id');
        return $this->db->get();
    }

    /**
     * @param null $id
     * @return mixed
     */
    function getParent($id = null)
    {
        $this->db->where('children.id', $id);
        $this->db->select('*');
        $this->db->from('children');
        $this->db->join('child_parents', 'child_parents.child_id=children.id');
        $this->db->join('users', 'users.id=child_parents.user_id');
        return $this->db->get()->row();
    }

    /**
     * @param $db
     * @return mixed
     */
    function getData($db, $child_id)
    {
        $data = array();
        if($db == 'child_checkin') $this->db->order_by('id', 'DESC');

        $this->db->where('child_id', $child_id);
        return $this->db->get($db)->result();
    }

    /**
     * @return mixed
     */
    function getCount($active = true)
    {
        if(is('parent')) {
            $query = $this->parent->getChildren($this->user->uid());
            return $query->num_rows();
        }
        if($active == true) {
            $this->db->where('status', 1);
        } else {
            $this->db->where('status', 0);
        }
        return $this->children()->num_rows();
    }

    /**
     * @param $db
     * @param $child_id
     * @return int|string
     */
    function totalRecords($db, $child_id)
    {
        $this->db->where('child_id', $child_id);
        return $this->db->count_all_results($db);
    }

    /**
     * @param $user_id
     * @param $child_id
     * @return bool
     */
    function belongsTo($user_id, $child_id)
    {
        $this->db->where('child_id', $child_id);
        $this->db->where('user_id', $user_id);
        $query = $this->db->get('child_parents');
        if($query->num_rows()>0) {
            return true;
        } else {
            return false;
        }
    }


    /*
     * get_child
     * get all child information
     */

    function register($getID = false)
    {
        $data = array(
            'nickname' => $this->input->post('nickname'),
            'first_name' => $this->input->post('first_name'),
            'last_name' => $this->input->post('last_name'),
            'national_id' => encrypt($this->input->post('national_id')),
            'bday' => $this->input->post('bday'),
            'gender' => $this->input->post('gender'),
            'last_update' => date_stamp(),
            'status' => 1,
            'created_at' => date_stamp(),
            'user_id' => $this->user->uid(),
            'religion' => $this->input->post('religion'),
            'ethnicity' => $this->input->post('ethnicity'),
            'birthplace' => $this->input->post('birthplace'),
            'blood_type' => $this->input->post('blood_type')
        );
        $this->db->insert('children', $data);
        $last_id = $this->db->insert_id();

        if($this->db->affected_rows()>0) {
            flash('success', lang('request_success'));
        } else {
            return false;
        }

        //assign child to user if this user is parent
        if(is('parent')) {
            $data2 = array(
                'child_id' => $last_id,
                'user_id' => $this->user->uid()
            );
            $this->db->insert('child_parents', $data2);
        }

        //log event
        logEvent("Add child {$data['first_name']} {$data['last_name']}");

        if($getID)
            return $last_id;
        return true;
    }

    /*
     * get_child_info
     *
     */

    function update_child($child_id)
    {
        $data = array(
            'nickname' => $this->input->post('nickname'),
            'first_name' => $this->input->post('first_name'),
            'last_name' => $this->input->post('last_name'),
            'bday' => $this->input->post('bday'),
            'national_id' => encrypt($this->input->post('national_id')),
            'blood_type' => $this->input->post('blood_type'),
            'gender' => $this->input->post('gender'),
            'status' => $this->input->post('status'),
            'ethnicity' => $this->input->post('ethnicity'),
            'religion' => $this->input->post('religion'),
            'birthplace' => $this->input->post('birthplace'),
            'last_update' => date_stamp()
        );
        $this->db->where('id', $child_id);
        $this->db->update('children', $data);
        if($this->db->affected_rows()>0) {
            //log event
            logEvent("Updated child {$data['first_name']} {$data['last_name']}");

            flash('success', lang('request_success'));
        } else {
            flash('warning', lang('no_change_to_db'));
        }
    }

    /*
     * add emergency contact to db
     */

    function createPickup($id)
    {
        $data = array(
            'child_id' => $id,
            'first_name' => $this->input->post('first_name'),
            'last_name' => $this->input->post('last_name'),
            'cell' => $this->input->post('cell'),
            'other_phone' => $this->input->post('other_phone'),
            'address' => $this->input->post('address'),
            'pin' => $this->input->post('pin'),
            'relation' => $this->input->post('relation'),
            'user_id' => $this->user->uid(),
            'created_at' => date_stamp()
        );

        $this->db->insert('child_pickup', $data);
        $insert_id = $this->db->insert_id();
        if($this->db->affected_rows()>0) {
            //log event
            logEvent("Added pickup contact for child ID {$id}");
            $this->parent->notifyParents($id, lang('pickup_added_email_subject'), sprintf(lang('pickup_added_email_message'), $data['first_name'].' '.$data['last_name']));
            return $insert_id;
        } else {
            return false;
        }
    }

    /*
     * add pickup contact info
     */

    function createNote($child_id)
    {
        $data = array(
            'child_id' => $child_id,
            'title' => $this->input->post('title'),
            'content' => $this->input->post('note-content'),
            'user_id' => $this->user->uid(),
            'created_at' => date_stamp()
        );

        $this->db->insert('child_notes', $data);
        if($this->db->affected_rows()>0) {
            //log event
            logEvent("Added note for child ID: {$child_id}");
            //notify parents
            $this->parent->notifyParents($child_id, lang('note_created_email_subject'), sprintf(lang('note_created_email_message'), $this->first($child_id)->first_name));

            return true;
        }
        return false;
    }

    /**
     * @param $child_id
     * @return bool
     */
    function createIncident($child_id)
    {
        $date_occurred = $this->input->post('date').' '.$this->input->post('time');
        $data = array(
            'child_id' => $child_id,
            'title' => $this->input->post('title'),
            'location' => $this->input->post('location'),
            'incident_type' => $this->input->post('incident_type'),
            'description' => $this->input->post('description'),
            'actions_taken' => $this->input->post('actions_taken'),
            'witnesses' => $this->input->post('witnesses'),
            'remarks' => $this->input->post('remarks'),
            'date_occurred' => $date_occurred,
            'user_id' => $this->user->uid(),
            'created_at' => date_stamp()
        );

        $this->db->insert('child_incident', $data);
        if($this->db->affected_rows()>0) {
            //log event
            logEvent("Added incident report for child ID: {$child_id}");

            //notify parents
            $this->parent->notifyParents($child_id, lang('incident_email_subject'), sprintf(lang('incident_email_message'), $this->first($child_id)->first_name));
            return true;
        }
        return false;
    }

    /**
     * @param $child_id
     * @return bool
     */
    function check_in($child_id)
    {
        //check if already checked in
        if($this->checkedIn($child_id) == 1) {
            flash('warning', lang('child_already_checked_in'));
            return false;
        }

        $data = array(
            'child_id' => $child_id,
            'in_guardian' => $this->input->post('in_guardian'),
            'time_in' => date_stamp(),
            'in_staff_id' => $this->user->uid()
        );
        if($this->db->insert('child_checkin', $data)) {
            $child = $this->child($child_id);
            $childName = $child->first_name.' '.$child->last_name;
            $message = sprintf(lang('child_checked_in_message'), $childName, date('d M Y @ H:i:A'), $this->input->post('in_guardian'));
            $subject = sprintf(lang('child_checked_in_subject'), $childName);
            $this->parent->notifyParents($child_id, $subject, $message);
            logEvent("Added checked in {$child_id} -{$this->child($child_id)->last_name}");
            return true;
        }
        return false;
    }

    /**
     * @param $child_id
     * @return bool
     */
    function check_out($child_id)
    {
        //check if already checked in
        if($this->checkedIn($child_id) == false) {
            flash('warning', lang('child_is_already_checked_out'));
            return false;
        }

        $data = array(
            'child_id' => $child_id,
            'out_guardian' => $this->input->post('out_guardian'),
            'time_out' => date_stamp(),
            'out_staff_id' => $this->user->uid()
        );
        if($this->db
            ->where('child_id', $child_id)
            ->where('out_guardian', null)
            ->update('child_checkin', $data)) {

            $child = $this->child($child_id);
            $childName = $child->first_name.' '.$child->last_name;
            $message = sprintf(lang('child_checked_out_message'), $childName, date('d M Y @ H:i:A'), $this->input->post('out_guardian'));
            $subject = sprintf(lang('child_checked_out_subject'), $childName);
            $this->parent->notifyParents($child_id, $subject, $message);
            logEvent("Added checked in {$child_id} -{$this->child($child_id)->last_name}");
            return true;
        }
        return false;
    }

    /**
     * Determine if child was checked in a given day
     *
     * @param $child_id
     * @param bool $date
     * @return bool
     */
    function checkedIn($child_id, $date = false, $checkedOut = false)
    {
        if($checkedOut == false)
            $this->db->where('time_out', NULL);
        $this->db->where('child_id', $child_id);
        if($date !== false) {
            if(valid_date($date)) {
                $d = new DateTime($date);
                $date = $d->format('Y-m-d ');
                $this->db->where('DATE(time_in)', $date);
            }
        }
        $this->db->from('child_checkin');
        $query = $this->db->count_all_results();
        if(empty($query)) {//child is out
            return false;
        } else { //child is in
            return true;
        }
    }

    /**
     * @param $id
     * @param null $date
     * @return mixed
     */
    function attendance($id, $date = null)
    {
        $this->db->where('child_id', $id);
        if($date !== null)
            $this->db->where('DATE(time_in)', $date);
        $this->db->order_by('time_in', 'DESC');
        return $this->db->get('child_checkin');
    }

    /**
     * @param $id
     * @param null $date
     * @return mixed
     */
    function checkinCounter($id, $date = null)
    {
        $count = '0.00';
        if($date == null)
            $date = date('Y-m-d');
        $this->db->where('child_id', $id);
        $this->db->where('DATE(time_in)', $date);
        $this->db->where('time_out', null);
        $res = $this->db->get('child_checkin');
        if($res->num_rows()>0) {
            $result = $res->row();
            $count = checkinTimer($result->time_in, date('Y-m-d H:i:s'))->h.' '.lang('hrs').
                ' '.checkinTimer($result->time_in, date('Y-m-d H:i:s'))->i.' '.lang('mins');
        }
        return $count;
    }

    /**
     * @param $id
     * @return mixed
     */
    function countAllergies($id)
    {
        $this->db->where('child_id', $id);
        $this->db->from('child_allergy');
        return $this->db->count_all_results();
    }

    /**
     * @param $id
     * @return mixed
     */
    function countMeds($id)
    {
        $this->db->where('child_id', $id);
        $this->db->from('child_meds');
        return $this->db->count_all_results();
    }

    /**
     * @param $id
     * @return int
     */
    function roomCount($id, $type = 'children')
    {
        $this->db->where('room_id', $id);
        if($type == 'children') {
            $res = $this->db->count_all_results('child_room');
        } else {
            $res = $this->db->count_all_results('child_room_staff');
        }
        if(count((array)$res)>0)
            return $res;
        return 0;
    }
}