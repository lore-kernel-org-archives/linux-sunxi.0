Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98105540B0
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Sep 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879522; cv=none; b=tM2ILOy01KKXLdVOGA0gs/7xHe42FztSeqNxJZv7psoGPaq74p6vQtpmESbydAUolACRel2JOI2FFGJowRcgkJHxdQSQ886JrP12T0vGCjBGAA+neytRopGypM9+rCEI+df/5U0ABDqt4MFn79KzRm/dE/6j0qaicxp0mLXzF7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879522; c=relaxed/simple;
	bh=M/9Buofcj2PjilwTJ9Q1IxG9YNjNHQfn3EQa0/hj4g8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3Vk/fxhhcxyC0q2vIrB6FVr7hNCXBNYV5tHUtG6JfFvvMlA4siMPgeLbKpBf7gVEnox1UxwLSan96LRngc6ZMgCaPxHX+BQp+AwMcDd0Aw5Q778wz3HDSsgI4BNWedl/uGcRTLlgIq2XgzJR7Bh7m2R71Qd08P7Po3gBhT1Z04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owMTvjhe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWu/sd9b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owMTvjhe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWu/sd9b"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Eivcd2607680
	for <linux-sunxi@lists.linux.dev>; Tue, 8 Sep 2026 14:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=; b=owMTvjhep613AUYi
	4aYU2+30nMpcnpwJO5Rfep6JNhv4IcadNAWpS6ouRx4yDyrjf7QjLPv7rEyeTgqR
	pkL9wP2yLl90OATvPstL1HAn7ND2AjnYh8YVosI2nkop3fIrIcop4eT/L3x3qHsr
	QZlfcaHDLqpY9Oq5HSqTJpt56roGtDoNLtaqlZPZP/FFrSW14C4l/0XdUzpbE5LI
	fzNtGi01D9R+FypsogxfPd8wqyoiLwxOWXAyZAOqCZA8OJKo6KgtN2qs5HI68FI8
	JW3OVZyhHFM3zBBvDXvMVzSCiQg8dyEm41TgMo1wm51Z+SNp5lshyAEsq2/X0+zb
	el0aSQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjjpev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 08 Sep 2026 14:58:20 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e9909eeeaso330671241.3
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Sep 2026 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879500; x=1789484300; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=;
        b=dWu/sd9b4zjBXbSsUN/FKSMaP5IG5Ho+Kv8lY7ebbh3T9PSeLG7et6UK4PHVgr1ipT
         +/xW+urrnFMFizE1aJ8ptpatgfDKwyvJlpfmDuIAK7Unqa+rsPLGIAwbh0aROtP/fv1u
         u1JrBo5aFcKp402Rk5bao1C7d3d+mb7KkNS4XkJRFchTuxByGodmtKC03sMQZ6rNi8Fm
         9izxCr6aDECBJR4IowdA0PNuZMzq6kPZzPA/otMTbGZFRLkst7vjpqW9hWnDEHMwWwcq
         1Jxa/Z449vJUo1uBImvtpqv3J4RyYc0Z7y3rabiHNGmu4J8bZQggAs1ML/YCmbcCOVYz
         KrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879500; x=1789484300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=;
        b=SXiuaSx3B5ToO5zbZItL5+Bgt47lIwaAlkgMdEo4wn6kPZNrBYv5sKPIk+cgWhp28F
         6q9T8tPVn9/rSMWAqGEiL8rqJu/w73/d33N9kp1WBWwvjEVPmnjMC1o99pShEFvKVUi9
         T2hzgbCTcGXItnctgOdsFcJlaaoaATTuNZcD3KpChTH7kJtOSoH9udyrQlwGpnBj4jsF
         uzOpVn2qGV6JFwteJR9HyxBTxUHTKdfeVDV3CgkJyDG/wqV0BU74OTZDUQbi53umZdH4
         VmuKIZfzhCXI8W6z06zFZMmD+eLdfL7INq8cOnOiTYfMjhmxdhxr9+19L4PKnOy/xq88
         pSHg==
X-Forwarded-Encrypted: i=1; AKwUvBz83Uus8F3+UHb9/wEjYi+Xc+1aO7xO25jo2H4QkAy9YSWhUEFwLpVR7qL46zObKJqhmW0JCL1gYC7RRg==@lists.linux.dev
X-Gm-Message-State: AFuF++kgm131mgrxOpvlqDpRufdvREt+zng3stOhXzOV8cGUaJ4KTAr8
	Y4LCTA18HJGFGljRaw1FgnGtkTPWKucKekujRlHIOGkhLwUwV2l+0R4JjSBwO+g8BsounDOVkMP
	s1RjgeJTJSNLcmcaFLN21k2I8oBgYEXXiWSMTfiVTKn6ShspgtfCqgkHgA1K1Qksgmg==
X-Gm-Gg: AYBFou35N2HPFghMEe4BnzAohdyM3cAADeyfTGBepMv7pmRhWKmPJJnYqWjMGHovNka
	VEKJms3o+VvOD3v9ONqq9np7e3FS/uJVS8gpTINic4gld9hZlmUr/vjZQIWOiA1bSONVNfUgjXM
	iiKCzI6VS4+RWozAElpvyVAq/1FzpbjCrGLIlCCANaN6vDxysQ7amJ4WaYHrfKAXih5NnHYHYwd
	KT7z6kbr2nLLX7Fqt7lDHb5Y0kpbs/8AcQmocs3Qgc1hNfwdytllDSOliKjDzhpCPCqdI+jXz+3
	nLm4nYTTCw6AKHOlYkLytmtJm86QhPUMXB3ObWYX4J9k0TzUDw3EBmx7RVcq4zJWUrPlznOOvYr
	KT7c4LdPs9uqSdtND8jffwxrHpCOK
