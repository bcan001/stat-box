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
import Index from '../components/index.vue'

// import custom nested components
import Sports from '../components/sports.vue'
import Leagues from '../components/leagues.vue'
import Matches from '../components/matches.vue'


// node js components installed with npm
// import VueResource from 'vue-resource'
// import VuePaginator from 'vuejs-paginator'



document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('index'))

  let routePrefixElement = document.getElementById("route_prefix")
  let routePrefix = routePrefixElement.dataset['routePrefix']

  let appNameElement = document.getElementById("app_name")
  let appName = appNameElement.dataset['appName']

  let element = document.getElementById("documents")
  let documents = JSON.parse(element.dataset.documents)

  let totalDocumentsElement = document.getElementById("total_documents")
  let totalDocuments = totalDocumentsElement.dataset['totalDocuments']


  const index = new Vue({
    el: 'index',
    data: {
      route_prefix: routePrefix,
      app_name: appName,
    	documents: documents,
      total_documents: totalDocuments
    },
    template: '<Index :route_prefix="route_prefix" :app_name="app_name" :documents="documents" :total_documents="total_documents"/>',
    components: { 
      Index
    }
  })
})

// register custom nested components here
Vue.component('sports',Sports)
Vue.component('leagues',Leagues)
Vue.component('matches',Matches)


// node js
// Vue.component('v-paginator',VuePaginator)



