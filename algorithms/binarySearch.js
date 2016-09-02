var bSearch = function(n, arr){
    if (arr.length > 0){
        var middleIndex = Math.floor(arr.length/2);
        var middle = arr[middleIndex];

        if (n > middle){
           bSearch(n, arr.slice(middleIndex+1));
        }

        else if(n === middle){
            return true;
        }

        else{
            bSearch(n, arr.slice(0, middleIndex));
        }
    }
    return false;
};
