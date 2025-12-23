Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31802332EB0
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484179; cv=none; b=WRfvCowsIcfexT8wK9qpPl6UpjZdfeWe92OdUvP1CRS4CYtFXevgxVfC7/hAkqn5O26ebG00yJ4a9EWzMhHocy7Cq9oqdwO90pkSeDOxysRy+wOCTMCt6xdAvS2A5dqA8NQvd1MLRzXeWezk1MjCG+hfGeftoda/+/4uYkV7oGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484179; c=relaxed/simple;
	bh=RIl62iCgn+geu7s6HZTdTxIYUTQdth8ibomSIberRJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzCqCk67p3FPSlVJQftyLA9bwjjxl0JbMpohBk4ApTpWT1KsE+vmRZveCLThLV/s5rFTDVLhUwhbKR1/hmCJs29Wz+cqLKbAqDRTHY+5axiiAMu+aq+wnAFxtwWNBTnKdI53QzIrElC4dRPI41eX7q7BMoA7CB81lu+HaRiJ3z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGtJqv01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtCsFS2T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGtJqv01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtCsFS2T"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8VE6d3062290
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=; b=PGtJqv01xFkPDLF0
	9sSCKg1EzX/dfThiML4tQYD6RxzIc2D0GQHgc9E5woU7+Qa4ZD5BmxFTfDwom/Zp
	/dTHffSso6IFUu/pp+5jvKu7njf7FTstNTuN10HjgRc35k1yoFcgALIkB/1I8QMC
	QZCbZDN/YTk06R+RYffs75NYZgj+u5kftGGI3BgyL8qQ+MYuvyX71b+IxVB0u3IW
	CwtPIanv2tzUPcpsOm8L7bW29WfX/DVqFrGHi9cT4ZWsPFpXoQjXlkOONgsyHBol
	OisiQG69PHI+hDVSzmfJCWIjsuRO6dStKYjFiplI/ML283x011S2Tu2nlBLS7Ev+
	f8qGUQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkaxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso45699081cf.3
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 02:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484174; x=1767088974; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=;
        b=GtCsFS2TqUtRfV6Cx1dxMwWc1c+r4XdwFuLE4NcNrJUUgJEcp8SAb4PX3Z83RpYOCF
         ulCaLQ1N2FBeEQCQggPZibMPEM73y5+Ba4EDlNSqIUlUxZTi4+/TpMQcqQwjNkGuONww
         fTUVEXR+KBnCRek4B+UziE1P4zqBFocosuGFlXMHamooZgGOtvvXfvxI52qbor7bdzlY
         iqVs3oukqwYZV6Or/58EGszy7TejCuVByI2IuDYv+r26q7f04RVHFbGsye3YGPb+Z7wZ
         bE4yJzSyzg6CSEVm8AyqY3GpZfl8u94qGWKijKArmZkJAwlK1Vi2u/J85j8kEIb0/Fzb
         5GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484174; x=1767088974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=;
        b=f+edE/8FsiVG4b28qOFLOtBDYGIJ2JpMoNKN++VUUluVvswLdvRaN+bWBKgfsvM1I5
         PksagKEqposhQG2m8+Ffnc60OsDbePkQpSAaUIYTqWByHX8twA6kPGs5lUaslx8b0dTK
         H2GP1G7eVwHB0B501p+wPOzeqWAuYKpQU4XPKqhz74h6xsdj+xv00D0K4sptgtiahtvg
         kYo7W5e6m0sixtYaYOaCDz+dP9hHkF1Sde1NSOi5Ns+gFZHNDZrx3x5JOFXgqtcK63b8
         COk56oCCf3qmrY4IAO4rWoQ765F32llZ15/8hLWrbV3FPbdP9lD7PDNK5IkL/FNJZu6p
         zDpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDCzkPhitrezfx2YJ6+8leKmSSt7TN2y966qseHQj0u4qvFhSCGRcUNGmVI28R/0Ml8WmflQk5Lb8Dew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyG590E2i7RoP2v98CpMsJ+eybNvNoFONefEyGg5rf1qxBfwiBZ
	t8PDfrMouFmbKqWb57qND3aSVj1oraC2mAoeVi78nz0s+1N9bSA0Sspe864UCrpZzTu7iX3zfi+
	B+BQRR5qk0mAvANHQR+QOQo4vlmQbX0cGs2CoLbTajaWnEd9O/NchM+6+4Njlyy1HAw==
