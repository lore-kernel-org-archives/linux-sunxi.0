Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28AD34DCE2
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837209; cv=none; b=mOIQWG0iqCnwQYQu+qZ3ZDuY/OWSoXd1ebqeX0WeJa8xxMEVo1O0MHj5UjDJo2iSRRESLtXdEzYIVZmO6HTdj46o0BAxwhcjm+DJLKgMusjqVTp1XfvKKA9GqMUzO+Sgt7/ie1pWWu8DLGvuiDaaD8EraJDMF87Mr5gp4GIZc64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837209; c=relaxed/simple;
	bh=v8r6k2O16OnH5w6BGAVCeXNkCvKSFSyUWNXZMHQqfkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTQWpSxDl1740RLC1OS5pc09NBcYAI2QjUn+yGuaRBs+7Bl6juP1XCmIVQv9Sjlz3w7FBUMbHYzXZIKUdb1k9/MJp0FonhNHOpi7PhLPp1GLTJzjTkfFgEADlOHFVD1b+NmYcOm0OdYNQ6PQNBz1cDgJPulHPEDN0+DamPGR6Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2TcI7/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnN61YaK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2TcI7/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnN61YaK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNHlCO2045688
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=; b=L2TcI7/x7teBpyyJ
	gPnAHuqTiwFcvqBpha0hG6k1wOXoQPhpicQsdZSIGKwqLKU4eFTnGPsjFpELk286
	EMx0GlV3ROgtwgZG4p1gJNZq5lr8WTAlBMAroSDT7/76+guIkxKoAgl+FOfivX5J
	KoWiScUAGlncq91zMMk+YdyxSPxUW6KQwXxu1LF8VutmGL/LqlyeDvVa6bAMdiSq
	r9rJSfMN0tA450ClmXMDVR9dmRl1bKnmVf746W5BYLhtSLdVkqYC7hA8SIHVT1UJ
	aNg20iPugZxTE/mIJisvw6Wknmu4wgJeieMIG3Kqx4obZXeJ7698yNh63QWjDO3Y
	hVc8nw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav2ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so3435759185a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 01:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837206; x=1772442006; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=WnN61YaKQ0AtGiiSXnhHabIXTryICTH+t0BPc+Zlxdk96H6CsUGmPvxZFjA3tICtON
         ZyGA/B+1c3oblJ4sEAYqyQLhKPKBHGgbqNeOrJvFYPgkZApMJT0TlolAgdsT5wNBqtI0
         CNTV7Wvb7rmAbffSaDuaHZviYUFNDpRyuscg7qak2Ke3Kide6J3ywO6lbhr6EWb/8UZi
         n3pNYMWrsmtHCsF9tWiDAiHCkz8rMmEAJ/zKdYw1vTGxpsBNjD0C0YKWSaNbI697ccNH
         dHqPQNcCZB5HLHTcNqqOsx7F5mwgZaYcm6PxcQcGN9PnLO+4MchC2lLncsxnj6PA0M3E
         XJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837206; x=1772442006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=J/UzdEm3/u5Ay/5FU2njPBCXFlUP+zUTw55UAbSWXYvrr2ejHRbLdTS03HogjxxisG
         zEItY6BCFi1lGh3f8FpkZ3qr7q/NTzLgfb3Pvlo9lVN1QoesuToalRHYN6YRJuicnQYf
         hyqw/Em3J2sZ5zjWM3+fPBVQN2dC6StC319+xvsS88RmXksQpQds+CHHQiph8J8BGUOX
         r/G0VqlUBywFEs7XysU2X+VBSiBbI5JI37DiRtNUKNi5/nUTKvCxBVJ6nYz5YClYWH5g
         WtfM1JpB5v0UO5d5eSj5Xvojg/1SqKjW1mWg25fwUKKrKmPdHrgeNgzRn0Ha3jpdBdK3
         F6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw5ingcMFiSvgtxGUdMIPXjCeZOwWjv4o7mhBWdU79FouYRfi/miM4yrn+zhdEhKXtzl0mgvSyE4vu5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKXCNURAay4ZazSW7WVq7NDGvYzTseYfnefWnh26dkr1pIB7Pw
	n3c0BMnEN+pBhwFr4d09bVO2YAuOGRPLVxUuWh5Lg7y0m6Is++37/0eCznqFUEa4d5iHaZyBX+N
	U37cvnWb6dfDnGYMjJmKW5Pu26B7/Ib74bVhd9+Vgbb5k8t4ZxrC5zU4kdRiuByQqeg==
