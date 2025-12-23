Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDEF33066C
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484177; cv=none; b=oPU1OTC32v7eHz8TRrFHB6frT3zK8Pkb1q2TP+FYL5EIZloqBidHUBiwtE0bEIZbp5Xxm+ggHQvKJUjvBGzaIYaniyW78LdqaK00R5lk2OmlRj/Bn74KXZmaMc+twMalwWfvU2My+YCusDXwhbiyF9TNWEPmSlQuC5FanUfYUK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484177; c=relaxed/simple;
	bh=v8r6k2O16OnH5w6BGAVCeXNkCvKSFSyUWNXZMHQqfkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sle4TW3O7Tgy++v9z/5ymluJhuPqTKVf7rDYy1Apt5+TuuRRGEi3u+dDQUjdiQ7Qu/sud44kisoDq0bRGWAC5GYDKQjedtrzT6rfWP3Dck6N1CHr9rEFLLhC/Kz1yPMkUnz7qBbZycCRM7xM/tHPFgdG2ZozlSyVstrtJGWFtVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5cVDaNp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eU3hqrst; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5cVDaNp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eU3hqrst"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7FgnC1630789
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=; b=g5cVDaNpMwXsImmJ
	gT/ZfS2PGwp+freHknl+WUVEuhaemAoe9mzv8tv9/oROdqOtSjsGfqMYpjgPG2NC
	7Yo/t3Uk06b8FEwDqwP0RjOph1mkPBn8SnN3ZHCWbGR+RfLkNQIglZ39gV5OVkgo
	8hZ2q4l/LHjQePZp34mfi1q8zoitHSYg8Zl4pgJsWoZFK3QrdRAcPfu3iAbdSXjm
	SKkxVi4Hujbk9GZkci0wHGH9iLVfvSheJnA7sd8Vb+qoYG2/f4O07d6CqhM1kV+G
	HTB2X3aNLuFpv7lKmdFWqGVbDHtRHq2n+MoXF8KJ6lPjzrKwImcOc6LkPfi8fj+T
	68KxkA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8j9mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee16731ceaso95436171cf.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 02:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484172; x=1767088972; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=eU3hqrstMXuBQtTXjpbBDjwfDrO9LTOAF/vIEUVrIy8hJapb5NUK1BoWbk0borkKS6
         0FthRLo+VkXL7VjpMixIcyi/78yyHBSPQQb+HQM4KqmbCVxNe1OOiKj+700sDuPlzHOq
         Pr1xi4VMMYt2EjeTDoRSjRH13PyunOtWPhGax8TkT71OW0leI04YD5kaGG4aZ4kHsrAi
         WQT16b8OYARWjeannU/Mt/YcHOwX2SN1TuP7JE1Pjr0S9LxcxLhtuYKD3T8smWkH3gpq
         ZEcsRzsP795b+E269+4WPbO5Lwlkxh1jQhtblsfrnv0KArRlBLhpsv+bHFEVgjQTwv0S
         2+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484172; x=1767088972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=LjjL1V6K7lFLAoqgVURbnC7/S9ZX/nfwFWXzlD09iCG/fyRbiYM4QKbYPciPooaVOe
         BzndazXfFJSuB4sMYUiNVlnvz2398JYnATeZ5OvJGkY+y3Dh2Wvhvl+9tFAaF/u7DT3E
         hWMyS4VMhrkq09A7sDOr/ypaSfxdUorrhCYxqq/YU0JbtgYjyo8Oi2Kkr7kTvnXEK3Hc
         mYPKUZigL3lYMv5qRnKrqsFpLxFOSGrSvozcmY9rXDXfokuoPMDaDn2FuC3dBguYCSDP
         icmruqA6Cl64CezlG3tAESZDGhnCxS0x2OwWAE8LPMC78oTeoLBNm9i73jhVU6A1zAAH
         oijA==
X-Forwarded-Encrypted: i=1; AJvYcCX07nFCkvsHYVNg4rCnAY2l0wXARqi5asabSIT9g2vcUxJ7K9Ug5Wn4rgX+xms4EYyVowEXWZwT3qZOmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYnbIejcwK0ooCjiDwwtWbyWP0vt8mJRWlbE/ycTt2nUypAAM2
	VlCzgMd2MOKp+jSCEHaEBnY/cTEMQNO6SNLi0mBKNGoLamiVCxaY82eI4sBZwSAwmu+uZdcR80Q
	+vjVQC7C/3Rs7RjeYntaNgQjcZ2/Mht+nJ8ZYmwgnmWIQIockLlLSbBWQiqLyAx1AfQ==
