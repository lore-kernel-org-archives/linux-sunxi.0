Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712857;
	b=yrm5U/Eu+OGoPgQXsKZTTNNVayFHmePfwI0e+K+TuX5MWQ1WePuaFgXfUS58cPsUkAI8
	 1C4W7hPjhc5Hu5DEP6QuOTGPeg4dduUzMwCB8YE432N2VcBOSpb2hLrsyJJ1sHkSaY1HR
	 Z1u8E+pK8EacjQGM9ynck6WN4zabOZ9SF6ifflsIeH+19PBMQhIG8+pntc/in9oJKlBu/
	 G5EpYAozTb5FmQXJczxwSS543YC9ut2VdKmRzrVGLJWVtlh4TexZbq2nGLHLqbssCydEo
	 +X8IBthP6ZTcNFOWM0YoyzF9LltzCgx9TUs76R0hF7FPDHJkFkMhhzplPi2h4P4+r0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=;
	b=0Tw7h53dysschJ0ZqJ/XCQfF9FbYXbOrMM/vYQqmWrlPZhyJKLyjyvEDt3krswongKH3
	 /HN9yZ/6D5+z+CxJLGOCKOvI+D35IWcbvuKsKOLAX2BI9+710XyGZ/Ze9r9YVxMxA4Hnf
	 NeKEs8BiqnBFMp5COuzocvKSj4rs5kxAqvKo6pzF896vLsbqw1o0tEvt4ViBHz276qxZ9
	 PsKAjsJNugFvAH8NA89BC6kFRZIVeivYA+oU5dCQ+skHqSj4oldjzaHnAKG4nwlIjQy5M
	 lmZbxIZrOynnkPDm+QJJgjC9KwAsbev9+l8YsKIr3eRZpg8jJ05EBbVZSUUqTumV7AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MsiV/zLn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HlADrl5P;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE1F606EEAC
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 13:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE1F606EEAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MsiV/zLn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HlADrl5P
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClH2j3506875
	for <linux-sunxi@lists.linux.dev>; Tue, 3 Nov 2026 13:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=; b=MsiV/zLnv5StFd6p
	hWvIzjdpPt9IQDAnWLv0tTrBGhCXT6u4wo6edsawVRotPX9NAWrAfgVi5ddHdiaL
	/GkXynkW/wyyEYd90f/TZ5cMEQcY7/FilTG67WsbGrdsuFkJTIx6ZtxrjeOgAQRK
	SlyRxNJRt+IOgiRCUykisIH3nJmlVDP+XfdwOCYYAT8dKmhUmLvi3Jf64xb6+OwC
	gzOz/6jUAoRJn5sH0nIA9iCDR/IPID3189s7CrV1cOIyuKvr0H6OW5FfUlHp4cnh
	NOeXAFq9T+O4R0O02xxzXBBrEX5vW2xkGRZ5lErI6Yn1X6ZP0Hk+IjpfHlMOqQsB
	cnyeaQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9af4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:34:15 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98bcae867a1so644778241.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 05:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712855; x=1794317655; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=;
        b=HlADrl5P8D4G2x+xtuIyUoWuTnAoM4mP+gf8l2WgXT9wW5SZLjhCidB6pTejlj/ymK
         K6tYPTvKoMnWPXgT0cA/Kov4ZnlHFS0CXFoIgkP57I323o8pysH1HUkaOBs3Js2yl5Jk
         DGbVZk6JzGLZZZuUq85ukgQshdrz69dW8OF15emqQCmuWduyXBVTNCZfNEqWjp/XemCR
         k3LS4k3GRpyrRrwFeTxXAVsUsnD2plcmtOyOtkvqR4no3AoRQU0vKQj6fiwPqTbAgoPa
         Q7b4ju+x2dA4SJVLDXdfoX1u3A+M8vw94bdlcFrs0Kqym/LNLjN4e42Gur0KmBN8hdsh
         fxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712855; x=1794317655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=;
        b=ENj75J0BI7BL1TNiaqAUdWTdfTjTpBRxjGqvZCLI6ifymax1hArVTVK8vm2nIBt6YX
         AI8zmAGvVgXTPWNJD8iKY2nN/VRCI5TnhcxPVaTKuTkaLggUNUX8hb7m3clQEG8IPLC8
         /yFVwZ9gLi+WSXyNs3EZzFX+SdSeTjzvNvaaZ9slKoiLlo/9k2h3+FqTEyqwXCMdSK/G
         VG+K7CLUIAsUTZrXcGpeAbzxzQ2/POgCkwmFmCLosQMn3VeoUhyRPMD9NSmF/8ibNGQ0
         9OesrrcItUaYUoNyF88TQygYaWd3U78N1beCU4jqrfsImq9KmVfjUKszH+B3CsSs8t3T
         +lXA==
X-Forwarded-Encrypted: i=1; AKwUvBygj4oh5SexS8UANa2nwWMl2yCGc8jB4OofqaLUCcm0XkGUadb6R+kdTakzJoIRLjU7eUCT6epHbEghTg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+59qMi21qKM18pZ3s9XpBNNjW18YcyucpIes26iuAQ9WneYo5X
	+Lbw2e9pZiSgcEx4MtxutK81xpsRItTJ4ztPK59hXcG40lnmIZaQX4PGH2pPzX4j6xrt7NzTsdr
	O+sV2Mts0iDD9G4D1QrJdfcUxkhxWNl3z+MhfjfkvhFvc8TUgtwOB1wvMOS8Y4sT1cQ==
