import { mount } from 'avoriaz'

import Index from 'components/index.vue'

// var chai = require("chai");
// var sinonChai = require("sinon-chai");
// chai.use(sinonChai);

var sport = {
	id: 1,
	name: 'hockey'
}

// var league = {
// 	 name: 'NHL'
// }

// var match = {
// 	 team1: 'Detroit Red Wings',
// 	 team2: 'Boston Bruins'
// }

// const sport = {
//   props: { 
//   	id: 1,
//     name: 'hockey' 
//   }
// }
// const wrapper = mount(FunctionalComponent, { context })
// expect(wrapper.is(FunctionalComponent).to.equal(true)


describe('Index', function() {
  it('brings the user to the match show page and display the teams when a match is clicked on', function() {

  	// var newMatch = new match();
  	// console.log(newMatch);

    const component = mount(Index, { 
    	propsData: {
    		sports: [sport]
      }
    })

    // console.log(sport.name)
    console.log(component.text())

    expect(component.text()).to.include(sport.name)
  })
})








