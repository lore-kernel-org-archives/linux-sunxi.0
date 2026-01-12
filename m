Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDCB3242B8
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jan 2026 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213004; cv=none; b=gwXYPz5okGLzEdRz/PcbSj4/n5pcdkFyCUy2PgmKJr7Z5kpASfng259oN8+r0MUYs5T8bD8Uu9nc1cDUIq7FmIMrcYviW9GJ+EdTSTRgQyv/yvNWMk/QFWFlEAIEuo1HMcYH+0dyja8tgia/86a83RV56mgDH16flT4ULIhyN8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213004; c=relaxed/simple;
	bh=ZoLyGwuv9GWzXlGA7nvL0ZuKn9B0vjgDXVyxRMxcrDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLtijGxtzKZNBdlrbTw8vB1Ik9MLAyYeK/BCvvbw5Cb7DYB0CLMNorK3pVKWwI71VlfOqoMqshzfxFKOUv9B6ZzV489/fRmtr5lzI9OycCnEskI1RaN4Zccq0zujQU39R3KC73RBydrk96izcKsZbw2lKeU43Vphho3NZTuO1/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J82g/RNV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLLW1yEA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J82g/RNV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLLW1yEA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C844tB1041986
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jan 2026 10:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=; b=J82g/RNVm849cx9V
	dFFyzABcKBNY+CiRsaA33Ps0scP/CMuZcqyfPxphl8zZh4KXw1EheKUhOLCLSELn
	fr73shiZALVUODPnid3Oxwt20bVRnDipcOwY3xUOqSkvUNu3g2BnarfxP3A3wi3v
	1USjRt/sjkTVynSi0LajUP0Pi7KgNpgUfpZPsiu8IVr8izPHvhL4yqL30yYC/FPb
	kPD1zWQEkIndjwmO7W76Q5fk1wRfeMnGHPSim1uq8gOZfDxkSlt1LJpFzSRiuLyx
	0wxtvVRJ1w7IiFKQ8hnC4kB1R1fWLCa44+kcs3unZN8H3p2vRbyYNeoxSltMV34Z
	3rUmBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfvgbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jan 2026 10:16:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c277fe676eso1888156885a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jan 2026 02:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212995; x=1768817795; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=;
        b=SLLW1yEAKbfYfKROFedpJ54GsZjSWo0ot5OC6TuN78BSEVBo95DOrm57n5/fpt+H4B
         LoayOLXYLHu4EVr7uRUjo6OQ3YMWnC7v+9rAX418QuMqi69dKgnjsQKIq3PGaiR3wPUU
         UP7fLMOwbcGq6mh8GivNZqpH8qMRT5bbfVn5z1APyl1z396uxeqP4Ko4c1wGVmonwepE
         OeKQz+jgN8eTtksEXi3zPu6pIn1Pax9/I5irqkLq0suOZ4AA39tnr6+DLeH9GCS2cu7o
         4b7wcwKse+ljgFpdBwcGGrENZCZU028RdwN589z0a/hRlY24upnt/1UiR59aS2UWSYCS
         R3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212996; x=1768817796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=;
        b=HOOeE968ODHqRTreemlyL59lH8AtYYA7Wb3wqjFOnyIrMbX8ZxjFWyDfFbxyAyrIgr
         wxRQz0Mu9lzEYoEOOnUayMaQIiOaWktQ5wbtK2PjVAuMQ1ji2U42p8FuxqKzr+p3UnRy
         GeYR/SwtOtu4rzYQYl/NeijspuLGKw2ZXYjKtOXkRnkPwHdU8FRk5bqjVCK+wudA7SPY
         c0FBM4It6/mgtRXzzmeZjviyCPUT6w3vE7f4kiwJc6/AyMc4s6uGHkP25COtBTZQf5I1
         Lr3zNl6ya/jKcVd4Hp3Z48emOcRDnnC6ns96Y5p4V3DA05GjRpUFuI86uES4zF95MQHN
         Hrow==
X-Forwarded-Encrypted: i=1; AJvYcCU9RV/IhjikSU3lESVWUOJHFphhY0M1WVGgIxn7Gi6GmbTfUnETEKRBNlRclIWc1jcMX0/+LGQCCePM4w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8aqjKagtCnNRL8Tgbt6OQLGEFvxRd8qMzzV5xhVwEXG+q0BGJ
	LluJu1eTeC4h1TzRwq0Tv/cwGQKV1rOJwfU6adoqTpmDL+Nn6+KRoK90fOX7Dw/H8w5X1hst+fj
	dflcHD48x4pt+zY2fxL5sUa9a0Y2HcXHCgNAZKhy4KDNougvitEQ+rQ4K/FLWZkCdEw==
X-Gm-Gg: AY/fxX7Emosm/yzq4EUs2JLlG1YWM8F7Ql+yi1T8XRQGzbjK8MTPOJFU/AG6Im6faUC
	GX2PqtHu0MhT33+1L75PKU1tjhFSPGzoewtXhpiURQOGx6NkQvAhSArJHBrPDsLtmlmiB9Q2HyQ
	toziGsK0kd3qTvjVMkJpajZWVaKNM7Npjs8/g6awwz4p2tVJU1KD2ZJWJWLAgM/3F94jFkCdmOQ
	JKA5O32S4htcjZPaqHdeS8Hz78N7HLqTuwi0x8DUnMVIqTp46AUih53x7qaqoh6Al+Pg83UOcV2
	tqnHnoxLb91OiITn3KVWcVwZd5kjWAuNTghTIXT3qd7/AkXKUbum80XA8VN09JFqds455nMM9m9
	9F5iSZdE0OV7GqkH7vKKRKqJoNnMsftLGdyXZlRSX
