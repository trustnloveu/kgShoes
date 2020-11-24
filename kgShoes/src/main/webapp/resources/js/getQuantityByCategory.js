
const getQuantityByCategory = () => {
    console.log('getQuantityByCategory');
    axios.get(cpath+'/getQuantityByCategory/').then( 
        (response) => {
            const result = response.data;
            console.log('result : ' + result);
        })
        .catch((e) => {
            console.log('exception : ' + e);
        });

}