Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601AF34EF05
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837211; cv=none; b=Zf1aSbjSlJCNYkinTMH+R0bDJtSJpdewYC+8aB46D11sqveSwVkZeChk3+QqjG1V+yvI+tnsNa5K1NRGINEwkalLIVLMksTaLKaETF9h9vxdTQ68QyFPcqGhkw3619fMB0RJOR9w6mKVx6kRDB7BssvVwyHchCWkDQa/PTx6i5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837211; c=relaxed/simple;
	bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lEJM8/W/cuaAVZMVcyRMWoCrSQg2l3//ti9b1SqPmSMU9q4XTGX0/F/N6NEnNpbEjzMN5nNAZ8OZX4eROFYl6awf/sNp5jyh7RjNMsQ0pik8AnnhFESf91ClaiUstPEFHVdudIWO9LstPRsxv8ftLpKouwN2vFw6PHfrxxyd4R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVF9YC7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZDsFDcf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVF9YC7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZDsFDcf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMx4UJ1953696
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=; b=eVF9YC7w6LwSXWPh
	KNjYpPPqoIYhzE9ED3GDU8Wv7tD8JO5zXzzjCMB83Ee3Sdy6RfVL80wjLVNCmQUB
	cXk28xdHPXoFLnBxE7K0JK9eo5rEjdHRtdVmo76v2RLhXTs3PyX+bvLi7XOtMTnB
	W69yd8Onuhn+DdiL+30cQEXYzCTAtCQdjPxaSL9zQmSDFXZec2/qELgIOV9R8kpR
	WQLH44Ki6glnjLGV0OJhMOSYVEQbcl3uLTBSGCatKoLr7QwfOZp3Q0HNCIccc12L
	Qf4yIqyl3EFogFaBi85g8nbHNz8xX8S/aAf3bbzPICu34VOFLdHIZMitjBJOx8h9
	RhmmyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbc1w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4b8e9112so363981785a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 01:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837208; x=1772442008; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=HZDsFDcf+NIOw8rM4UJ6/XLMZXXj2mX2zWGoc3pR1Y7iVRwmdkPFnMtzVeEF4bW8XG
         /xVqHmiWBgDZLVJfF/OvFEvqD1XmH+FuGbvT2fFcjsBR7OzkDgtjWIgRVomEs1qmNmJm
         sI6dVccDEPUiYByrxk6vIvJfeipuBytT6G8yuH0YtYjo7UEcPeP00Bbsy4Y8qD7ikYSX
         ARuPc8j+9Aj5P22teMnGWdz5Pr0H0we1JxWM8GNUlsraoibEZDgMEl24mDQvfBShw9/P
         Z3aTxrOt36uzr/aicjBVlAMhbpbkJsxQcimoRYGME4TV2tbWRgRj/CxM/pYpWGKw8HQ4
         AqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837208; x=1772442008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=YkJrAe5J4rBSRr6MyZohLZYprclC52WtXXpB40wQX7tdpTJHyrrmvOiGdizzrSc6OO
         /VM77/PT3jteEqvG78e3cwkZ+DONu110F0qaD3Sh+QpnScq0DE1eNxxqitkiGMxI94OE
         MeE79Gchd7w2S9CHVSmSDDHHN/vRkS6eWU4Xq2+iKi3dvyvfJO6WuH5BZUd8jzYsIBHT
         OkBIrAJjkEohxUvWSqaYMl6kXmfNtG1H83LEt0zw76jSw68XcUK/p2clHRoqOsu6Hr4u
         kSdQbINiNA2JGYnNbiSdAj5hMyv108XcI+hU+BOcelufp9z7iSyRKTPI9PvlpVFF9Omv
         +DVg==
X-Forwarded-Encrypted: i=1; AJvYcCUCv4BogRLEVtWlKRmTKw2q1jUkIV13aBL3uCwwMwqBNmD85mbL8CrzEhrbSAPupRpTjHWOfMc9sJDKaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxdyfa36wXaLB1OfmD6zwuvbc1vlfaPfMym3JFs4w+ZdPjLetum
	D9HHCUDu+8SN5m+LCon5JeOwOPiAEx6qeTb8hRPpwBwhb+4t1Y/FcoiVYeDumf5rPB3Hr6Gkiyu
	u4gkfsk8Rs7bHI1FIUlPw3kuHJpMYZa5rIDmg6BQbiMXVOUeA3qQOZuw3OgAQtjIKmQ==
