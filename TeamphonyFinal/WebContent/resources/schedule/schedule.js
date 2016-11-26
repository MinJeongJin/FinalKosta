/**
 * 
 */

$(document).ready(function(){
	var date = new Date();
	
	var hours = date.getHours();
	var minutes = date.getMinutes();
	
	if(hours < 10) hours = "0" + hours;
	if(minutes < 10) minutes = "0" + minutes;
	
	var currentTime = hours + ':' + minutes;
	
	var endTime;
	
	if(hours == '23'){
		endTime = hours + ':' + '59';
	} else if(hours == '09'){
		endTime = (parseInt(hours) + 1) + ':' + minutes;
	} else {
		endTime = (parseInt(hours) + 1) + ':' + minutes;
	}
	
	$('#startHour').val(currentTime);
	$('#endHour').val(endTime);
})
