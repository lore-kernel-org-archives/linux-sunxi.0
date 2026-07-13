Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D32435EEE
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948906; cv=none; b=DbLmPICIZVkxYHe4k1QC2llbyZV3yc8/03Ki2jABYaz190Gyk3+AtfBpQ1lIPitJzgfn8KFJXf8qZoFNRwfn4E+8nLrKae9zZMlkB9iq9+l6o8GJvbi468tBis8AfF3PvR1UPYb/o6H9YhRvab/RdD/8FlemaK2Lk8QVpGIBCQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948906; c=relaxed/simple;
	bh=TqGGHsUwyhTsco06VxVuKgwFcBldf6bN3oZwc4gBkFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZQJLaEL6oAi45do0WXVhGGfDOksJdKYrH2kR+4YCHU/76pdvMF1unfPuoYEHotEh61zAG/CV6WEfMZ0OmZhKVLJ2YvyPt0M1tFXy9lS1xI3QNZBWHLJ8p6AGDS6ADBaRIj4gS8T9cPN4WCh+6VRGEhz9aNfCvwAWFJSBfFDZQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAqZS2MR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GA+a61CK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAqZS2MR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GA+a61CK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvj31494374
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+2ZprCy+bUYfEEV2sLvW6R099FI4HZnlU8Ix92wRw7k=; b=dAqZS2MRgD9bQjzE
	7fkd7SLmmebZa0KqKh/N419BADvAkALOln4bbxCm4KlpyE9E9QtRJuK2DFjSEgFx
	MoZMUJYgGg6PkkW++3WtZDUzBFlTu4Yb7p4YxQEi5BKwEc0bbr9JA1X1EOGn7Mke
	GUgse6seFhGYIZzv8v9tIYd5hAAcQYFFnmPQU5LeLJI0VddrDbrsJdIczg12onFv
	MDUVprMl7mGSFdYXpRHBd08sYrxfj915Gq4mQ/gAT7wONX5mraB/CJI3DFwc1CZe
	9dUGXitF9erhRkx7HJGDb+P5ajq/3RUmi4bI/q/TsigdZTg9ZOWAAtsykPEGy+m7
	12vQow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2qjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso32027561cf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948903; x=1784553703; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2ZprCy+bUYfEEV2sLvW6R099FI4HZnlU8Ix92wRw7k=;
        b=GA+a61CKvEzuW2hNEfPRzrKs1vY91yNuJB92dzPBsRiOTdOvZwM6AV04YLgHJcCgXj
         6DctmK4GhdHwx7mNzAiiQA0x4QV5Gj7BgS72lk+swZuSc2vPVYjd/M2n6aSwmNSaOALf
         0MdmEiV0bSblVGKQzdfVF+owyyEM4qDjRQSqyFi4+5WV1C/Yv8O1jhKPSjrezD9MoABZ
         ZdFnRt2+YjosP//zxlOMAOzQ4mdprCxRn+gePgDdtXfk3aO4egt4bVxA8TlA9beti8l5
         HxLh34wTxpEAVX7cz6OvHFKgPYvEo1MrGfjkx5A8cgBibaTEBSK7J/prDi4Q1Fz9fYVe
         jKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948903; x=1784553703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2ZprCy+bUYfEEV2sLvW6R099FI4HZnlU8Ix92wRw7k=;
        b=KcamsE8bU76srKsrWP2edZNXrgC+U3rABg4DZrj1xy2gucrW8+LFRS3/6bA/4lw2ZJ
         Lz3YCFP5yuuZelnVh2RZSanC1Iu8RDGo+chDi5WhqPWOQ5dRioJk4ovA2kAkPRZCpcG4
         82wZE30kRqLhmG3lrxDYtllEJLkH05+KCVZm6cFh7+Lc9INeBQcPjh2AZATMC7K/rHuX
         jlMipJZ0cq/9hl++yA8issb/xO/jw6nhqvK+bW+Sf6N1n6VVYOFE5PaVqa4gyxDTITtD
         X0Udsorr1nsp0CrJRxsd6R3ACRyH0UqBjyPI2cR1zfxhdjDYEAD/uqUWpypFddjQZ0wa
         UTJA==
