Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD6A427A0A
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948890; cv=none; b=GPwjlEMlbcMkDe2h87g+KezlIyFDdwBm+bNQe5XDLiyKNKmwZp2NKyAjEs9XpB72+Nubso3c7tJsAIn9QayjwgfBRBzCMbmyOWKTpwIrMI0mBPb4P829WKsHjTmW6flFbenUSBJ4jSdysH+UROWMy7txd48XHd9wBOGOHx61++8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948890; c=relaxed/simple;
	bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AHqpfHzAQqCGG6MtcJuCBycQBoxmpcGqdHo7R/RedC5083qT8Vt5FN9RcK39YMusqAOuVVJbuV1ToY3OVXSs0QDGu9ytv4NbVDt+XAKf0zO90gHnt1+kZT+A8+LLKF/0kqx73ywJqVcHjtVgPCF0y4t/FenGqwkCQ4EThhCjfZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qf8msRCz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVUDpDHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qf8msRCz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVUDpDHj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDjFh1453405
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=Qf8msRCzFf3+tHNz
	SOrsHJEPxq0uRMP6T3kvWKfsmoQjWYm+Nj5IdZSgZkPNmsX+HEzLlh2JJ07ihf5N
	mko0DY98giBkts0M6oLnXVXDK86/6BcvurPiwX+0Oz4NdrJ0vvdVbea0tDnESH2l
	vnGrYeCsYkqpzINV+eybonxT8jHlzPGK/rI8qIfPFQ9/TN6FauU7+JfgvqwggXrZ
	HNoKHVWu1a+AZ4PauUxMwhZd2XCe/FTJ0guFq7zymqxbR8SKtOflyczwlMckFF7v
	6WOgxKJStJY3SWa/67PFYX2EcOi3J+BwVj2X6XiGuYy6jwpFyePLlGxSs+19WNFQ
	Erw5uQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj01cvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so43671586d6.2
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948886; x=1784553686; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=kVUDpDHjiQYV9fZL58GQzMWWXLn7xRs9W2yYHgNDV+4B8RVyshqRbQtNfUsI9sjijg
         kv8XW/jN8jIC4aXA02gvA+/s3c+Gl5v5Hr2bNzRqJKRKXmJzJ8nUq3rkmbT/UaqWwJo5
         ZbrhHZfG2kM0b0uCKSgNECPWNW414P9fOMVVpRq2ia6+ANYayAQ5hE462UrNDitPdR41
         KGbL5DXXz22Z1XIOJq9+7M6MWCPBtIKGlANZ2Q4qEB3LUJNWWm/WVbti9EDfI0OQr9QN
         OAvMRhHDGPFaJNs7CzMWajwXOWvaOaygvxYYQdFtF8favKGHHEAVNJYvM82Jwu6I4xbH
         or6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948886; x=1784553686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=W+7odaoFt2i0dJ4CyTnGCZnrHSVcZc9sjmBi9yYPTo2VT0IA+TV7AUm+Qn/CZkr9DF
         iRTv8TCR7qn+EHzMr6V9fKm1/uwAaZR9IGdRI6BIsGqguCGvJlhHppAsYpuBZoWNn+5V
         TIEPwYXUMtje646y/LxqD7UmxpJL+9o7NL6KLgkxWmLQPvUMesu8jFAmCQ+I8MdFLkfw
         eJ44X2SffjU+NX95faoLSS91cy7w75/IYvd5JoQ1WuXFIdGrlNsSNYrB445x5bUawZ+i
         hT9yvSZSkM+m1cG6jkuuPkK69Lg9/eLvKV05DTH5vLAf+2OSnXeOHmwzSmzEtZ/2lwEV
         2C8w==
X-Forwarded-Encrypted: i=1; AHgh+RqRpSNEcVSEmOpRvjSGYf02zKYlxnml4vnM3scYF1LmWScqLIluTllGqIDbNuUnaO34lxzgeQh7ioaxSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwokXWiDcitmmuiHMDVkqWd/k3a8/QQt3eExOHxPpMNaYNfCCGH
	DV3FTzVdphx/7HOdr245Ls8e2+OIKfW+ZYC2H5xnKOukjzmFjtEDxncIXxiAlpQYuMEKqx2VBqa
	h05BfH0BuuihqwdzgRvJBzpGq7D6J5ntVRaKhzusN1Gdo8RsRyQltAUMWn2I1JRFGsw==
