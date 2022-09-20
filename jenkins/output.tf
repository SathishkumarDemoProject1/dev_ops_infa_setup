output "jenkins_public_dns" {
    value = aws_instance.jenkins_master.public_dns
}

output "sonar_public_dns" {
    value = aws_instance.sonar_machine.public_dns
}