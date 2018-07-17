import { mount } from 'avoriaz'

import Index from 'components/index.vue'

// var chai = require("chai");
// var sinonChai = require("sinon-chai");
// chai.use(sinonChai);

var formatDate = function(date) {
	var newDate = new Date(date);
  newDate = newDate.strftime("%A %B %d, %I:%M %p");
  return newDate;
}


var sport = {
	id: 1,
	name: 'hockey',
	leagues: [
		{
			name: 'NHL'
			// matches: [
			// 	{	
			// 		match_datetime: 'Fri, 08 Jun 2018 00:33:29 UTC +00:00',
			// 		team1: {
			// 			name: 'Washington Capitals'
			// 		},
			// 		team2: {
			// 			name: 'Detroit Red Wings'
			// 		}
			// 	}
			// ]
		},
		{
			name: 'USHL'
			// matches: [
			// 	{	
			// 		match_datetime: 'Fri, 08 Jun 2018 00:33:29 UTC +00:00',
			// 		team1: {
			// 			name: 'Washington Capitals'
			// 		},
			// 		team2: {
			// 			name: 'Detroit Red Wings'
			// 		}
			// 	}
			// ]
		}
	]
}


describe('Index', function() {
  it('the index page has the available sports on it', function() {
    const component = mount(Index, { 
    	propsData: {
    		sports: [sport]
      }
    })

    console.log(component.text())
    expect(component.text()).to.include(sport.name)
  })
})




















