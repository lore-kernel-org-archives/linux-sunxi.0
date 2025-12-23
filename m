Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D1C3328F6
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484178; cv=none; b=EutJ3K4e0ZSzk9uvQ/vzjxEPjp0PPw5q2z6kvxhiVT0vkgjIVgOr2CqzxmZY0YFJJ7u3qNN3Txi7vhSCm0hkBiehLa4gkXDRUMkb10tGI0vLIv+vyaC60AhL1iZaKcPTSo9+VoJs12i3UX87GX4VWbCuuq5gBN8W0pOYzU3h1Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484178; c=relaxed/simple;
	bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fn3SI/AhSWlUgHmaxNajO0/R4b3QoX73l6KwtlnVcBKoDHR0WBn1yd/C+H7BXkOqmzrP0CzJDBlW2hUlHhI4jpgpdzST9HC030ciBmlvy3VUC2Fdj2ic+R46rWxfuTKMVcDc4UbHOtnMYo6cBl0VIlNqRvxMyMyJ/0otQQHE3zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOWraz2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHS42X2h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOWraz2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHS42X2h"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN75rUg4044820
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=; b=kOWraz2TOCazDGf/
	xFaXszmIsPaHsVx1Y+SMk56kvHxWl6Qswq2UjwUwluKU3ZkPCG62E9lpmTNLi3La
	zkIIRrtamDCJyo3PsxPo8BKCV1Sjsw349P64AqU6rxeKvYsP7w3fT11QqEqVxg3r
	xYjd0kq77VhUBsTiiBT5D1KCkQvRQAg92A+Qcl5Xd/O0eFo4yRZyivy6QJqVeyiM
	jPwpntIMRWc26KtwrHcIVgwSdXpEZP9w1XV38ycO0t7cWYZ3nqgnJ7ynd0Z8Fi+8
	bgj4FxrIz26xWlDvCI8QlRK7Lm7lYQBjXANqdf9J70E/UUe3jArLPMO/kdnpOIbk
	J3ygjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha6fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09211413so121300521cf.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 02:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484173; x=1767088973; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=OHS42X2hdwEnl8DfMaltz9h1+RShEEWK6njJTEELnEP3kGYUBuQCau6SbopQ29RxO5
         hXSISSldMzx6Yt/lLQc741SeBXDEg6TYNzXCYg2tf9uKSqBn+RiThnenXbJ6W7q4hWZp
         f6bBAzU4l6j27ZNitsuOhzW3mjvL9OqG6x+kvonx/XmvtW2byI7X/2W43WeS9zlm1+dG
         6fdBZnFO3DJLrg3Bd3A9EQg1tLsBQkGJDI0yBGVhtCl1QUjwQEUaT7iDeS8legRTGYM2
         JpZZoAVlXVnNQaF/cLYWXIiGMsTD4F5d8+REZaZJY+de40Zro5UD9TSInuLX0fAkgqJp
         uonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484173; x=1767088973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=tysa5xGScF6MsD4DWovEDu0T8Ybe0iE8gF8cTlvXHbDa/aeE+STXZMQQ7pT/oS8/sX
         7Yv8AfvpqOEgz1rQGvTqhFI9HA4POVRj+Zo548nIYXSWweyiN6zuQUoPG8qUSbrXXdHJ
         WNlIPHzmpB32luzSXzZRwHWbn9aTIXjlYBbMmEalEhZw0Xu0loZC/mDHKzPKJFedB4O4
         dTqee0v8OGNCZeBaJrGpXHRcwrm5IMTonTzFRitYHC+23FA3OEw59z4Ue+LLl4wjTe6c
         iJZ2M1+7wgIGoI0i8E7JLF357kv5ixFdRu3A52uAZPpYjAnvub7bfzp9+YhF0/wrEduV
         OyKw==
X-Forwarded-Encrypted: i=1; AJvYcCV8JmyUT1HtUHwA5QjsD2OTcBiHuGhEQuj9QYHkZW8g1LNx/Z8liuKqo7alp7osIcyMFB/CiUTsfTk7xQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp2ZLTUu+SrWSI1cf6ZVkEe0WoBrOyfW51YYgz23xagHgTSxxM
	Yhguj/glNqTC0k2r5KCpnePQSwaN9poB9lDlW554anlhwdGJ0uTQ9HO3oUkcTgrDFoRv6nldaCF
	fACPh5jHe0BYff/WHluBYuDdK53XAJGAli0mIRHxtkTIE1JLP9Xv9o73t92XAm7Ci4g==
X-Gm-Gg: AY/fxX6/e2AKFkmzqdWJgvENq8jiIFMSIsGMIWX+YSOzoyQaMrzUOUj4CkA6+hGd1Co
	gYQwK0g+kVcoLenl/tn6kd1+pp4r/hAWvVpsxhKRj/lb+KJdTh0fa+g2oHwduXn7faTL1xJnKQc
	aCqw4xKaY7YyAhI34IojdIM7qvFaV2iXDGCXdRK1qDuYUYCRPlpZIYNkvoLEAZT3I9XBDjT2L3p
	xCRmUnnevJUFUlMS5i2lZ3sscS2dCbZyWbbwlNCKPdWzzgoJbXgeaF5wtDeDKQF3AU84xT+PkhQ
	8mas9BPy812JtwqHPDCrKkk9bZb5sct1MdqVOyMeeE7ypz59LKvdWyTlcN4rK4LuJ3Bt1RGqlSR
	5iBubiSlfOnz0/rsiTQaeYnWq4pwn9IGgrgoivw==
