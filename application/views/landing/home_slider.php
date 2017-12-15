<style>
	.carousel-caption {
		z-index: 10;
	}

	.carousel .item {
		height: 345px;
	}
	.carousel-inner > .item > img {
		position: absolute;
		top: 0;
		left: 0;
		min-width: 100%;
	}

</style>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="<?php echo base_url(); ?>assets/landing/img/screenshot1.jpg"/>
		</div>
		<div class="item">
			<img src="<?php echo base_url(); ?>assets/landing/img/screenshot2.jpg"/>
		</div>
		<div class="item">
			<img src="<?php echo base_url(); ?>assets/landing/img/screenshot3.jpg"/>
		</div>
	</div>
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	</a>
</div>