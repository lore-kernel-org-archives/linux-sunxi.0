Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80F334EF09
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837221; cv=none; b=m+98CKEHJFtSpVCZ6WA9BdzLFgNYZAg4qhdpbXfr6RcY/tQHDoVpdsuAVzmw2m8ylcMtCfMVIBHbhKMiE8UW9EwVSOIHFl8k7J5RTxEGmSZKofM4FVYeTuP7+hxjxFMNXCDCIEXrSs40m/Ps8uP+X89DLdO45tinbZbTwdhPnso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837221; c=relaxed/simple;
	bh=DjhS85KLuUmnMirWSsbDnV889wlZnMXf3iYZWcjz17w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUSblAV4tYSXvDCsFlx1PmKUK3zNiWDV3fGXk5UEm5kOVGZYw7/pzaGHQq9e+LRqwkmhrQlXm0tBEX9n/MpjoA8HLZkenBAkwnXU0ijdh2fsvQL46ViC4KS9sFbzVuI5r14X9p/KTIW4fAeNQvRgnktFHtAN8aIcLXhS175Qa/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0N/woDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+W92LjO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0N/woDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+W92LjO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMt1p31197849
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=; b=K0N/woDFr29hUgCL
	j4aSDpX99bJZJUbqnsHkF54vWRZ2E3TE6N6BmrLpb6yhd9J0hJkoWckH0PsfsrY9
	wa84yN5dwdoeHPLG3JaETb+M+1cRKKNc2HAgnRNoS1aSpgbKfmFyVfJpUEDtzxeZ
	QgliwKASu4Hi3WzPKyWMAHJ1P0aLlK2oOU1K0CRdb5SLcfZ9/4SADrgHXn0oYnpB
	vighooS7fG02Yyo6y75JFnllJ1bfqvApzfIb6LYnbqn3B9RS9f0p4QR1rE5OUSgx
	xWe8J6lDTWWXzLkQsr79kCH8Ovecmu4vEgTlEQQJag//jTYLyi3ca8cWLLIFxxgE
	tDKP6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603m2bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so4603850285a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 01:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837217; x=1772442017; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=R+W92LjOnLtUrhunTU8hFCTy0FTZhAtE66eHD+AOOobPPDPQAiifKio2cJhyFjuDtP
         6n3IRJ7tFuGLMSO7l1n1cx1dKGwTqT3ltcH6p67jiA9YCQLNRj48GhuCLB/YRfwLxs53
         bKLxViKFRLr+P8wtD+2g1OGIpFPdfHjto+Gh+ch3h4bnSKMDC4BzIbJTsnkKadhoFxWL
         qLH/t5wrqAbx4I6iC4SSpH5rF8eA2wcm9wMEZCFHzVuoUM2xM3dBMKJ63afNdGSHXJru
         ZbGVbJtwJrW6qdFRPd5krcwsJf8DxxO33Ot2/Pg6oFIs3Nf9bLpVm37XqhMvUE4tOywX
         7f7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837217; x=1772442017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=Qqq5vRs10/tok41Il8dKEMDYH8JTNZ4oh+sgfWee5LOzhI3MwzgwAYf3eSNZ2g7hAx
         mGuMCyKEp5IlwzQFbCth+ytewaG2m4LANiZZc5AXYWtFXEal6E6YNKNdfTu/N2AARxhn
         dRtmZ+9cGRVksU5rPAW6OVVLkoHLeBkynXvg40ruYvLmLO/ijnQuShH3uGIHn6JFDBcz
         dSJpKIl1fsMxEdlsje0dWcMkBCOrY/NCI9EQWzhnpkbSmV5cwEbwJ2p84AwXtqyfbllw
         I+57HyOvAcoFFNLzou7SpuAFQWAAL0jAkp8LH9wNbzDRrMEC0n5lFPQ8R3yrpZTXIZOl
         s7YA==
