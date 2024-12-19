import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const url = new URL(location.href)
    this.element.value = url.searchParams.get('search')
  }

  search(e) {
    window.location.search = `search=${e.target.value}`
  }
}