X-Forwarded-Encrypted: i=1; AHgh+Rokj7tsPlZvw96JpWXXQzjeyKJ1fkd7HDwd0XtwGmussiSwsrSeezmK8sQgthGwDBnh1nw9Z6oHQAOrGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNICJbOLguTLlIXgLquxIcIUbuwn7AWHy0JO7WxSWWA4p0/czT
	Yk5Z+uCrn+RT4nxidQufIaBFa/McZcnx3x4NB0RGMJWTp8twHgZRNqErk4p+RlCXwtnn8VOJ8jS
	9DWHnYnSigNeb36ML4/Ohh9pYSf8aTmK6c+B6tq8/ZfM8HrQzRVgqwxcZ/+2d1snijw==
X-Gm-Gg: AfdE7cm3ToFpjBtnMEQCcb/I2j7OYRPYGQ/R+kvukuFF2IW/vl60MYnGnDPdlOuG294
	ZD/6tRV2W+mFdQsZaYBpstHMunAJReejkcIFJ1Ql8qEXJKl/gsgmofQ+5RfooTWNf8dwvlca8my
	TEGkRoPpmvcgOoO0beYL6KclVBaqlYj8coPln2Yh9BvZNJ9fhXIQSntAyd2eMP7iu4q15PrcteW
	AzwJC+4xITh4IAmlirkj26zvdp4c8dwqQTBid6y6HCZwZpbk1mVccLI2U8Q1JllJ/RYrvwm0Mxb
	RM6hUdxCL/m0lorX4yTNJVBcK0K1hEIXAMA5LGJaxumZstU0PLemh0/AJrorJLEwmtXuxcyrrPN
	H7DQMvHBvZteTncx9/GS6wwoF11zcAT3tlv3dF0Ch
X-Received: by 2002:ac8:7fcd:0:b0:51c:1b78:b044 with SMTP id d75a77b69052e-51cbf27e714mr91207751cf.61.1783948902460;
        Mon, 13 Jul 2026 06:21:42 -0700 (PDT)
X-Received: by 2002:ac8:7fcd:0:b0:51c:1b78:b044 with SMTP id d75a77b69052e-51cbf27e714mr91207081cf.61.1783948901957;
        Mon, 13 Jul 2026 06:21:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:39 +0200
Subject: [PATCH net-next v13 10/10] net: stmmac: qcom-ethqos: add support
 for sa8255p
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-10-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TqGGHsUwyhTsco06VxVuKgwFcBldf6bN3oZwc4gBkFI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY9WSl89yzJ2CqMhlNNU32SUrhE3oOrdIQ8i
 NwsReN/KxyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmPQAKCRAFnS7L/zaE
 w3nCEAC1q3NEe6qIb2fTolQ4Z9crn1CgZI+xbic7vhmRZAUVv2Y+TlD1w+G8QI+LY1Q2jCtPvHE
 APl58knmDufMR0I2L7Kjq+b0xL6+z/8+9cW1te2Nv9Mub5tO7TOQ4bS0siuIDg9h75hoYRhmTYT
 VG2pDnADdTWmYlJadmBqZQesz3LU/8wgeP/MCx7WMuUoxL7dr/vdGjhke74AypqVAmWBQqyE7zb
 9LhGB8JQuhU2axn4XHHVaUB/XvWBDoRWRF6QwJ66eoUBPPOgGvhp/0OdDigx1Nv3aMf6mfloKsg
 U8iOqKIb2FPUGDTv0vE5myMB84jwjXFg3ux3UkSejFAe0xik3eT9GYgUHPm1DUgkBPqm9aUBGsx
 zLMVZu7dEVweNIBa2BXOOb9v586Mk6rSYrH+t//kxMyl5dv6n2mnScucHHH6fAw+RxoE1NTawCU
 QrOT1N6vB1LUWwolnHaVH7lXf496fbGZnfkb49q0UW0GzEgSzSs9t/gl0oFMQx2yhgXX1u+Q8Af
 82h70nfjk9yU0b+AqzlPEyHcp7YK8Tj4dCs5YgHPDAFdlTumFOnbQxweaxv1hOBXVOhp0CC/rbk
 YrqsYusTK0WT9c/Ecb7BzFoI95ZNE7eaddEsJBBtJmPJAC7mO+h6atdhgwE5FnPbFDoNb24il+N
 9Y4jV9pjO+YFPVw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: kHEBP6bK5Xs5XytdIAeCPOWSf3M6a8t4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX1OFJC+yQDQKH
 0xjNlGnKR5ereKrQs7SMq8qnXRbKaMBtftUxY5LF29kDd8ptVB20acPFVRyZNAwePq9Pa5Q2SPy
 4vlzqxJSQtMxV2ORDE+DZlZTBso7nptqBivEBvwFGNWzY4tDiTuxyRw4MC47Khb2dsGpVPDfw/C
 vLbVzLF1jJF0TiSIasCqNjoQzMa99kqY6gI3Hryn7scGQ7zGqU/RjtETQjM3bBTZcoy5kUpT7Jt
 0vW53HunoRm5qobE3QVB068ezikeV3yyLeMVwrfbNpONY9km2b29DXyabvOglWxMpIb+qINQIGW
 C90EmJb3F8XFZAGlk+PfUKHv8Nwd3sv1epZbtEjKh47mIDXis1/9UYuWBhRsEMlDFnYn3H7QlD4
 TopZeEcImgfg6KUnhC5++zAYAfIiNrIrEZazB1ElRdw3E79DJxl7vTdnfdf8s5t9ygHmDMdraDl
 zu3Fi7PAmkm7mQvM31Q==
