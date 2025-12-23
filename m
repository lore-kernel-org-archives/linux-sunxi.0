Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF06533066C
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484189; cv=none; b=cm9KZyEQ24M9hiaio4c5RwlwdZv0sGnH27SLOHQTtK2m6ZVViX/oPn3fITddT87HWWdnYGNIk+kfyZL0i9v2XCKuggwHxDobO0bbhfJh2rFCFX1s4V/a0/zvcKRm1EVi//av2khv1iBBDaqd95o++uVKxwAk8rr4Zw+IeWqAY4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484189; c=relaxed/simple;
	bh=4FwHimgg29jlntM6pAuTRFRVSUKHlsg/WMwTYloxTIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=av5bpOTu1PRqFBCfzOy6+khBB8ZStQ4YP23fr5XWKWs2SKxR9okXJPOOg057IzkC+58kJx8FipmmbL8wg+m5wYvc5RXBDRH/7B3GzB71HpSQrciF93vKAnclG1BXStL8SCPN/XMECGmgPD9vI85+2dckWqKWW+/UYCRPE7nW1TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TH82n2RE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JY73CFZV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TH82n2RE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JY73CFZV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2mlV02199150
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=; b=TH82n2REmZ2IrdP6
	aoMlqIC7IqTaux2aOxGZa/nehnemTyKBWoO/gusPvJ2i7kBV+sZ7BpNP52dT/BiT
	bV7249MTKpyxGvm4/W8xBHEIIcmu/cm1zPVrYCbIRLjMFDVzJcZfb651hTpYwTgA
	Dm+gPtTlM199hlN6zaqzsyLoc14I6hrs6QVqT4Ntb6CJ5Ww/S6VyuDy5cXqDf110
	Me9+p2Uz/ZYGIWv0ydKHbCOAHOWS3+k3+V78hz26BO1gAJ9Mirzxc9qQhZ1aKthb
	DWjgCiddrmF5NmVOpqsRTeBGjlkKSk1rBa/Bl4BDWHcBLjyuX5b4yGMvGcifXkpr
	Dcwyhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwurgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:03:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so130841911cf.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 02:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484184; x=1767088984; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=;
        b=JY73CFZVqRMqDHtRbmGSS04sM0An0f6K5I73xMiJa03jxPBj/Fcv5C5B1TpxndZOIL
         +2c/6Jog5sZlFSCrGurHfP7tyVMw37QVLDLPa/QqXKQfR+Jx69bdq8yCKQ0DUlG8RZJo
         //QwatweQ+F8aFlCt8DYhBp9ncbTFDy/4705uHWSwIuTJfSuf0yFN6abjxcVkO2m4SU3
         h7zqMeWf22gRbTVedv7RuOJ5mzVcp1lA5gWp8uhcvGAZ+SpbqjgTszAk2O8HOngTM1+q
         fN3zFJZRw98Dqz7GoQfbs5jR5xqQjdni5gERXrQpyFCiOvcF4EC9jxiad9g93NN5wKwv
         RBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484184; x=1767088984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=;
        b=IpZjn1qGeX54eU774xMPb6uxONUkBU4j7LrCrGzfrzG2AZNzLu4fYMcI3ozsNR9JgH
         XT2Vw8ZqF21kzKnZ5MuFJSiFLL3uyp3h/QIHR8Rju1ju/nWEiQKHCpNfO2KOuTZa7p76
         s5AtarRSMuvPLli1EwiqkSn/XHE45VTFPD18hxznEqvCNm6uGVu9mUrMdPyL48/45J8g
         AMMxEwhbIan70cPu9LnlZO14/uKJ3J0LlAm3O5oDv9v57cbmNIxEYf4qimjdF6ZvipoQ
         yagseSdZ8kCuQRlE15avsshTr1jMJYIi17Z3TzctAJ2oXO0LLpaTozPNP8iaKvTuBaQm
         OVKA==
X-Forwarded-Encrypted: i=1; AJvYcCV86RsKH6ESeXNCNueS+pj7rgj8pLDttimSDXtvGBAOIZrPyIQk++8Gmv59MusqLhGm7GqHIfzxxwjoFA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/Y/bqnjSUO37rtehK8vFZc+iPC6MbwqltNAoYjFO16qmNq+m+
	IU5SByXfSN9PZUfIGDhumTJi23G5frk7xuah/Vk1f6JsatfYiorefiR/Xd60nhZ5wC6Q/EQO2n7
	c6cazy4dEMe3GgrBtWPKFsYsm4h/LRNTrqI51jcPrJMpve4LyfEheqvoyo7fyhVf2hw==
