
        const dataset = [
            { y: 13, x: '1월' },
            { y: 33, x: '2월' },
            { y: 23, x: '3월' },
            { y: 43, x: '4월' },
            { y: 53, x: '5월' },
            { y: 43, x: '6월' },
            { y: 23, x: '7월' },
            { y: 33, x: '8월' },
            { y: 43, x: '9월' },
            { y: 53, x: '10월' },
            { y: 33, x: '11월' },
            { y: 23, x: '12월' },
        ]

        const dataset2 = [
            { y: 33, x: '1월' },
            { y: 23, x: '2월' },
            { y: 13, x: '3월' },
            { y: 23, x: '4월' },
            { y: 33, x: '5월' },
            { y: 23, x: '6월' },
            { y: 13, x: '7월' },
            { y: 43, x: '8월' },
            { y: 33, x: '9월' },
            { y: 23, x: '10월' },
            { y: 34, x: '11월' },
            { y: 13, x: '12월' },
        ]
        
        const dataset3 = [
        	{ y: 43, x: '1월' },
        	{ y: 53, x: '2월' },
        	{ y: 33, x: '3월' },
        	{ y: 23, x: '4월' },
        	{ y: 43, x: '5월' },
        	{ y: 13, x: '6월' },
        	{ y: 33, x: '7월' },
        	{ y: 22, x: '8월' },
        	{ y: 33, x: '9월' },
        	{ y: 55, x: '10월' },
        	{ y: 44, x: '11월' },
        	{ y: 42, x: '12월' },
        	]

        const baseSvg = d3.select("svg");

        //svg는 먼저 생긴 순서대로 인덱스가 잡히므로 먼저 넣는다
        var svgAxis = baseSvg.append("g");

        //x축 y축을 그릴 때 위치를 지정해서 축이 그리므로 생성되는 범위를 미리 위치를 지정한 것으로 바꿈 
        var svgG = baseSvg.append("g").attr("transform", "translate(60, 0)");

        //선택한 svg에 g요소를 추가하고 위치를 지정함
        const xAxisSVG = svgAxis.append("g").attr("transform", "translate(20,360)").attr("class", "xAxis");
        const yAxisSVG = svgAxis.append("g").attr("transform", "translate(40,0)").attr("class", "yAxis");;

        let chartConfig = new Array(2);
        console.log(chartConfig.length)
        chartConfig[0] = { data: dataset, name: "월 별 가입자 수", color: "lightblue", index: 0};
        chartConfig[1] = { data: dataset2, name: "월 별 등록 경매 수", color: "lightgreen", index: 1};
        chartConfig[2] = { data: dataset3, name: "월 별 등록 거래 수", color: "lightcoral", index: 2};

        print(chartConfig);


        //========================================================================== 

        function print(chartConfig) {

            chartConfig.forEach((element,index) => {


                //데이터 변환 domain에 실제 데이터 값 , range에 범위를 지정
                const xScale = d3.scaleBand().domain(
                    dataset.map(function (d) { return d.x; })
                ).range([20, 780]);

                const yScale = d3.scaleLinear().domain([60, 5]).range([40, 360]);


                //위의 scale을 가지고 x축  y축을 그리는 함수를 만듬
                const $xAxis = d3.axisBottom(xScale).tickSize(0).ticks(10);
                const $yAxis = d3.axisLeft(yScale).tickSize(-780).ticks(10);

                //x축 y축을 그림
                $xAxis(xAxisSVG);
                $yAxis(yAxisSVG);

                const linerGenerator = d3.line()
                    .x(d => xScale(d.x))
                    .y(d => yScale(d.y));

                var line = d3.line().curve(d3.curveBasis).x(function (d) {
                    return xScale(d.x);
                }).y(function (d) {
                    return yScale(d.y);
                });



                svgG.append("path")
                    .attr("d", linerGenerator(element.data))
                    .attr("fill", "none")
                    .attr("stroke-width", 3)
                    .attr("stroke", element.color)
                    .attr("index", element.index)
                    .attr("class", "chartLine");


                let tooltip = d3.select("body").append("div").attr("class", "toolTip").style("display", "none");


                //점을 찍는다.
                svgG.selectAll("circles")
                    .data(element.data)
                    .enter()
                    .append("circle")
                    //반지름
                    .attr("r", 5)
                    .attr("cx", d => xScale(d.x))
                    .attr("cy", d => yScale(d.y))
                    .style("fill", element.color)
                    .on("mouseover", function () { tooltip.style("display", null); })
                    .on("mouseout", function () { tooltip.style("display", "none"); })
                    .on("mousemove", function (d) {
                        tooltip.style("left", (d3.event.pageX - 25) + "px");
                        tooltip.style("top", (d3.event.pageY - 60) + "px");
                        tooltip.html(element.name + "<div style='margin-top: 5px'>" + d.x +" : " + d.y + "</div>");
                    });
                
                document.querySelectorAll(".legend > div > div")[index].style.background = element.color;

            });

            document.querySelectorAll(".yAxis text").forEach((ele) => {
                ele.setAttribute("x", "-10");
                ele.setAttribute("font-size", "14px");
            })

            document.querySelectorAll(".xAxis text").forEach((ele) => {
                ele.setAttribute("y", "10");
                ele.setAttribute("font-size", "14px");
            })
            
            document.querySelectorAll(".xAxis text").forEach((ele) => {
                ele.setAttribute("y", "10");
                ele.setAttribute("font-size", "14px");
            })

            document.querySelectorAll(".chartLine").forEach((ele) => {
                ele.onclick = (e)=>{
                    console.log(e.target)
                    console.log(chartConfig[e.target.getAttribute("index")])
                }
            })

        }
