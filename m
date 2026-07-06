Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAA641A776
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344065; cv=none; b=EZNn9mrAwZFozV2tep+lGbUNcsavmSRq2cHKX//zUUafz+pEucJofjqDJviQd8n/ciR5gQMO9+H69tB57f8YJYifiFjrqoZqMVifpmGkl0tPn49mbsXqC+japBmwbsr5lPJzxHxECYeKNMYhXNyZv/zVDg0R8Bx0bZ3shZbiMEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344065; c=relaxed/simple;
	bh=DZwv1shl0TUtjDQMbmf7p8enNrlmK99dKcZ4kwPIp8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UdHkIXD/YNozbiNGOynKC2ebw1etjnO4Bww3MQnl/kNsr1qM1aO+7/uym02dw6w4Z25hYYS6Gi6MB3ERaW2q9uC9DoF0aezlFqP9EhAj70SzPnYKnEMqMc3THrRKx+gFPHa1CdrDbC+wAwLmyVtX38UZTiUJUZSTRdWGdAp6vVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4J4l9dc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tl5KNeA0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4J4l9dc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tl5KNeA0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFhm401621
	for <linux-sunxi@lists.linux.dev>; Mon, 6 Jul 2026 13:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fv2kNiSYpp/mwiQNvruO0GBGKpPCowAj63Sbzft+biE=; b=c4J4l9dcCWrHvoWD
	eCzTpSsWzXRAgEXSysa9R/0WpEZSOxZYh5qSd5sHzPl5d71nqgDncIZSvX7Yrw1v
	dLtJ0wMe6kRFF8a4GCTjO71INYcBa++KzXjhSh3W7YiUsFUDfmMTqglGaKd49e/3
	f1bsn2LyofXuMpusUrHRmnffH6BL53RTH/1gMTpEm8LDukKvKjXvDLDKTP7VZv3X
	y2KaO8llWE/XgrPNJhkn3UY9zEWnHzz7BPvwCUeQ5rjEpRoX+yLpeN883lMp47Vb
	T+5CDVgmfEJ3sPlOdecqa9yXK6Yg1WTMMoOcAPm+5mKVSIphlt3xxtom/HkMTP56
	tFVGmQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grs9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 13:20:54 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bda012e304so770527e0c.2
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 06:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344054; x=1783948854; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fv2kNiSYpp/mwiQNvruO0GBGKpPCowAj63Sbzft+biE=;
        b=Tl5KNeA0wvgEwUdwXuMofvukugyT4ShbhlwVE2wsWgoAM/X5msPzd8FUJTgxAg7Je/
         ZQy3GOF5kugVQQIXu1hOVA4ou8pPN+47wQLCwXtzahoNQuuLhIcJfi9g2mzFFXGEX+W5
         EbsGfYLW0VvUqu2Quxa+Lrz+PeqZBFcXWcwzKFLNwBzji1PAhyvSsQEC/1s+NEVMkk+B
         HK7a4Cj9eynm2fOARjRO1fN53fXoJ2hs0B/dMbikt9YDs87z1erqvoKkrXJHdb3bJjy3
         bWV19kPlBoRGp5beNXYouzChBm4I/yOqcAe+TkwPp8hvg/RK60GAiTHyNlyEixkONAr5
         k1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344054; x=1783948854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fv2kNiSYpp/mwiQNvruO0GBGKpPCowAj63Sbzft+biE=;
        b=EMYKDO9BzfD6MXaEwT4F0rdArZ/ByjkLdQUokcDBAnXhBFK5vRF5qy7q0ryXHk4LmI
         KobKh6GHAMNN0tTwOChC33/TmumKB2BKA7sRd2DpD+yF2N6jjqq19TJ77AF19vLnC6rL
         PyzgCVvOBOgcBxDEz5G4j35Lme+hZrE38Hzq8GkCpjIU+PNoudz2kTbPw117mH0f+PpC
         Q+YFgz1tSgdZtcmKaDCUlN4eSzIKvFskrvGzFRpciTJmybSQXSrASPTPxGRqfztHFlVy
         hc+vaoGpaaOS3G4ec46zzQyt2kSXFMcumNxo5Fj22zGHaVzIdjSUqgpSBz4Htc7aRsrL
         VV4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoZBb12ghQMeFQqpBHTLUA4C+Ccm/y3pgMxOXYQ5WWIR+DrhxcDYKnmc1kRXC8hvJi0KALDAU76f3zNXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YybD8+eHCbvtOZWgWiNMg1V+ZNsX+c7lB+n32AOtfhWEe3MGj79
	fxo8ysjMFWrmCcFQYRRT04Cengd+SFJ6gtVK45WfD5emBec9SiHi/uuLZoXOiK+nBdnT31duB+p
	mwK8ONhE0NOdAIttGkbs+pZCxyETdVbR04xxA4ieTa3bLoQYi6NnNbPhtTQknZhrNfA==
