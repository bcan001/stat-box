<template>
  <div id="index">
    <div v-for="sport in sports">
      <p>{{sport}}</p>
    </div>
  </div>
</template>

<script>
  export default {
    el: '#index-new',
    props: ['sports'],
    data: function () {
      return {
        original_sports: this.sports
      }
    }
  }
  // CUSTOM FUNCTIONS:
  // function calculatePaginationPages(documentCount) {
  //   var pageCount = 0
  //   if (documentCount == 0) {
  //     pageCount = 1;
  //   } else {
  //     pageCount = Math.ceil(documentCount/20);
  //   }
  //   console.log(pageCount);
  //   return pageCount;
  // }
</script>



