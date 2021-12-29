// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721Connector.sol';

contract Hurt is ERC721Connector {  

    //array to store nfts
    string[] public HurtzArray;

    mapping(string => bool) _hurtzExists;

    function mint(string memory _hurt) public {
        
        require(!_hurtzExists[_hurt], 'Hurtz already exists');

        HurtzArray.push(_hurt);
        uint256 _id = HurtzArray.length - 1;

        _mint(msg.sender, _id);

        _hurtzExists[_hurt] = true;
    } 

    constructor() ERC721Connector('Hurt', 'Broken') {}

}
