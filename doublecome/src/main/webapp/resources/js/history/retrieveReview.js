//후기등록 score바
$(".scoreBar").find("span").click((e) => {
	$(".scoreBar").find("span").removeClass("scorechoice");
	$(e.target).addClass("scorechoice");
});

// 후기작성 서머노트
$("#summernote").summernote(
		{
			height : 300,
			width : 500,
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