X-Gm-Gg: AfdE7ckZGulGAkQsRb4wNcQiQYWrjVFCq0mx8CIKzhbTPc93oQ2nzDrzEfz+O8n4mDL
	ck/vVlQs8BQQXYLb91vviZQMGeGeN0pZRNxvLBfhUGFWdso8Z8AA2tR2CL/+nlPjwN10ZNNidJB
	7cnU5GabbsM2Z6RNYvcLpq1WzbYAAbOgZ0Ke9TuMCW0PK+YEOr46VMsKTjSc0rj+gtarhzS98SR
	4dEOH4X16k8guiDi8TTvYx6Cujm8ntUoiWicWpoZC1EbHrqSquJppjPR86IgivsLXl6Ynfw7WhP
	HFkGJAxBOiXTeJf+ucmWrKYPlMT3gSuqPk6Dw0I9V7M0RVMoXRnyH9XmVssIcoLHJI5tHiLVsdo
	BLEULuEs0ezUCZ9s7+N9scXqfxiNcPgS2K5VdhHLg
X-Received: by 2002:a05:622a:303:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51cbf0d40a0mr86033841cf.33.1783948886537;
        Mon, 13 Jul 2026 06:21:26 -0700 (PDT)
X-Received: by 2002:a05:622a:303:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51cbf0d40a0mr86033231cf.33.1783948886012;
        Mon, 13 Jul 2026 06:21:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:34 +0200
Subject: [PATCH net-next v13 05/10] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-5-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY4z91onaKk8EZSNQidgZf3zEywv9nc+nEcm
 240LzBDxc6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOAAKCRAFnS7L/zaE
 w1ucD/4m4/PTLJO0XMbU6rkRzGWtB4Ml5ByIwYm518Uxusod+xBCfBe/O98uwt/UkUh3XGQ8ANN
 PIwNDFrrG8qsxCqfjFpvQxoZeidLrlPt6STp6j4p+gOVWdTto250bumWcxT/+P/vbSwzWLb8K2o
 6cFSLyIHA/KVYLxYYaUK4wesPOclMG6Ze7JPku0PdKxtQ/aYWPttEUv8xvzheabI+0AqsX3jARN
 dF82kntlPB75YooEAqaQSswWn8lhbTd9mV9gGsna95JJgpwYnG7IZABNDJykWuEYtHBgOI6m5ia
 VFokjS4/XDjphp4oPxdgqxO6UTVh4bdilWU7MaWdLs0AiC3oAUSSmoSZm7e8IrXx68LVIF6IqRX
 geK39OIcIChi4YwyEGny8GngvKdPtAEmsZwrJAuM4eecviRJIT/Qc4U+tn50CpYV8yQ7xjUwfK/
 D1QN1WSBE47QmmlUlzo08joi2AujLXtNCV0gXTaIHdx7njErkwIowCqaFIAMLsXwRWW8bl9hxC3
 CVsGSMrvXAGfbtG+MrMpEGMYwLuL9Hq/VuTaJn14J04bNn2FmNLIteRt7HIblRGQoZhRQSOEyB4
 F2MOTDosGkq0ICXPck1d/CoYelm5ME+EOJZSGFax3uvDX5Lqfafyjs5YHpzElofYwX0n6WI9Ojs
 uyMFYwSxO43PFPQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX8NLMgaE6NU3S
 2LpGL3fXxi1BpYKNjzNLHzWyvlJd6MpUPjRK2zh9T/5JegmMRfOiER2y0PqPv8uuW8wR1CsDmjP
 3GJMon0ayeUFyvmesx6Z287ic98Sqno=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXzdL532Ew7foZ
 t7np7+wm537eYNccGNwGMEoZHolmW20VbJMnEk7TaMTI2isD3TYsAROP715/CBHebXD5XmEOMoX
 eXdR0GZ7pF4yvDNvaYnQ0RmW1/qWHmKMe5NwIKppw8bTEdIVSaB2CztCcMV3ufOalle1bMkQEK9
 FBG0tR65d/Wpjb8P4hJ/Pt99tF87+JYstsKAGCUG43pOSFyS6JoV3QGRG8fWdmltQ2PB6ergaMP
 g2eyTpsPTzvB4IoJM/bI8G/ijugrTAgyMtA+tOG1e1oCQuCHDZAOEXSKotRDwmmnyWLylY+ezYe
 gNeCpCly6khhBt76kYm+mcopl+8GvodUCU2a+/5qh6TN+cR8pI2r40UsuVLWIrh5prxpnBd8LSI
 OhcFMefyIrKZFuPJe2gmjtC4ILrYx03r8AIty8XCBB8Or/mRFRHaGnOKGZ1I3SLXaVR2Garr55D
 mlykgyXthe6GOKBDk9g==
X-Proofpoint-ORIG-GUID: koegpyMQXVcg7O5dwz33d7UTn3mF9PIJ
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54e657 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: koegpyMQXVcg7O5dwz33d7UTn3mF9PIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130139

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3

