//SPDX-License-Identifier:MIT
pragma solidity ^0.8.4;

contract FakeNFTMarketplace {
    // Maintain a mapping of Fake TokenID to Owner addresses
    mapping(uint256 => address) public tokens;
    // Set the purchase price for each Fake NFT
    uint256 nftPrice = 0.1 ether;

    // purchase() takes some ETH , and marks the msg.sender address
    // as the owner of some NFT

    function purchase(uint256 _tokenId) external payable {
        require(msg.value == nftPrice, "This NFT costs 0.1 ether");
        tokens[_tokenId] = msg.sender;
    }

    // getPrice() returns the prcie of one NFT
    function getPrice() external view returns (uint256) {
        return nftPrice;
    }

    // available() checks whether the give tokenId has already been sold or not

    function available(uint256 _tokenId) external view returns (bool) {
        if (tokens[_tokenId] == address(0)) {
            return true;
        }
        return false;
    }
}
