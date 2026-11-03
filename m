Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712863;
	b=MqKUeG2EIVJNCs6l+IJBCbeUHVfSMhHie+FxdUPlLG0oePt/Ve8CcvFTCAO3ncEnLmlG
	 nowt6DX+f92kVwXcmsP5k977d/OkGC9+QY+lJ3nJ3xY+oCFHcwNRsIrc0n6DcSIdULXZ0
	 kv5PhJdETQ8FLjONB2wuo1SwvBn9Kg1UL24uCHPWuUeYqiV+Pc5HE7SIQv2umeHTvSZXH
	 vN5ceR3vxcAt0lCH7AmG/hNonlHnAR7GrSKMrFZQnP1AQfs9F+Z4whol5UmimdUgSGNRS
	 K/c4/Blk8hdmGlfeJWHuNrQQnXRh73h0Aq5ip6WrHn1C72neajYzQimNf57uVhIuYjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=;
	b=X539Pbg24YqQwwUERDClBHnuNBYAy1lgF0rG/qx7rUvczIc0L6/6WYv6RGWyB3K1uuUT
	 KOUyGeH2RNqAeQK8agtIoNi5xNI6iGfcjyB35AUvAJw95oTHlx0GlSw55Vaz6jg12Nahg
	 ZH7k4PgVKKBYDdUGLMw+GhhQQUH1GuJsmBLhyVq0aMvjSHHrHchkri82wH6QFr2k2a7lB
	 C/0zFzo/dr7ilPvRqgQXO190O0RQEmNdyJWnwCqsT5Qwvc6faweXVl1JhUKn7w8RVAuBf
	 dsRebI0f7ifPZd1jN92aHDVr2OvxIrpBLGDKcvMFSf0cbpvjUIpbhz2QNyHFRBr2IeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QmbkTUT9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H7ygn/t8";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC8606D823
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 13:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CC8606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QmbkTUT9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H7ygn/t8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClKdm2865937
	for <linux-sunxi@lists.linux.dev>; Tue, 3 Nov 2026 13:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=; b=QmbkTUT9EgzLQBTd
	DwbS5LW8ukNsULr+oDxFwYnWgiBPXw3dEogpNru3TPt4l2RQMK/YbXTyxbgQvxtp
	25KeFLv4HAUw9jIoRRfOfgpUSJ+nSYeH8WZ3pVHJCKKmyG+gUkaxtcGaYwQtNu7z
	thD4iYNqoWWEbPZgu7X9/AoSyNOFB0aaMpEplshRjGOQFmgpBM5s88x0hhZAKiIP
	o8eRJeGjCCTksdklSC+cKahTNWalNlHkpw2s+C3R5MVlPOp85pgbZoLXzAaW4mXh
	U+OCFkQ+6qG6tvpY4rvZLH8gUlWChW8CuTVLkd5qqkWknKpEPpL0j/EYHbmGBM21
	K1RXeQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5jve2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:34:18 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98c6374b678so3795834241.3
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 05:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712857; x=1794317657; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=;
        b=H7ygn/t8MKZ6Yiwm5pwqRKTODtt9eV9n48ZwFoq1ABXc1xk+BX9jus4FV7boD5lWUP
         uYY8o6l2zMbSmfusMlwaKh8JylGBLayK5Uc+SDldTu0+FP8SPUxVRd7FtClewA0SD7Qa
         LwGjBhwDyA1SturZ7stjQW4gdM2Idq1ck2LSiCRSBnNsRrBP4/9QN/ZH++LdCidZ4A7y
         4KmsRUXBdG0gtzrULGYWIUNW6maovDMXCHBDXJnSh6hXpvQ+3h9Hi+2L9T+rbVzWBY5W
         /TYKhf8FhOHsDEpjiuYieb+3zeEjLMpukLX0ibsYZK4hwt4ay5hMxxXCZ7tzh7TSTyJU
         YPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712857; x=1794317657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=;
        b=I3oND2tuZxb8o13YEzHeGabMmgd/t6Hr9bP+mA4IjgAPzr3I72dVXqw3XJMtVovfqt
         J5oCO5WA7BVG/G2fEipNR8jl11Jdxnj3MdRo0/lxFIxOXSVi0WhCpFig6nVEyHYbtRB0
         dhGZYuhHthiLGVZKU2E6sK91x7/GOiAVuEKwecUhq5ic8WQYSC+cwcN7vhlCovn/A7MO
         YUF94g8IbID3ayc7SFzVGBQ25H4YnrqFxhhp7dx1hRL0PMIbC9EPYETviYRET7DSsoYT
         2bmT8A+l06Fyxr37/YNEP2eQkYrjLpQt7kqjx0oO1YodHlcjxkPujHjNLQQhAU2RVK6R
         wISg==
X-Forwarded-Encrypted: i=1; AKwUvBwwV2nk/6VZDyawWrExtPMSOnCAwT6uLWSKRuysb22syhRtDjAowrFvZMdOKjm3oW2vd2XXOon8Ggs+VA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+3t3rFRXTg32o9yElGaYbTIc7CMXFkrWVTit76tiaxAWvavWD4
	Febm/ZvqN8/UD8/uTE1CKcwrPgoT30SuUssQFRRWaxC5McZZYBhhTqshBakKC4NuOG75/r4nXyA
	VX/mMcGOmgZrSIdWGxHlv9MSL2RX8LICD/RVuvGLi0n5BPW1ah2Q7ARr3yHKZwLJunQ==