X-Gm-Gg: AY/fxX5aZlMBTlrZbU3x1G4QPsGEydQtUXQo+QMEQWtMZlOBjg/abVzff6Is2J4p+Mx
	8Go4Y0p2zRz22L1KUNiAAQoDle3EuaDQzw4mvMGwJpUKn1CvMjdLlYq7GxFcMtg4GcVc9VYKEu3
	ZF/WKMf/SzTzhNP6EeRUIPbaRwWr5okaHdUmVEB01rkNT2wiloQxZb6UBQjLTITBl04CKMujfGF
	b/1gPTonF0ZFJFBmXht4Fa3WS357aAnhT8FNnmiiaUOHWWwnLYeN4kEhMGnz3beJIdT56V9xIat
	kOrqj/pEvRsTXzqonIPxt0MTEAyff8+XDIs5FyITTApEZX/mdkKX+vI8sDxo9+xjjfT4leXSJ3R
	5atdM04vU5j6MpYJVFsv6bohy+JFlQG7pXoeN3Q==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216034221cf.27.1766484183603;
        Tue, 23 Dec 2025 02:03:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAMTJ8pU1YC3SohbnEGLHAGZHc0AA80x7fYb578qtWe2mL3hTCo/7Z/yMtAiRHdU8xQS7aHQ==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216033741cf.27.1766484183148;
        Tue, 23 Dec 2025 02:03:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:03:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:34 +0100
Subject: [PATCH 12/12] i2c: piix4: use i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-12-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4FwHimgg29jlntM6pAuTRFRVSUKHlsg/WMwTYloxTIE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGlKaMKjcyICb7c6UsCyrP1wlptqZ7FtRRqRMa9ynrsk3cOjk
 YkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpSmjCAAoJEAWdLsv/NoTDTa8P/1PJ
 3J38Rsk8OVuFFOLjY8ZAaeAQBKgVC7sJzw7nbu3V+LQJH8+ifuhdooUdi0IlsXt97oMXa66FcQ9
 0gw2YiyNXkmud6rB3GC/x3c4uNK0wKq5spQJcT9aOUa8u/gZ4PPK4MfVSiy/Fo4YqRJURYxQM6s
 dAPbGdd7LynK69IU2Nl311cKRmBNscXNzM0Z1b4jOl1es4R/vbZA4pfJxJFdRoO2H8q0VEFbN0v
 zD+s3ZeRxYP5m6qWxnaTwRBrfeTH+Oos2g2inIEjSt7l4Xy6HZS5nefyfe8OWMEAxUeXjHs+bSa
 r8XLlsgEc9MVKOe2en8wvIZJfF/QZ6jd4xYcO+RJeORm0HzHdF8TgdU6oOgV8Xamhe8KsWMTV2h
 sNWtMM670n/wlBYz+kEBJ6YcWwL2Ecxu2HxRjvfDvCDpgXzBYBoV7ZREMO/10Ougp8Eplr3+wDs
 TCuxhaS8c3fh3rrA2IdE+z9h/IRc/F6os0IkJ2nAopuP+KVCoVz0X/pTy1kn84ukScDHqwKxT1s
 fSFx7xuLjep1ExXaYPvblmMmZYe1+UOQIDYK3cIhvYNaOUlyWNIBUQ+3Orngcn0vX/yUxGPAsNK
 lcfS+4siyLmNRv2Xhqgdtj4r2czS4tH0B4gH++Tezd68ywjNiXorRG5zcbWFFU+/8GTpHdiK0+O
 8TiEy
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a68d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZTA4KjZG30Bk9MnLWp4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX9aI1NWXgsXOK
 GZ6NheN59fP/fGtMpOdAo89kvDNbUrzZtsROWKxAoHLjvneF+mGN38mpc3sieBmBUVoy7+uAl5H
 C07x0R2azns1Yv+haKU3RKmIBlb9ftGGZi4dzl89Sgt1nk7raq/U26iLDoYDw86beG/T9w9koD7
 v+GH0qp9eZ1Hs4ChxV/qM/48SbsMpZ1/5hhF9nEqbWbvyFeKShWGJ04vcnzXbW09W6AJ1t2n9i3
 UTNep5NR6V8cA2Sk8evrqumzm4e9098JeYojBZcvDKKv7BVg0cfub0C6xPYoG0Qi7AbyFYzsiP5
 8qMnf2/qkAfYk62LBGX+zQUmQcXM/R9zefVO1TqA/LOqsgIYjAYesCsnt92KQeiS1fqsLOZ+vrn
 r4caTgm4Vzxbt0f+cJHyJj3E50hQEMW9J5OqLiykksyHv2pH0kQbcyPcCDgTw+I+AM+mm0l3QG1
 TpheLyO0WXtpjjD2ZtA==
X-Proofpoint-GUID: Ox7UVuKNSWbbQWG6ZL7fbGy8Yz503VAa
X-Proofpoint-ORIG-GUID: Ox7UVuKNSWbbQWG6ZL7fbGy8Yz503VAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index ac3bb550303fe5893822af50c385004c9292e695..bf6ce6b4bed3f4ae8aa392c68189a67636c01bf9 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -650,7 +650,7 @@ static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
 		size = PIIX4_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -825,12 +825,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		ret = piix4_imc_sleep();
 		switch (ret) {
 		case -EBUSY:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "IMC base address index region 0x%x already in use.\n",
 				 KERNCZ_IMC_IDX);
 			break;
 		case -ETIMEDOUT:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Failed to communicate with the IMC.\n");
 			break;
 		default:
@@ -839,7 +839,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 
 		/* If IMC communication fails do not retry */
 		if (ret) {
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Continuing without IMC notification.\n");
 			adapdata->notify_imc = false;
 		}

-- 
2.47.3

