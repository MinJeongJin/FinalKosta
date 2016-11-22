/**
 * 
 */

$(document).ready(function(){
	var date = new Date();

	var day = date.getDate();
	var month = date.getMonth() + 1;
	var year = date.getFullYear();

	if (month < 10) month = "0" + month;
	if (day < 10) day = "0" + day;

	var today = year + "-" + month + "-" + day;  
	
	$('#startDay').val(today);
	$('#endDay').val(today);
	
	var hours = date.getHours();
	var minutes = date.getMinutes();
	
	if (hours < 10) hours = "0" + hours;
	if (minutes < 10) minutes = "0" + minutes;
	
	var currentTime = hours + ':' + minutes;
	
	var endTime;
	
	if(hours == '23'){
		endTime = hours + ':' + '59';
	}else if(hours == '09'){
		endTime = (parseInt(hours)+1) + ':' + minutes;
	}else{
		endTime = (parseInt(hours)+1) + ':' + minutes;
	}
	
	$('#startHour').val(currentTime);
	$('#endHour').val(endTime);
	
	$('#startHour').change(function(){
		var temp = ($('#startHour').val()).split(":");
		var cutHour=temp[0];
		var cutMinutes=temp[1];
		
		var ChangeEndTime;
		
		if(cutHour >= '23'){
			cutHour = '23';
			cutMinutes = '59';
			ChangeEndTime = cutHour + ':' + cutMinutes;
		}else{
			ChangeEndTime = (parseInt(cutHour)+1) + ':' + cutMinutes;
		}
		
		$('#endHour').val(ChangeEndTime);
	});
});
	