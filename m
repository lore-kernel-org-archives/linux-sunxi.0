Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921F55592F8
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Sep 2026 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879507; cv=none; b=EfPpV/11rUOXKXK2ITkcez4TDAWJJs3HlP/Ck6nV+dXxRCM+y/8aFnYgB7XKD8ftX/kOhV11Y6ASJthGlHHApvTev/v4Y7uLVLuFjV2VUnPAm7yedGElUR5krUJX+FxDPl5WeQR5Fm5j7ovQIkztPlLTSffOzMs6vwvxFiDjt2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879507; c=relaxed/simple;
	bh=DLq5kJ6GnQDKhq8FVuX32328SGe67zNr4t3N9JmNPY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DYmrPw/QvWCcxEbgQzvcrtknYgER4Wh3C9KgcicOh5fFjSVWqvpbJrbYQdgBQ10G48u9XLEMhJ6ae9/IKFBZVqwyJdfr1uAgOqnVdpYby+ryXGMfryJ3w6mN9f5jFABOU0ItdAMej6dMnAQYXOoNuo1waCiA59GrrbOs0grI+yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrNdHwA1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmsG5xLz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrNdHwA1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmsG5xLz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ej1OC2607824
	for <linux-sunxi@lists.linux.dev>; Tue, 8 Sep 2026 14:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0N7yiitrW6dR7p59PNZxxyK3pZtNPXwOVD0qGLv/uw=; b=UrNdHwA16moFMjxf
	fJMD7pH4j0/lZ0U+AgJVseFdFW4hLsnlOMdoR8Iobss+OloYgzBNeMoBUZOMDjYS
	N56805fokNTB/bpnz8TJv9pQUhiYoRKNrzkNbjhkMUE3qLMTtgHjLQ5vAXizYydr
	IW/DH8y6a4dQq/Gg6Gw/YclNkuv6eaPdQ13pKuChIJQc1QRqm63HT9ZKlIl2/y4W
	Y/mQht2pu4kkJy3loTphjQF0/1HdO0BBpfPMnzOS4xSIU9jNccw4s3zO7R0Iz8Pj
	w98506pIY5mq3j/8EmKgnocSZ/is7sS39+oSAnfkAZhy2MbHIXmzuFHKCPXbaH4p
	5diaRg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjjpee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 08 Sep 2026 14:58:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cb32961e3so2721566241.2
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Sep 2026 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879497; x=1789484297; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0N7yiitrW6dR7p59PNZxxyK3pZtNPXwOVD0qGLv/uw=;
        b=UmsG5xLz3m4JF13XCH+Q1wLlFJevSnM+pAEDGC0mnzIQ4XvYXa5cVHgLZ62i7sh1K3
         7mxJZaONnGO10rcsB6vxjhihQdgrW/OTa73KziAaUHEeo7sly59btzK9U5CIDLEaDjJJ
         7G8b2lq9P3Dfd1Le/7Jw7gSOoPDD/6TLITrvy/n5js42Uv84068SsT0HtLC+5hNxVojy
         uQVasGQYu+h0w3JO772nxOa0Wai6rzgk11Pkf2MueM8QaHn90B7c3d/mqRigLTj6TOEF
         v4k0pWmVcbTDPwYaIjaY5t1kx/oS0n8aSx6aUTBb622wBZWTeJtoh1mZZYp661cIxtLI
         WeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879497; x=1789484297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0N7yiitrW6dR7p59PNZxxyK3pZtNPXwOVD0qGLv/uw=;
        b=eeI1zlKw8oZjJA1l+t860t5EbvrASVukAWbM0BUStyYOi2j5rBOpk6g0W1Gz7ALorS
         Xt74GDooF9IFT24QToC729eEw6VZb+9Jg2NYnZ6VDV/Q9B4pTUgQ5vzstEnrKHk8ES79
         fKtmhg+JaOnsU9qeT4xsswhS4ZYZ4Sgz99b3PSUFRVGW14LHNMnqz0/z0PhQzcxWRIwK
         Ol+6gKie3dzfNZBTTX9GuCXgBCwyTkasERMgh6bcxOEWNK6pf71pYwf4h0X4rdKsrU/c
         I7SeIQuTpPNNVBjrKt/snqkbnUHiEUXJlwVkyOkeGdSAOVRyE8VWhq6OQkAGHfvEhhwT
         f2qA==
X-Forwarded-Encrypted: i=1; AKwUvBwSJ6ua90RL5c9KqQdxdwsppcOfSoabR2+fYaxwp+mHttFL/DBa6VyGSP1euhjLuy2U/+DIghc6yCtalg==@lists.linux.dev
X-Gm-Message-State: AFuF++kBgtk6odwNlZnBv8kmqGoNm1Cne/BW4ia1o7NdgkI0Wki0Zl9t
	AZUqKXCugIEJcLZteZD4TC0XFcaZRXCsQNhcMZK9/L8QwKlkvZhuojVptCA6FYA71nnSfZqc9mv
	hwHZrpN7i3DdUbCOoNC8Cf5a69UKn3hDfdxmSrPGLGE10d5dT2Hcn0P/nA4HcRp5sYw==
