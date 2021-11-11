import { api, LightningElement } from 'lwc';

export default class ZipCodeAddress extends LightningElement {

  @api label;
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
    const input = this.template.querySelector('lightning-input');
    if (input.checkValidity()) {
      input.reportValidity();
      return false;
    }
    return true;
  }

}