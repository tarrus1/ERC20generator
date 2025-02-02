// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.16 <0.9.0;

contract LookUpContract {
    struct ERC20Token {
        uint256 tokenID;
        address owner;
        string tokenSupply;
        string tokenName;
        string tokenSymbol;
        string tokenAdress;
        string tokenTransactionHash;
        string tokenCreatedDate;
    }

    struct Donation {
        uint256 donationID;
        address donor;
        uint256 fund;
    }
    address payablecontractOwner = payable();

    uint256 public listingPrice = 0.025 ether;
    mapping(uint256 => ERC20Token) private erc20Tokens;
    mapping(uint256 => Donation) private donation;
    uint256 public _tokenIndex;
    uint256 public _donationIndex;

    event DonationReceived(address indexed donor, uint256 amount);
    event ERC20TokenListed(uint256 indexed id, address indexed owner, string indexed token);

    modifier onlyOwner() {
        require(
            msg.sender == contractOwner,
            "only owner of the contract can change the listing price"
        );
        _;
    }

    function createERC20Token(address _owner, string memory _tokenSupply, string memory _tokenName, string memory _tokenSymbol, string memory _tokenAddress, 
    string memory _tokenTransactionHash, 
    string memory _tokenCreateData) payablexternal returns (uint256, address, string memory, string memory, string memory, 
    string memory) {
        _tokenIndex++;
        uint256 __tokenId = _tokenIndex;
        ERC20Token storage erc20Tokens[__tokenId];

        erc20Token.tokenID = __tokenId;
        erc20Token.owner = _owner;
        erc20Token.tokenSupply = _tokenSupply;
        erc20Token.tokenName = _tokenName;
        erc20Token.tokenSymbol = _tokenSymbol;
        erc20Token.tokenAdress = _tokenAddress;
        erc20Token.tokenTransactionHash = _tokenTransactionHash;
        erc20Token.tokenCreatedDate = _tokenCreateData;

        emit ERC20TokenListed(_tokenId, _owner, _tokenAddress);

        return ( _tokenId, _owner, _tokenAddress, _tokenName, _tokenSymbol, _tokenAddress);
    }

    function getAllERC20TokenListed() public view returns (ERC20Token [] memory) {
        uint256 itemCount = _tokenIndex;
        uint256 currentIndex = 0;

        ERC20Token [] memory items = new ERC20Token[](itemCount);
        for (uint256 i = 0; i < itemCount; i++) {
            uint256 currentId = i + 1;
            ERC20Token storage currentItem = erc20Tokens [currentId];
            items[currentIndex] = currentItem;
            cunrrentIndex += 1;
        }

        return items;
    }

    function getERC20Token(uint256 _tokenID) external view returns (
        uint256,
        address,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        ERC20Token memory erc20Token = erc20Tokens[_tokenID];
        return (
            erc20Token.tokenID,

        )
    }


}