X-Gm-Gg: AYBFou0JiuwtKU9c1tcXYAa/jynT64DnVFN0ejgGlG6/wz2lD9AJxNKCALOHHpuW3zM
	ljzmUvsJyuGX9rnO8hZBp9Z3QA4DLJN75osYdyT76jWrLSqEnW6NL9s3vqfn06PlKLU4mE/idtQ
	EjU85iQHAEgsfaktt9cljzNOforiwa5y79lxEaoCYlUc3gHgsbDCLk0NTk3RGkpnjKuM3w6Ojm9
	Bwwms0o947/UEE+YxA3OejnDfqvpqXNXF9YA1fMIeHtQQid+ZDfleoLSH6X+eBFJY4GF+nv/Tyi
	9B4o/A9ejthMA6Q6ala3UGYa/whu5rwl6ZyBI24TqKWnyQ1zA5tcS7iReUAnO8iF+x7JhcSwwjZ
	3Lm6BVRBpi74FquUrYrriNqwh/0huDHR+JdaZZzXW24YPKkE7wq5nLEVBXNBxUy7xf77YYK9HJF
	WdIw==
X-Received: by 2002:a05:6102:6883:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7d07267f930mr4343543137.24.1793712855144;
        Tue, 03 Nov 2026 05:34:15 -0800 (PST)
X-Received: by 2002:a05:6102:6883:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7d07267f930mr4343520137.24.1793712854700;
        Tue, 03 Nov 2026 05:34:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:52 +0100
Subject: [PATCH 1/3] ARM: stm32: select HAVE_SHARED_GPIOS
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-1-aa862c1d71e3@oss.qualcomm.com>
References: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
In-Reply-To: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
To: Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+xwhEIq1Kfy5I5NBWcOLNXVJMoR1QHxqiMRtC7afj20=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSGfA1l9T+A4p0kHk24QWFBtFJJJT4XTpef
 LL7mrxNOM2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 w3MtD/9uudBQVkBxiiyISXvd0Y8Wm8gryDzgKaUNm4uEeMoX6xWUdYiho8KqcFnTr2vQp4EHnl3
 V0ky3XWFAJp0xs5mWtYBVxfPRZRr8cnxjlXKA8ij1iB/xGYMX9c36/H6dvhJMcv0J5TVL479Ho1
 Us0zp0l9KFSw9Wb7NAJYRFMMmmycip9ccbIS5alE2M4qiJmOoP+brHSvRaXMTZcIfAPXSlDn72R
 e+KKlEt3o6mq5kvmkf1IqPQPvfB/e/Ge4s4s76EVwK/1qjlPqRuRLjDkBuwi4db9tshI2O9hd4/
 enqe4FeuCfB7VRHCRYiBS9m+Ic/QKQaDynxnHy8un+GYvrJ7tUuoXIL2n7bU3ArxHq4feXatqZU
 7QD+4rD4k4y0Wpu4IX6wbtG2W46DJ+782W3LOnAbWo+QL53D4Re/Um+LJ5mYVG04dNybyezoMDM
 b16yKM6XXF+aWYlc9lVXiHYH/S4Qv0AKH3gbG6oH7Bs0aRloOJoTG7tF+k6SGgKz6DdorIl7gq+
 B2jzN5nJ7CW8Ir2RG9+9/iWLT/uwfmCqrpUIYb4rNPgFRBhkawf0a0XJ7SC6ofdLHCFkD2Zf06O
 UXxh6oLDnuX6xMBcFK3qaQYYVC1zi0uFcU5ITlheV7DslAZ06/VqIMwIjTDugUu9CzVnemUyQbq
 j0MTBEPlGcNcfIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Pg1Xz_rtGtXzzpgR48MFxystcUfyzWDx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX2DcBI/Qh3k+B
 8wRBI51jeGWywLrK4DZwwQjkcl1MleftZPa6q31rTOZ/78YjoAunn5vKg2mM1GaqEht2fhODqOp
 f/Vl0UKJ46j3tYSrzun4IPofu0n4hWk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX2UaQOb3FHeYu
 DKSs4OBfQ2/U19SbL8kZ1Dkln/fUjPEVKrTFTOjs7FD07RZ/S0w4OEcLdzo8taFfriADDsCoPeQ
 ITUVJWYxc816vH4HSPL8NE2qYnXVXcvLkOGqrEpOd1mJoA9DNuug6QpfTpdKbvplqxsNMcwBAPe
 1PvMKK3HwKPauHDKjHpiJvdQfc2x7wRuSpZ+5SMPksgy/4KCAziKpyI88ihYFxTNI3D3zjInX5S
 2teZ6D/7Bys01D7HnDZMQP7Lqq/TRZOYxE9FQ6ChuTobBm4E2inVOYZsDMemSXDYMZuGvniIbxu
 gY+4n1qGeZ0ildmOlLyyVhk50Q+TkxukzPIP27NFJT7fcBE2lWtpwdPtMNzCqDWsih/uJY5f0eb
 PCw7tq1wClv3fIuQETMKW7zeyB/xTaIIVsqu8ZO5XsZL0cdqAjttjQKxoyKa4+djcY2isEHJZ9V
 7dwj3HB5Fvf8MOb3gsQ==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9e2d7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=b5q88MxlnkSnrj9B7awA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: Pg1Xz_rtGtXzzpgR48MFxystcUfyzWDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

Enable automated management of shared GPIOs provided by the GPIO shared
proxy module for stm32 platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-stm32/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 4ac3384e397aabd86e4843d6a6326cd22a2dd66e..ecb6b35610f4988b4fca3fa10defc260a149f7c1 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -9,6 +9,7 @@ menuconfig ARCH_STM32
 	select ARM_AMBA
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_STM32
+	select HAVE_SHARED_GPIOS
 	select PINCTRL
 	select RESET_CONTROLLER
 	select STM32_EXTI if ARM_SINGLE_ARMV7M

-- 
2.47.3

