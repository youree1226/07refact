package com.model2.mvc.common.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;


public class CommonUtil {
	//�� Ŭ������ DB������ ���� ��ƿ�� ��
	
	///Field
	///Constructor
	
	///Method
	public static String null2str(String org, String converted) {
		//null�� ���� nullString����...
		if (org == null || org.trim().length() == 0)
			return converted;
		else
			return org.trim();
	}

	public static String null2str(String org) {
		//null�� ���� nullString����...
		return CommonUtil.null2str(org, "");
	}

	public static String null2str(Object org) {
		//null�� ���� nullString����...BigDecimal �̰� ����...��...��
		if (org != null && org instanceof java.math.BigDecimal) {
			return CommonUtil.null2str((java.math.BigDecimal) org, "");
		} else {
			return CommonUtil.null2str((String) org, "");
		}
	}

	public static String null2str(java.math.BigDecimal org, String converted) {
		if (org == null)
			return converted;
		else
			return org.toString();
	}

	public static String null2str(java.math.BigDecimal org) {
		return CommonUtil.null2str(org, "");
	}

	public static String toDateStr(String dateStr) {
		//��¥�������� �ٲ���
		if (dateStr == null)
			return "";
		else if (dateStr.length() != 8)
			return dateStr;
		else
			return dateStr.substring(0, 4) + "/" + dateStr.substring(4, 6)
					+ "/" + dateStr.substring(6, 8);
	}

	public static String toDateStr(Timestamp date) {
		//��¥�������� �ٲ���
		if (date == null)
			return "";
		else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			return sdf.format(new Date(date.getTime()));
		}
	}

	public static String toSsnStr(String ssnStr) {
		//�ֹι�ȣ�� 000000-0000000 ��������
		if (ssnStr == null)
			return "";
		else if (ssnStr.length() != 13)
			return ssnStr;
		else
			return ssnStr.substring(0, 6) + "-" + ssnStr.substring(6, 13);
	}

	public static String toAmountStr(String amountStr) {
		//������ 1,000,000 ��������...
		String returnValue = "";
		if (amountStr == null)
			return returnValue;
		else {
			int strLength = amountStr.length();

			if (strLength <= 3)
				return amountStr;
			else {
				String s1 = "";
				String s2 = "";
				for (int i = strLength - 1; i >= 0; i--)
					s1 += amountStr.charAt(i);

				for (int i = strLength - 1; i >= 0; i--) {
					s2 += s1.charAt(i);
					if (i % 3 == 0 && i != 0)
						s2 += ",";
				}

				return s2;
			}
		}
	}

	public static String toAmountStr(java.math.BigDecimal amount) {
		if (amount == null) {
			return "";
		} else {
			return toAmountStr(amount.toString());
		}
	}
	
	
	public static String toAmountStr(int amount) {
		if (amount == 0) {
			return "";
		} else {
			return toAmountStr(String.valueOf(amount));
		}
	}
	
}
