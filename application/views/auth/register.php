<?php echo form_open('auth/register', ['id' => 'loginForm', 'class' => 'login100-form validate-form']); ?>
<div class="text-center" style="position:absolute;top:0;right:150px">
    <a href="<?php echo site_url(); ?>">
        <img class="logo" src="<?php echo base_url(); ?>assets/uploads/content/<?php echo get_option('logo'); ?>"
             alt="Logo">
    </a>
</div>


<span class="login100-form-title p-b-43"><?php echo lang('register_form_header'); ?></span>
<?php echo lang('register_form_notice'); ?>

<?php if(!empty($this->session->flashdata('type'))) : ?>
    <div style="">
        <?php echo $this->session->flashdata('message'); ?>
    </div>
<?php endif; ?>

<div class="wrap-input100 validate-input" data-validate="<?php echo lang('Field is required'); ?>">
    <?php echo form_input($data['first_name']); ?>
    <span class="focus-input100"></span>
    <span class="label-input100"><?php echo lang('Firstname'); ?></span>
</div>

<div class="wrap-input100 validate-input" data-validate="<?php echo lang('Field is required'); ?>">
    <?php echo form_input($data['last_name']); ?>
    <span class="focus-input100"></span>
    <span class="label-input100"><?php echo lang('Lastname'); ?></span>
</div>

<div class="wrap-input100 validate-input" data-validate="<?php echo lang('Valid email is required'); ?>: ex@abc.xyz">
    <?php echo form_input($data['email']); ?>
    <span class="focus-input100"></span>
    <span class="label-input100"><?php echo lang('Email'); ?></span>
</div>

<div class="wrap-input100 validate-input" data-validate="<?php echo lang('Field is required'); ?>">
    <?php echo form_input($data['password']); ?>
    <span class="focus-input100"></span>
    <span class="label-input100"><?php echo lang('Password'); ?></span>
</div>

<div class="wrap-input100 validate-input" data-validate="<?php echo lang('Field is required'); ?>">
    <?php echo form_input($data['password_confirm']); ?>
    <span class="focus-input100"></span>
    <span class="label-input100"><?php echo lang('confirm_password'); ?></span>
</div>

<div class="wrap-input100 validate-input" data-validate="<?php echo lang('Field is required'); ?>">
    <?php echo form_textarea($data['address']); ?>
    <span class="focus-input100"></span>
    <span class="label-input100"><?php echo lang('Address'); ?></span>
</div>

<?php if(get_option('enable_captcha')): ?>
    <div class="flex-sb-m w-full p-t-3 p-b-32">
        <div class="contact100-form-checkbox">
            <?php echo $data['captcha_image']; ?>
        </div>
        <?php if(get_option('allow_reset_password')): ?>
            <div>
                <?php echo form_input($data['captcha']); ?>
            </div>
        <?php endif; ?>
    </div>
<?php endif; ?>

<div class="container-login100-form-btn">
    <button class="login100-form-btn">
        <?php echo lang('Register'); ?>
    </button>
</div>

<?php if(get_option('allow_registration') == TRUE): ?>
    <div class="text-center p-t-46 p-b-20">
        <?php echo anchor('auth/login', '<span class="fa fa-user"></span> '.lang('Login'), ['class' => 'txt2']); ?>
    </div>

<?php endif; ?>

<?php echo form_close(); ?>
