// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BaseContract {
    uint256 private value;

    // Event to log the stored value
    event ValueChanged(uint256 newValue);

    // Constructor to initialize the contract with a value
    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    // Public view function to get the stored value
    function getValue() public view returns (uint256) {
        return value;
    }

    // Internal pure function to add two numbers
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    // Public payable function to allow deposits
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        emit ValueChanged(msg.value);
    }

    // Internal function to set the stored value
    function setValue(uint256 newValue) internal {
        value = newValue;
        emit ValueChanged(newValue);
    }
}

// Derived contract to demonstrate inheritance and access to internal functions
contract DerivedContract extends BaseContract {
    constructor(uint256 _initialValue) BaseContract(_initialValue) {}

    function addValues(uint256 a, uint256 b) public pure returns (uint256) {
        return add(a, b);
    }

    // Public function to set a new value using the internal setValue function
    function updateValue(uint256 newValue) public {
        setValue(newValue);
    }
}
