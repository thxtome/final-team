        $(".categoryBox .conditionLable").click((e)=>{
            let $checks = $(".categoryBox input[name=condition]");
            let check = $(e.target).siblings("input").prop("checked");

            if(check === false && $(".categoryBox input[name=condition]:checked").length === 2){
                $("#conditionAll").prop("checked",true)
                $("#conditionAll").closest("div").addClass("categoryClicked");
            } 

            else if(check === true) {
                $("#conditionAll").prop("checked",false)
                $("#conditionAll").closest("div").removeClass("categoryClicked");
            }

            $(e.target).closest("div").toggleClass("categoryClicked")
        })

        $("#conditionAllLabel").click((e)=>{
            console.log($(e.target).siblings("input").prop("checked"));
            let $checks =  $(".categoryBox input[name=condition]");
            if($(e.target).siblings("input").prop("checked") === true){
                $("#conditionAllLabel").closest("div").removeClass("categoryClicked");
                $checks.prop("checked",false).closest("div").removeClass("categoryClicked");
                
            } else {
                $("#conditionAllLabel").closest("div").addClass("categoryClicked");
                $checks.prop("checked",true).closest("div").addClass("categoryClicked");
            }
        })