X-Gm-Gg: AfdE7cktNamBqVv9cfUJfk/vI02nIN3KKFSBm/Xfr3m8mvbo2jn2rNCMsLS5BNmEFnP
	NF0D1YuCv4SdxjOCYf8LfQGFER6wANVWiSwokovpwWVRo/ORVLYi8d8tdj5vNlAxMXhmcGvSiCi
	HhpErZoxWR2MNq/CoznIfZFAbEeSJ10CznUgetgPoFuhMa5AVy861r6pRktECtlyacqb8BZpj9J
	zUfwYnCG24d+qF/ZuWkslO+SpSqBW0nYZOBaQhrPOABRlZNbE/QtUsOBzeVwRPLKiq14OmTnF+b
	NzcfZNlf/jdPPKB6b4M/99yKxOO0HQUZ6GmmVqaFi1wE7sv3g4Gvz4o6NLcBtbA17T+gHKG1cZn
	s1S5hctBdKGoVbe1kOxfqsqTd2pyeJ9z50XK7Istt
X-Received: by 2002:a05:6122:4d07:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5be89537d9emr273828e0c.0.1783344053393;
        Mon, 06 Jul 2026 06:20:53 -0700 (PDT)
X-Received: by 2002:a05:6122:4d07:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5be89537d9emr273804e0c.0.1783344052852;
        Mon, 06 Jul 2026 06:20:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:20 +0200
Subject: [PATCH net-next v12 5/7] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-sa8255p-emac-v12-5-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5525;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DZwv1shl0TUtjDQMbmf7p8enNrlmK99dKcZ4kwPIp8U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uf3y3xcnGJBzldDQcP1Gvdu36/YPVnRiucD
 rasQBf6RzOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurnwAKCRAFnS7L/zaE
 w1fLD/9hd0BgIb9hVJYMbf6fTbBgU23ib1oILj+2s+xFhKiLcjSO77OrgbdGCE4chR2ObV4hCwO
 oFmk55GX0mryjsCZQ2a9orFkFOIMZC3E7sPkG9AV20SPFxLzD9w1z/jG5xpduAz4oOYbOCfdZNo
 4op0zdzC/8mSk94sKrKAWL690pN9vbgEkZ2tXCz3BJAyIepf6vRTf6f39Gi1/bkvH9aE3T8RXgS
 kCXSUarLusOK7zXSrhc1y0Ph5sjEkLcbsOqXjH/TRUkICTR+VcVvKyMAtc22q/WQzYrSN8lJ1fw
 UwdaFJd8Ttw0UW7hSQlv99XXaqBFnkZxZAFZsgIAhzwpGOxhdQt/L3T3FKC+6RICO+HcvApYw2H
 8eXE88o6UpTBgWtfNdioDOeI5CId17EferHTZWwg/ujOTBzrXnozaTlss4mdqHhJXDbopmG0CYY
 XExTsItYWONAZUtPWIjpQlaOF05HiPQzdhcXCchEL7Oxf3kPLxzIrPaCFiQF4oNxk1i6iqXm7T2
 W93zrAhOZHlYT34CBzFVGXF5XlDyjdvxSVyTwVk8KIr/Fp4lP81W3dWqXsXSnFwPDC/Sivrnyom
 0pmXxjblCX01B46rJauGIVskRhjtWUTfGOHBF1oXOGsBPlzHw8uohG7ROPX/K9PklNdpYwm0q/y
 sOrK4uXRfg1vsBQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: XC4XJHAi6vcobOEJ_cJ9qrxHfDEVnY8D
