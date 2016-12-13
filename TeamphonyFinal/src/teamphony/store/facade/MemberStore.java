package teamphony.store.facade;

import java.util.List;

import teamphony.domain.Member;

public interface MemberStore {

	void insertMember(Member member);
	void updateMember(Member member);
	void deleteMember(String memberId);
	Member selectMemberByMemberId(String memberId);
	void insertStarPoint(String memberId, double starPoint);
	List<Member> selectAllMember();
}
