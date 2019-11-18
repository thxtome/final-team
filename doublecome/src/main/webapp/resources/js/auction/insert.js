		$('#summernote')
				.summernote(
						{
							height : 400,
							width : 820,
						    disableResize: true,
						    disableResizeEditor: true,
						    resize: false,
							toolbar : [
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
									[ 'height', [ 'height' ] ] ]
						});
		   $(function () {
               $('#datetimepicker').datetimepicker({
                   minDate:'2019-11-13',
                   maxDate:'2019-12-14',
                   defaultDate:'2019-11-15 11:00'
               });
           });
		 //3자리 단위마다 콤마 생성
		   function addCommas(x) {
			 let val = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			 if(val.substr((val.length - 3, 2)) != "000") {
				 alert("입력은 천원단위 입니다.")
				 return;
			 }
			 return val;
		   }
		    
		   //모든 콤마 제거
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