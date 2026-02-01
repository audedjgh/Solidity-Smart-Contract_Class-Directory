# EXERCISE 1 : 
## Question 5 : 
After opening the .html file on a local sever, and pressing the button “check your metamask balance, this is the answer : 


The answer is correct because while my MetaMask is currently connected to the Sepolia Test Network (where I have 0.300 SepoliaETH), the website logic is querying my balance on the Ethereum Mainnet. On the Mainnet, my balance is indeed 0 Wei, so the application is accurately reflecting the state of my account on that specific network.

# EXERCISE 2 :
## Part A :
GitHub uses RSA to verify your identity through asymmetric cryptography, which pairs a public key with a private key. Here, the roles of the keys are reversed compared to the encryption used in the last exercise. You upload the public key to GitHub to serve as a "lock," while keeping the private key secure on your local machine as the "key." When you push code, GitHub issues a challenge that only your local private key can resolve, proving your identity without requiring a password.
The difference lies in the fact that the private key is used for signing and authentication to prove origin, while the public key is for encryption and verification. Using a private key is appropriate when you need to authorize actions, like a Git commit or a blockchain transaction, because it provides a unique digital signature. Conversely, the public key is appropriate for ensuring confidentiality, as it allows others to encrypt data that only you can decrypt.

## Part B : 








# EXERCISE 3 : 

### Node Reliability and Network Integrity
In this class simulation, the nodes functioned as part of a distributed mesh network, where each participant was responsible for receiving and relaying data. However, the simulation revealed that not all peers were honest or reliable. My observation of the data flow showed that messages frequently arrived with shifted or missing letters, with errors often originating from the same specific people (nodes).
My conclusion regarding "adversarial" behaviour was reinforced by my own role, which required me to introduce errors periodically. This led to the logical deduction that other participants were likely assigned roles as malicious or faulty nodes to simulate Byzantine failures – a real-world scenario where nodes in a blockchain may crash or intentionally propagate incorrect data to subvert the network. We saw this clearly in rounds where the workload was heavy and information loss was high.

### Network Topologies and Consensus Mechanisms
The simulation explored various architectures, primarily focusing on distributed topologies. However, one specific round introduced a decentralized structure by splitting the class into two teams connected via a single "bridge" node. This bridge acted as a bottleneck, mirroring how inter-operability works between different blockchain shards or sidechains. As noted in my observations, the bridge was often overwhelmed, which made passing information between teams inefficient.
The consensus mechanisms evolved throughout the game to mirror different blockchain protocols :
•	Speed-based Consensus : Early rounds rewarded the first node to broadcast a correct message, similar to the "race" in Proof of Work (PoW) where the first to find a solution wins the block.
•	Economic Stake (Betting) : allowed us to bet accumulated points for the right to validate the message, with a penalty for incorrect answers. This is a direct parallel to Proof of Stake (PoS), where "slashing" conditions penalize validators for submitting fraudulent data.
•	Majority Voting : In one round, a single node proposed the "original message," and points were only awarded if more than half the class agreed. While this might seem like Proof of History, it is actually a simulation of Byzantine Fault Tolerance (BFT). In this model, the network relies on a majority (51%) to verify the validity of a block, ensuring that a few bad actors cannot corrupt the final record.
Real-World Similarities : These simulations share deep similarities with real blockchain operations. The "bridge" node observation reflects the latency and central points of failure inherent in cross-chain bridges. Furthermore, the shift from speed-based to stake-based consensus mirrors the industry’s broader transition from energy-intensive PoW to capital-efficient PoS models. The errors observed during propagation illustrate the propagation delay and data packet loss that real protocols must solve using gossip protocols.

### Performance Parameters and Consultancy Recommendations
Based on my observations, several parameters dictate network efficiency :
1.	Propagation Interval vs. Accuracy : As seen in Round 2 (45s) versus Round 3 (10s), shorter intervals increased the workload and led to significant "message errors".
2.	Redundancy (Propagation Repeats) : Increasing the number of message copies (e.g., 3 copies in Rounds 6-9) must have improved reliability but increased the "heavy workload" on individual nodes.
3.	Topology Complexity : The "bridge" in Round 4 proved that specialized roles can overwhelm certain nodes, leading to "heavy workload" and "partial messages".

#### Consultancy Recommendations
If I were advising a blockchain protocol, I would base my recommendations on three key questions derived from our simulation:
##### • What is the required Tolerance for Latency ? 
Our simulation showed that pushing speed too far causes collapse; while a 45s interval was stable, the 10s interval in Round 3 caused "heavy workload" and significant "information loss". A protocol must set its block times based on the physical reality of its nodes' propagation limits. I would recommend a threshold that ensures data integrity is never sacrificed for raw speed.
##### •	What is the optimal redundancy level (Number of Copies) ? 
The simulation highlighted a critical trade-off regarding message replication. Increasing the number of copies (e.g., from 2 to 3 copies in later rounds) successfully reduced "message error" and ensured less information was lost during propagation. However, this came at the cost of a "heavy workload" for every node involved. I would advise the protocol to find a balance where redundancy is high enough to survive "Byzantine" peers but low enough to prevent network congestion.
##### •	How should the network balance Throughput vs. Decentralization ? 
In Round 4, the "bridge" node created a faster way to organize teams but became a massive bottleneck and single point of failure that was "overwhelmed". This reflects the "Blockchain Trilemma." I would advise the protocol to avoid over-reliance on centralized bridge nodes or "super-nodes" if they want to maintain the resilience of a truly distributed mesh.
