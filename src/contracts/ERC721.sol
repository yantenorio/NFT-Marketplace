// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721 {

    event Transfer(
        address indexed from, 
        address indexed to, 
        uint256 indexed tokenId
    );

    //mapping from token id to the owner
    mapping(uint256 => address) private _tokenOwner;

    //mapping from owner to number of owned tokens   
    mapping(address => uint256) private _OwnedTokensCount;

    function _exists(uint256 tokenId) internal view returns(bool){
        
        //check the mapping of the address
        address owner = _tokenOwner[tokenId];

        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal {
        //the address can't be zero
        require(to != address(0) , 'ERC721: minting to the zero address');

        //make sure that  minting an id that doesn't exists
        require(!_exists(tokenId), 'ERC721: token already minted');

        //adding a new address with a token id for minting
        _tokenOwner[tokenId] = to;
        
        //keeping track of each address that is minting and adding one to the count
        _OwnedTokensCount[to] += 1; 

        emit Transfer(address(0), to, tokenId);
    }

}