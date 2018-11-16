import "bootstrap";
import Chartkick from "chartkick"
window.Chartkick = Chartkick;
import $ from 'jquery';
import "bootstrap-datepicker"
// for Chart.js
import Chart from "chart.js";
Chartkick.addAdapter(Chart);

   $(document).ready(function(){
    $('.datepicker').datepicker();
  });


// import { myChart } from '../components/highcharts';
// myChart();
// import { mapElement } from '../components/map';
// mapElement();


