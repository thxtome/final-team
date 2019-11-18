        $("#openReportModal").click(()=>{
            $(".addReportModal").show();
        })

        $(".cancleReportBtn").click(()=>{
            closeReportModal();
        })

        $(".addReportModalBack").click((e)=>{
            if($(e.target).attr("class") == 'addReportModalBack'){
            closeReportModal();
            }
        })

        function closeReportModal() {
            let $modal = $(".addReportModal")
            $modal.hide();
            $modal.find("textarea").val("");
        }