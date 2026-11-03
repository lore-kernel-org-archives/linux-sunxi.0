Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712858;
	b=LxhsZOykZd7gzTF4AQGxZvop0Q5g/1/WLCrj4cX/olzqgsCrNzt30EIdQW3uHGj9tw9m
	 MAAdUWXAw16XMXkkemEMD+b7FDDFZcbiHDWjpjZ+gz5GSX1i1HixWFXD04/Jbb4Igj4gO
	 5tJNu9pKE7hZZOCdcoPnZjHs8Qq3WEnYpJoiOMLlmvi6r8G6CgO4LeHENYsISwl3/ptlp
	 0HAor9vSRhHl6bhq/jjw4NcWUnm3ww4h2b8BqmOo7hXXm3tj4MP25VJxT7iqN5y1HVUew
	 IwxI0uGRVu+le+dzksidK3vihW7SMNUXvWt/bKI2y4Raph0d+/NqNOKWaRzVfH6Vn1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=;
	b=dVrUJnssNoLkLgrXkZQexcGmoR/eV07P+MIfS87H5f5txd+VHga8stOWhdvSLxzSlMeo
	 Llhd3z0oMsBSUUjsEUKZQwuRbDm6SkR4Gf3ei1fGjA2dZvlcu39wNgoVgSBSECb/YLSIX
	 NRAXhec+bgzgKDkq2YE9hEl1qXfLc6ysPJDjA0622eVIOltCFB4hCk762ykNhGkEapOve
	 L+MvLIvHmjqVJ/KSMPbJvkedKSB1m3Wd2jZT2pZzWS4C9pPSp7TE4r0B3GRWooFMB1oDm
	 Gv2a9Xj8NaojKYW3Q6KBxxZKNQB1qibWS/+Gc/5im/raerHgbFntRrKFHa4YrNpvovw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1CK6Ffo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YaR0FBGE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095B5606EEAE
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 13:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095B5606EEAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1CK6Ffo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YaR0FBGE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClENh2897066
	for <linux-sunxi@lists.linux.dev>; Tue, 3 Nov 2026 13:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fSFNdJgGvwopHTFPREQKhg
	PmKSBKEGZI/r6GjlVmNlQ=; b=P1CK6FfoAAkGJNL40dyQMbJWqH1fCi3gQZd/8z
	Lou6/z0PloUEvicelSjeopBBgaVP7ptdK3DoIPq8HMk4bMEhGUQuadxsE++tMOTK
	MWMysaVloK09OijfNNLA7RIGKyc3C6Uh8w0S+jG84NsC/1tKHZMZ+uo+eo/J0oVX
	el+s8EVytA1aURLuFkYk2xt3EHyABEioJqpcwLyq3k151ne1Pei8ahFdeFDtNYN7
	ak1kBMTi8a4uUgZdV2hL5iGRsx08PxySTt/1Xp539W1ZjYegHY2C61z6CfBlrNzp
	vstikzjAOadT0/+ReQov7Ve0eVsGCKx11YGiKWe0AovtqQHQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0873wy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:34:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98bcae867a1so644761241.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712853; x=1794317653; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=;
        b=YaR0FBGEh6R0Dm+otCOLWhu29y5m3TteiSNX4v733A0BQonesr2JL3YeL62+bjgKjn
         xNaGAwdFH03vBsffozUSIAGNiNiCDMraiuA8iILA1xHZG50lDM2k+65oXCt8HX+/e2EY
         mORE7h1U7CsQmkhGCcGANHIQxIsN2Ki1UUVhbn73Ci92FbaiJvc3v2gashyfQvWR+CBx
         VtG8OEhJ9VkjEVd4Bh/iTf1atU1O6LaGZE1W85GfRiFbH7ukyKhucYsgTjBro09pBTT/
         FCj8GXDYUWJcyy++6qInMzIX6v+x70pJQvTxH4eoWNaBYDCHzEobovgVi0TyTAS4uand
         m7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712853; x=1794317653;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=;
        b=kxswcmXez4tupzel3VPu0DQR9i3dcRk8dAk8sKMDxia/d2sKBvDN/tAMOZu4goN1kb
         ibDUyP9Y4k11fTuoto77sIQjLPbQuQUPoMX1MlMYb2l/Q8+YLWSSaDHbpLRTtKae1/aM
         GLbVgq59QfvHaraqynrrRoIk8BdPBH917JzdczANLKA5/CaLFfF8G9Ycb1QmUkglFN6p
         NZUzKJuPIUPJ7DoC0FvdLHsR2dtNOVr8BwgnHolV63+y6iSiJ8LrZNmaVGXoLWkiWdmX
         SS4dlNKWaklOYmjVTyO8MmyiFjC0Xn+UF3WlW9Z3YeYRubK4rusHKJ035pGQrBf01h+u
         eN+A==
