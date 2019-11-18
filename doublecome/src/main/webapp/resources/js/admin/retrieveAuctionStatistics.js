
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
        
        
        
        
        // ==========================================================================================================
        c3.generate({
            bindto: "#pieChart1",
            data: {
                columns: [
                    ['입찰 진행중', 70],
                    ['경매 종료', 120],
                ],
                type: 'donut',
                onclick: function (d, i) { console.log("onclick", d, i); },
                onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            color: {
                pattern: ['#2ca02c', '#98df8a']
            },
            donut: {
                title: "상태별 경매 비율"
            }
        });
        
        c3.generate({
            bindto: "#pieChart2",
            data: {
                columns: [
                    ['한놈', 70],
                    ['두시기', 120],
                    ['석삼', 80],
                    ['너구리', 70],
                    ['오징어', 20],
                    ['육개장', 100],
                    ['칠면조', 300],
                    ['팔뜨기', 120],
                    ['구구단', 120],
                    ['팔구단', 120],
                    ['칠구단', 120],
                    ['육구단', 120],
                    ['오구단', 120],
                    ['사구단', 120],
                    ['삼구단', 120],
                ],
                type: 'donut',
                onclick: function (d, i) { console.log("onclick", d, i); },
                onmouseover: function (d, i) { console.log("onmouseover", d, i); },
                onmouseout: function (d, i) { console.log("onmouseout", d, i); }
            },
            color: {
                pattern: ['#1f77b4', '#aec7e8', '#d62728', '#ff9896', '#9467bd', '#c5b0d5', '#8c564b', '#c49c94', '#e377c2', '#f7b6d2', '#7f7f7f', '#c7c7c7', '#bcbd22', '#dbdb8d', '#17becf']
            },
            donut: {
                title: "카테고리별 경매 비율"
            },
            legend: {
                position: 'right'
            }
        });