X-Gm-Gg: AY/fxX7+F1CBgroSqzf5xJjj2f3MFrmMg+cnDexvZlJY4VJ9WZRmLnCu2b7+tNTKqTx
	/y8rWi8jYSueByhbZZHs7hX6/IgZfzVHl2hemZisC0Pd1/J8787vwraa5FBkiEsf/hTRg7ZOgtb
	yVLjl8cBdNvAwOWB2PBYMF8xMaENlJqAzQvyUnw9dikAC2aIU/Lbwy/wBqVZe8itlKOqhcyMQQn
	LzaW0If34WLtfPis0m/PZyt6ruWpLZPGBiRaVoXGqBO9m09Ix/9CSa37PN1cP61mYzy30GtoAbJ
	A1MrV5BRKPZBTSprF/k69Snn9uq2TFxY4iVVekDac0oUVvFAEr6iPjySSd6nC5TiMjEa5K26yme
	wQ5/vI3gB6G3Mm5iBXE8ORDQexfb/YCq6kaSlbw==
X-Received: by 2002:a05:622a:4813:b0:4f3:5652:6743 with SMTP id d75a77b69052e-4f4abd79a87mr210916061cf.39.1766484171682;
        Tue, 23 Dec 2025 02:02:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2nrkfO76+qDOJ3k1gwHAAwaCG3ETkY5QEA1jJ//1LJTq/ZgfSqHuPJJDz32+uEXbZStF10Q==
X-Received: by 2002:a05:622a:4813:b0:4f3:5652:6743 with SMTP id d75a77b69052e-4f4abd79a87mr210915701cf.39.1766484171153;
        Tue, 23 Dec 2025 02:02:51 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:26 +0100
Subject: [PATCH 04/12] i2c: isch: use i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-4-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4804;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v8r6k2O16OnH5w6BGAVCeXNkCvKSFSyUWNXZMHQqfkA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi6WTQILh3vDp8LqDDriRAq9W1Ef9GxiLPWF
 7dPi5v50q6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpougAKCRAFnS7L/zaE
 w1rXEACS0olMUbGK/4Yp3SSQETn8Vguzf1GV7NdR6FPf2hSdaFxGeutLyKpJl+R34UFzl3HIo16
 D5lvsdFTfAgGtO3OfJzRqJzvZiqKUv/RaZurI8wGPSvyM2wWpFRZtWYSM3x4yJ799xkM61vhiO3
 zCtFQX9FndLM4u3ArsvyRbokSficADUkzDEd/m5GB6DOK1UvgbgKFEVAHSsIthU9RLEdhjCwvrb
 Ooii5Z3b0haaGOKsDZgWYBvUl5X8PqWNqB4kVsV5X/Nps8sJJPl19O+rRow/9YSZRthPEd5W8YH
 1EKH+MSz9FoYqIBNvIHExKMy512VO/7h/987/ta0sQRcfGQv5MxS61Yxl53icjrbJ0e2pdrGTAP
 MQwnWQk4Ofkr3KB11kui0cRbFlJsEDcsTj7APhADj44YTHseEvx+YadnT/7rWrJscq0v0E72JuO
 LHzxIy8tS87lik4AXEhsmQQrjDWGlZb0/fx0V5IVRHSLLkjhnk1pX2+MtSuo/q5/zvrzHWGAbBR
 McWzobJevYOUQFVNqS7YiwfVAQOtduMCW9Wq55OKrnKp8PYI0IgH3ubSPg2qT+HbyEtuV+lgF6z
 ARUYr5FUkASy66qOcrG7IVFQzoMvR+0ckhdp5lig8EwJf+RgQ6HBs/LgJDIICAh3sy80zf3Lg86
 PD/zBN2HibFEgAA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: E1pm-Ci6_5KsOQxGMMdZt_bkvb5U9ZZ2
X-Proofpoint-GUID: E1pm-Ci6_5KsOQxGMMdZt_bkvb5U9ZZ2
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a68cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7nvlAvaXHceVFyMUCzIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX9iSM2U6nCpJv
 h/TAAYbWcV8bJNjE21N/x40ubF1l+y5qHzwVkinlf++kK8PLsJgx163fJqpMo3DYjQQ8SaVtpNZ
 3Jf7Yw2wAwkCtCjcR+hGla0Uru2+aLgIHsrI7qvJjoCkgBN6upAOcURZDtG58yalAYI6cz/mXw2
 QsEcf53IUzHRIMFTg1Z1AagKehIAMj9Rhy1gYyQcat6hKmF6wPssFNgF3WxAIkHA5xj8arUHww+
 Qb9v/7fWfMZoDM6JflcgR7pY+VvAfmBhZkfFQeyYgp9MeZEyzeO9myCwcZeLtRbw+0qaf1KIYQf
 hqIZsPHzWMFr/itNKRINzzkuRK9ymZVP+CBof8TEaZZ3H50xwwh7BIJgLs4Qjq1qh8F/pjxcynY
 LNFcglGn6SYfZdkvxV6Z4PKOKQAgjbuBFjcwQ6oMxUUaa9eBDfHX7jaqMgvkJ3e9LI/oURzbiBd
 xazhcLjbb/F8gFgXPIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-isch.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index a2ac992f9cb0d2accfaa979b802b98c3b7fbe3af..6ff07ab12e30db6821cadea4de3a588b9023ea20 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -86,7 +86,7 @@ static int sch_transaction(struct i2c_adapter *adap)
 	int temp;
 	int rc;
 