X-Received: by 2002:a05:622a:1494:b0:4ee:1b37:c9da with SMTP id d75a77b69052e-4f4abcd08e2mr168062941cf.17.1766484172928;
        Tue, 23 Dec 2025 02:02:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxU8ImwOEdXoIYf1MsM9TeSN65+Y/YYSiNRkoIkd0saptyh7UpmC8vEXV7Zyr4GO6jy06A4A==
X-Received: by 2002:a05:622a:1494:b0:4ee:1b37:c9da with SMTP id d75a77b69052e-4f4abcd08e2mr168062531cf.17.1766484172477;
        Tue, 23 Dec 2025 02:02:52 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:27 +0100
Subject: [PATCH 05/12] i2c: ali1535: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-5-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi8rAtrAU9cEajonJovu2JYczyiZGMkrWxDS
 Y5Jzyib7tSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovAAKCRAFnS7L/zaE
 wy17D/972dKE+ZfFzABiKYPVHpMHlDBeQ56KuVbzVhhUQvh0TJ2053lqVMHamKoPDvLT0rdTX4A
 99HxmF7uBeJtK+kbQ01Bdhmq9xHApLT+E29E37/AD2kEmDiqgh2pTnK/6jzrt33YZCho8x2JdmP
 FOTUzTACynBfyD/meIOwFNVUlG4WKdCV5XZDwe/EafvWX4xsEE1/NnLEWfwTVWIH0t7neEk1i7h
 zs7wBNgyOwLuRvCFDyHbW8Eq9uo32AHlKqIsh+FuKGKIhA4zqXstnLmuLRentmZEf/EiuAGr9Af
 ps9zEjpcLXnUWlm6GfINfIZvZBDiIMnd8wl1uhXmlEgM4t3FUJ7fwY7nQaskSu9FlHvdC8KMWBR
 ogcRWdUUbIXrCWw55dPDVkZoV1xrZIrrTHq/HzN1/8GZBOZ58mEZsDyGAM++a0RPSToPBNNfZQh
 Ols9ASW/RvRWlQMGgD0AI2ZrcFIgp2di6iLIqqxyhoHMo/1/ZdutGyPOVAjBXsU1qF3WEWcBSy6
 0NQm5+X2Dw/RlYAbc5CP+CuusHtIuMcUfaAIN9rNbvvB0FoFqg+0++Dh7dKod4k441yvjxX8+aN
 iNjR0KQX6Z7yQJY0evDEofPKrBoN3VRupLBzlwys3dtpohLH1tkLvUxD4YuV7pXe2m9kX4AIPof
 LVWSd4OC++9HVcA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: oG1aGUhuuinqYbkFhrYQt-lN6TB8DdfK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXxyWLMZpqQqEW
 HqF1GIqNSMDVBFBuM59a1aTY0gPR38d3DbTqSX8iwleC2LS8m0YccJ4/77MMhKD4Zs10ABSSIRr
 oyGXJSJM+xE+25ZQPbbYibNwDuwoNFmpEyr3rKTa1uHEpiBsjN3roE8XcUW2IVz6BDGQgUpFHv0
 TBz1GK6PejLMpg9H6BmpWpqYuMrKgzuvEd00oh4xy2xSOESgcLUsjGP+jYmdqmpeISGk74kTMGQ
 aGjQR8C2VosRbOdUy5VQqRFXD9jInSUv8IkIO0gdIWFDDDKK9Nm32v0tPEBqzqvwA7w9vUXPevu
 LO349o2avmnZRScsQjhxPGkBQ+yyjQtDqvKNofuRbtPH7M7A/Yh9B7J/3HIpf+VKd9/b7Biv49q
 H5c/tNJ460rIzYdkX7N9E8BUYnY483KiCoeWm11Dmd3zIFxRMKiwmJdyDbFQzZwMXWbY4i1KhzM
 9YJCUg7/gs/kqfIc3pQ==
X-Proofpoint-GUID: oG1aGUhuuinqYbkFhrYQt-lN6TB8DdfK
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a68ce cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qeKQattCTu4iihMYEEIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ali1535.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index 1eac358380405838d15551e353605cab0a7e5e65..bf0f36450c5930f86b122618d17eecf1782dd776 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -215,7 +215,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -245,7 +245,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 		 * BUSY bit may come back on when you try and use the chip
 		 * again.  If that's the case you are stuck.
 		 */
-		dev_info(&adap->dev,
+		i2c_info(adap,
 			"Resetting entire SMB Bus to clear busy condition (%02x)\n",
 			temp);
 		outb_p(ALI1535_T_OUT, SMBHSTTYP);
@@ -262,7 +262,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 			 * power reset as one of the bits now appears to be
 			 * stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"SMBus reset failed! (0x%02x) - controller or "
 				"device on bus is probably hung\n", temp);
 			return -EBUSY;
@@ -290,7 +290,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI1535_STS_FAIL) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/* Unfortunately the ALI SMB controller maps "no response" and "bus
@@ -299,7 +299,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	 */
 	if (temp & ALI1535_STS_BUSERR) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -307,14 +307,14 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI1535_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
 
 	/* check to see if the "command complete" indication is set */
 	if (!(temp & ALI1535_STS_DONE))
 		result = -ETIMEDOUT;
 
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -352,7 +352,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT)
-		dev_warn(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_warn(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 
 	/* clear status register (clear-on-write) */
 	outb_p(0xFF, SMBHSTSTS);
@@ -416,7 +416,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		}
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		result = -EOPNOTSUPP;
 		goto EXIT;
 	}
@@ -449,7 +449,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		outb_p(inb_p(SMBHSTTYP) | ALI1535_BLOCK_CLR, SMBHSTTYP);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3

