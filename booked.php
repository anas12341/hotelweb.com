<?php include('db_connect.php'); 
$cat = $conn->query("SELECT * FROM roombook");
$cat_arr = array();
while($row = $cat->fetch_assoc()){
	$cat_arr[$row['id']] = $row;
}
$room = $conn->query("SELECT * FROM rooms");
$room_arr = array();
while($row = $room->fetch_assoc()){
	$room_arr[$row['id']] = $row;
}
?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="row mt-3">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<table class="table table-bordered">
							<thead>
								<th>#</th>
								<th>Name</th>
								<th>Phone No</th>
								<th>Room Type</th>
								<th>Num Room</th>
								<th>Meal</th>
								<th>From</th>
								<th>To</th>
								<th>Status</th>
								<th>Action</th>
							</thead>
							<tbody>
								<?php 
								$i = 1;
								$checked = $conn->query("SELECT * FROM roombook order by title desc, id asc");
								while($row=$checked->fetch_assoc()):
								?>
								<tr>
									<td class="text-center"><?php echo $i++ ?></td>
									<td class="text-center"><?php echo $cat_arr[$row['id']]['FName']; ?></td>
									<td class=""><?php echo $row['Phone']; ?></td>
									<td class=""><?php echo $row['TRoom']; ?></td>
									<td class=""><?php echo $row['NRoom']; ?></td>
									<td class=""><?php echo $row['Meal']; ?></td>
									<td class=""><?php echo $row['cin']; ?></td>
									<td class=""><?php echo $row['cout']; ?></td>
									<td class="text-center"><span class="badge badge-warning">Booked</span></td>
									<td class="text-center">
									<button class="btn btn-sm btn-primary check_out" type="button" data-id="<?php echo $row['id'] ?>">View</button>
									</td>
								</tr>
							<?php endwhile; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$('table').dataTable()
	$('.check_out').click(function(){
		uni_modal("Check Out","manage_check_out.php?checkout=1&id="+$(this).attr("data-id"))
	})
	$('#filter').submit(function(e){
		e.preventDefault()
		location.replace('index.php?page=check_in&category_id='+$(this).find('[name="category_id"]').val()+'&status='+$(this).find('[name="status"]').val())
	})
</script>