<div class="row">
    <div class="col-lg-3 col-md-4 col-sm-4">
        <div class="box box-info">
            <div class="box-body">
                <table class="table">
                    <tr>
                        <td colspan="2" class="text-bold"><?php echo $this->company->company()->name; ?></td>
                    </tr>
                    <!--						<tr class="bg-teal-gradient">-->
                    <!--							<td>Company ID:</td>-->
                    <!--							<td>-->
                    <?php //echo chunk_split($this->conf->company()->code, 6, ' '); ?><!--</td>-->
                    <!--						</tr>-->
                    <tr>
                        <td colspan="2"><?php echo $this->company->company()->slogan; ?></td>
                    </tr>
                    <tr>
                        <td>Timezone:</td>
                        <td><?php echo $this->company->company()->time_zone; ?></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="box box-success">
            <div class="box-body">
                <table class="table">
                    <tr>
                        <td colspan="2">
                            <?php echo $this->company->company()->street; ?>
                            <br/>
                            <?php echo $this->company->company()->city; ?>
                            <?php echo $this->company->company()->state; ?>,
                            <?php echo $this->company->company()->zip; ?>
                            <?php echo $this->company->company()->country; ?>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo lang('phone'); ?></td>
                        <td><?php echo $this->company->company()->phone; ?></td>
                    </tr>
                    <tr>
                        <td>Fax:</td>
                        <td><?php echo $this->company->company()->fax; ?></td>
                    </tr>
                </table>
            </div>
        </div>


        <div class="box box-warning">
            <div class="box-header">
                <div class="box-title"><i class="fa fa-money"></i> Due Invoices</div>
            </div>
            <div class="box-body">
                Total:
                <span  class="badge"> <?php echo $this->db->where('invoice_status', 2)->get('accnt_invoices')->num_rows(); ?>
                </span>

                <h2>
                    <?php echo $this->conf->setting('curr_symbol') . $this->invoice->getTotalDue(); ?>

                </h2>
            </div>
        </div>
        <div class="box box-primary">
        <ul class="nav nav-pills nav-stacked">
            <li class="active">
                <?php echo anchor('children/roster','<i class="fa fa-file-pdf-o"></i> Children Roster','target="_blank"'); ?>
                <?php echo anchor('family/roster','<i class="fa fa-file-pdf-o"></i> Parents Roster','target="_blank"'); ?>
            </li>
        </ul>
            </div>
    </div>


    <div class="col-lg-9 col-md-8 col-sm-8">
        <div class="row">
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-aqua cursor" onclick="location.href='<?php echo site_url('children'); ?>'">
                    <div class="inner">
                        <h3>
                            <?php echo $this->children->getCount(); ?>
                        </h3>

                        <p>
                            <?php echo lang('children'); ?>
                        </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="<?php echo site_url('children'); ?>" class="small-box-footer">
                        <?php echo lang('open'); ?> <i class="fa fa-arrow-circle-right"></i>
                    </a>

                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-green cursor" onclick="location.href='<?php echo site_url('mailbox'); ?>'">
                    <div class="inner">
                        <h3>
                            <?php echo $this->mail->totalUnread(); ?>
                        </h3>

                        <p>
                            <?php echo lang('messages'); ?>
                        </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                    </div>
                    <a href="<?php echo site_url('mailbox'); ?>" class="small-box-footer">
                        <?php echo lang('open'); ?> <i class="fa fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-yellow cursor" onclick="location.href='<?php echo site_url('users'); ?>'">
                    <div class="inner">
                        <h3>
                            <?php echo $this->users->getCount(); ?>
                        </h3>

                        <p>
                            <?php echo lang('users'); ?>
                        </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="<?php echo site_url('users'); ?>" class="small-box-footer">
                        <?php echo lang('open'); ?> <i class="fa fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-red cursor" onclick="location.href='<?php echo site_url('tasks'); ?>'">
                    <div class="inner">
                        <h3>
                            <?php echo $this->tasks->getCount('active'); ?>
                        </h3>

                        <p>
                            <?php echo lang('tasks'); ?>
                        </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-pie-graph"></i>
                    </div>
                    <a href="<?php echo site_url('tasks'); ?>" class="small-box-footer">
                        <?php echo lang('open'); ?> <i class="fa fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>
            <!-- ./col -->
        </div>


        <div class="row hidden-xs">
            <section class="col-sm-12 connectedSortable">
                <?php $this->load->view('modules/calendar/widget'); ?>
            </section>
        </div>
    </div>
</div>
