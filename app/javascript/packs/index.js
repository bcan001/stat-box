/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// custom components
import Vue from 'vue/dist/vue.esm'
// import Vue from 'vue'
import Index from '../components/index.vue'

// import custom nested components
// import Sports from '../components/sports.vue'
// import Leagues from '../components/leagues.vue'
// import Matches from '../components/matches.vue'


// node js components installed with npm
// import VueResource from 'vue-resource'
// import VuePaginator from 'vuejs-paginator'



document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('index'))

  let sportsElement = document.getElementById("sports");
  let sports = JSON.parse(sportsElement.dataset.sports);

  // console.log(sports);

  const index = new Vue({
    el: 'index',
    data: {
      sports: sports
    },
    template: '<Index :sports="sports"/>',
    components: { 
      Index
    }
  })
})

// register custom nested components here
// Vue.component('sports',Sports)
// Vue.component('leagues',Leagues)
// Vue.component('matches',Matches)


// node js
// Vue.component('v-paginator',VuePaginator)



