import { LightningElement, wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import BILLING_STATE from '@salesforce/schema/Account.BillingState__c';

const STATES = [
  { label: 'Acre', value:'AC'},
  { label: 'Alagoas', value:'AL'},
  { label: 'Amapá', value:'AP'},
  { label: 'Amazonas', value:'AM'},
  { label: 'Bahia', value:'BA'},
  { label: 'Ceará', value:'CE'},
  { label: 'Distrito Federal', value:'DF'},
  { label: 'Espírito Santo', value:'ES'},
  { label: 'Goiás', value:'GO'},
  { label: 'Maranhão', value:'MA'},
  { label: 'Mato Grosso', value:'MT'},
  { label: 'Mato Grosso do Sul', value:'MS'},
  { label: 'Minas Gerais', value:'MG'},
  { label: 'Pará', value:'PA'},
  { label: 'Paraíba', value:'PB'},
  { label: 'Paraná', value:'PR'},
  { label: 'Pernambuco', value:'PE'},
  { label: 'Piauí', value:'PI'},
  { label: 'Rio de Janeiro', value:'RJ'},
  { label: 'Rio Grande do Norte', value:'RN'},
  { label: 'Rio Grande do Sul', value:'RS'},
  { label: 'Rondônia', value:'RO'},
  { label: 'Roraima', value:'RR'},
  { label: 'Santa Catarina', value:'SC'},
  { label: 'São Paulo', value:'SP'},
  { label: 'Sergipe', value:'SE'},
  { label: 'Tocantins', value:'TO'}
];

export default class AccountBillingAddress extends LightningElement {

  zipCode;
  street;
  streetNumber;
  streetAditionalInfo;
  state;
  city;

  @wire(getPicklistValues, { recordTypeId: '012000000000000AAA', fieldApiName: BILLING_STATE })
  getStates({data}) {
    return data;
  }

  constructor() {
    super();
    console.log('AccountBillingAddress constructor');
  }

  connectedCallback() {
    this.zipCode = '07132-030';
    console.log('AccountBillingAddress connected');
  }
  
  renderedCallback() {
    console.log('AccountBillingAddress rendered');
  }

  disconnectedCallback() {
    console.log('AccountBillingAddress disconnected');
  }

  get states() {
    return STATES;
  }

  isValid() {
    const component = this.template.querySelector('c-zip-code-address');

    console.log( component.isValid() );
  }

  handleSave(event) {
    if(this.isValid() ) console.log('Tudo validado');
  }

  handleChange(event) {
    this[event.target.name] = event.target.value;
  }

  handleAddressFound(event) {
    this.street = event.detail.street;
    this.streetAditionalInfo = event.detail.streetAditionalInfo;
    this.city = event.detail.city;
    this.state = event.detail.state;
  }

  handleSelectedCity(event) {
    this.city = event.detail.cityCode;
  }

}