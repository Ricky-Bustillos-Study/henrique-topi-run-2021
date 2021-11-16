import { api, LightningElement, track } from 'lwc';
import findCities from '@salesforce/apex/CityController.findCities';

export default class City extends LightningElement {

  @api required;

  @api cityCode;

  @api 
  get state() {
    return this._state;
  }
  set state(value) {
    this._state = value;
    this.findCities();
  }

  @track cities = [];

  findCities() {
    findCities({ state: this.state })
      .then(result => this.cities = result )
      .catch(error => {
        console.log(error);
      });
  }

  handleSelected(event) {
    this.cityCode = event.target.value;
    this.publishCitySelected();
  }

  publishCitySelected() {
    const event = new CustomEvent('cityselected', { detail: { cityCode: this.cityCode} });
    this.dispatchEvent(event);
  }

}