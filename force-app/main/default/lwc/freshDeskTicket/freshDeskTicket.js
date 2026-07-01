import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import craeteTicket from '@salesforce/apex/FreshdeskTicketController.craeteTicket';
export default class FreshDeskTicket extends LightningElement {

    isLoading = false;

    ticketInformation={
        'Status': '2'
    };

    get typeOptions(){
        return [
            {label: 'Incident', value: 'Incident'}
        ]
    }

    get sourceOptions(){
        return [
            {label: 'Email', value: '1'},
            {label: 'Portal', value: '2'},
            {label: 'Phone', value: '3'},
            {label: 'Chat', value: '7'},
            {label: 'Feedback Widget', value: '9'},
            {label: 'Outbound Email', value: '10'}
        ]
    }

    get statusOptions(){
        return [
            {label: 'Open', value: '2'},
            {label: 'Pending', value: '3'},
            {label: 'Resolved', value: '4'},
            {label: 'Closed', value: '5'}
        ]
    }

    get priorityOptions(){
        return [
            {label: 'Low', value: '1'},
            {label: 'Medium', value: '2'},
            {label: 'High', value: '3'},
            {label: 'Urgent', value: '4'}
        ]
    }


     handleClick(event){
        event.preventDefault();

        const allValid = [...this.template.querySelectorAll('lightning-input, lightning-textarea, lightning-combobox')]
        .reduce((validSoFar, inputCmp) => {
        return inputCmp.reportValidity() && validSoFar;
        }, true);


        if(allValid){
            console.log('Clicked');
            console.log(JSON.stringify(this.ticketInformation));
            craeteTicket({ inputMap: this.ticketInformation })
              .then(result => {
                console.log('Result', result);
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Ticket Created Successfullyy',
                            variant: 'success',
                            mode: 'dismissable'
                        })
                    );
                })
              .catch(error => {
                console.error('Error:', error.body.message || error.message);
                  this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error',
                            message: 'Error Occured',
                            variant: 'error',
                            mode: 'dismissable'
                        })
                    );
            })
            .finally(()=>{
                this.isLoading = false;
            })
        }
    }

    changeHandler(event){
         event.preventDefault();

         let name= event.target.name;
         let value= event.target.value;

         this.ticketInformation[name]=value;   
    }
}