X-Received: by 2002:a05:6102:2ac4:b0:778:30ee:f44b with SMTP id ada2fe7eead31-78a4ab31a99mr9637188137.13.1788879499703;
        Tue, 08 Sep 2026 07:58:19 -0700 (PDT)
X-Received: by 2002:a05:6102:2ac4:b0:778:30ee:f44b with SMTP id ada2fe7eead31-78a4ab31a99mr9637151137.13.1788879499260;
        Tue, 08 Sep 2026 07:58:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:26 +0200
Subject: [PATCH net-next v14 07/10] net: stmmac: qcom-ethqos: fix SGMII
 loopback not set on resume after speed change
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-7-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=M/9Buofcj2PjilwTJ9Q1IxG9YNjNHQfn3EQa0/hj4g8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJtPEfTx4lMAuscmYS50twwqIkudyRPZJ+SL
 07thj6YQuGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAibQAKCRAFnS7L/zaE
 w7QzD/4wAkPdm1bk0HVl/ZJF/wSwT+FFKyLR7R6zsVVdqSLVbG98nFldIWBBhPCoHhWaa/nKYQ7
 ghiB/rKnjn1NjO607l+C6hKGRIjHhhIQeFTmfH6tkPTUDMYkoj5tNCLhclHbnI47ZcdcDGwFHQH
 DstjQXudubsIwU81fFgL54Mi6jMYquXGdb233Q6PBWFa7wNd5tnmhtYDwA60Ko43AHhHUJLMA+Y
 +t8bRqMav1PwRLp9XW6yLafq5BA3uW+VwmeciVdQHu3hIjWaOKOgzjdpcqRXpwyV7ptfQ3PdXdS
 LvJcTgA9f+1yXNRI0yCdULY+M4Iseb2LqdMy0XCWpnetbRvSjzJEH2OCR3Eu0siJfUwGVZmmlMF
 HjcMDh1hJuQwJ7Ej+iVTYo3K3KfTB81LP6BtA2WdDxvGSZSDKICJuAuK4z+hdtX3Ozrbsr0vx1D
 D+sRfyd1DP/QwVh0aGfKZmcUWS/zk5Tb/ZUJFx84TvCDXGRgH0tzsyT5elumuHqG1eDYa5GNtcS
 cTAGeh/iUjkMo61N5mshpV+kqCyOpFPh9RWH342EmuMli3GbOhyBCiWA3HD6Kun0XJSxeV4KsVO
 Gz7t4kA9KKjWTOBIGV3ASkOeawOEoSYwCODprNyTMVYyHIqN4Vh9SqwGDUauxzjecZQ9rWXBLTI
 iIAtQtTgM4Fw7hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX4jg13wC1GeAW
 solXcwpjsWfYbyZz7gXcGyJ9oEXSJK3hL7k5I2kcb3idgA5JgjDupRB1kRCvWRM9KYIG27sJYF1
 VZBg4Gcz8ZN740lxi8x74bpIcbup+ms=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX07VJ8e/KAcV+
 sMjVdpIgeu1IU031e1USiF9sXN9Wn+zKS3dDySh548ZQGaVgBPvxzhDHQ4TwuY0vNp6jzrW/prB
 aJXxmbS3KFB51QAMkmD8D19piasn4To0jzgw0FZ9mRpXJ0FgYtsrs074bc5eiisF6YlDu+hrlzr
 Ck+aHAjYiAorbGBoAaCDD1b3FXO7mwIZ6kSp3ruJtn+IH9fBSRZaYcX03P2fB6bfcBH6tY2Ev/K
 odHeOngGc76EAP/+OnBPN+Nt1UCyd9Hurbg4W0c4Fe5n8UsFL56FmfuLPJc91JU6FQlCDXgN6Ep
 /OKQksZUpELc5BsPmMPUqAIOLkOiVKLbAV33QF+qI93rs9LA0ll73D2blj/sgiwoQkTW1okAPHY
 rhoXHiK4xsENaHvgzD5GJyGJgJG0CGwAhBC8xSv1RCw903FbhtG9Y+f7fsUxMrktHWZ1UjiRbMD
 fOcpOycVT11V6U+NNdA==
X-Proofpoint-ORIG-GUID: eN18y-j0gIcRhu4TlU10maOj5eToLrhi
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6aa0228c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PjAGQVefHaMtIuCO3vkA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: eN18y-j0gIcRhu4TlU10maOj5eToLrhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161

The loopback in the MAC wrapper feeds the TX clock back into the RX path,
while the SerDes is being powered up. Without it, dwmac4_dma_reset()
polls a clock that never toggles and times out.

qcom_ethqos_set_sgmii_loopback() gates this on phy_mode being 2500BASEX.
mac_finish() now updates phy_mode to the runtime-resolved interface, any
subsequent resume with a 1G SGMII link skips the loopback setup and the
DMA reset hangs.

Extend the guard to include PHY_INTERFACE_MODE_SGMII.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index fd7414a50eb4e7d4d5adad7e93d49a55500c7f32..e067ceee016217c49d3b3d572fd9f33e562d1a75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -190,7 +190,8 @@ static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
 	if (!ethqos->needs_sgmii_loopback ||
-	    ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
+	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
+	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
 
 	rgmii_updatel(ethqos,

-- 
2.47.3

