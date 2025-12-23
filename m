Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B45332C94F
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484182; cv=none; b=Lw0WybacE+qdXmmU2Uy9mM8KU+hBeCgcLa0wJVHzRDgTdvq2QXPjqfOOUtOMtY+H5mCBdSBgUnp6wFAj/Fdoq1Q7aHPK1Qfrd0NcNkdyhMxzslpi/5noJO33loxZEnxSFPd702/17GVcXwUltpmca3w0EkSIhb5CmF79T0aEgjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484182; c=relaxed/simple;
	bh=Z5y+uDYDLt8QrBK74QcxPQFJYMWolbieGXxGJWOf/Z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ey6/gN8FUVeaegth3HN/gf0ya7HKHwPEkTnSuVkV/Gawthf0W2kOZglV17J5rQGfazUXAjGUe6CFT5kOOQoDqHWuqjvByN/+MhUWdAye7XwUXzPEcRPSdSVDOpl7BhcSKj82flZdtKaQ+RCjaS6uqg+K9JcBi+G9lH4NdfHaj2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIBBN9gE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCu1b8oa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIBBN9gE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCu1b8oa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7UKdX2115198
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=; b=bIBBN9gEj819WWSx
	ukr6MOHNbMcO371J8nAzeNYa6kAXDXdyE4Dg/KOTsXaUTl9qKkZkGyRLFsanbFM7
	ulRV11/8RRD9xGHJkL5via2oxM8bV6+tDFtIDXmq/u97zF8aI5SlLyMu89neCMDG
	4+G1BfRsARTSwS//CvhRqWHZi/lbX18qELxu7Gulg/+9G/jTQHbcFHvI3sSUJbpu
	F/geqQDiMKZYCvIorg0sAQNQOseeeCIphl8Yf9Ax6I4JQuaCniTsMznNJN5oeS26
	NkGkG3bWxTuZe2B7WVeVjmr83pKepmi4QZzpriJF/ENOpl53lgZMfiuxGK9Xhcqy
	0qriWQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudj7yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed74e6c468so69425831cf.3
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 02:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484176; x=1767088976; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=eCu1b8oa+2wJO0MeUS1Fx/2uLpOPtbMuIO3f7LInnOkD/9MRqhwpBsutnC/tPvOsZo
         w1pf473NEdbUNYxcgqYcKoCuslTXy8MV2um4W7XMJ9o2mcb/oET/rIdeTnDSZDnAW1H3
         mq1OlrNy3ketX6cJkvp4ZBhL9OqwVF4fiL7I+g0qOFlSG3G+2mKwmwuI1mdOv/c0TOL2
         EoG6h0IZv6aMoUzX6fPRf2ehS4+ckc/+KYIRk+asImp0bv+FXj1xUhOGRAVD3/WUtJxR
         LihzILzoMgDynGF1W0bNd7hcus7HdHPJ50X+pqUxb4oatyH20ZHbrGvWZKo/mViS6OSA
         vqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484176; x=1767088976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=O6qIvudd9HnyKNqJrZXoKX9wXvrPaBZO8igpnmhCrDiYuvo8Bw+S1XR1Ry2O028CeV
         e9ByvmbMqoTXyrnlnHdGfF8DZUkyEQs3U6YQJGjaH1UBoCpvVzUSVEDFmuUOhImW6m4q
         JoUO3ju5+9YJonkGcIM4BItvhDgAbtgNKbSQD8qIbd8s2Bsm95q1lHeLA7FafxmuJI2Q
         rj/hFPq/Qbhx5elmeshmnZeTFzvOB8Hq/zhdO9vI8xlxxM9+JxzjCZyy3aE9WyPmkbUQ
         y5/so5bKW2jmrhuXyDqccNLpcDhkjZKk31Sg8eL6ky+Sjr0U6GkPJyIDUd/YK4PJQFHY
         yRCw==
X-Forwarded-Encrypted: i=1; AJvYcCVO9ATYs7sTXsUBYIOlKP8B7tHt0xEvWEHZ4sqmUEXXmn6blMh4nO9HEtH92SueMdkCQg2sCpX2SmiqPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4TKjcnDnfcgsEB1C2Jl62w+y1pXpo/CVivi/qBv8Qru2a3sZs
	cwtfmv8FpDtEPLhnfh1n8sDUd/8X+YdM54btTetWpKoPNDrkd1QyWKqXZPOErYwNMQ4lIksL54b
	bUfWxcuUB7voSqAqcMJYXc2aRrXRmxusaysIgZDtGq+fhdCzzv0MGLx5cclZg1FQ58g==
X-Gm-Gg: AY/fxX7QufJWI1EW3eOfwQM66qKg01RW0pZSSyqZhquDr+Fw2jVuuT1nORF6pdkCflm
	bRQekQpGmknBmIOZ2xTXnvSObJn+FcQEpLObTRxRJtxfvhwm2BXVyWzuWjMcoIaji45ArfYRTWt
	JmHkwUe6Ns0vZvnsLC4wuSKIWpGjeDjivfu2rkAK3H+V2v+YyxPRyCMHQMQvFMp9R5tZ0AGtR8c
	rBWjn92qCws9In43weA18gOlBW4gMhzDETq611r/fHcWph2e25X3lq2hbBv7QLLQ1rZFDpww551
	yAjLOsbu2XqsAvhFrZG47Q6yMBYSysqQjTwEBLXFuwAB5JdTwqV9NW0yNYmEZ1UMoTLPWuAcTVc
	EllMWw3xaG97bZv4nyt8e3z7wqUtyXN9HAATmsQ==
