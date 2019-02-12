pragma solidity ^0.5.0;

/**
 * A simple contract that let's users increase a number by one with each call.
 */
contract SimpleCounter {
    
    uint public counter = 0;
    
    /**
     * A function to increase the stored number by 1
     */
    function increase()
    public
    {
        counter = counter + 1; // increment it by 1
    }
}
