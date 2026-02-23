Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E21C5D7D
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837216; cv=none; b=hkLSM6nG6ySMrwWvYioHGsgmeSml0pJLBeHMe9j1YRQL03esQLrmuSkQ9h0Ji13cFytcazf6Aw2PLntkpqILsCbQ0nLmFX/xppAT8zUJUWrqsBgSeakLrX3QZhaoMiLiuUI1epa+y2sOMtmDwg0eO5JW3XobcK1CLL2+ZCFK2D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837216; c=relaxed/simple;
	bh=1vPODltnTM4Mj89cEM+Xo4mC22cbE/KV3QxgDL0fRbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxAzxySSrzphQHwqBwPrcUm1ijP+cwntCEcJHOY/kwTCTJWUCJY1g6SEp0E19TS4xYf+sD9oyz4+M9HLWKrht38KHFFWLFr6rvOiGMBnJZmNJh9G6ghTSiQGX4lXKFvBsteUmgZGnOwFg54lp5uqupg4TbaFpkaCGSClSmh1lXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSRJZgRv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBH21fqv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSRJZgRv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBH21fqv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNtSPt1313614
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=; b=PSRJZgRv7ZFbB8fJ
	Ct2ywslvEODZYZD0Dteb/AtL1psfjK7xJSxCfYTywYJyUj64Py+RsIS4jn2Sz3wg
	SrvlcHpwdObHdk+hcFJmGMb+OeDJ/dRXBm1yqjE3G0dX9n7lwbQadBpiEgKTxSQ4
	Y27JqAhe3EVd56Q1Uov6c0DP0GJoDT66dNRd/1/L3bxGBd9MzNc/PSO1pYizrJqU
	1gipxi8xP9ya49/xGglniiT0N7PADwozdAJ29h4itJooEMm0obJDAcCpYuzck7RZ
	h7WdCL2Oi0JtixPv+YwAa3Y5wpxBCjZ+Voi4T291wstbp6U3XXSOHLMBBp3dS0vx
	n4jQwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603m2bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ed6c849so3866096685a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 01:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837211; x=1772442011; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=;
        b=cBH21fqv2pq81bdoMoOyrSgJRhQDhi3/LjK7z603GYPjKtFqUgY9oNsDF17E+VPLO8
         rwFbC7FqQDNggvoFq25zm8LvLKFiRtaMpsBO1Uskk7e09z/Z6DIdv8Uvfkhiaqx5je1G
         dz5OkO8TOrvLqAyGn7b8hAb1B6l/g4zY8UpT2RfOspWa10rksJK1DqJq5IeroObNv00V
         d0i7b7Xu142NubJltp4SuYez1dFE1KgxubT6B9pmqfBgAXghSwklIy4DWGyNbqvX/Fub
         qy4lw7gEUPnvl4HNlxqP6W/kUm6z638ZCRCXYqfdSQ4DqfR8fGEXFxcDwI3SJr6rSaID
         /nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837211; x=1772442011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=;
        b=TWNKGCLxSjpaaN+iJ2i8bfD3PLAi7QggCyX/IEGzq6BJX2s0SiP01jUI6auVcgKXk3
         dq2ji4KU0xA5smRX/7wgBLaRY2c/esG5ZuII0Spu4ZISNqly5/+MKxEcf1CPBekNWdSx
         aDqudMB+ETbXMSh1hZHWakAXUt3LTOKdVh6b/WlEiYd48uf1KHJnqhun7g+a5JgO0DpU
         9I2BQzd7cahAbURSsaVrEWx5KXPPFkS+XW6VXY6dmjt2S1d8LnM9lmLe64CfJVKVCnSv
         pCjifrMqLi8bQOinD44IPh5TlFwXRA+9t/JwEwO7e9Y0c1yST86cFglG8C1pmQhfp4hH
         c5aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiVlAjKcLhPdDq0w1lw3tWoW6slesfcY/Jp9IPdkkZrupgyo9ruyCW+LvZ5A2WKE/rA//LsWCRapMBKw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxop+C/YPwrjx4V0KglQcQQr79QmPD+jGx7y0xjWe5IirUyZouJ
	4UtF1ZNMtLIQP9ESrMfSDcRBym3t+EHMtmbU0cWdZ5JNaj/aoba65I3ro5dyTwXc4WbzuqRf4Eo
	1Dk3UpolQuMO8YedT5S9gZuBYz4+WYDhc0UQsXDpfd6UR9G6e8sj6NOHD2dnUWFqyCw==
X-Gm-Gg: AZuq6aLYQ4yVNh0vrCa8R2ipwONzhI++wx/pb2Rz0jf0r+qp3c29EdJDvzZQb/1jS81
	VXQLcTWaxc1ZXxXUdZQ9GFVm5p8rk5HMPzdk/wZCafIKiHfCYrVEJ+7eJMcz/hjnce4TY2mnWEy
	nw0SBeJhSXwNy43r49Xi8MIQ+jQbk24rujT7FSCM7rnN38HgHP4nlfp49vi927yM/CqBH3uEwYS
	NoUiDN10VNXZyfIoHxkLseuRq/DnLGheOHefVnjlvPK6QdiAcX4zLQe8XRQZ32v5zUWgQBYD+yq
	GNiWBKpZlqYLusC7g1ZeRs1S6uxykAQXg9oj0Nl1Tk68GxTH2WasJB4Uv0GxxM8NtAFif9u81xc
	9eAhOTJan/XuVENK9jV88uWskzBmLYClso6vFDCNdnxpblC4zKfGc
