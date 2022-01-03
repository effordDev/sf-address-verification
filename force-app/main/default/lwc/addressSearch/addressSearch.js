import { api, LightningElement } from 'lwc';
import addressAutoComplete from '@salesforce/apex/Google.addressAutoComplete'
import addressDetails from '@salesforce/apex/Google.addressDetails'

export default class AddressSearch extends LightningElement {
    
    @api address = {}
    results = []

    isLoading = false

    @api
    clear() {
        this.results = []
        this.address = {}
    }

    get addressSelected() {
        return !!this.address?.name
    }

    async handleAddressSelect(event) {

        this.isLoading = true

        const place_id = event.currentTarget.dataset.id  

        try {
            const data = JSON.parse(await addressDetails({ place_id }))
            
            this.address = data.result

            const address = this.address

            this.dispatchEvent(
                new CustomEvent('addressselect', {
                    detail: {
                        address
                    }
                })
            )

            // console.log(this.address)
        } catch (error) {
            console.error(error)
        } finally {
            this.isLoading = false
        }
    }

    removeAddress() {
        this.address = {}
        this. results = []
    }

    handleSearchChange(event) {
        const search = event.detail.value
        
        clearTimeout(this.uid)

        if (!search) {
            this.results = []
            return
        }

        this.uid = setTimeout(() => {
            this.fetchAddress(search)
        }, 1000)
   }

    async fetchAddress(input) {
        try {
            const response = await addressAutoComplete({ input })
            const data = JSON.parse(response)
    
            if (data.status != 'OK') {
                return
            }
            
            this.results = data.predictions
            console.log(data.predictions)
        } catch (error) {
            console.error(error)
        }
    }
}