X-Gm-Gg: AYBFou3c2cXQc84bNTdzuIs3h+/6wH1WuGyLhVeo0F8OWXvSESokK6tCv3ST1dco4VA
	LPMk1C8YlaY1QUeiOi5nGomLELrZ7x85OTmhYwbDSYN54L+t1Q1Tb6lfh/xooa1V1y67rdnnjAT
	rI6QJudTwyvowhCYEVWzWrtWRtciQJSgyIdzYQN3nIiYS5/yUWdTvdfZb3+UF+rjVmNEEDUeHuP
	bsszfgox6yyk+0pm5gqAcuyNp5hN3RkOXY16P2pzl2D/BVWWC+WiJh1Lje1fu4QXjncrPTD3AEQ
	KQfop/EUn8hmV/1DSDYkQTlp0nwPcsb+mH4Rxsg8qLTxJ9txlBNnr06dIa87ufKqwYfvT/pcZqp
	1OiRwwdouWRDnVE+dFPlcj4vyPtI9ms8pC3VFuHJM16V0f/t61MDso9acHJwpqMlFRYKybAAsdm
	t2Sg==
X-Received: by 2002:a05:6102:370e:b0:7c3:2168:d603 with SMTP id ada2fe7eead31-7d071f40bc7mr5046282137.0.1793712857357;
        Tue, 03 Nov 2026 05:34:17 -0800 (PST)
X-Received: by 2002:a05:6102:370e:b0:7c3:2168:d603 with SMTP id ada2fe7eead31-7d071f40bc7mr5046256137.0.1793712856891;
        Tue, 03 Nov 2026 05:34:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:53 +0100
Subject: [PATCH 2/3] ARM: sunxi: select HAVE_SHARED_GPIOS
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
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-2-aa862c1d71e3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=715;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/AFcbMcZblHubDxf794SVqjhIpAl11By9m4gfG7n6zY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSrAQvg5vxhqBArsuQUFlydgNSbeoyY/b4+
 Dy4eH/ORcmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 wwCqD/904Uu5wvPIs2SDwjL5QN91sAwhgbcm1t+Qgn/BiD2d4ab61Ev+vE81zGYobw9S9j/z8Or
 Vy/17jrUknJfanVDqVnL+RRNJm/WgqmaiWcjSjSFY3quypJPXqbFyriwzSEmhskOF4u+2lY+Ro1
 Nx2IqrKHi0xwY8ljDETtM7qA1uDQ4mIpNSvol4gysTa9PdFmLjEy3dVjNOYhWWIFfvQ3NPV37tr
 LxD+wjUN4QZRs4uYJLbaGbg46Dy8/mH5a9ZAUNoY/RPsvLC3zSCV0My0pxNRYi/xwYz+yvneaNA
 ozana2AyAeMNKlUAU0HDlpo3KYaLiuB6WHlM4x8b+k7eW18qu6kshYVv1nRhq+uU0mRPzuFKJaE
 10rqsKleMVnr+Z02+Ab/eEiGud09h+JpV8mMTTbExeL+TPMOhoULvd9d32r6boIjouqA7LD8DQ9
 oZsa9h4ytzL/jDdISTbVqxB8xPiPug/S7MDj2lJp6Y080Ze55l8q72oAooI2vS2XiFq90z8OL/6
 TUrcCKy5ypAjg8UMr9ipDDdMB9J5qU85VqhQadmJ3PRDPXtGCOqqm4C+L4xgUXzjy3MwiVflOIS
 Y2gXpDTZzMsb1qBfeHIGzzMDXn5ewPKLVavffLJok/ZIsKxZ8Ao43gXvd5YjX7cyCUs67vt8NQp
 fttVjqjLLdb+t6g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: LXsfUg-9DD6b4JodfaEvnyijb6HzVLGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXz3P2Iz0NOf6v
 xNzvoY07HvB7s25wyw8qmaGVNrYXkGhRofL3ZRowbeILUdhVHtvNVJFPuy9Zv/eRbfsfjvQszV/
 u/eBHuaTmHrXGXHjDfUPqD53Y3vPW6zcnn7OcI0PM4oEKotKonIbgpUhGoIChPdB/CanIVs9Jfp
 UhjoK06aKc/OHHXGyqQl7QIBsarmOEJ2v/Z6l9NDhqH9ORDSYHjqGV1AG+U8M2FLLmpanacC1Bl
 7IYI5sdp0lvRIpUVVXj7NFH97mloywfT6iOyxl8TWEDhaZ/c7Vuu6uaYOkGSMRl8SvpKGUaHBgC
 y+iULGDUX8jUjqn+odfRir2F0xkImFp4Ge4lGPk5bKlERKd4DmjWZfNWL6aLtloOURoQ3sHn5bK
 qF66UjIzWjN6roo40u1xzfHfND7Wj8Zb5xlkDjAgsmtKZp5MdhaDSFer7zRP26HMX3Qy3YSUcFZ
 Y/wUpG02eL0dAnyEbrA==
X-Proofpoint-GUID: LXsfUg-9DD6b4JodfaEvnyijb6HzVLGz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXwT1AGo8RARuV
 2iDWoK1RVqRss3hq32+HaJXkVIWsraTn0KWCPYnlf0+8E6+AEa6kGqGExmw4IDjCusHvsFE1NWD
 JQ09GWnsMZYiRwR3wimQINiMgv8RtgY=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9e2da cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=eCt6F14imeMwFY3J13AA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

Enable automated management of shared GPIOs provided by the GPIO shared
proxy module for sunxi platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-sunxi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index e015f2497111a42133ddd4e7ddd172eda06d90ba..b62e8518e270459444e7d4ee382ef753c368dd51 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -5,6 +5,7 @@ menuconfig ARCH_SUNXI
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_MMIO
 	select GPIOLIB
+	select HAVE_SHARED_GPIOS
 	select PINCTRL
 	select PM_OPP
 	select SUN4I_TIMER

-- 
2.47.3