X-Gm-Gg: AZuq6aJv5GuERsh+OwCfFsrxbGMyipAsTdTYuiVcoJJVHauzWkju3f4dgPsCuRgyzOE
	XQGSswCHn+dETwZnD48NN+oWNPZLI+xIyriDM9tGj6q/99FRW7S5YX/5Wcd/Q7V7m0xXjXBKTAZ
	cFH5gsITncD3ONolTF88B6ThDov+1nRekaVpeBdm+zNLLaENh4azZi2uW50V5aHIIPRTQk2zVKM
	a/AfGyTJDeZuTFY6+YsGLYqREe6qzhmSz2RYZ/JF63TAlTZy6hJp00X4r3QDku6lB6BPpwwRUbH
	jXyfCnfXYLwUDjpvyBYFWbsmgueM7rm9NhzNOHHpC0c31qT2ThWxLk1aXBcC+BktSKC13qmnEfP
	VGE2DDp3RLqCV6QndoRG6rjC/U2UfeNAOycB8++UgBQTDVg6DXP7E
X-Received: by 2002:a05:620a:1a0f:b0:8c5:3045:3e7b with SMTP id af79cd13be357-8cb8c9fc733mr1029849085a.26.1771837205849;
        Mon, 23 Feb 2026 01:00:05 -0800 (PST)
X-Received: by 2002:a05:620a:1a0f:b0:8c5:3045:3e7b with SMTP id af79cd13be357-8cb8c9fc733mr1029845185a.26.1771837205401;
        Mon, 23 Feb 2026 01:00:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:34 +0100
Subject: [PATCH v2 05/13] i2c: isch: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-5-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4804;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v8r6k2O16OnH5w6BGAVCeXNkCvKSFSyUWNXZMHQqfkA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcBJgBWfoyEfYLkAxhcJWdiklbYSi9bXzFb9
 oLJUErBEW+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAQAKCRAFnS7L/zaE
 w1P+D/44ZcebR/fvD0BMZJTYIEGXsUdU+RvW7Aguaz+mVFiT8m8BjgGaH6bXTtOwFXWltPaYVB8
 gA988LhNnl9RLXQx/d3msmtcpEzxnqJ82g2IBUBx47/Qn5JYYgqUJ7LF0q0dHMl1XKj+e0awcp5
 VRPl4BH/moANOs+eghmvoD1ttdkl+3FMIHqsbY7Kq88iSRMbo7tml0+H/KbtJT5ypVwq1TxHAOJ
 1hCKo2zPjVoDM3VG8yzn4TInTSrlxiVog3/YIPtDR4whybvkrctIa0AX/Zyjn2mnyeI8JgqAXSR
 oaha7BeM6SAMI53TP+V/jq4Kw4RO0v4sVIlKWDEcbXwzmDjH1HFntiZn39C1ZqAYSIflxBKNV+Q
 CoFSfuA2hIq9W/iYmZ3ejMyDByyLKraBPgtOQ0sUPAsmNAIHLbyL//uxD/mT3bvqkSgUmhF3Xdi
 Shm2mBaRB84VPI5P2d5OyK0nbkN6um4VWfA8q/98mjk5X6c+AAmrildSJD0c9WP0L1WYkV7eTTt
 vVWBUJA8GEuLnQPcLTZg7kSKixPQArRRLn9sv0l7sLSzNUqTdqML+VFuqIpRKlbCilNSbTzt7U3
 kLL6biV8HF2aK+DfRl1pVWcaj7QjPt2rrNc2DV2Qt9ocvFAAM0khP2QOYQ27/rcUh4kxU8j2Zzq
 VHZR8pXt3HsZDeg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c1717 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7nvlAvaXHceVFyMUCzIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX7OlDxQ2TP36R
 2Q8BcyfqLIrMtvQTuN3CGUCAbAPVKdR+P/6fHSdRnrK3Mc6HOf7QnEuQJksK7b1zG+tDi8sDLLC
 cZG57zK4twkOGhq0yIkJwYpaMhSJ6oj/0bjjUpns7zC/31iTVgkhM+5J+RepHmEMHDlpwjtCiXu
 MGI+u60a/dpLSWnnJPKa68R7VwWLxMbDnhOox3mDGKnod8L15508ccNFTa7rx88VfuYyO/EdaW+
 Xeizgb6ntZlyF6gZgzL+/8JEM9ZJX/hB2H6LIR6ga2gI5VcNE9Zx9PmMfW3j9unc2Z8Nul1wjVS
 TS5WbAxbfGhO0L96F7GgPYpgLjTO7le/0MF6BSU9gbZP1rpj1SiuihuLuxQjr7auH+/st7KXxCi
 lUmAVAWgcDZee1nRA8hetISJIaxMk604qxjxuA0stTSFlHrLMa8E7aVjyNVphJdsG3JgN/qCZag
 STyQ+imPQLilDq563nA==
X-Proofpoint-ORIG-GUID: dGbMeltOniduZkNx3KOfhFNxvXXFdMOT
X-Proofpoint-GUID: dGbMeltOniduZkNx3KOfhFNxvXXFdMOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080

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

