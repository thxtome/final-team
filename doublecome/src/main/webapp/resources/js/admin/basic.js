var series = [ "월 가입 회원수", "월 등록 경매수", "월 등록 거래수" ];
var dataset = [ {
	'1월' : 31,
	'2월' : 19,
	'3월' : 54,
	'4월' : 21,
	'5월' : 14,
	'6월' : 62,
	'7월' : 123,
	'8월' : 5,
	'9월' : 32,
	'10월' : 113,
	'11월' : 32,
	'12월' : 43
}, {
	'1월' : 9,
	'2월' : 19,
	'3월' : 29,
	'4월' : 39,
	'5월' : 29,
	'6월' : 19,
	'7월' : 29,
	'8월' : 39,
	'9월' : 49,
	'10월' : 9,
	'11월' : 39,
	'12월' : 9
}, {
	'1월' : 21,
	'2월' : 21,
	'3월' : 11,
	'4월' : 33,
	'5월' : 43,
	'6월' : 12,
	'7월' : 55,
	'8월' : 66,
	'9월' : 21,
	'10월' : 22,
	'11월' : 33,
	'12월' : 21
} ];
var keys = d3.keys(dataset[0]);
var data = [];
dataset.forEach(function(d, i) {
	data[i] = keys.map(function(key) {
		return {
			x : key,
			y : d[key]
		};
	})
});
var margin = {
	left : 50,
	top : 10,
	right : 30,
	bottom : 50
};
var svg = d3.select("svg");
var width = parseInt(svg.style("width"), 10) - margin.left - margin.right;
var height = parseInt(svg.style("height"), 10) - margin.top - margin.bottom;
var svgG = svg.append("g").attr("transform",
		"translate(" + margin.left + "," + margin.top + ")");
var xScale = d3.scalePoint().domain(keys).rangeRound([ 0, width ]);
var yScale = d3.scaleLinear().domain([ 0, d3.max(dataset, function(d) {
	return d3.max(keys, function(key) {
		return d[key];
	});
}) ]).nice().range([ height, 0 ]);
var colors = d3.scaleOrdinal(d3.schemeCategory20)
svgG.append("g").attr("class", "grid").attr("transform",
		"translate(0," + height + ")").call(
		d3.axisBottom(xScale).tickSize(-height));
svgG.append("g").attr("class", "grid").call(
		d3.axisLeft(yScale).ticks(5).tickSize(-width));
var line = d3.line().curve(d3.curveBasis).x(function(d) {
	return xScale(d.x);
}).y(function(d) {
	return yScale(d.y);
});
var lineG = svgG.append("g").selectAll("g").data(data).enter().append("g");
lineG.append("path").attr("class", "lineChart").style("stroke", function(d, i) {
	return colors(series[i]);
}).attr("d", line);
var legend = svgG.append("g").attr("text-anchor", "end").selectAll("g").data(
		series).enter().append("g").attr("transform", function(d, i) {
	return "translate(0," + ((i * 30) + 10) + ")";
});
legend.append("rect").attr("x", width - 20).attr("width", 19)
		.attr("height", 19).attr("fill", colors);
legend.append("text").attr("x", width - 30).attr("y", 9.5).attr("dy", "0.32em")
		.text(function(d) {
			return d;
		});
