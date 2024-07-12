package dc.human.kimbanbagi.tableJava.common.service;

public interface LoginService {
    public String login(String userId, String userPwd);
    public String getRegister(String userId);
    public String findID(String name, String email);
    public String findPW(String userId, String uName);

}
