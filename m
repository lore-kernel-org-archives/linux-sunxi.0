Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362831B832
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Dec 2025 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144581; cv=none; b=ArWnxCaC8HxtGU4ZX/rPhr06fc4sTPkERy24SnVAvEapLjJcUKNVlXoLLCJwm3GJDyXjujFG0UcqC7Pyw4IPe3sP4aQTrBaartiQ64+0c9fJFv9Qk2h+JNDHm9ruNwZZLIc3RtSFHQ83q1jXRsgPIe2Kk3xa1yx3+t55xczxZkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144581; c=relaxed/simple;
	bh=Djhq+Qs7UcuFRjlz7V1IxtmMHXL21sAEDKp3PNofzZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWHAEYXLHKmcMozLtV6u8oMh0BfLyBRJgJeoGtq3sVSoj3NNfe7/FWJlRnlRH7kMSrdoj+L3ftgahTgdqoPaLfoNfc9dbZ5Lst/y570LGe6PUBHPLVx4qkR8NxIkqoWOY7N5E20kdNkCS+sJy2Vh4RL/1jJ/Bsb9HCA6MI9BLa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBHFp77w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/RstSyP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBHFp77w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/RstSyP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBZXm84101209
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Dec 2025 11:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=; b=CBHFp77wpmg4I3K7
	Rg/zPjnBug7Mvz8+cpO95J+3tPdoWdrXTCJTbkEtKa23Lbh6i34cVMmpsY+uOueZ
	Vbuil+bTAuzBVjv8uuJDvYsZvF9EvsuEyzaYAVrwdprCSF3TedQpqZuEzy3LPi2y
	ukmz8jEM0pPXOmp6xDA6zka7gU+Y1H1e1CUVxhhQHJqwDOOAVv9Bm+BbFyXS08ef
	wOiGb52r1BhhhIzWcSfbx9TP/WCYP1WYAdMQkQZgw+X1HURHcVFLerNGVDnnfZQF
	GLq3XzzlftyUytUd/QVBiQ5xMbzCRr5j2wnRSxDPNez/Hx801e/L2AD6IVcQKVa0
	p9O9wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2gqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Dec 2025 11:42:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ff3de05so43151821cf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Dec 2025 03:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144575; x=1766749375; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=;
        b=Z/RstSyP18Lqrvb1o9ugyUhel6taEBKjQBaMmLyPzxS7IZ1nnp9+La5bXjUMnSuLW7
         Aj7NRF+SUgPKzeePavbIGA38Acy4DkV0T6cIa578mYmyI/JYcqQakJ2P2iA+m5QTM71O
         u6Ugk77wJtIXy0NiROZRAfAKfyVLoSBTICEfnDL4BiuJsQozAJ8Bsz0B/sWCeT+19oK0
         +kc3jotqajC7fFQ5dqmyQn+9na5Qml7/noBGdj2Bl4u0zVl9eIqHje673UjnkJim82xS
         SDatFyYwbgv7dIP3Xjrj79fxd4E7BfiF5MukR2hCXJH2pFqEI5sV4yUCy9dfGXWApYq4
         ogqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144575; x=1766749375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=;
        b=tShQh9fNx2QHYFRCivkSEHvV5pgfWa7IspS1ilX8qdrm8IEP131l/OHKSZPGoPZ109
         zGwZySpY3fXzhD0r2bWaOfIzZByZrtD53+D5gk/Qp0OnjUNWX2RkFkuLej+4k/9La9jf
         mSfzzy6mIiYvgNA9lI9a12cYaJmYYzvdYKY6eNaXmSHNm9wdYjV5mv97UGQmePZP2+cO
         2d+v2Hh36vM0PDenQvMwXVTrEdtlPAcgnVqqEUW+gTQXVY61qJx9vqQOhrls6wnj6Z3L
         H/BKKSEMfBXawOgT/8lim/j5zkgjrYo2oPVSnBH+w0lDzRboxt1toFbndxnOTy1neB+m
         fX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9EiBDbu52zdF9+Gx1/EgcopZrgNaqcgr6OJ9ODIBAQR61/XL05KOCg44gSEy4GzAamH2alBskIva2jQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2SS0g+qz9l7cM31ToeAAYcrALOBBNVomlI7COxjFFgsiwAh+b
	isfy7pGnI8h6q4DFxeX/KRiYLvPk8YjuLTtea/0VrLTEmlsAlHU5GCWgR83TzWo/DYuqK935jF/
	sqMEWvP0AXDLUE6KMoi3XIDLMcsN8xkihDX2FZN7+oaPeo1aKMZL0OjKXagG7xHHJjA==
