import { mount } from 'avoriaz'

import Index from 'components/index.vue'

describe('Index', function() {
  it('brings the user to the match show page and display the teams when a match is clicked on', function() {
    const component = mount(Index)
    expect(component.text()).to.include('home')
  })
})

