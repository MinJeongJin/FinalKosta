package teamphony.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import teamphony.domain.Member;

public interface MemberMapper {

	void insertMember(Member member);
	void updateMember(Member member);
	void deleteMember(String memberId);
	Member selectMemberByMemberId(String memberId);
	void insertStarPoint (@Param("memberId") String memberId, @Param("starPoint") int starPoint);
	List<Integer> getStarPoint(String id);
	List<Member> selectAllMember();
}
