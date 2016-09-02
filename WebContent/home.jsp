<%@include file="header.jsp"%>
<div class="container">
	<div class="col-md-9">

		<ul class="nav nav-tabs" role="tablist">
			<li class="active"><a href="#posts" role="tab" data-toggle="tab">Posts
					Ride</a></li>
			<li><a href="#askforride" role="tab" data-toggle="tab">Ask
					For Ride</a></li>

		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane active" id="posts">
				<!-- first tab-->
				<div class="modal-content">
					<div class="modal-header">
						<strong>Ride Offer</strong>
					</div>
					<%
									if (request.getSession().getAttribute("errorPosting") != null) {
										String errorPosting = (String) request.getSession().getAttribute("errorPosting");
								%>

					<div>
						<ct:Label textColor='red' text='<%=errorPosting%>' />
					</div>
					<%
									}
								%>
					<form class="form center-block" action="PostInfo" method="post">
						<div class="modal-body">

							<div class="form-group">
								<textarea class="form-control input-md" autofocus
									placeholder="What do you want to share?" name="post"></textarea>
							</div>

						</div>
						<div class="modal-footer">
							<button class="btn btn-primary btn-md" data-dismiss="modal"
								aria-hidden="true">Post</button>
							<div class="col-xs-2">
								<input class="form-control" placeholder="From" id="from"
									name="from" type="text" required>
							</div>
							<div class="col-xs-2">
								<input class="form-control" placeholder="To" id="to" name="to"
									type="text" required>
							</div>
							<div class="col-xs-2">
								<input class="form-control" placeholder="Seats" id="seat"
									name="seat" type="text" required>
							</div>
							<div class="col-xs-3">
								<input class="form-control" placeholder="MM/DD/YYYY HH:MM"
									id="date" name="dateandTime" type="text" required>
							</div>
							<div class="col-xs-2">
								<div class="radio">
									<label><input type="radio" name="posttype" value="1"
										checked>Ride(Offer)</label>
								</div>
							</div>
						</div>
					</form>
				</div>

				<!-- existing post listing -->

				<div class="col-md-12">
					<ul class="list-inline social-links"></ul>
					<ul class="list-inline social-links"></ul>
					<%
									if (request.getSession().getAttribute("jsonArray") != null) {
										JSONArray jsonArray = (JSONArray) request.getSession().getAttribute("jsonArray");
								%>
					<input type="hidden" value='<%=jsonArray%>' id="postData">

					<%
									}
								%>

					<div id="mainContainer" class="well clearfix content"></div>
					<div id="loader"></div>

				</div>
				<!-- last first tab-->
			</div>
			<div class="tab-pane" id="askforride">
				<!-- second tab -->
				<div class="modal-content">
					<div class="modal-header">
						<strong>Ask For Ride</strong>
					</div>
					<%
									if (request.getSession().getAttribute("errorAskForRide") != null) {
										String errorAskForRide = (String) request.getSession().getAttribute("errorAskForRide");
								%>

					<div>
						<ct:Label textColor='red' text='<%=errorAskForRide%>' />
					</div>
					<%
									}
								%>
					<form class="form center-block" action="PostInfoRide" method="post">
						<div class="modal-body">

							<div class="form-group">
								<textarea class="form-control input-md" autofocus
									placeholder="What do you want to share?" name="postRide"></textarea>
							</div>

						</div>
						<div class="modal-footer">
							<button class="btn btn-primary btn-md" data-dismiss="modal"
								aria-hidden="true">Post</button>
							<div class="col-xs-2">
								<input class="form-control" placeholder="From" id="fromRide"
									name="fromRide" type="text" required>
							</div>
							<div class="col-xs-2">
								<input class="form-control" placeholder="To" id="toRide"
									name="toRide" type="text" required>
							</div>
							<div class="col-xs-2">
								<input class="form-control" placeholder="Seats" id="seatRide"
									name="seatRide" type="text" required>
							</div>
							<div class="col-xs-3">
								<input class="form-control" placeholder="MM/DD/YYYY HH:MM"
									id="date" name="dateandTimeRide" type="text" required>
							</div>
							<div class="col-xs-2">
								<div class="radio">
									<label><input type="radio" name="posttypeRide"
										value="0" checked>Ride(Asking)</label>
								</div>
							</div>
						</div>
					</form>
				</div>

				<!-- existing post listing -->

				<div class="col-md-12">
					<ul class="list-inline social-links"></ul>
					<ul class="list-inline social-links"></ul>
					<%
									if (request.getSession().getAttribute("jsonArrayRide") != null) {
										JSONArray jsonArrayRide = (JSONArray) request.getSession().getAttribute("jsonArrayRide");
								%>
					<input type="hidden" value='<%=jsonArrayRide%>' id="postDataRide">

					<%
									}
								%>
					<div class="well">
						<div id="mainContainerRide" class="content"></div>
					</div>
				</div>

				<!-- end second tab -->
			</div>
		</div>
	</div>
	</div>
	<%@include file="footer.jsp"%>