-	dev_dbg(&adap->dev,
+	i2c_dbg(adap,
 		"Transaction (pre): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
 		sch_io_rd8(priv, SMBHSTADD),
@@ -97,13 +97,13 @@ static int sch_transaction(struct i2c_adapter *adap)
 	if (temp) {
 		/* Can not be busy since we checked it in sch_access */
 		if (temp & 0x01)
-			dev_dbg(&adap->dev, "Completion (%02x). Clear...\n", temp);
+			i2c_dbg(adap, "Completion (%02x). Clear...\n", temp);
 		if (temp & 0x06)
-			dev_dbg(&adap->dev, "SMBus error (%02x). Resetting...\n", temp);
+			i2c_dbg(adap, "SMBus error (%02x). Resetting...\n", temp);
 		sch_io_wr8(priv, SMBHSTSTS, temp);
 		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 		if (temp) {
-			dev_err(&adap->dev, "SMBus is not ready: (%02x)\n", temp);
+			i2c_err(adap, "SMBus is not ready: (%02x)\n", temp);
 			return -EAGAIN;
 		}
 	}
@@ -116,28 +116,28 @@ static int sch_transaction(struct i2c_adapter *adap)
 	rc = read_poll_timeout(sch_io_rd8, temp, !(temp & 0x08), 200, 500000, true, priv, SMBHSTSTS);
 	/* If the SMBus is still busy, we give up */
 	if (rc) {
-		dev_err(&adap->dev, "SMBus Timeout!\n");
+		i2c_err(adap, "SMBus Timeout!\n");
 	} else if (temp & 0x04) {
 		rc = -EIO;
-		dev_dbg(&adap->dev, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
+		i2c_dbg(adap, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
 		/* Clock stops and target is stuck in mid-transmission */
 	} else if (temp & 0x02) {
 		rc = -EIO;
-		dev_err(&adap->dev, "Error: no response!\n");
+		i2c_err(adap, "Error: no response!\n");
 	} else if (temp & 0x01) {
-		dev_dbg(&adap->dev, "Post complete!\n");
+		i2c_dbg(adap, "Post complete!\n");
 		sch_io_wr8(priv, SMBHSTSTS, temp & 0x0f);
 		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x07;
 		if (temp & 0x06) {
 			/* Completion clear failed */
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"Failed reset at end of transaction (%02x), Bus error!\n", temp);
 		}
 	} else {
 		rc = -ENXIO;
-		dev_dbg(&adap->dev, "No such address.\n");
+		i2c_dbg(adap, "No such address.\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
+	i2c_dbg(adap, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
 		sch_io_rd8(priv, SMBHSTADD),
 		sch_io_rd8(priv, SMBHSTDAT0), sch_io_rd8(priv, SMBHSTDAT1));
@@ -166,7 +166,7 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 	/* Make sure the SMBus host is not busy */
 	temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 	if (temp & 0x08) {
-		dev_dbg(&adap->dev, "SMBus busy (%02x)\n", temp);
+		i2c_dbg(adap, "SMBus busy (%02x)\n", temp);
 		return -EAGAIN;
 	}
 	temp = sch_io_rd16(priv, SMBHSTCLK);
@@ -177,11 +177,11 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		 * 100 kHz. If we actually run at 25 MHz the bus will be
 		 * run ~75 kHz instead which should do no harm.
 		 */
-		dev_notice(&adap->dev, "Clock divider uninitialized. Setting defaults\n");
+		i2c_notice(adap, "Clock divider uninitialized. Setting defaults\n");
 		sch_io_wr16(priv, SMBHSTCLK, backbone_speed / (4 * 100));
 	}
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size, str_read_write(read_write));
+	i2c_dbg(adap, "access size: %d %s\n", size, str_read_write(read_write));
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		sch_io_wr8(priv, SMBHSTADD, (addr << 1) | read_write);
@@ -223,10 +223,10 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		size = SCH_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
-	dev_dbg(&adap->dev, "write size %d to 0x%04x\n", size, SMBHSTCNT);
+	i2c_dbg(adap, "write size %d to 0x%04x\n", size, SMBHSTCNT);
 
 	temp = sch_io_rd8(priv, SMBHSTCNT);
 	temp = (temp & 0xb0) | (size & 0x7);

-- 
2.47.3

