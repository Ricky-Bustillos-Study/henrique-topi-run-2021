import { api, LightningElement, track } from 'lwc';
import findAddressByZipCode from '@salesforce/apex/ZipCodeController.findAddressByZipCode';

export default class ZipCodeAddress extends LightningElement {

  @api label;

  @track address = {};

  @api
  get zipCode() {
    return this._zipCode;
  }
  set zipCode(zipCode) {
    this._zipCode = zipCode;
  }

  @api
  get required() {
    return this._required;
  }
  set required(required) {
    this._required = required !== false;
  }

  constructor () {
    super();
    console.log('zipCodeAddress constructor');
  }

  connectedCallback() {
    console.log('zipCodeAddress connected');
  }

  renderedCallback() {
    console.log('zipCodeAddress rendered');
  }

  disconnectedCallback() {
    console.log('zipCodeAddress disconnected');
  }

  @api
  isValid() {
    const inputComponent = this.template.querySelector('lightning-input');
    if (!inputComponent.checkValidity()) {
      inputComponent.reportValidity();
      return false;
    }
    return true;
  }

  handleChange(event) {
    this.zipCode = event.target.value;
    this.isValid && this.findAddress();
  }

  findAddress() {
    findAddressByZipCode({ zipCode: this.zipCode })
      .then(result => {
        this.address = result;
        this.publishAddressFoundEvent();
      })
      .catch(error => console.log("Error: ", error))
  }

  publishAddressFoundEvent() {
    const event = new CustomEvent('addressfound', { detail: this.address });
    this.dispatchEvent(event);
  }

}