X-Gm-Gg: AY/fxX6u4EZD2geF3Ii31ysBqYUiP5oSL6IZiQ8DNYeyjrcct29FptbdESugHY4x3cV
	+8DzJ5Wyi+0bmIiSsoBtlYPiDh7aCzbpZtlsDYkVFZn+gp71B6kuA5neEYIWB1JcDStVsHKw+Ar
	/SS5P/6zmp4fEl2RtaoNtIprKm1Qto3CG+x8QIQo5XBEEvryMnY6nWoh6utBDtHqnCANnK0DHkg
	GAFspMSTn2W8r01s+iVJx8+Gtn5IG0KRlC8LGzpWX8fyjBYcoQ2N/QvtrJaRXrwzMahotftZDjp
	f1HxEIadFol6Ix4Jpqi0chojX1D/SNiLNJMRsbW1BlqXMg7jhHBOAQ6RX/oHxNe96H1DzCiVuG+
	F/hmo2raWY6ex96SeQmRtmSo0tO/rXeh38staRBs=
X-Received: by 2002:a05:622a:198b:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4f4abd8ca70mr31652631cf.44.1766144575418;
        Fri, 19 Dec 2025 03:42:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXqKhXyGW/sOCylHSqPsU9xZo9abZxVRQYCYTMt6lSiNRCCt2ixMu9EsVynhaWcGrEf/49ww==
X-Received: by 2002:a05:622a:198b:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4f4abd8ca70mr31652031cf.44.1766144574971;
        Fri, 19 Dec 2025 03:42:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:42:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:19 +0100
Subject: [PATCH v6 4/7] net: stmmac: qcom-ethqos: split power management
 fields into a separate structure
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-sa8255p-emac-v6-4-487f1082461e@oss.qualcomm.com>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
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
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3459;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xDKLLZ/nGakVrTmQ+/4MLzBk+KmOo6dAa2oHorRw58A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTosU5uN+G2JPXQO6N/VK1p008Oy6bofZoKjo
 4TC9E8cTb6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6LAAKCRAFnS7L/zaE
 w8KcD/9ZLZTgUdutIP1az4i2m9SlSrbZuBpSxCTk3tVAOh+pTUXnqxh44wcriaptAi7CAdjYTsW
 bvBu0uld9h2v02gfR7d7KST7DXd3WuHxsE0CEWVvEipG5rJeroe12tLfcoLVHhJSkHS+WKFR2j0
 NtOFNStGn6A2142OljZTa1/9PatjKIgBxSTTuFskeqOs3+2IhIH+P1/rOkFDM7nLIUicSRdpDI/
 luhS8I1dCa2N87ZP8osUOpu1J5AuCCed9LJQtnLGDXJRpHHwX7SIqXdB2lEFcWuTyOtBdK4x5to
 /zAzDREVu73NkkoUL9WeaR7LMcCgvujivWWJOzuENtUoJCQi667HIb7ewTqvBJcGf2s63hxySAv
 st7UtHOzFtJZ+1ic90B0fOoFJWEHhiMhljyfNlCHt9htbxgKwLyFbr+ny2zKTdvUF/FFgllMFA3
 m/s0PKyeVehgH84mFxxFScJN7BxGZsxxHgEMPGCX8iJfeMQ+HLuz5pBtLPRGMD+g6MW3oRi2prr
 3MhkAUBFVRYpQAjjL1QYYPX3UhWVkBdxnv4/L6D25Ut2s3PpOX92lI+Vt7zECxME9g3x9xJbW9w
 xSnslNc5kfLfVgheENGgHolGcNe+tosRYeTSnd8MkMX4aCyqXAmez9E/q4e9EzmM7LaHsqEkrYi
 YE8Hk92iOl8+j3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX8j8mKjHRjTS+
 2N34SFPSOB605CCCVYe/q+6LVOPkBu16zR7Dea3e8HWV1292k0kuMaEuOfXdKvqPNa5x7VJkLCf
 EdiWf5d/6VCINyriILeJIQD7zd+eNTDTHlx+f8lLBHQH/FWOX6dFY9bijZiHHM1pItCQlUNMyLB
 3VbrZU2Qr6bKxY7uujwya3jqcAFDPVOcP5b715Fswt2RmV9EYjuUX4TBBF4hJdmHRbkTFsulFHA
 DeKK98VnqD7r7yTEI0/pU3QJupIyPHHfRyv+XOZJd9cN1lbo79+ZxmbpuYPj2pAAniv2DrOL6Bp
 y/jlOef7TR4O0mgeTswMhtfjHWJrfpFkxNpC8TTDp+SplZtpvYtL/PcPK6YapyCENk5nKdeouv2
 l2hIcdQsOwPkBbQURql2sZQR+ftALHQF6ZiepOMn/yqGcyMFAMUmPL6x/LJgZXK47+/35BngXPZ
 FYpI/X+LlgOsj5Ajnnw==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=69453a40 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fthQcs0maGYz3WdgJrEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: y_z_vS4J2m7OyHU0vscqKB7Z0BGjOYik
X-Proofpoint-GUID: y_z_vS4J2m7OyHU0vscqKB7Z0BGjOYik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190096

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e0f0eca94342..54458ff5c910 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -303,7 +307,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -324,8 +327,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -744,11 +752,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -796,6 +806,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -803,7 +816,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3

