package com.smart.home.dto;

import lombok.Data;

@Data
public class MemberAchievementDTO {
	// ȸ�����̵�
	private String memberId;
	
	// ç���� ��ȣ
    private int chalNo;
    
    // ç���� �޼���
    private double achievementRate;
    
    // ç���� �޼�Ƚ��
    private int achievement_count;
    
}
