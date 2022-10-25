pragma solidity >=0.4.22 <0.9.0;
import "./interfaces/i2SVstruct.sol";

import "./VestDAIDO.sol";


contract VestFactory  is i2SVstruct {
     event NewVesting(address, Rule[], Vesting);

    function deployVest( 
        Rule[] calldata _rules,
        Vesting calldata _vestConf
/*         bytes32 _typeContract,        
      uint256 _amount1, 
        uint256 _amount2, 
        address _token1,  //vested tokens from 1st side, address if ERC20 contract, but if isNative ==true, must set to "0x1"
        address _token2,
/*         uint256 _startDate, 
      uint256 _pausePeriod,
        uint8 _vestShare4pauseWithdraw,
        uint8 _voteShareAbort, 
        bool _isNative,
        address _teamWallet */
        
        )   public  {
            /// @notice Explain to an end user what this does
            /// @dev Explain to a developer any extra details
            /// @param Documents a parameter just like in doxygen (must be followed by parameter name)
            /// @return Documents the return variables of a contract’s function state variable
            /// @inheritdoc	Copies all missing tags from the base function (must be followed by the contract name)
        Vesting memory vest = _vestConf;/* Vesting(
          { amount1: _amount1, //total amount tokens of 1st side  that sends to  2nd side,  f.e. amount of team's token for this period that sends to investors.  //vested tokens, if isNative ==true, must set to "0x1"
          amount2:  _amount2, // total amount tokens of 2st side  that sends to  1nd side,  f.e  amount of invested  token  that sends to team            
          token1:  _token1, //bought tokens
          token2:  _token2, //vested tokens , if isNative ==true, must set to "0x1"
          raisedToken1:  0,
          raisedToken2: 0,
/*           startDate: _startDate,
       pausePeriod: _pausePeriod,
          vestShare4pauseWithdraw: _vestShare4pauseWithdraw,
          voteShareAbort: _voteShareAbort, //share of stakes needed to approve voting in this vesting
          isNative:_isNative, // true if this vesting uses blockchain native token to vest, f.e. ETH in Ethereum mainnet
          status: 0,
          teamWallet:  _teamWallet }); */
        //if (/* typeContract == "DAIDO" */true) {


            VestDAIDO vsd = new VestDAIDO();
            if (_vestConf.isNative ) vest.token1 = address(0x1);
            vsd.setVesting (            
                vest,
                _rules);
           emit NewVesting(address(vsd), _rules, vest);
    //    }
        
    }
}