X-Received: by 2002:a05:620a:40c4:b0:8cb:1c3a:90f2 with SMTP id af79cd13be357-8cb8ca81f99mr847883085a.64.1771837211313;
        Mon, 23 Feb 2026 01:00:11 -0800 (PST)
X-Received: by 2002:a05:620a:40c4:b0:8cb:1c3a:90f2 with SMTP id af79cd13be357-8cb8ca81f99mr847877485a.64.1771837210797;
        Mon, 23 Feb 2026 01:00:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:36 +0100
Subject: [PATCH v2 07/13] i2c: scmi: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-7-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1vPODltnTM4Mj89cEM+Xo4mC22cbE/KV3QxgDL0fRbY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcDzdqpQoO1qrBXLMBTaUorlyf28sbZOZqxK
 AmDe0QuUlCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAwAKCRAFnS7L/zaE
 wyA4D/417EoyqI0QBn4m++bexsMnLKIhOgaSKHUlCRm4WI0kBCH7GfKNgK0l6z9SvrOC1PZnQbB
 2l0PDir3Gnpx+UNskCvlxw9rjF3lBGssYYGa3MKV4RYggkAOwBTogDaLDyeI0bJw0LvXF9X5UMi
 V+vzvRzs/8vJXCcpVokzUI94EnTskk137bVDQDWWd94SiFlx30X/cS4x1o9Vz/UwklHpX7qi46E
 yMNQqgYnvg4PEPqi10LUKV10mU+2YEQR9/ooqGMteOJjbvRfb1VP00k9n8PzFzPUzWD9ZLCwHEY
 nnc2ULdIYR8Bcbu+AeD4P6PMQ1BpbGYQESpx7GVIKOdNcQrjnrLJefyJKvRpOuJd8rRujB/CwtA
 wnEutW4GlXh/yMXgnpqnOTzrQfU6hC7HMIhpMXf1sk/2idyYqgV/SqJMfZ+BMajPVIuVxTYglj2
 5euD/Mz1ZAtyF2XuBVL2mdeg3jqXPc9fJfgH6XfViUmnaKHN04uOJXrBeB8PvGFLzomwfyC3lCt
 FyF09qqotF/WPjhL+Xivo9wdFdqRe5pK/YtFHMyqtcZN9lpVIjE5exOQA6Kzr0tFqg05+J4v6xn
 caKJHWeVbnZdXH6hqq7ZJwglqDcAazl9a4qgg++XzUMrHK0w9pnYrkW1ldDjKXJF68OF0Uwgty8
 OqHs2gqY3dCK8tA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c171c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=iZeLIxs0cxVxcBwrIEAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX7dWwD5InlJ3g
 5ljkS8g2uyMlnYshisSQjbNn9W6hIxjmeTqJwm3wE+BEpAEy1HcOo7U2m4OL6UVD6plIKTgatI8
 d8J/1G5AfCMkJUKLsrlM5yK6q+88KxNUdztfiqFmOgv3l98+QGusCh8lkat+V6FrbSitJRLza5V
 Eqs5V7yPBBhMsG2eRskSkJ7/lhFCVp3O/BhZFd8pkPfhsVEKwCn0mNP1OL7ihmflok2lrWzD/hc
 W6Lkm3w5TQLn4kbA4gPZzSWUfyry7+PTSdcrUDM/gfinbaMUuHE4SkVOUJsUwBfrLnVEePx2TNV
 9va4ovRnl4mBKI47/jkFdD0GoLbb4xkNAatULl3q3x3DsPA/Y+nCfb2xq4lvCuMGaRt8xWWFxEk
 tY5cT2ermEd7yzslKexXfTDsuyi2JVslgTqGaKPNcUw7+tJQ8c+/6PsSlEePDTuuoC2Gfmk3DV1
 mtC/i31CywTUx/CyRUA==
X-Proofpoint-ORIG-GUID: 7DBO5FczkCkq3Lpn2dWYn74JK5uag868
X-Proofpoint-GUID: 7DBO5FczkCkq3Lpn2dWYn74JK5uag868
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 324a63efa1ab90027854646f84142f052a966537..57b8175f0fa8da52dd74c5bf8e3059358c033a37 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -87,7 +87,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 	char *method;
 	int len = 0;
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size,
+	i2c_dbg(adap, "access size: %d %s\n", size,
 		(read_write) ? "READ" : "WRITE");
 	switch (size) {
 	case I2C_SMBUS_QUICK:
@@ -148,7 +148,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 		break;
 
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -257,7 +257,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 
 out:
 	kfree(buffer.pointer);
-	dev_dbg(&adap->dev, "Transaction status: %i\n", result);
+	i2c_dbg(adap, "Transaction status: %i\n", result);
 	return result;
 }
 

-- 
2.47.3

