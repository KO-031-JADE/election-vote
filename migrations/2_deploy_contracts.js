var Election = artifacts.require("../contracts/Election.sol");

module.exports = function(deployer) {
  deployer.deploy(Election);
};

// 먼저 우리가 작성한 계약을 요청하여 “Election”이라는 변수에 할당한다.
// 그 후, 이 변수를 배포된 계약의 manifest에 추가하여 우리가 migrations를 실행할 때 우리 계약이 배포되게끔 해준다.