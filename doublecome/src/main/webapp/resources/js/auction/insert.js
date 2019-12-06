$(".category").click(() => {
	$(".catg").val($("select[name=catg]").val())
})

$('#summernote').summernote(
	{
		height : 400,
		width : 820,
	    disableResize: true,
	    disableResizeEditor: true,
	    resize: false,
		toolbar : 
			[
				[
						'style',
						[ 'bold', 'italic', 'underline',
								'clear' ] ],
				[
						'font',
						[ 'strikethrough', 'superscript',
								'subscript' ] ],
				[ 'fontsize', [ 'fontsize' ] ],
				[ 'color', [ 'color' ] ],
				[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
				[ 'height', [ 'height' ] ] 
			]
});

let sysdate = new Date()
let maxdate = new Date()

sysdate.setHours(sysdate.getHours())
maxdate.setDate(maxdate.getDate() + 7)
maxdate.setHours(maxdate.getHours() + 6)
$(function () {
    $('#datetimepicker').datetimepicker({
    	format: 'YYYY-MM-DD HH:mm',
    	minDate:sysdate,
        maxDate:maxdate,
        defaultDate:sysdate
    });
});
function addCommas(x) {
	 let val = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	 if(!val.endsWith("000")) {
		 alert("입력은 천원단위 입니다.")
		 return;
	 }
	 return val;
}
 
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}

$(".start, .buy").on("focus", function() {
	    var x = $(this).val();
	    x = removeCommas(x);
	    $(this).val(x);
	}).on("focusout", function() {
	    var x = $(this).val();
	    if(x && x.length > 0) {
	        if(!$.isNumeric(x)) {
	            x = x.replace(/[^0-9]/g,"");
	        }
	        x = addCommas(x);
	        $(this).val(x);
	    }
	}).on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
$(".start, .buy").click((e) => {
	   $($(e.target)).val("")
})

$(".fileUpIcon").hover(() => {
	$(".hoverNotification").show();
},() => {
  $(".hoverNotification").hide();
})