X-Gm-Gg: AY/fxX5XtHBa+Jzt1BmFT3RUVdsbu8eh456e/vE9GX4fuDK7ZraXAKMjYe6Dz89eQ8F
	iczm3AARiHHrE0Wt84BJ9xEHtQ6NpwqZFowpmglMynysh+Z8GMPK18RSQCD7rejd3CNw84X+sb/
	nzOukBftlgfZcLWRTyNrjvepSkj/1r8RzukEk9TG/9Tt02w8xlUteRjkES3NuTPqbJ3sWKVGGw4
	hL+cuRGtfeAKTycWHglD1VqBCibRDMOIf0EHGFn5w2UPEaBGg6gKSF592klYQN3XMSexflHsB1l
	Oq/Q3oLNyPgZlLYTGQg6ke0InNcVPoi5ekcKEuvgioPDTYrIkBFVyA8NV4K9PrIpMtPiZo0ebrh
	uW5/T8LNEUbow+ZnyJCHgY7EMh085S2TAFSVxjw==
X-Received: by 2002:a05:622a:258f:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4f4abd6e488mr216717921cf.48.1766484174519;
        Tue, 23 Dec 2025 02:02:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPzfEhfDLCN2KQRG3eXv3603/QIFTCQ3fgqRQI0wW6fh6MkpQmoObyB8JOHuhsUVXPreOj+A==
X-Received: by 2002:a05:622a:258f:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4f4abd6e488mr216717531cf.48.1766484174005;
        Tue, 23 Dec 2025 02:02:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:28 +0100
Subject: [PATCH 06/12] i2c: scmi: use i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-6-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RIl62iCgn+geu7s6HZTdTxIYUTQdth8ibomSIberRJc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi9QpltbyrI7odMVS6fBVkmr9NkXuk8yrkL3
 XkWgXt4udWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovQAKCRAFnS7L/zaE
 w2S/EACN3KysLT+Ab5yj5K35LkC7LOd9tZrE/a0sLOrsKkOjkbjUa099UfaIId1GKtt1/aaAzQn
 bZtc/GClmaiNzCfR4bdnbVCOVXcvIMikDvr42Wf9iQqqnRCpoo8mUXDx+bNQlo7MjKwKVs0vSZC
 GKF+3X565kuPX31mKr96XKGHfsHSCWADBDiSR4kBX3h5vgQeN0zgFPq9S9MBTBDEMmSfHtiS2Eg
 R/O5ZJc+6Xa2eElqXm4De1R+zF85mV/Qu3xkpuSFXEWWFZhrCd/Ei64B1WJpo5pA0cc4Y+Lo8ey
 gIdKhh6SkCedu9ZLoJy+3fkDCRrmC+vvtlu/nb3ML0x8cJEfNehgmqTRuNBTuAujBvJ+PTc24V8
 PGfeAsHnI7pMMHFbjZXKht9/nQ/5DDPtWRMc3xAXdTmNetVRcZqeaplnBfr06ZJtCg/I36MZcUE
 QOyAsPM1E91bToi8GsL5jQlpfOusxgAozXWvj7l5DE7mo1AEXBsGthuECijJh44aKfymlGGRvK8
 z3cOUlq8lItD9ixk98dVGmGPYFvkhxl1WPKBNhZ7+wdB9GFywUHMR1SKCe18iO1LhrvpgzgYOSR
 4wdpgP+2B/dPen0U0hk+ZaNGKeQ9soQCtUpUwkr9ASGtDIF3vmVtCxkzoCIM2wyEnK8iAuQGW9M
 FJMCJ+lgq98p1vg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX8BrjR31hBesj
 p8cOGiRMXhA5SSVLFUxI4gYDpiEgO8ru7iXKH6iknZ0i6aGyLdJ0rzSzxX1K1terh+1qE+7V0Lr
 HqGtRsupSTGfFsJCC2pEDOgHAwlDom5faPmKNvfG/0ulR2nBh7+DOxyxcPZZ4RraJinw2ZGoTsP
 +aG5bbk7VSgbgyLvXUDOW09trZLWa4pCPQtC5vyvh0WzbaA0Dja+ZkZNiC/GChXJ1LV6GRtk6LQ
 7Q0sYbjqsnXv55lWVxBCz8+LNai3uT3EUhJurYXF+Sx2Id2Ki8QwlxtM6rd4sjBzZhT6AsF8y+H
 oOSRJKJnAejv83qfRAI/JVIwZj4DN3ZB/Fm2w66G7VDQWJvaOVwEU5INpwjlpGCT+eHJYEEOneP
 OXKw+Y9bQ4u7Wj4LiLq9/MJlYqMtxcGoibo0SYCZnY0fKx/HfM/AssNOxTUWtQRgDxwA/Dl42s6
 DTgLCeOwJuTu5bhUHjw==
X-Proofpoint-ORIG-GUID: d5BH9sAjlUnBHwY5TRLq_p_Sr4AUMjK8
X-Proofpoint-GUID: d5BH9sAjlUnBHwY5TRLq_p_Sr4AUMjK8
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a68cf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dY4OjmsCUpDc7DjzIskA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 10a5146b3aa5fc6edb4c2f3e1cc57750041b7087..96a2cd70d367f485d5f230be4eaf124398b0f239 100644
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