X-Forwarded-Encrypted: i=1; AKwUvBxoBvm6YUcB9HotrEX9zGi0IfHreO3mw1XCVzGnH5ejsa6nTHbThIbNZcCo/78pnIafjdlq+L+SYf/QFA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+eVswnvrt8H7FpXkFoJdRfPLOY9pZODWP1iX1+/RJ9/agiq0iM
	WEMsO/vDVYidS2U9pdYSMEBLXmsdQIHmtPDEOIq4muFQ3pv/lF8TLHH3ZDGi+iYLw8mv8RdjlFh
	ZL9o3HWoVs18HN5f6qIbONc4Kn+yyYgmvAWSFIyL/lY2Ii49eUoSVTwm2uagV+2Dd8w==
X-Gm-Gg: AYBFou2ulUNpJgeBqafiDbSYxmDNbEtnVR+eNaElHnJG2MTiakxbLnEzQeDEncTg18p
	R9jEy+y+fb+42TElOol3xwRD4yU6mo/1A2RZY9tbSwhr3IIDrwrVA3gDiB9XbBw43aZ+T17WxIV
	GsO6OptnInQTh7QL/TmB6bGhgClfjmOxNMPeFuLaOo1aSlXw7cffkpSOfqzdhEvLXKR4k6wiV1y
	rHNd+uksM/ntiHw5MIoN8KV9zet6wW5jrarb7QuCMf2lafuG9WgTdwgZMmFaot33bfUUclbvd4w
	fTqFLbh4vrqqOoT4xH5JrheOz4oDyM2euYbsHx3vghw6hESyGyDxo+GsfRMNJ3/L8SeyVNiuTQi
	35XB2gv3x0eTnlOfW/ATwx6Nss4wZ9mvussMiD2a1IphFxLI1wBWq5q2FAFt245SncmPvz0I5Oq
	V/4g==
X-Received: by 2002:a05:6102:3e84:b0:7cc:32ce:4c51 with SMTP id ada2fe7eead31-7d0725cefcamr4330603137.8.1793712852902;
        Tue, 03 Nov 2026 05:34:12 -0800 (PST)
X-Received: by 2002:a05:6102:3e84:b0:7cc:32ce:4c51 with SMTP id ada2fe7eead31-7d0725cefcamr4330597137.8.1793712852429;
        Tue, 03 Nov 2026 05:34:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/panel-mipi-dbi: stop requesting GPIOs explicitly
 as non-exclusive
Date: Tue, 03 Nov 2026 14:33:51 +0100
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAL/i6WoC/x3NywqDQAxG4VeRrA2YEVrsq5QuvPzagGaGCYogv
 nuHLr/NORc5ssLpVV2UcahrtAKpKxq/vS1gnYopNOEh0rScesPKmyZli8Y4x3V3PcBL0ug8DOG
 JTuZWIFQiKWPW8z94f+77BxCusO9wAAAA
