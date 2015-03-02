let
  region = "eu-west-1";
  accessKeyId = "maple-leaf";
  ec2 =
    { resources, ... }:
    { deployment.targetEnv = "ec2";
      deployment.ec2.accessKeyId = accessKeyId;
      deployment.ec2.region = region;
      deployment.ec2.instanceType = "t1.micro";
      deployment.ec2.keyPair = resources.ec2KeyPairs.maple-leaf-keypair;
      deployment.ec2.securityGroups = [ "nixos-testing" ];
    };
in
{ maple-leaf = ec2;

  resources.ec2KeyPairs.maple-leaf-keypair =
    { inherit region accessKeyId; };
}
