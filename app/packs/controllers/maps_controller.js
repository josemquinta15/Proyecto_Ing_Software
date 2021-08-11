import { Controller} from "stimulus"

export default class extends Controller {
    static targets = ["field", "map", "latitude", "longitude"]

    connect() {
        if (typeof (google) != "undefined"){
            this.initializeMap()
        }
    }

    initializeMap() {
        this.map()
        this.marker()
        this.autocomplete()
    }


    map() {
        console.log("Inside the map function")
        if (this._map == undefined){
            this._map = new google.maps.Map(this.mapTarget, {
                center: new google.maps.LatLng(
                    28.48,
                    -81.56
                ),
                zoom: 17
            })
        }
        return this._map
    }

    marker(){

    }

    autocomplete(){
        if (this._autocomplete == undefined) {
            this._autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
            this._autocomplete.bindTo('bounds', this.map())
            this._autocomplete.setFields(['address_components', 'geometry', 'icon', 'name'])
            this._autocomplete.addListener('place_changed', this.locationChanged.bind(this))
        }
        return this._autocomplete
    }

    locationChanged() {
        let place = this.autocomplete().getPlace() 
    }
}