X-Change-ID: 20261103-panel-mipi-non-exclusive-gpios-bb27e91f31e1
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wi99EfjZrDJfc4ByH5DW5LiPzd+d5x4qqFh6JHJjz+U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLRR4h1JzI3varWGQUzdBOuYb4wR3+FhGm1v
 VLnE9/MsbOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0QAKCRAFnS7L/zaE
 w5RvD/9+qgHJdqEE9cOISLwTNLZEAeePooJ21oZyBXVJ9HzRowzhSVXfRV+d5UWam7pnTBKb86f
 /hFhyRxBYWnnvLzwf5T9W+Dl43T0Fv9vC/BFKpyUBUSlpZaoeCMZ9Lbp6BpPbfbDrs2ZA2GJGBJ
 /4geiGmFb9smNEX1UDPbPh4GytbFkh1ndBf47pkzIDa/5MUN0EO+BOUEWP8R68mdfEa4HO5jkbm
 a9L3eOuYNmI2O5puHkDc0I4VNhzyPvoMZz1ple0PGXsN0ALd+SEQfQb5cfssWQHKRSKDLJJRTpS
 NHPi9eaZ8ArXRDdB78eq26D1KGyt4vnhDA3j6FaD1BEz3pm14WA6whjvELRpXacKqJhWtdkm6M8
 kSRoleVeXCGClALH1TchAdVob+seZx3wqHArsiC9TC0HcdW4fWbjIAo5LXojtBYpOC9Mo1QPDDw
 wncDeDCOSlHLwNIzG4iuCw7EnNPxeSoBam28DzBbje7//AwBqDJrG+ErlZgaIJJ3ansHeIANht7
 jppIqC1pn56IQW16s7z5xpW0u6juotyKmkIteyeDnT/KCxJ4QVV7JFwmwqanBXPN4XhA8LUzWC2
 f8xoCkYRCCBjq84iApk0xhY+vDBg60VIqjo2ylevGDYOaE3CJ9XSK1KmUmBBHy4HnorbOysgo6k
 8ZDVWN2t2ktuuow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX+0C4VritQbIZ
 UM9035gh5ZD+ZIE/45fyIqIo9yoN3lNcVj2aneii7Afbc1x5mvSFygUP5fVKNYQTzdjseEc3NxB
 tugpVVieufpPazTP+Oq3oeUV9kKIgm4=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9e2d5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2ktC1rJDgDHwaXYRQ2kA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX1OZh9akW8twD
 oJ+a/iul6LwTaCYy+ck/QBTvYMU0LHAU+vFOy07iaGyblbiZwWteqLQ6CHbKjhitifHxIcR8Tv8
 eRl71C9gh5b7Py8qLvvUXRF3Fxq9XYwj5nBAXXAmWr/NziXpKIBrkXIjpGF1ygxc9tBUto8ptAF
 gXIkNy6TUNdOvicn53+AVL0zF3GQLcXkustwxKFE5eiY9vh1sEkwbC4cugFjEJTfpvteTItO/s5
 xsZazaNQOPYJJcIKB8rP/FUuq77azUb8IaFSXaOKRSgTLsYd8cKef8yG6RFZaRG99dy1rWxrNCf
 yMaFhmSx8ca/XrSuwNVqX0S3msvcfnZOIXTcSNYCnr58HAkNFZyiOKlSGeOgwcuXXqeRwwyYwDQ
 LswWRPstWzmxhFx+vs01dtenehxJXoZiDZsGUy4tijiMvkDnfyCtsYl8NmSymdOtNdmjOIY7kFW
 4wvCYAgO7WgfCkWmL9w==
X-Proofpoint-ORIG-GUID: 92pjjc53odFYB5x_YyXK7dUqFiOA_zVT
X-Proofpoint-GUID: 92pjjc53odFYB5x_YyXK7dUqFiOA_zVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030053

GPIOD_FLAGS_BIT_NONEXCLUSIVE is deprecated and I'm slowly working on
converting all users to using the shared GPIO proxy which automates the
sharing and allows drivers to not care about whether the pins are shared
(as they should). This series selects HAVE_SHARED_GPIOS for the two ARM
platforms that use this panel driver and then drops the non-exclusive
flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      ARM: stm32: select HAVE_SHARED_GPIOS
      ARM: sunxi: select HAVE_SHARED_GPIOS
      drm/panel-mipi-dbi: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE

 arch/arm/mach-stm32/Kconfig           | 1 +
 arch/arm/mach-sunxi/Kconfig           | 1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 +--
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-panel-mipi-non-exclusive-gpios-bb27e91f31e1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

