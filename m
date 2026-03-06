Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF713EBF3C
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Mar 2026 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812045; cv=none; b=awpd/qsYpMA65QqZC9p3wxZIDnIqg7BBRCk28a66J8Ky8CTnDi6J/wnP2j6oA7rdTfKz4hqviLzGrXmsCJ2M8O/QcCIvndqyIXLwMyG1t01ebc47Z5DaUAv+WB5Et9QsAS35tReFb9DRn8MwT2/1n4TjkDjxOAmo76IpfLQp0fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812045; c=relaxed/simple;
	bh=Esc+hVA1988/zRbYdoXvQozou3w6fDBDaNQ/dCWfR0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QjCFqa0+b7bzyIHPqMbqIojOXoL8Y9rgSJANCzzMqYcSTpOs7hLQSc2XhKbjMh/24A2GCWonEq9J09y9akBE7a5bDV7sBOmgKWiMjW5VDQrjfFbWY0Zl01rAHpHavaI+F8JXJtMTpXCyuHU2t6coHF9SkuL1+7xUASNv5fe6Cw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EH9xO1OC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qly1A0aS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EH9xO1OC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qly1A0aS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FTJ1o028284
	for <linux-sunxi@lists.linux.dev>; Fri, 6 Mar 2026 15:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FZ00ncedK+mL4WvdIiqnQo5Amq5I++OhTfC5QvXt2Q=; b=EH9xO1OCIOWc1zvv
	3lyhYOt9wRBCHpHK8iwerd8cDL8VQIy0CKm5JF8+kO923+ECbVlYud+O1KloukJg
	VzuLR3ba2QFdzSmavfpZtG6OOlJBvQdq99sFVmzs75lQlQ7CfUcZypQdU8hl/cLU
	5EcdC04U0MOU5Qs7WF5y50SzqLqViByyMB75tJgervQVraNyoJRwwlYHtblae7rN
	/bhSkpkZOjQMrDkrZpngKpHqWkpqADPTHrYy+ENP12YnNPYKFxBG468tKwU41JA1
	LnglT1vxOTNZVbQ5qNHNquLSV7LA8gW/BrDtUWTyRanF58ePpavR/m48yiLk8vJC
	mNT4Qg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98h5pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 06 Mar 2026 15:47:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a129cd2so5916035385a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Mar 2026 07:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812041; x=1773416841; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FZ00ncedK+mL4WvdIiqnQo5Amq5I++OhTfC5QvXt2Q=;
        b=Qly1A0aSf8xKKJE3tK9BhrOH1Ai/APbLk1q4vFn1wd+i1uavl+55hDZ79+RsgTRzmM
         RJLxIpAGWMFjoDehg+kimswedK3dWY9sEbjuwU5FFeiMJYA0FZDlYAxdsCM2lxUipZLx
         XQqbzXVKbBhMT1JVYAky3NIQNxb7GyElcVJggT9TWLylmRJwy++TR7MS+U2Fo8I6v/GC
         tzMYB2PnJfKqVfuXsnX3HgYq26J2piFpmsNrIM/D0g8aSupChajCNO2QQxIv7RZK//q8
         q4c3BRBgq/wzYgfBcqyf7s1zRvo7AfWx/kwbxk16AITFFE9hMGjLr04eiXpCQ+n2PZLQ
         13Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812041; x=1773416841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7FZ00ncedK+mL4WvdIiqnQo5Amq5I++OhTfC5QvXt2Q=;
        b=rL5FrUfiQ3x3a8pGwMbW3HXW6dTg5wkJnLiBsn5+OnY9YQU8xm+Sue6bg8ZeDXYIF2
         PIz8B+cP6NqsZUm/TRjoueeac1sxr1Bs51M+VV0neLuTOJ6bDpfnIaVjy+0tMkRkCvU0
         7uvgyk1ilfpKA+1+OvY35v7tUUMX/xu06JldQujGaapN050uS9VPKNaFXIXLJROfp+Y5
         tqKnz1/SBNDyoNVJyeBY3gGwNO7cHYmTFcTZU4AeITi3g1XddfvbQpj7Wg20hwDpJTr5
         blWpwXhkipO4018Yd24WG8fqf0lPIoaVNLpLpVEYUEZrPVy4NLdY+RCtMa1nFXJiANC2
         xSSg==
X-Forwarded-Encrypted: i=1; AJvYcCWfDVju1RyoNyZb/GaSq6UD2YCXfzDHU1a5s8D7WlSEkO26T/uWKxwF1Ot63qZdB3yyPScB5pmU5wudcg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiRUahrjghEcNfolsDhqD57924ohj8jW0UE5+680g5KpnVSQ/Y
	SWrGDOTE3wyQZS3JFujWXStaHptlpbaKDwFoc4HrEwXH8Pa7ySHxekTERyJxkCfnydva9Sur4Xx
	E6YULpuefclbyPrrpkIBbW063CqSLPrdAQHLATiT+PrY5dngxCbRDPNBeys40mI28dg==