X-Gm-Gg: AZuq6aJ2/tVCGGWsTYqBLRYold/+SPV+10Dm16uXDMLNkeK0i/iFzbFkYBNco9G/+tZ
	4gCWZisVUiUB2ywFUUo0Wm/z1g9zxxmxQsVcGBTcBOfI0nnolUzPudH6Q7WfABqd496HA5cm2+N
	CEf4JxWd/yNCPd8uZDce214bZIlLIuhBekkjyqA3YNF8jJm2zLliEC0F9OQtqu2MeQeEnVDQNA5
	1BlnX3jJ2MYjT8SLImxKqCWBT8+XV6PR21k3k6ptF0/F0DUEoNrH6Gk95CuLKumLLhlfvcZviTv
	eJfLUkuJPQ6KL8YUxBTc8KyOBv7P73t6n1vD152Cku0RfbBnco2kDRmo07nvlj/8u/QzpXnfVEg
	Dg+tLOQLhC3JhyzJdvoHSBUhoOLi9N1YzeaZNwwXOdDg0HhU7Wp7H
X-Received: by 2002:a05:620a:2a02:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cb8ca65d49mr901115785a.38.1771837207943;
        Mon, 23 Feb 2026 01:00:07 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cb8ca65d49mr901109985a.38.1771837207444;
        Mon, 23 Feb 2026 01:00:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:35 +0100
Subject: [PATCH v2 06/13] i2c: ali1535: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-6-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
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
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcC9bXEdP5Sn4fkg7K34tcVggPIty362en86
 2bK5yUtOsGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAgAKCRAFnS7L/zaE
 w2HnD/9dfwrfuwI9JNyaou0gpSZMKALGt6siXFCwiP5v/VMZFa/ZAbYQMnscjI5Uj0upHdGpOte
 uqv13A9Rl/BBSCZm8v/xgj3mjDQl4VjYfz5ADx5CIRpYUQ/e4ytiY3HULkih/OqsNCi1U+xFrw4
 DmmV8F+k03bMBYhCuKCFZpOpH6JhA49t+dTc92nci1Bj2KgEmD1gX8vfZDPRnc2NxfZYEyWO7Mm
 xBOidJdFnjKag2twYtSUYRqpFO010jrP7usg4Vo5UIhfQvQESVDdvHIQbjSre2JCFw8E7aJHGWF
 byVagIDoYVo5MaIy7ZYzn039rnGioGGfd64riNEyG0hD/lrhIzw2Mhwx1oRRBvWPvve4I6vVD1w
 bMOV+YKP5B9S30WS4UCFmmbg5Z6hmXmYj97F6PQcOLEcB6wt3LHMrpxAjd+PrXwFNdPrqS90dX/
 NEcWQsQhTHwZujx2SmuqLDKGnyqFG0XfZzQj8TGu7UnuuhaiFGfhnwv59lkHlilT7BQ/Uro8IiX
 aLvs0jmh6qbDD4u5dNWoK8o3PycqBlZHnhJ7q2uxdJaZkLYYs6TlXM8RXYi4NIdN9ssO0yPzC8s
 W4YoVNx+K67HNjCvGGJlxEEi3Q6cCeWmYwcMbtLleh5YVV7W/SzvJpJUr3RTY5jhFuvwa3IcUxV
 rbVtGFew+m/UCBg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: H_Cse8zs05vqRWzXDUq8n-_fEn6R0DRe
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c1719 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=qeKQattCTu4iihMYEEIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: H_Cse8zs05vqRWzXDUq8n-_fEn6R0DRe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX+hemrZqVmRu0
 iIuU1u5iXJeAtPYwWT8fljLsycwlBnfzBHrp5jLYl9/g/sPU4eh+Cs2hWmH06z2BOB9s+KjJy+d
 X/Qd3wAgFOP5C+ksStMQ//ZtgyMdq2lqNysUlK8rZVJtV/cV/N5xPSGekpK0EeiEYCUp+QsIqd1
 FRyONECDZheTs60suKOTm2gw2j5U5gPB7NkjReZ5Z8tttF3WpRJVXDPVBUTXp9NiEKzv5HxnWoX
 GfjHbideEZctgZfVw2HtgO49TgN19KtNFDwgpd/zXkJJNTueL9iT5/mRHr4CxB+B6BOZOFq+tY1
 yrMYvCUQhfLqrvfXkz80YkhtSk/y9sgh48eWHQ/h2+ChtvOmWIBgTiGczMMFmhVH4t3jTp2qzLv
 0xMgOmyzaB/BkQlV3tqgoPrLktufLzcVHKgfCe4+zWwfg93PAnHUS0O/nfBWJsuf8wkrJUzaqsn
 7v554XA8AT32hOS5Rtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080

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

