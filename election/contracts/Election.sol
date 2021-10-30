pragma solidity >=0.4.0 <0.7.0;

contract Election {


//Modal a candidate
struct Candidate {
	 uint id ;
	 string name ;
	 uint voteCount ;
}
// Store candidate
//Fetch candidate

// Store accounts that have voted
    mapping(address => bool) public voters;

// hash in solidity, key value pairs
mapping(uint => Candidate) public candidates;

// Store candidates count
	uint public candidatesCount;

	 // voted event
    event votedEvent (
        uint indexed _candidateId
    );



	 // Constructor 
// same name as contract name similar to java class
	 constructor() public {
	 	addCandidate("Congress");
	 	addCandidate("BJP");
	 	addCandidate("AAP");
	 }



	 function addCandidate(string memory _name) private {
	 	candidatesCount++;
	 	candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	 }


	 function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
       emit votedEvent(_candidateId);
    }
}

