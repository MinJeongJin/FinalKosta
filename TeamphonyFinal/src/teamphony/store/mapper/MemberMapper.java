package teamphony.store.mapper;

import org.apache.ibatis.annotations.Param;

import teamphony.domain.Member;

public interface MemberMapper {

	void insertMember(Member member);
	void updateMember(Member member);
	void deleteMember(String memberId);
	Member selectMemberByMemberId(String memberId);
	void evaluation (@Param("memberId") String memberId, @Param("starPoint") int starPoint);
	double getStarPoint(String id);
}
