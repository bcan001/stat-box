<template>
  <div id="index-documents">
    <div class="row" v-for="doc in docs" :key="doc.id">

      <div class="medium-2 columns">
        {{doc.id}}
      </div>

      <div class="medium-2 columns">
        {{doc.tpartner_id}}
      </div>

      <div class="medium-2 columns">
        {{doc.doc_type}}
      </div>

      <div class="medium-2 columns">
        {{doc.version}}
      </div>

      <div class="medium-2 columns">
        {{doc.inbound}}
      </div>
      
      <div class="medium-2 columns">
        
        <div v-if="doc.processed == 'T'">
          <a v-bind:href="route_prefix + '/documents/' + doc.id">
            <img v-bind:src="image" style="height:10%;width:10%;"/>
          </a>
        </div>
        <div v-else>&nbsp;</div>
        
      </div>

    </div>
  </div>
</template>

<script>
  export default {
    props: ['docs','app_name','route_prefix'],
    data: function () {
      return {
        image: this.route_prefix + '/assets/edit-doc.png'
      }
    }
  }
</script>