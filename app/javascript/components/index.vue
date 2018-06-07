<template>
  <div id="index">

    <div class="container-fluid">

      <ul class="nav nav-tabs pad20-top">
        <li class="nav-item">
          <a v-on:click="getSelectedSport('home')" class="nav-link active home-tab">home</a>
        </li>

        <div v-for="sport in original_sports">
          <li class="nav-item">
            <a v-on:click="getSelectedSport(sport.name)" class="nav-link" v-bind:class="sport.name + '-tab'">{{sport.name}}</a>
          </li>
        </div>

        <li  style="float: right; margin-left: auto;">
          &nbsp;
        </li>
      </ul>

      <!-- Tab panes -->
      <div class="container-fluid pad20-top">
        <div class="row">
          <div class="col-sm-12 col-md-3">
            
            <div class="card pad10-top">
              <div class="card-body">

                <form class="form-inline pad20-bottom">
                  <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" style="width:60%;">
                  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
          


                <div class="pad20-top">
                  <h5>SPORTS:</h5>
                  <nav class="nav flex-column">
                 
                    <div v-for="sport in original_sports">
                      <a v-on:click="getSelectedSport(sport.name)" class="nav-link" v-bind:class="sport.name + '-tab'">{{sport.name}}</a>
                    </div>
                  </nav>
                </div>


              </div>
            </div>

          </div>
          <div class="col-sm-12 col-md-7">
            <div class="pad10-top">
        
              <h5 class="pad20-bottom">
                STAT-BOX - Accurate Sports Statistics
              </h5>

              <div v-for="sport in selected_sports">
                <h4>{{sport.name}}</h4>

                <ul class="nav nav-tabs pad10-top">
                  <div v-for="(league,index) in sport.leagues">
                     
                    <li class="nav-item">
                      <a v-on:click="getSelectedSportLeague(sport.name,league.name)" class="nav-link" v-bind:class="sport.name + '-tab ' + league.name + '-tab'" v-bind:id="league.name + '-tab'">{{league.name}}</a>
                    </li>
                   
                    <li  style="float: right; margin-left: auto;">
                      &nbsp;
                    </li>
                    
                  </div>
                
                </ul>


       

                <div class="tab-content" id="myTabContent">
                  <div v-for="league in sport.leagues" class="pad10-top">

                    <div class="tab-pane fade active show" v-bind:id="league.name" role="tabpanel" v-bind:aria-labelledby="league.name + '-tab'">
                      <div v-for="match in league.matches">
                        {{match.match_datetime}}

                        {{match.team1.name}} vs {{match.team2.name}}
                      </div>
                    </div>
  

                  </div>
                </div>





                <hr>
              </div>


            </div>
          </div>
          <div class="col-sm-12 col-md-2">
            
            <div class="card pad10-top">
              <div class="card-body">
                <p>Now on Stat-Box</p>


                


              </div>
            </div>

          </div>
        </div>
      </div>


      <!--  -->

    </div>



  </div>
</template>

<script>
  export default {
    props: ['sports'],
    data: function () {
      return {
        original_sports: this.sports,
        selected_sports: this.sports
      }
    },
    methods: {
      getSelectedSport: function(sport) {
        // console.log(sport.name);
        $(".active").removeClass('active');
        $("." + sport + "-tab").addClass('active');

        if (sport == 'home') {
          this.selected_sports = this.original_sports;
        } else {
          this.selected_sports = this.original_sports.filter(function (s) { return s.name.match(sport); });;
        }
      },
      getSelectedSportLeague: function(sport,league) {
        console.log(league);
        console.log(sport);
      }
    },
    watch: {


    }
  }

  function changePage() {

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

  $(document).ready(function(){
    // $('#NHL-tab:first').addClass('active');
    // $('#NHL:first').addClass('show');

    // $('.league-tab:first').addClass('active');
    // $('.league:first').addClass('show');
  })
</script>






