<template>
  <div id="matches">
  	<div v-for="match in original_matches">
  		{{match.name}}
  	</div>
  </div>
</template>


<script>
  export default {
    props: ['matches'],
    data: function () {
      return {
        original_matches: this.matches
      }
    },
    methods: {

    }
  }
</script>




