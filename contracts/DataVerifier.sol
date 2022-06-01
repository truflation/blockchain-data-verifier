// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract DataVerifier is ConfirmedOwner {
  mapping(bytes32 => bytes32) hashes;

  constructor() ConfirmedOwner(msg.sender) {
  }

  function getDataHash
  (string memory key,
   string memory subkey1,
   string memory subkey2,
   int256 data) public pure returns (bytes32) {
     return keccak256(abi.encodePacked(key, subkey1, subkey2, data));
   }

  function getKeyHash
  (string memory key,
   string memory subkey1,
   string memory subkey2) public pure returns (bytes32) {
     return keccak256(abi.encodePacked(key, subkey1, subkey2));
   }

  function addData (
    bytes32 keyHash,
    bytes32 dataHash) public onlyOwner {
    hashes[keyHash] = dataHash;
   }

  function verifyData(
    string memory key,
    string memory subkey1,
    string memory subkey2,
    int256 data) public view returns(int256) {
      bytes32 keyhash = getKeyHash(key, subkey1, subkey2);
      bytes32 savedHash = hashes[keyhash];
      if (savedHash == 0x0) {
         return 2;
      }
      bytes32 dataHash = getDataHash(key, subkey1, subkey2, data);
      if (dataHash != savedHash) {
         return 1;
      }
      return 0;
    }
}
