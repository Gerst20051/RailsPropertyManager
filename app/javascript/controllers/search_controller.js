import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'minBedrooms', 'search' ]

  connect() {
    const url = new URL(location.href)
    this.searchTarget.value = url.searchParams.get('search')
    this.minBedroomsTarget.value = url.searchParams.get('minBedrooms')
  }

  search(e) {
    window.location.search = `search=${e.target.value}`
  }

  bedrooms(e) {
    window.location.search = `minBedrooms=${e.target.value}`
  }
}
