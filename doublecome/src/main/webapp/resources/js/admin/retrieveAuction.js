   $(".categoryBox label").click((e)=>{
            $(e.target).closest("div").toggleClass("categoryClicked")
            console.log($(e.target).closest("div"));
        })