import { LightningElement } from 'lwc';
export default class FreshDeskTicket extends LightningElement {


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
        //event.preventDefault();

        Console.log('Clicked');
        alert('Clicked');
     }
}