X-Proofpoint-ORIG-GUID: XC4XJHAi6vcobOEJ_cJ9qrxHfDEVnY8D
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4babb6 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=uYDRVFWwO1WiFYTZPIgA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXx2EB7WeQK8hX
 Pop5kSGLsBYZ1Ri0lh8n29OEUl8KtIR0yUn4uRpbvaGsMZkXXmnKU6RVHzpDJed2NeQDV57Zkk6
 itwqts/IkkrTwVSCykHpHI2shp1rLp6brdhqtpSlRBqaKtmgt9VYgNF82F1F/YFO/lyOrKgQ6V5
 tXqtT+My9rZtXytLysW/4DvZztjzfxnrfnUE0G9UxNyUsqoUPQ92yPUL3nzDckrL42GF4fltOUo
 cximrqAWZcl+XQlqMcZPcyo+RbYP5UCYT4EkDFdt8P0yagnMIihMvY/IZoDIoU1aHtJWKGZcoat
 eFfFLWiH2zcRqKOCUZ0bTIVOJcAoja+V4TO/AiVtgrjWXHyjp3zVcPwJ/H6PwYqv4HxFUQiaX4e
 GHn7nCJu3HLpqvJt35+qg8/BXXsBYQCPuQ6z7IxS9lT3KdNN0Bm8ubmoOo/hRFA2WGmWG1q7Xna
 uh6sLSBQMUBLc/eNBhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX8MVfebzD+FEg
 lJG0y7aT1KA45qA/12tr0dorJNStgG90pCb+asWPK1DP1XglJBaydrGyW1NyG/er6FWiG2S3zTh
 c5OM7qeYgCZJ5HyjP+ZW9AhAW8Opfdk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136

Instead of needlessly copying the fields of ethqos_emac_driver_data into
struct qcom_ethqos, just use the address of the former as a reference.
It's .rodata after all. This is done in order to avoid having either two
calls to of_device_get_match_data() or having to extend the latter with
another field when adding support for SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 37 ++++++++--------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 47b70b5e706f221c01f1c0ae3b1acafae6641165..fa3447b90315672d706d5ce7d710bdec6214e4e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,12 +103,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
-
-	const struct ethqos_emac_por *rgmii_por;
-	unsigned int num_rgmii_por;
-	bool rgmii_config_loopback_en;
-	bool has_emac_ge_3;
-	bool needs_sgmii_loopback;
+	const struct ethqos_emac_driver_data *data;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -189,7 +184,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
-	if (!ethqos->needs_sgmii_loopback ||
+	if (!ethqos->data->needs_sgmii_loopback ||
 	    ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
 		return;
 
@@ -322,7 +317,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	/* Set DLL_EN */
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_MCLK_GATING_EN,
 			      SDCC_HC_REG_DLL_CONFIG);
 
@@ -352,7 +347,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_HC_REG_DLL_CONFIG2);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
 			      SDCC_HC_REG_DLL_CONFIG2);
 
@@ -432,7 +427,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	if (speed == SPEED_1000 || ethqos->has_emac_ge_3)
+	if (speed == SPEED_1000 || ethqos->data->has_emac_ge_3)
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 	else
@@ -456,7 +451,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 /
 		 *  (2 * RX delay ns)
 		 */
-		if (ethqos->has_emac_ge_3) {
+		if (ethqos->data->has_emac_ge_3) {
 			/* 0.9 ns */
 			prg_rclk_dly = 115;
 		} else {
@@ -472,7 +467,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
 
-	if (ethqos->rgmii_config_loopback_en)
+	if (ethqos->data->rgmii_config_loopback_en)
 		loopback = RGMII_CONFIG_LOOPBACK_EN;
 	else
 		loopback = 0;
@@ -495,9 +490,9 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_rgmii_por; i++)
-		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
-			     ethqos->rgmii_por[i].offset);
+	for (i = 0; i < ethqos->data->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->data->rgmii_por[i].value,
+			     ethqos->data->rgmii_por[i].offset);
 
 	ethqos_set_func_clk_en(ethqos);
 
@@ -511,7 +506,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_HC_REG_DLL_CONFIG);
 
-	if (ethqos->has_emac_ge_3) {
+	if (ethqos->data->has_emac_ge_3) {
 		if (speed == SPEED_1000) {
 			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
 			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
@@ -538,7 +533,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		if (!ethqos->has_emac_ge_3)
+		if (!ethqos->data->has_emac_ge_3)
 			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
 				      SDCC_USR_CTL);
 
@@ -743,11 +738,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	ethqos->data = data;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
@@ -784,7 +775,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (ethqos->has_emac_ge_3)
+	if (data->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))

-- 
2.47.3