X-Forwarded-Encrypted: i=1; AJvYcCUJXGdltBYpR3DFpUnpVkPt5M3SGuiU5lncCMsOIxy31631UuclznX1BoIZIyGQFdeEkTYkU0gx04i+0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcoVD5XFm+oylzdGcUSbVLYwr+eZ73jLbMA9HzQ1oMHvG1Ljoj
	XF5tMXbIk2WWglGLxXBCiwIgDrIRZMnOeUAakdd26nX/GEyOfscEKu56qelhbwt640GsJlrJsz+
	KzMuXy5KiPa/XSvVkx8byW0jM4nGm5v+vLB3F9++tTJJW9P+ZGm9slMrbLOzn2h+ijA==
X-Gm-Gg: AZuq6aJhVt+xgqf1W+c4Cdp7Qg4H45UKuNYX8f8os6VzIFi0Qzv/wyO2wUw6lJ0War5
	p+P1HZ9KIsKL0auThYnXLtdMTYYIbRuZTXKszqGrm7mnfE5ms+63acl9jPJ0M6tdcCGl2BLYLYV
	5zFcoEU6WAusQL4CbZO679IUf/hPkA7CEeJv4u0OT27tuReafNNVXb23SIOeuKpGTFY7Qur5a3t
	4xRhnZSf58hI+S+Q/+Kw0ds5LvaqSJwgg0Oo5oPuFHP84PujkKlklBq9kB4mT9GbFuPYzPfc++V
	ApmYgCWZ7LynatYchTdBdYWoCFGLlwwKRAmuixCza92J1yFT594Y9VyeY3ht6e5aVsAvB0v61N5
	ZDR+p+ckjVpxcPdcPsb6G+eb+b366DxQ2F58hdau09HWQMKnCXfqC
X-Received: by 2002:a05:620a:1a18:b0:8cb:7ad5:6c09 with SMTP id af79cd13be357-8cb8ca0db51mr951741185a.24.1771837215903;
        Mon, 23 Feb 2026 01:00:15 -0800 (PST)
X-Received: by 2002:a05:620a:1a18:b0:8cb:7ad5:6c09 with SMTP id af79cd13be357-8cb8ca0db51mr951731085a.24.1771837214830;
        Mon, 23 Feb 2026 01:00:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:38 +0100
Subject: [PATCH v2 09/13] i2c: powermac: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-9-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DjhS85KLuUmnMirWSsbDnV889wlZnMXf3iYZWcjz17w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcFq5rr7pZsKaH0vo50s68t3HBi/s2UeO3pf
 cyse87kAE2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBQAKCRAFnS7L/zaE
 wwvQD/9KQpGaSOnhf7D5wLXAJtnQ/I9Vwv8R/l5Y+cN3CDNCgFgfSuV8c71GsQwvh5rVVtCYtuI
 O0v0A2OBZs0blNA1qvLFtl+B/sCtCoAuWmbmTse+WATvyGDO0kn/cabe2lihk+xZ/oUzJf1LU6v
 JdAjq4Epdp+fHbNELIyQ1jBt9UPC5J2fmIbgHqZcX8lOZvx4Y524oMJ4NcXEkTLAShJtZiFMTC+
 4Lxl0MTG4YjeeoyByjGFZuskzAy7Uuq3TIGwCkFINVGezKvdEVYcWoAwtEPKM1cire1U/HOJ03U
 M3wZxH9U2KmoVtcm1eJvyPAKp83Y3EzpgGVgIdW0fsOV4brc8ppWTQ8PcTTQNEtA9kcyvYWREAx
 9/TFULQeBL+tzYS38s2fciWkKtrXyaTKtHJ1x9uOazhuzE54jUFHZnF/EyZTNqqEyhsDib2K1p+
 UGFV7sUXMI3+ZxPU/l+iURu0zhIxQCSPGzb6L93EZZ+j1SUDTQS0u04wVUcKHejW0rnUPsRMp0i
 aDU2wl8yMkmu/EerybVNislobBDsx4vSVOtRgMxwY7iJU49TA4qZ3vaBAxo8gKOHtrky2CP39AV
 nk3WeuefJSAZPiKC/jAbYqThvGTXNtLxu/a2PkSu0s5P5PwgDE/+RvFp0LiA4L23pNvBnmMhRlq
 V+y4rtaVTGtj7Ng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c1721 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=xF5Bwn5Do6ynS7Zu1PoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfXy5cNtELcf4hM
 COTNr8qNol5AkQyHgcrTZZO7wzDyocaTQ/hGhZxZru8jCwwEv8ijpPaHAeHUN+7hP3RS4snK0RK
 orhCgl8yPTW2+WVQtBd+m5uylXKQkftXC9tcOj7lAOCUDkkpOPcShV7zy4Z571luyRNjS8pqida
 HGZm+yOK8NfW02Sk/+S1I5Zqn77+Rrbdu0YbH7HsqdWbDjZdpGZuGftqO2rEAQEJV3eIKHlA5JF
 hEofH3Q4EmHqww14oIsuBYoOaCvnjv5hVyJiANc1P1WQrF67E8qbk0xj14+imAZc74uJwMjniaJ
 xj/rYNLQ+s1k5cPXk+2t4dwRaAV2fnHpF2TNJaHqJdHXF5O5+z2zioHpVbpZXfqF6e5+UH5Q91X
 itA5s8WlQ6qgUwMMU0QmAxqsk5djnem+fB2cB2/tiOLOKoLq0R+c5wWhc50tcdLAEfkc77sjMrJ
 HcP/3c2//VlxnfG/xUQ==
