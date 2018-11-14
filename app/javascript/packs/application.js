import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import Chartkick from "chartkick"
window.Chartkick = Chartkick;

// for Chart.js
import Chart from "chart.js";
Chartkick.addAdapter(Chart);
initUpdateNavbarOnScroll();

// import { myChart } from '../components/highcharts';
// myChart();
// import { mapElement } from '../components/map';
// mapElement();


