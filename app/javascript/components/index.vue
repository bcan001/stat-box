<template>
  <div id="index">

    <div class="row">
      <div class="medium-3 columns">
        <select v-model="option">
          <option v-for="option in options">
            <div>{{option}}</div>
          </option>
        </select> 
      </div>
      <div class="medium-9 columns">
        <input v-model="search">
        <p>{{search}}</p>
      </div>
    </div>

    <div class="row">
      <div class="medium-12 columns">
        <p>
          <button v-on:click="resetData()">reset sort</button>
        </p>
      </div>
    </div>

    <div class="row">
      <div class="medium-2 columns" style="font-weight:bold;">
        id
        <img v-bind:src="sort_desc_image" v-on:click="sortData('id','reverse')" style="height:6%;width:6%;"/>
        <img v-bind:src="sort_asc_image" v-on:click="sortData('id')" style="height:6%;width:6%;"/>
      </div>

      <div class="medium-2 columns" style="font-weight:bold;">
        tpartner_id
        <img v-bind:src="sort_desc_image" v-on:click="sortData('tpartner_id','reverse')" style="height:6%;width:6%;"/>
        <img v-bind:src="sort_asc_image" v-on:click="sortData('tpartner_id')" style="height:6%;width:6%;"/>
      </div>

      <div class="medium-2 columns" style="font-weight:bold;">
        doc_type
        <img v-bind:src="sort_desc_image" v-on:click="sortData('doc_type','reverse')" style="height:6%;width:6%;"/>
        <img v-bind:src="sort_asc_image" v-on:click="sortData('doc_type')" style="height:6%;width:6%;"/>
      </div>

      <div class="medium-2 columns" style="font-weight:bold;">
        version
        <img v-bind:src="sort_desc_image" v-on:click="sortData('version','reverse')" style="height:6%;width:6%;"/>
        <img v-bind:src="sort_asc_image" v-on:click="sortData('version')" style="height:6%;width:6%;"/>
      </div>

      <div class="medium-2 columns" style="font-weight:bold;">
        inbound
        <img v-bind:src="sort_desc_image" v-on:click="sortData('inbound','reverse')" style="height:6%;width:6%;"/>
        <img v-bind:src="sort_asc_image" v-on:click="sortData('inbound')" style="height:6%;width:6%;"/>
      </div>

      <div class="medium-2 columns" style="font-weight:bold;">
        Processed
        <img v-bind:src="sort_desc_image" v-on:click="sortData('processed','reverse')" style="height:6%;width:6%;"/>
        <img v-bind:src="sort_asc_image" v-on:click="sortData('processed')" style="height:6%;width:6%;"/>
      </div>
    </div>


    <index-documents :docs="docs" :app_name="app_name" :route_prefix="route_prefix"></index-documents>


    <div class="row ctr pad1">
      <button v-on:click="getDocuments(selected_page - 1)"><</button>
      <button v-for="page in total_pages" v-on:click="getDocuments(page)" style="display:inline;padding:5px;" v-bind:class="{ selected_page: selected_page == page }">
        {{page}}
      </button>
      <button v-on:click="getDocuments(selected_page + 1)">></button>
    </div>

  </div>
</template>



<script>
  export default {
    props: ['route_prefix','app_name','documents','total_documents'],
    data: function () {
      return {
        columns: this.header_columns,
        selected_page: 1,
        total_pages: calculatePaginationPages(this.total_documents) - 1, 
        total_docs: this.total_documents,
        docs: this.documents,
        search_attribute: '',
        search: '',
        options: ['id','tpartner_id','doc_type','version','inbound','processed'],
        option: 'doc_type',
        order: '',
        sort_attribute: '',
        sort_asc_image: this.route_prefix + '/assets/down-sort2.png',
        sort_desc_image: this.route_prefix + '/assets/up-sort2.png'
      }
    },
    methods: {
      resetData: function () {
        this.option = 'doc_type';
        this.docs = this.documents;
        this.total_pages = calculatePaginationPages(this.total_documents) - 1;
        this.selected_page = 1;
        this.search_attribute = '';
        this.search = '';
        this.order = '';
        this.sort_attribute = '';
      },
      updateDocuments: function (currentSearchResults,searchAttribute,searchString,totalCurrentSearchResults) {
        this.docs = currentSearchResults;
        this.total_docs = totalCurrentSearchResults;
        this.search_attribute = searchAttribute;
        this.search = searchString;
        this.total_pages = calculatePaginationPages(totalCurrentSearchResults);
        this.selected_page = 1;
      },
      getDocuments: function (page) {
        if (page == 0) {
          page = 1;
        } else if (page > this.total_pages) {
          page = this.total_pages;
        }
        
        var axios = require('axios');
        axios.get(this.route_prefix + '/documents/paginate', 
          { params: 
            {
              selected_page: page,
              total_pages: this.total_pages,
              search_attribute: this.search_attribute,
              search_string: this.search,
              selected_page: page,
              order: this.order,
              sort_attribute: this.sort_attribute
            }
          })
          .then(response => {
            this.selected_page = page;
            this.docs = response.data;
          })
          .catch(function (error) {
              console.log(error.message);
          });
      
      },
      sortData: function (fieldName,reverse) {
        if (reverse) {
          this.order = 'desc';
        } else {
          this.order = 'asc'
        };
        this.sort_attribute = fieldName;
        this.selected_page = 1;
        var axios = require('axios');
        axios.get(this.route_prefix + '/documents/sort', 
          { params: 
            {
              order: this.order,
              search_attribute: this.search_attribute,
              search_string: this.search,
              selected_page: this.selected_page,
              sort_attribute: this.sort_attribute
            }
          })
          .then(response => {
            this.docs = response.data.documents;
          })
          .catch(function (error) {
              console.log(error.message);
          });
      },
      getSearchResults: function (currentSearch,searchField) {
        var currentSearchResults = [];
        var axios = require('axios');
        axios.get(this.route_prefix + '/documents/search', 
          { params: 
            {
              search_attribute: searchField,
              search_string: currentSearch,
              selected_page: 1
            }
          })
          .then(response => {
            // this.$emit('updateSearch',response.data.documents,searchField,currentSearch,response.data.total_pages)
            this.updateDocuments(response.data.documents,searchField,currentSearch,response.data.total_pages);
            // this.selected_page = 1;
          })
          .catch(function (error) {
              console.log(error.message);
          });
      }
    },
    watch: {
      // whenever search changes, this function will run
      search: function () {
        // this.search = 'you are typing...'
        this.getSearchResults(this.search,this.option)
      },
      option: function () {
        this.getSearchResults(this.search,this.option)
      }
    }
  }
  // CUSTOM FUNCTIONS:
  function calculatePaginationPages(documentCount) {
    var pageCount = 0
    if (documentCount == 0) {
      pageCount = 1;
    } else {
      pageCount = Math.ceil(documentCount/20);
    }
    console.log(pageCount);
    return pageCount;
  }
</script>