X-Proofpoint-ORIG-GUID: F2i0XPnkLNb4VE9hqLLSNS8bc-jnLxbm
X-Proofpoint-GUID: F2i0XPnkLNb4VE9hqLLSNS8bc-jnLxbm
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
 drivers/i2c/busses/i2c-powermac.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index f99a2cc721a81dc328bc03ea88ff959cafe0f05a..fb5482655d6c5c617392e9ccd745433d5d828335 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -92,13 +92,13 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 
 	rc = pmac_i2c_setmode(bus, mode);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			mode, rc);
 		goto bail;
 	}
@@ -106,11 +106,11 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 	rc = pmac_i2c_xfer(bus, addrdir, subsize, subaddr, buf, len);
 	if (rc) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		else
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		goto bail;
@@ -145,23 +145,23 @@ static int i2c_powermac_xfer(struct i2c_adapter *adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 	rc = pmac_i2c_setmode(bus, pmac_i2c_mode_std);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			pmac_i2c_mode_std, rc);
 		goto bail;
 	}
 	rc = pmac_i2c_xfer(bus, addrdir, 0, 0, msgs->buf, msgs->len);
 	if (rc < 0) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_dbg(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 		else
-			dev_err(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_err(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 	}
@@ -219,7 +219,7 @@ static u32 i2c_powermac_get_addr(struct i2c_adapter *adap,
 	else if (of_node_name_eq(node, "deq"))
 		return 0x34;
 
-	dev_warn(&adap->dev, "No i2c address for %pOF\n", node);
+	i2c_warn(adap, "No i2c address for %pOF\n", node);
 
 	return 0xffffffff;
 }
@@ -235,7 +235,7 @@ static void i2c_powermac_create_one(struct i2c_adapter *adap,
 	info.addr = addr;
 	newdev = i2c_new_client_device(adap, &info);
 	if (IS_ERR(newdev))
-		dev_err(&adap->dev,
+		i2c_err(adap,
 			"i2c-powermac: Failure to register missing %s\n",
 			type);
 }
@@ -299,7 +299,7 @@ static bool i2c_powermac_get_type(struct i2c_adapter *adap,
 		}
 	}
 
-	dev_err(&adap->dev, "i2c-powermac: modalias failure on %pOF\n", node);
+	i2c_err(adap, "i2c-powermac: modalias failure on %pOF\n", node);
 	return false;
 }
 
@@ -331,7 +331,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 		if (!pmac_i2c_match_adapter(node, adap))
 			continue;
 
-		dev_dbg(&adap->dev, "i2c-powermac: register %pOF\n", node);
+		i2c_dbg(adap, "i2c-powermac: register %pOF\n", node);
 
 		/*
 		 * Keep track of some device existence to handle
@@ -353,7 +353,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 
 		newdev = i2c_new_client_device(adap, &info);
 		if (IS_ERR(newdev)) {
-			dev_err(&adap->dev, "i2c-powermac: Failure to register"
+			i2c_err(adap, "i2c-powermac: Failure to register"
 				" %pOF\n", node);
 			of_node_put(node);
 			/* We do not dispose of the interrupt mapping on

-- 
2.47.3

