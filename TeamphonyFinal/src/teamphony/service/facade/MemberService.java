package teamphony.service.facade;

import teamphony.domain.Member;

public interface MemberService {

	void registerMember(Member member);
	void modifyMember(Member member);
	void removeMember(String memberId);
	boolean checkMember(Member member);
	Member findMemberByMemberId(String memberId);
	void saveStarPoint(String memberId, int starPoint);
}
