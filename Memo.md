# TODO list

- [ ] dev-java/guava-20.0 matches com.google.guava:guava:27.0-jre, weird!!! Check out what is happening.

- [ ] implement \<optional\>true\</optional\> using USE flags. An artifact which will gain benefit from it: https://repo1.maven.org/maven2/io/projectreactor/netty/reactor-netty/0.9.8.RELEASE/reactor-netty-0.9.8.RELEASE.pom

- [ ] variable ${MAVEN\_PROVIDE} for those who provide many different groupId:artifactId. e.g. org.hibernate:hibernate-entitymanager:6.0.0.Alpha5 has 2 other equivalents.

- [x] use a LUT to map category/package and groupId:artifactId

- [ ] execute things like $(ver\_cut 1-2) while generating cache. shoule be done by whom?
