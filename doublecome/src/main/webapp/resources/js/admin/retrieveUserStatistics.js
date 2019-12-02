
        let data = [
            ['x', '2019-01-10', '2019-01-11', '2019-01-12', '2019-01-13', '2019-01-14', '2019-01-15', '2019-01-16', '2019-01-17', '2019-01-18', '2019-01-19', '2019-01-20'],
            ['data1', 30, 200, 100, 400, 150, 250, 123, 32, 42, 321, 62],
            ['data2', 50, 20, 10, 40, 15, 25, 213, 64, 84, 132, 232]
        ]

        let data2 = [
            ['x', '2019-01-10', '2019-01-11', '2019-01-12', '2019-01-13', '2019-01-14', '2019-01-15', '2019-01-16', '2019-01-17', '2019-01-18', '2019-01-19', '2019-01-20'],
            ['data1', 300, 80, 90, 140, 215, 330, 123, 212, 321, 121, 262],
            ['data2', 350, 220, 110, 240, 215, 125, 113, 364, 384, 232, 132]
        ]

        

        printChart(data)

        $(".lineChartType > span").click((e) => {
            $(".lineChartType > span").removeClass("clickedType")
            $(e.target).addClass("clickedType");
            printChart(data2);
        })


        function printChart(data) {
            var chart = c3.generate({
                bindto: "#lineChart",
                data: {
                    x: 'x',
                    columns: data
                },

                axis: {
                    x: {
                        type: 'timeseries',
                        tick: {
                            count: 5,
                            format: '%Y-%m-%d'
                        }
                    }
                }
            });
        }
        // ==========================================================================================================

        let pie1 = {url: "retrieveUserStaticsAc.do", 
                    target: "#pieChart1",
                    color: ['#1f77b4', '#aec7e8', '#ffbb78', '#2ca02c'],
                    title: "신고수별 유저 비율"}
        let pie2 = {url: "retrieveUserStaticsDc.do", 
                    target: "#pieChart2",
                    color: ['#d62728', '#ff9896', '#9467bd', '#c5b0d5'],
                    title: "거래수별 유저 비율"}
        let pie3 = {url: "retrieveUserStaticsRp.do", 
                    target: "#pieChart3",
                    color: ['#7f7f7f', '#c7c7c7', '#bcbd22', '#dbdb8d'],
                    title: "경매수별 유저 비율"}

        printPie(pie1);
        printPie(pie2);
        printPie(pie3);


    function printPie(pie) {
        $.ajax({
            url: pie.url,
            success: (result)=>{
                let data = [];
                Object.keys(result).map(function(key){
                    let innerArr = [key,result[key]]
                    data.push(innerArr);
                });

                c3.generate({
                    bindto: pie.target,
                    data: {
                        columns: data,
                        type: 'donut',
                        onclick: function (d, i) { console.log("onclick", d, i); },
                        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
                    },
                    color: {
                        pattern: pie.color
                    },
                    donut: {
                        title: pie.title
                    }
                });
            }
        })
   
    }
