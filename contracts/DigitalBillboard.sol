pragma solidity ^0.5.0;

contract DigitalBillboard {
    
    string public text = "FOR SALE"; // text to display
    address payable owner; // Owner of the contract who will receive the rent
    uint256 public price = 5000000000000000000; // starting price is 5 eth in wei
    uint lastRentAt = 0; // timestamp of the latest rent

    /**
     * Runs only once, at the creation of the contract
     */
    constructor()
    public
    {
        owner = msg.sender; // owner is the create of the contract
    }

    /**
     * Change the text of the billboard
     */
    function rent(string memory _text)
    public
    payable
    {
        require(price == msg.value, "The sent amount does not match the price.");
        require(now > lastRentAt + 20 seconds, "You can't rent this yet.");
        
        text = _text;
        price = price * 2;
        lastRentAt = now;
        
        owner.transfer(msg.value);
    }
    
    /**
     * The text can be set to empty by the owner for free.
     */
    function censor()
    public
    {
        require(msg.sender == owner, "Only the owner can use the censor function.");
        text = "";
    }
}