X-Proofpoint-GUID: kHEBP6bK5Xs5XytdIAeCPOWSf3M6a8t4
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54e667 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2F0B3szvjGg3gJiy4BkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX1Z1x74LVa7Xj
 2IhLxpY+cTBQGrlPMkuOq3rmTzc/r5K+p07RFuTp7Ykzesxg2rCfy/NkfYQWMzNp32TlX9P95Nl
 ZlieVMk1XIm6Qt1xFrWWE3Pjs2j2zUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130139

Extend the driver to support a new model - sa8255p. Unlike the previously
supported variants, this one's power management is done in the firmware
over SCMI. This is modeled in linux using power domains so add a new
emac data variant and a separate setup callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3af1608fc21cc7cf6b0ad31952b9f59d6f00a2b1..d34f20f868138c4e81ce85364cc97d47c445238f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -98,6 +98,11 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	/* Fixed PTP reference clock rate, used on SCMI platforms where
+	 * firmware does not implement the clock protocol allowing linux to
+	 * query it.
+	 */
+	unsigned long ptp_clk_rate;
 	int (*setup)(struct qcom_ethqos *ethqos,
 		     struct plat_stmmacenet_data *plat_dat);
 };
@@ -108,6 +113,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -207,6 +213,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -311,6 +319,30 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.ptp_clk_rate = 230400000,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+	.setup = ethqos_scmi_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -756,6 +788,63 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	return 0;
 }
 
+static const char *const ethqos_scmi_pd_names[] = { "core", "mdio" };
+
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	const struct dev_pm_domain_attach_data pd_data = {
+		.pd_names	= ethqos_scmi_pd_names,
+		.num_pd_names	= ARRAY_SIZE(ethqos_scmi_pd_names),
+		.pd_flags	= PD_FLAG_DEV_LINK_ON,
+	};
+
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &ethqos->pds);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains\n");
+
+	/*
+	 * The SerDes lane, its clocks and the MAC AXI/AHB clocks are owned by
+	 * firmware and brought up through the SCMI power domains above. The
+	 * MAC wrapper itself, however is in the kernel's register space: the
+	 * mux that feeds the SerDes recovered RX clock into the MAC's clk_rx_i
+	 * is not configured by firmware. Without it, clk_rx_i never toggles
+	 * and the DMA SW-reset polled in dwmac4_dma_reset() never completes.
+	 *
+	 * Map the wrapper and program the same loopback/functional clock bits
+	 * the non-firmware platforms rely on (see ethqos_clks_config) so the
+	 * RX clock is present by the time the DMA engine is reset.
+	 */
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	/*
+	 * Run on every runtime resume, which stmmac performs after the power
+	 * domains are on but before serdes_powerup() and the DMA reset, so the
+	 * wrapper is always configured ahead of the reset.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+	plat_dat->clk_ptp_rate = ethqos->data->ptp_clk_rate;
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -843,6 +932,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3

