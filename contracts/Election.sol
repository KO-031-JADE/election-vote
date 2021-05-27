pragma solidity >=0.4.22 <0.8.0;


contract Election {
    event votedEvent (
        uint indexed _candidateId
    );
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Read/write candidates
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender],"This Voter has already voted!");

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount, "There is no such candidate");

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidatte vote Count
        candidates[_candidateId].voteCount++;
        
        //triger voted event
        emit votedEvent(_candidateId);
    }
    
}



// contract Election {
//     // Read/write candidate
//     string public candidate;

//     // Constructor
    
//     constructor() public {
//         candidate = "Candidate 1";
//     }
// }
// 먼저 스마트 계약은 solidity version을 선언하는 pragma solidity 구문으로 시작해야 한다.
// “contract” 키워드로 계약 이름을 정의한다.
// candidate 이름을 저장할 string 변수를 정의한다. public으로 설정하게 되면 solidity가 공짜로 해당 변수 내용을 조회할 수 있는 getter 함수를 제공해준다.
// contructor 함수는 스마트 계약이 블록체인에 배포될 때 최초에 한번 실행된다. 우리가 미리 세팅하고자 하는 변수는 migration을 통해 블록체인에 저장된다.