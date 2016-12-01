package teamphony.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamphony.domain.Member;
import teamphony.service.facade.MemberService;
import teamphony.store.facade.MemberStore;

@Service
public class MemberServiceLogic implements MemberService {

	@Autowired
	private MemberStore store;

	@Override
	public void registerMember(Member member) {
		System.out.println(member.getMemberId());
		System.out.println(member.getPassword());
		System.out.println(member.getAlias());
		store.insertMember(member);
	}

	@Override
	public void modifyMember(Member member) {
		store.updateMember(member);
	}

	@Override
	public void removeMember(String memberId) {
		store.deleteMember(memberId);
	}

	@Override
	public boolean checkMember(Member member) {

		Member loginMember = store.selectMemberByMemberId(member.getMemberId());
		if (!loginMember.getMemberId().isEmpty() && loginMember.getPassword().equals(member.getPassword())) {
			return true;
		}
		return false;
	}

	@Override
	public Member findMemberByMemberId(String memberId) {
		return store.selectMemberByMemberId(memberId);
	}

	@Override
	public void saveStarPoint(Member member) {
		// TODO Auto-generated method stub

	}

}
