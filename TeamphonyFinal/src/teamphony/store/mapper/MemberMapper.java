package teamphony.store.mapper;

import teamphony.domain.Member;

public interface MemberMapper {

	void insertMember(Member member);
	void updateMember(Member member);
	void deleteMember(String memberId);
	Member selectMemberByMemberId(String memberId);
}
