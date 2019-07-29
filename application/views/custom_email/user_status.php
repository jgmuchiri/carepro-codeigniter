<!DOCTYPE html>
<html>

<head>
   <title>User Status</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
   <div style="width: 93%;background: #D5F2F4 !important;height: 100%;padding: 4% 3%;font-family:Verdana">
      <div style="background-color:white;padding: 4% 3%;">
      <?php if($logo != ''): ?>
           <img src="<?php echo base_url(); ?>assets/uploads/daycare_logo/<?php echo $logo; ?>" alt="Daycare logo" style="width: 200px;margin-bottom: 1%;">   
        <?php else: ?>
           <img src="<?php echo base_url(); ?>assets/uploads/content/logo.png" alt="Daycare logo" style="width: 200px;margin-bottom: 1%;">
        <?php endif; ?>
         <?php if ($first_name !== '') : ?>
            <p style="font-size: 20px;font-weight: 600;">Hello <?php echo $first_name . ' ' . $last_name;  ?>,</p>
         <?php else : ?>
            <p style="font-size: 20px;font-weight: 600;">Hello <?php echo $username;  ?>,</p>
         <?php endif; ?>

         <p>
            Your acccount has been
            <?php if ($user_status == "deactivate") : ?>
               deactivated for <?php echo $this->session->userdata('company_name'); ?>.<br />
               Ask your manager to activate it again.
            <?php else : ?>
               activated for <?php echo $this->session->userdata('company_name'); ?>.<br />
               Visit Link: <br />
               <p>
                  <a href="<?php echo base_url(); ?>/login" style="background-color: #EB6C6A;color: white;text-decoration: none;padding: 11px 35px;font-weight: 600;font-size: 13px;border-radius: 21px;">Visit Dashboard</a>
               </p>
            <?php endif; ?>
         </p>
         Thanks!<br />
         Daycarepro Team
         </a>
      </div>
   </div>
</body>

</html>