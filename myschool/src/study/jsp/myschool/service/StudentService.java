package study.jsp.myschool.service;

import java.util.List;

import study.jsp.myschool.model.Student;

public interface StudentService {
    
    /**
     * OO 데이터 상세 조회
     * @param Student 조회할 학과의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public Student getStudentItem(Student input) throws Exception;
    
    /**
     * OO 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Student> getStudentList(Student input) throws Exception;
    
    /**
     * OO 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    public int getStudentCount(Student input) throws Exception;
    
    /**
     * OO 데이터 등록하기
     * @param Student 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int addStudent(Student input) throws Exception;
    
    /**
     * OO 데이터 수정하기
     * @param Student 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int editStudent(Student input) throws Exception;
    
    /**
     * OO 데이터 삭제하기
     * @param Student 삭제할 학과의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    public int deleteStudent(Student input) throws Exception;
    
    
    public List<Student> getStudentAVGList1(Student input) throws Exception;
}
