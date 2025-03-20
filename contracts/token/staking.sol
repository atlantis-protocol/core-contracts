// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }

    function min(uint256 x, uint256 y) internal pure returns (uint256 z) {
        z = x < y ? x : y;
    }

    // babylonian method (https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method)
    function sqrt(uint256 y) internal pure returns (uint256 z) {
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }
}

interface IxAQUA is IERC20 {
    function lock(uint256 _amount) external;

    function redeem(uint256 _amount) external;

    function burnFrom(address account, uint256 amount) external;
}

contract AQUAStake {
    using SafeMath for uint256;

    struct LockInfo {
        uint256 amount;
        uint256 prevReward;
        uint256 unlockTime;
        uint256 day;
        uint256 rewardAmount;
    }

    mapping(address => LockInfo[]) public userLock;

    uint256 public secInDay = 86400;
    uint256 minRedeemDays = 15;
    uint256 maxRedeemDays = 90;
    uint256 minRedeemDuration = minRedeemDays * secInDay;
    uint256 maxRedeemDuration = maxRedeemDays * secInDay;
    uint256 minRedeemRatio = 50;
    uint256 maxRedeemRatio = 100;

    IxAQUA private AQUA;
    IxAQUA private xAQUA;

    constructor(IxAQUA _AQUA, IxAQUA _xAQUA) {
        AQUA = _AQUA;
        xAQUA = _xAQUA;
    }

    function lock(uint256 _amount) public {
        require(AQUA.transferFrom(msg.sender, address(this), _amount));
        AQUA.approve(address(xAQUA), _amount);
        xAQUA.lock(_amount);
        xAQUA.transfer(msg.sender, _amount);
    }

    function initializeRedeem(uint256 _amount, uint256 _days) public {
        require(
            _days >= minRedeemDays || _days <= maxRedeemDays,
            "Lock time not valid"
        );
        require(xAQUA.balanceOf(msg.sender) >= _amount, "insufficent balance");
        xAQUA.transferFrom(msg.sender, address(this), _amount);
        uint256 unlockTime = block.timestamp + (_days * secInDay);

        uint256 ratio = getRedeemRatio(_days);
        uint256 rewardAmount = _amount.mul(ratio).div(100);

        LockInfo memory info = LockInfo(
            _amount,
            0,
            unlockTime,
            _days,
            rewardAmount
        );

        userLock[msg.sender].push(info);
    }

    function finalizeRedeem(uint256 index) public {
        require(index < userLock[msg.sender].length, "index not valid");
        LockInfo memory info = userLock[msg.sender][index];
        require(block.timestamp >= info.unlockTime, "lock time not expired");

        xAQUA.redeem(info.amount);

        uint256 MMFresidual = info.amount.sub(info.rewardAmount);

        if (MMFresidual > 0) {
            AQUA.approve(address(this), MMFresidual);
            AQUA.burnFrom(address(this), MMFresidual);
        }

        AQUA.transfer(msg.sender, info.rewardAmount);

        _deleteRedeemEntry(index, msg.sender);
    }

    function getRedeemRatio(uint256 _days) public view returns (uint256) {
        if (_days >= maxRedeemDays) return maxRedeemRatio;
        else if (_days == minRedeemDays) return minRedeemRatio;

        return
            minRedeemRatio.add(
                (_days.sub(minRedeemDays))
                    .mul(maxRedeemRatio.sub(minRedeemRatio))
                    .div(maxRedeemDays.sub(minRedeemDays))
            );
    }

    function _deleteRedeemEntry(uint256 index, address user) internal {
        userLock[user][index] = userLock[user][userLock[user].length - 1];
        userLock[user].pop();
    }

    function getUserRedeemLength(address user) public view returns (uint256) {
        return userLock[user].length;
    }

    function getUserRedeem(
        address user,
        uint256 index
    )
        public
        view
        returns (uint256 amount, uint256 rewardAmount, uint256 endTime)
    {
        require(index < userLock[user].length, "index not valid");
        LockInfo memory info = userLock[user][index];
        amount = info.amount;
        endTime = info.unlockTime;
        rewardAmount = info.rewardAmount;
    }
}