X-Gm-Gg: AYBFou0JHfwxtqEO34U+rpC6fG/CP8EqngVn/eRTCdOxMajOdcgFLpc4lpBb62z+s59
	rAKeR4KQntEHtNgqmf8YhCKYzr+uhTjHu83+kCGH2AghkcOEFZEmc476Lyq1cmtrGV9hFMuXHjn
	E9V99iWnQZS2ZkWEk7utjmctbE/aC5b6CW5MPelPh2nbIi/yTb0Eojifodp1JdwzSHx1huiU3nJ
	UQze7bsRT5326VueI/431EAgLaS53/ybSkzRPuvTnJazksqv6aXvgKc3d6Dadsn5aNW2txcPS67
	+KiOQkmM14eD+/LpRwRCKBnVAG5/dcgiGjHT3OdDnTfGIDATXl9SRn0eO8Ly7m8q3pyefQw0M7s
	Q3Ss5n34xqv8Vs46DAHzEED3zO7WD
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id ada2fe7eead31-78a4a72eac3mr14116065137.3.1788879497221;
        Tue, 08 Sep 2026 07:58:17 -0700 (PDT)
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id ada2fe7eead31-78a4a72eac3mr14115998137.3.1788879496786;
        Tue, 08 Sep 2026 07:58:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:25 +0200
Subject: [PATCH net-next v14 06/10] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-6-ec212b747a7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DLq5kJ6GnQDKhq8FVuX32328SGe67zNr4t3N9JmNPY4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJs9HybHaSqzBfK2Veao8xyX8UXTlPcezcbj
 QlPlyhTxkiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAibAAKCRAFnS7L/zaE
 w1v+D/9iBpy/Ln8FSiJNFaOgPkx7WGqGjICkj3LljoYYONiLgB2AbbniiS/o11WhO6qaA3KlYCy
 5LpbCtIpTVc8+Hr/pdu+wDKOYKMU1x3Co7RJPcQDRTDBXbAn3UOdmYo48WkNu3mDMU4Dkd3bbw5
 K45RxGgRtI80+uqgWHFtKkKHnUi/KtbJH+4tT+bTmk0bhPQ7fqcgh/q+Pg9ijh4Zmfh6yyOwq7U
 TY6rIOEV6WalGxA0WrT7qNqvvIV4jB42F1qdYuSD4ce3AGZ9iemrKyl7qTE5LfOEMezpQ6lEr5P
 5RRxrJOOFtAHSKMf7H+8q039bFTIzhHKyG2hin3YL0duAYz55SGcBdfcPLxdfPga7JS04y2xkr5
 /04dhHN+1c65cwArcgWGGuCapxI2hvyEJdJEUg0Ny0+ezM3BvVFt8KW4xAa4rcO+mRjvvTFEfhT
 wwRHE77XpXq8zpL4yzW4wHiT023lGqHKQaBfqtJOzpD56dgQlZYX8zIZ/XVnz80DVKdb0VuJ6TI
 Tjtej0zBwwzi2noJhR4vy8malCbdiMtieCLlMibgq/nXB9FCnsQjTIIIn2oZI3uZfPtT8hn2TsF
 ASBniHYS1DB52vO23N8V8cd3Idv3x+i7LCDlX/FL99+cCvn8L/PVicsv9qc7QKgIiy2f2JaIrej
 lGHVVieGgj1UMyQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX4EWEV5KOnV1C
 Wx0soXC7aHv2qANynZaZP9fRLZW7Dihgumm5ovamcImFL14eNlHzUrxzxlUEOYiyKG2A9IHi40T
 clTysaR5mHStBa9shfEOjN1s5x7LtQo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXw5/qyiT8OOHT
 8yrEbLA7Iso9tN8K0zdrlTgCM7q6uExoc4Vlk73CwxkJxcigiPdQDqXclhRgdeRQUtkQ5GSwqGw
 VwBXdmSa5xKi32pRFKwKVWNLC/n1ytqC8KS2sAJKL7lQvDZqXEkGrABZ7fhXPDbKgYD+084x4kv
 RDOEa2ZIBVDFZiIiQmf1XaNFu9tSlVb5KjHY+5/EE35lg3Vc/QAXVl00oreopMekxUsZEcwf/ZP
 riVOEUBHBunA2KJRagVGkbwzfHQndgLvB64/ux4Sj2s5dyB+v8AVEhHkgt78G53p18seAQB5mTc
 U22MEa++oMenpxWJ2n0J88Pce7dWatyD+43DlY/RvE+6HtcewMradnqIf5RD3qp4iVMPKVtSuTk
 eghcj8pP3/yLMKSUt0YTi1qTL7g9OFCSnFdng/cTcLlm7H9B8InaKEiRwuHsnvjI13BrPDk2m9m
 BSfmXF8G1WUmU6SoqGg==
X-Proofpoint-ORIG-GUID: vYoHn4Zu7InzqIaN-ynPI68p0zGJuD0P
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6aa0228a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=fYsbkC7JaC8eFfGKQicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: vYoHn4Zu7InzqIaN-ynPI68p0zGJuD0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161

ethqos->phy_mode is read by serdes_powerup() and
qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
wrapper for the correct interface. It is set once at probe from the DT
phy-mode property and never updated.

phylink resolves the actual runtime interface and passes it to the
mac_finish() callback. On platforms that only ever operate at one speed
these two values are always the same, but when the interface changes
at runtime - for example switching between SGMII and 2500BASE-X — the
stored value becomes stale. The next serdes_powerup() call, on
a subsequent link cycle, then reinitialises the SerDes to the wrong mode.

Update ethqos->phy_mode from the interface argument in
ethqos_mac_finish_serdes() so that it always reflects the last
resolved interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 47b70b5e706f221c01f1c0ae3b1acafae6641165..fd7414a50eb4e7d4d5adad7e93d49a55500c7f32 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -634,6 +634,12 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
+	/* The interface mode is only known once phylink has resolved it and
+	 * may change at runtime, so keep it in sync for later
+	 * serdes_powerup()/serdes_powerdown() calls.
+	 */
+	ethqos->phy_mode = interface;
+
 	if (interface == PHY_INTERFACE_MODE_SGMII ||
 	    interface == PHY_INTERFACE_MODE_2500BASEX)
 		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,

-- 
2.47.3

