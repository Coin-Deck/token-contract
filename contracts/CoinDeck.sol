// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

/// @title Coin Deck Token (DECK)
/// @notice This contract implements the Coin Deck Token (DECK) with burnable, permit, and voting functionalities.
/// @dev This contract uses OpenZeppelin's ERC20, ERC20Burnable, ERC20Permit, and ERC20Votes implementations.
/// @dev The token has a total supply of 100 billion tokens (with 7 decimals), all minted to the provided admin address.
contract CoinDeck is ERC20, ERC20Burnable, ERC20Permit, ERC20Votes {
    
    /// @notice The total supply of DECK tokens in base units (100 billion tokens with 7 decimal places).
    uint256 internal constant TOTAL_SUPPLY = 100_000_000_000 * 10 ** 7;

    /// @notice Constructor to create the Coin Deck Token.
    /// @param _admin The address of the admin who will receive the total supply.
    /// @dev The admin address cannot be the zero address.
    constructor(address _admin) ERC20("CoinDeck", "DECK") ERC20Permit("CoinDeck") {
        require(_admin != address(0), "ADDRESS_ZERO");
        _mint(_admin, TOTAL_SUPPLY);
    }

    /// @notice Override to set 7 decimals instead of the default 18.
    /// @return The number of decimals used for the token.
    function decimals() public pure override returns (uint8) {
        return 7;
    }

    /// @notice Handles post-transfer logic required for ERC20Votes.
    /// @inheritdoc ERC20
    function _afterTokenTransfer(address from, address to, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }

    /// @notice Handles minting logic required for ERC20Votes.
    /// @inheritdoc ERC20
    function _mint(address to, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._mint(to, amount);
    }

    /// @notice Handles burning logic required for ERC20Votes.
    /// @inheritdoc ERC20
    function _burn(address account, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._burn(account, amount);
    }
}
