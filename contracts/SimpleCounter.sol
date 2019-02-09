pragma solidity ^0.5.0;

/**
 * A simple contract that let's users increase a number by one with each call.
 * It can only be increased by 
 */
contract SimpleCounter {
    
    uint counter = 0;
    
    address lastUser; // address used last time to increment the counter
    
    /**
     * Runs only once, at the creation of the contract
     */
    constructor()
    public
    {
        lastUser = msg.sender; // set the initial value to the contract creator
    }
    
    /**
     * A function to increase the stored number by 1
     */
    function increase()
    public
    {
        require(lastUser != msg.sender); // it can't be increased from the same address which increased it the last time
        
        lastUser = msg.sender; // update the last user's address
        counter = counter + 1; // increament it by 1
    }
}
