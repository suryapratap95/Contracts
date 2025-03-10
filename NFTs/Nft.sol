// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MYNFT is ERC721URIStorage, Ownable {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenId;

    uint256 public mintPrice = 0.05 ether;
    uint256 public maxSupply = 1000;
    bool public isSaleActive = false;

    uint256 public maxPerTx = 5;

    mapping(address => bool) public whitelist;

    constructor() ERC721("MYNFT", "MNFT") Ownable(msg.sender) {}

    function mint(string memory tokenURI) public payable returns (uint256) {
        require(isSaleActive, "Sale is not active");
        require(msg.value >= mintPrice, "Insufficient payment");
        require(_tokenId.current() < maxSupply, "Max supply reached");

        _tokenId.increment();
        uint256 newTokenId = _tokenId.current();

        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        return newTokenId;
    }

    function batchMint(string[] memory tokenURIs) public payable {
        require(tokenURIs.length <= maxPerTx, "Exceeds max NFTs per transaction");
        require(msg.value >= mintPrice * tokenURIs.length, "Insufficient payment");
        require(_tokenId.current() + tokenURIs.length <= maxSupply, "Max supply exceeded");

        for (uint i = 0; i < tokenURIs.length; i++) {
            mint(tokenURIs[i]);
        }
    }

    function setMintPrice(uint256 _price) external onlyOwner {
        mintPrice = _price;
    }

    function setSaleActive(bool _isSaleActive) external onlyOwner {
        isSaleActive = _isSaleActive;
    }

    function setMaxPerTx(uint256 _maxPerTx) external onlyOwner {
        maxPerTx = _maxPerTx;
    }

    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        payable(owner()).transfer(balance);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://purple-manual-koala-959.mypinata.cloud/ipfs/";
    }
}