X-Received: by 2002:a05:620a:191b:b0:8b5:5a03:36b4 with SMTP id af79cd13be357-8c38942611amr2171260685a.71.1768212995549;
        Mon, 12 Jan 2026 02:16:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYulo3AW2dpzYmOgTmnb00p8XDyYkP6yaVRp/tr3YHxen6aKzZ4A66moQru8K3ffeDVCDlWg==
X-Received: by 2002:a05:620a:191b:b0:8b5:5a03:36b4 with SMTP id af79cd13be357-8c38942611amr2171257585a.71.1768212994897;
        Mon, 12 Jan 2026 02:16:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:44 +0100
Subject: [PATCH RESEND net-next v6 5/7] net: stmmac: qcom-ethqos: split
 power management context into a separate struct
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-qcom-sa8255p-emac-v6-5-86a3d4b2ad83@oss.qualcomm.com>
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
In-Reply-To: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5018;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ai4l3jd1/eF4m0deghb1F0cSTBLoK0XWRQHcHMJ+W4w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnq1poFeCZEhGAbmOEx862guge+htaF08CAU
 WRid/G2CfyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ6gAKCRAFnS7L/zaE
 wxWZD/sEntiOzbImdwRltcgIShIGvZC8ukrcaFjCojiYxd1Oqi2LNK2fbi6NwZ+LBIG2uTaHk+2
 QOuSh+pM9mO0GJdCbAR7vqrseDjB0+3EGZS9euka4b2fv3kXZKn5o5BIz5sZ/WbRN7HIHNh3qOE
 PVeScp8uwCfAECOHVWZElnAW3RjMQ1uK+FRRIZ2afYqUI52Iv50UV5tIiaK6sY9MWFVbin0HTZZ
 hqiD5ZNwZ02jnplOZIKlMbFAFQ54bBjNwYZphy7CJZAkzLMYSnPHLAKVS3VpPFLDo5XxE2qbSUc
 ZjDZnPK1pT/Sv33lf5NOSCHOxnV+GUYj2LGWrcshhqNAjW+K0K8Ygfx2tQjWSK2EbfSg8sUrZXG
 qAAH8nyRkDVFQXrOjnJTW9Ecw8BlKjqsEQeMd+7C8u0cc9jszvdkNCNevRfCBJejdjFdEftST01
 jqUBVr04XNwxNNZkI8Cty2A42/DA8aDLr20cKzUo+aWrnCOY+WFZoKDOfy6T1WkzMqNrPUBEzpZ
 PJ4HJHtWgOVVmHf1/K7B6skUMKINuR6aDPl1t5cOI9Eai8MF2SnrmZ8iUmhuXKP7dE1A+dVy6fM
 y3EtIhGtRmd3ecY/vKJ7eHH69ZrXeiV4qiOdAYbaLuMRGglazNI7nuxNC7nuUa9bhF4JAVyC6Pz
 xBXljylIoPiCmPw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: _FYfqoaGv-1DilMQZtWFwOtfZkg0XQxS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MSBTYWx0ZWRfX+UwOkHKGFCHF
 kU+Uky1TfEWibYDFkYk12/7ALLrvy2s/O8jHh3oGnVmSnVLH4MJCmb4Qok1ylJGvd6jy/qcYJjK
 /CDgXtgGBy9uGqjK6Xcg0sMuQRJ4+smpRBXQk8FZSxm6NLrnOQBo0CPTGznc58QqQ/ijm3Yg5PZ
 L9oJQbfwXwQ4piqe7Q4vdog1UvA9oJmH1aB/0opvxXa5elWNRYRMXAnvAtbZmLx3ZRGk6+hTyNJ
 Q8a9r0N8cHAA3r1Bx3bbjOJpZlTL1GHggsPe+P7pT3Ii2bbQdO3VJrP+C4jR7W3QyJhtOTquV9o
 6wa31V0w8VyQSsNw10UJ+Wt+uBCECBEI8e0bDm7vN+pzVIfp1+Qk3jgVJc7nX8WTheWcDlfZhzR
 wuNbCkXDvBdVQqWW1WopSKvBefLNgoruTUqnZGW/ZTOWlhkXrZikCyT1uFRSNPWMtYEYUN8HEpT
 rKKCCgsA7YfIQUALM2g==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964ca04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=X-TyB6MtGS_gwYDveGAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _FYfqoaGv-1DilMQZtWFwOtfZkg0XQxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120081

From: Bartosz Golaszewski <brgl@kernel.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 54458ff5c9108a6255b38677f4de973511b5176d..856fa2c7c896ea3068ac38d9ee71b4173edce80b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	unsigned int link_clk_rate;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
-	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
+	int serdes_speed;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -193,9 +197,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -616,7 +620,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -683,23 +687,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -708,7 +712,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -721,7 +725,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -816,9 +820,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -829,9 +833,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
@@ -853,7 +857,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.47.3

