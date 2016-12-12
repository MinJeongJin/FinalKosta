package teamphony.service.facade;

import java.util.List;

import teamphony.domain.Member;

public interface MemberService {

	void registerMember(Member member);
	void modifyMember(Member member);
	void removeMember(String memberId);
	Member findMemberByMemberId(String memberId);
	void saveStarPoint(String memberId, int starPoint);
	List<Member> findAllMember();
}
