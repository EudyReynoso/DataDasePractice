const Factorial = (num:number) => {

    if(num == 1) {
        return 1;
    }
    else {
    return num * Factorial(num -1);
    }
} 

console.log(Factorial(12));