var gulp = require('gulp');
var apn = require('apn');
var q = require('q');

gulp.task('apns', function() {
	console.log('推送--开始');
	push();
});

var myDevice = new apn.Device("8ca518a39dd7cd0836fd9f1bcd006ac8cc45b41946bea511933f60d97419ca52");

var options = {};
var apnConnection = new apn.Connection(options);

/**
 *	推送
 */
function push() {
	var note = new apn.Notification();
	
	note.expiry = Math.floor(Date.now() / 1000);
	note.badge = 3;
	note.sound = "ping.aiff";
	note.alert = "\uD83D\uDCE7 \u2709 You have a new message";
	note.payload = {'messageFrom': 'Caroline'};

	apnConnection.pushNotification(note, myDevice);
}