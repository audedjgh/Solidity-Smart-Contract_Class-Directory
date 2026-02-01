// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;


/* 
* @title: Subnet Masking
* @author: Tianchan Dong
* @notice: This contract illustrate how IP addresses are distributed and calculated
* @notice: This contract has no sanity checks! Only use numbers provided in constructor
*/ 

contract Masking{

    // Return Variables
    string public Country;
    string public ISP;
    string public Institute;
    string public Device;

    // Maps of IP interpretation
    mapping(uint => string) public Countries;
    mapping(uint => string) public ISPs;
    mapping(uint => string) public Institutions;
    mapping(uint => string) public Devices;

    constructor() {
        Countries[34] = "Botswana";
        Countries[58] = "Egypt";
        Countries[125] = "Brazil";
        Countries[148] = "USA";
        Countries[152] = "France";
        Countries[196] = "Singapore";
        ISPs[20] = "Orange";
        ISPs[47] = "Telkom";
        ISPs[139] = "Vodafone";
        Institutions[89] = "University";
        Institutions[167] = "Government";
        Institutions[236] = "HomeNet";
        Devices[13] = "iOS";
        Devices[124] = "Windows";
        Devices[87] = "Android";
        Devices[179] = "Tesla ECU";
    }

    function IP(string memory input) public {
        // Step 1: Convert binary string to a single uint
        bytes memory b = bytes(input);
        uint256 ipInteger = 0;
        for (uint i = 0; i < b.length; i++) {
            if (b[i] == "1") {
                ipInteger = (ipInteger << 1) | 1;
            } else {
                ipInteger = (ipInteger << 1) | 0;
            }
        }

        // Step 2: Define the 8-bit mask (11111111 in binary is 255)
        uint mask = 255;

        // Step 3: Extract sections using bitwise shifts and the mask
        uint countryCode = (ipInteger >> 24) & mask;
        uint ispCode = (ipInteger >> 16) & mask;
        uint instCode = (ipInteger >> 8) & mask;
        uint deviceCode = ipInteger & mask;

        // Step 4: Map the codes to the predefined strings
        Country = Countries[countryCode];
        ISP = ISPs[ispCode];
        Institute = Institutions[instCode];
        Device = Devices[deviceCode];
    }
}