X-Received: by 2002:a05:622a:1927:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f4abbae21fmr207318041cf.0.1766484176221;
        Tue, 23 Dec 2025 02:02:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvZUZ2J6IwscWcY7RC74ES7QnMTV7pkYZ1I5E0GX9LHN3najl8MNqhxo5VDEyhUmehwO5Tzg==
X-Received: by 2002:a05:622a:1927:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f4abbae21fmr207317561cf.0.1766484175625;
        Tue, 23 Dec 2025 02:02:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:29 +0100
Subject: [PATCH 07/12] i2c: ali15x3: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-7-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4026;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z5y+uDYDLt8QrBK74QcxPQFJYMWolbieGXxGJWOf/Z0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi+az3h2mjkdy8JfZt/+vwI7gUUYCdcxe1ji
 Aldb5AAaUyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovgAKCRAFnS7L/zaE
 wwg1D/9/TgJ7+cyyriM7piIyunaQDjTvaDw+EBEL51hFHlX+lO4/jVLy2woMDI6R4fIvrXdW6ub
 Jpy8I2sZt3jMNDjOwoehDFb99d7nU9UhuOIfHRCrblhzfjt5iX1W+Qaf1pwx0BawuEPynomq6YV
 8YXynU/1S/jKFPWKtSwMhvDyUfo2IiEuj3+gmgLsn7gW5CUydnE1u2dyvJPDUz90YLOHV7/RQBg
 fDif1lvU3gfyFc+J2P/yOhXn8Kr9DkrvqIQyYJdfbes6fDpGhgG9OAIUUHhhKpTjuit3E9F9wMd
 FtxMUW3JOIdOouc90ODz/CCxB/bn3qYR+bY2vynlawaZQAFsb+nE33QJshh8AMF9esfFhUjNqQ9
 mebGDH5BMjgjuPJCLwlPneIN+MXg4aJlY2gZySYW2vtrMOreqUVOWaNaK/tECpvg7zY+wu/FNJn
 OtTNA7guV0cmbQHlOXLdjzKbklatBSK3hvb+0TUjfcli/xb2Wbpkvz1qhX4UorxXc7aW67O+Nh/
 K7+rXBRV+/VbEI22DeQ7FRSUA0shc+W1WZKDV/M7RO//k8q8g63p69ixoRUXzIqiiDjsm8oPizV
 thrGUnbGDKbK6jTyCj+ShJmpLpL9LIJ5RPRtEbMachuYbTpfqO0d0QWI58cXjGgllDLPJhR4Oxr
 OY84XabOoDPMwvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a68d1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FH57a1SQlJoUzRel804A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: cYfvtDumTRgGVJoJtPBCvrJ7cjH1y-c1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX/avjcggLI4ab
 X6UgMEK7IWEdiHeZZf52cIJQYCq8NkZSMAdeEXvuJeoRSwxzd20ff4quuoKkJHKEeMtTC5fEnlF
 T2w3/jpUF6y7zspgPC0Xq8+Fgr8OQN5wjc1xLxapio8EGmeu+X9Eh3RD0VJTRPlhIBLdDlLgBOR
 A9j8T5lxFjiXQzBWM4pO50gStA2xWW/K8Wb5SZOaD90C1VOg5NCkgorLjEbB0Sm/GFpzyREl0Yg
 73PMezT0EvSyY61e54Jce7O/f/TmMDJgtwZV/XaLMLR6JinLODwTuPiMqyJGg25HNkVrnMai7Ki
 qEr+fHpBzAixw1oTxlkczCJ6zTEEyz4LBG41RrsJC/ZrCeO8f/bo6/ENqVtVG47kdph6kvcQGFD
 MhW8965yN+KT/PQwlEAKFmPA0+orBgaEuX/SSwD6pDBWLBTiZxJzHXUzjgqi3pbBOqikiLkL0aC
 au2ygUE/k7gn0nJw+GA==
X-Proofpoint-ORIG-GUID: cYfvtDumTRgGVJoJtPBCvrJ7cjH1y-c1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ali15x3.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 418d11266671e314aa2fb882ece025dc0ae998da..bd62aa8d645004bef121fa46efc1d7afc473332a 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -223,7 +223,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -255,7 +255,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	   then the BUSY bit may come back on when you try and use the chip again.
 	   If that's the case you are stuck.
 	*/
-		dev_info(&adap->dev, "Resetting entire SMB Bus to "
+		i2c_info(adap, "Resetting entire SMB Bus to "
 			"clear busy condition (%02x)\n", temp);
 		outb_p(ALI15X3_T_OUT, SMBHSTCNT);
 		temp = inb_p(SMBHSTSTS);
@@ -270,7 +270,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 			/* this is probably going to be correctable only by a power reset
 			   as one of the bits now appears to be stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev, "SMBus reset failed! (0x%02x) - "
+			i2c_err(adap, "SMBus reset failed! (0x%02x) - "
 				"controller or device on bus is probably hung\n",
 				temp);
 			return -EBUSY;
@@ -299,7 +299,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI15X3_STS_TERM) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/*
@@ -310,7 +310,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	*/
 	if (temp & ALI15X3_STS_COLL) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -318,9 +318,9 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI15X3_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -347,7 +347,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT) {
-		dev_err(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_err(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 	}
 
 	switch (size) {
@@ -404,7 +404,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		size = ALI15X3_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -437,7 +437,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		outb_p(inb_p(SMBHSTCNT) | ALI15X3_BLOCK_CLR, SMBHSTCNT);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3

