import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();
import Chartkick from "chartkick"
window.Chartkick = Chartkick;

// for Chart.js
import Chart from "chart.js";
Chartkick.addAdapter(Chart);

// import { myChart } from '../components/highcharts';
// myChart();
// import { mapElement } from '../components/map';
// mapElement();