X-Gm-Gg: ATEYQzztvuYMBcCi9HXlE/mrDL+nYxsNkwR3fbD1hVi/TZrjpsY74/ceqATtkFcYe7h
	zJPdEPkfbVFjP8u64gBAR1UYpX4jpjR6o44GYGpDvfHLVh3+QopYnxXXGqvC2M6PI7fuWftMpUl
	ReMIqoCBibqTYqLowHdYMaYO7oaAZqDKpepjf8nmkLlKEufzpSoWpKEHQrXiarVlz2RDHO5OWMp
	dgQW6XFn4E8buSMWUqNUmLmI2eOZOKAFG5JvnPFapCIIMVe+y2LhVp451xCVqcy1FN3RM7Lb2Yt
	/eFRqTmoOZqVabh4jTFy2N+eumnnrh1ihUjgTPGVl6qI7TELmfHapOe+PGkAz7orIpQAiZTSxlr
	fq2K6PGMM2Irap0KGcbd5YhLJPijneEC2UpVsEiM2sHuptobY9qO2
X-Received: by 2002:a05:620a:460a:b0:89d:b1e7:29e5 with SMTP id af79cd13be357-8cd63409440mr729247985a.5.1772812040982;
        Fri, 06 Mar 2026 07:47:20 -0800 (PST)
X-Received: by 2002:a05:620a:460a:b0:89d:b1e7:29e5 with SMTP id af79cd13be357-8cd63409440mr729242985a.5.1772812040433;
        Fri, 06 Mar 2026 07:47:20 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:42 +0100
Subject: [PATCH net-next v7 4/7] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-qcom-sa8255p-emac-v7-4-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4xdEZ3Xz7FPuhh4TIgOPGYV5mznSWY2Gmb1v1cWPOGU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbtqrbJrglPgvGD4e8XKoLPxkAHqr1h3Nepe
 9UbIf0JqnGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar27QAKCRAFnS7L/zaE
 w6aDEAC26/DLAc01J88zpFwROfoamNnM/xgAfAQbvQbU5luOZnh34NX/RcNJ0+nNFwz08EN5X4j
 5/JUw32zLJjd9HwDV1/fuqQezyNR0MnfpDgymbvYx3t2EmMNQa/hIxYER1tZfPvEPNBJ2Wu/y3I
 R57CjTB0NYLVSXoz90wG+F6uMQndZApxjZtk6xPJ3bZYlWkM8LXJydoVqVP86fOs2N4bDpOAiZy
 ud/NsEg7x+jpCSCFPGQbBW4j/VnYBFQnIP972sAfSiQQLA6bISpkzbTj9BYlBAjAf0/g5DUZddC
 GHdOAClK66MCmWlqKdWIQyIxa4CLf5H7ZFXWbfNCXXp7tCeKTJ7KcO8vRVrt0rz49p12/OrPnUE
 +xSwFwp4c3CWOBIe+LQEJVgZvOZNhiT/rFkYHDPqFcXgAU3h/4amGyjTx4GQcV41ouVzJz/d3ZL
 udtbd89DsaMLHJden6imqwwy7J0Cyym9sol9uX6NCus+M/ksJAiGq5ciFaeNqnaXxdx8C9JJOWs
 PC4a+tikzXDLlAaWMKTDDBSaAegMx2hwv/uzGEKhuik1rSI0l37Ot342QCdiijQB67EuWiBmDZ6
 3sfVGr3yhS5XncXXCLDr6Wb5Lnn8jxgliJwhTAthF+9Nrej9nFuX81hPoPs3qVeEXkOv5czbUB5
 fqP35uwnzraR8XA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: uWgABBbTXpCi9safSsmE1Hqkjf3TpbxY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX3CNds31HXvW1
 lR0Cri217PTMJt3aNEv8JeL9WV5z2xxK3MXLi9hG+hQefQUV11OZ5uLK/l34OKpTUU+HcPk+kTZ
 AsbuKJiS0zzkftiVGfAwYEb4SULd6MbRkP8ro2AIMyeA8gKBbXWz3Csqmmz4X0Vh4NsBiPc5YYN
 FcicsKZWHJJMDLZHRASSkDnijLfsiIWye2kjwfqVAgJFkh3S/ZbJ3qCIiJhdiJqcDElCMTN3DoG
 FrrkDxKWciXw2YmHF64bZHesiIa1+YCoIet0BXZ9sGVgTdg8sLMmFH/SOLEmnAmROW6f8rZRmXw
 lMgtlgKmh6W4fr5aI3eyYtz2c/YvjTchb6bRDPXpuMf8XFjS4vIV3jPJYvF2QKOHdo524W5lgIe
 ut1UPkfXuB/jT8cLrvgmTE/Qzot9tDRPpgXwHBg++EQgE9UjZTxiaNvBZmEXkUZi9QHqWkpFjPb
 +a11sSD45To+8f0u0ew==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69aaf709 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fthQcs0maGYz3WdgJrEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uWgABBbTXpCi9safSsmE1Hqkjf3TpbxY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146

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
index ae7e088b122753fefa24fd2ca715151fd56e6376..f9a3741b692665b5acce34487f7fc2aaf557f0cb 100644
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
@@ -302,7 +306,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -323,8 +326,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
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
@@ -751,11 +759,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
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
@@ -801,6 +811,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -808,7 +821,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3

