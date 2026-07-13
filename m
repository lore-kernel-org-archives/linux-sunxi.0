Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1738A426D1E
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948872; cv=none; b=AAsVMs4e3d9j5q2zphrHbuNrlOFC2tI+e6ZorMbBNx/C6e8+wUgJH2xSlRsy+8BZbrE8G+UzpZ+PjZ+TwQOPZradz1yiICSw9G7Xys/xb/+qVAroYbIM2/v1dQisp2VxcqeDsE5BSLCbztrlYtRGexPfAWyntTnKLAK69FjR1zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948872; c=relaxed/simple;
	bh=jjMtp5SqAas4zIIzp6l5IEc/YbwGv5zChtMnC787rmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kz8sA7knFqhnRfatXw09z6qpy4b2jbM5zk2ek8lYp4e75o3KyleIRESXpsCu8k2aSr4VaXnWdluxv9Kg6nhmeavPl7B4dd7UyX3W0uyYZT+cEkevRnKld6g7du1t0t84l4C65LNsR+o6nyTPYnhTYYPWe8T0tIz06I9XIHfbTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HRMgAGLm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvMoxbi2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HRMgAGLm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvMoxbi2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDjdW1453340
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=; b=HRMgAGLmTEjLL7NM
	fyUok4F7YQcqnppTYtirZjwB8UYNicMU6F1+I7N5ozfZx2/JtO+LcXq4XYQxgWGW
	ThUPjmF70f942+VTtukuLP+HPSK/avuY6favBLTLI19Qv6JfHRrCru8sMnGHeIiG
	voP3rzkT0P0xj7F7snSJX25ArsOqtqZeVvU8nSdc1t3AC3VJCMDLwYwVbIlta/oZ
	5bKurWfOHT2SvIt2fHQQtW13/NkuuRvNSyeIAPx4eR7j7U2g+I5SecH0oNslpZ12
	hFwzxIYh+Pa1/g5okCPXjEuXOQTJJdsLzxBwkiSFOhnXSoqCH/+UTcElkIB90IK9
	c2+k/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj01cuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso62729261cf.1
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948868; x=1784553668; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=;
        b=KvMoxbi2j1WA+ddBT7A6OabSiV4ZmhOD8v3MSqAP5o1i2LI7Y1zBwO9lOs7l7JN1Lv
         aWeQ/+B/Te2cqTCHWy2Gg9rP+bsPd7LjHvp6WwdieBqd/ZcfuegOUjsohZtM2XRmuEae
         iGFahhkTqtJZpOTcXFj+KS694I9fhC6D4ytmFFNUAZWmz8C4RMYAAbnRiHn+AAC92guG
         NQu0HFTepyMBIoHBFQmVulKDoUGFQAzuRPgiiEyaBcC/fUi7JFMTTs4KvYvlnutivgdp
         kQQaC2jgkKX1PeyEri9FhhUivG06oZqP8/X4GHikTqsalXkHXAdjFc3mTtLpXV3kzlGc
         ApOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948868; x=1784553668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=;
        b=lSKzbWVSgepn/9DtUxS/SVokKocvVbg/KR884YNoLf/lWz7fzXo9yKG4m+reSEZJvy
         a0Vs44PcbWUIUA2YUe6wTjTNWpyxeMVlL+pgWqx4G7wNrxCaLkgXLZC78tCmcfQPpBP2
         Qde/LZ1XpA7VbHBgHgAVSJwr5J4EP1+XphktTJGtDJkgtghbyXLYCJm2eFPCOKp6pAvy
         fu/lv+6MH+Uu0tlaOpK+rCRZjN5fEVsH+fPkqh/JVWea+PSNFHgufhn5bqQ+WhurLbd+
         OLhjlQniWG+4Acf9hrfqv6K/tCL+8Wll4apHl0pMS0nuxQiNw0xF5SDzzT1kLAx0hFYQ
         Q3IA==
X-Forwarded-Encrypted: i=1; AHgh+Rqqorgym/VL0tB/Cst9J2OMuuGzBQs8CWN71Z2pVoP8H+hXQ4bOE1gN0uyCckBnIeodSxq8EiHCuuhkMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YznUA6Y2CnIzj2ufgjZ6YgFxYKJ9+syzqud9i0SbrioilFhMlBT
	VC/bXUqM31jvMuSSTcqYfTLRcGMxUYcjfLFI4eYohjfDizSMLQhVL+bbF/gVfYroFUUS61BV5IY
	Yz+NLQ2TA9NFtpeLCWEyLr9Ow8XPijcjIh/oZc5CiDbkNjOE/BvNAciVQaBXUqAHcJA==
X-Gm-Gg: AfdE7cm8nSpb87vwadYQk/d1Lmpq4LFGcfTVabZg6zNotU5MndWHcaL/RVNT6bTiXSe
	fVwPDaDPo/lV3VplS3IfqoBZHuhrYyta446XMAIGuRuQSOE17MlSJdYCk2aMY39CTDeAcsp9B1h
	HDxa532y4GqoaZWZD44zlNXOHt8AP9h0ZF86a2lSm75RI57u2rbUpsD9cb9lkhNOppT6Pi0PreJ
	5Dwz39/nptmLhdrb+Cwypp2t692WG8ISYDte8sGb+vI36PN9HR9elnTWjTnRn0W0SKLg0eVVxOH
	N6+k3IAy+jv4+TdZCSid7vVbAVujFPVyyrZJeHQ6oi58QmdOAgD1SIooyvHHzVKEWqErZwF03+W
	sBHc1z2LRTali3Sv7++rDbQT+0KJ2AMAybznN/H+I
X-Received: by 2002:ac8:6f0f:0:b0:51a:8c86:bd40 with SMTP id d75a77b69052e-51cbf2bb069mr93022461cf.61.1783948868282;
        Mon, 13 Jul 2026 06:21:08 -0700 (PDT)
X-Received: by 2002:ac8:6f0f:0:b0:51a:8c86:bd40 with SMTP id d75a77b69052e-51cbf2bb069mr93021511cf.61.1783948867610;
        Mon, 13 Jul 2026 06:21:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:30 +0200
Subject: [PATCH net-next v13 01/10] net: phy: aquantia: fix system
 interface type not updated in forced mode
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-1-119f8699ef8e@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jjMtp5SqAas4zIIzp6l5IEc/YbwGv5zChtMnC787rmU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOYzzfnrx183EvrDrG4Ij0t7Dbry5xhQDBN63
 sTHPBPheJ+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmMwAKCRAFnS7L/zaE
 w1LgD/9qtqvWaJNIcmSJbF08/P2HiqqtPEBd1s+tyKeMo7yTuSVEomvSt9PQeumZk4luZvppMze
 BCjhLWx+6fOyjhWVSz8HBY65tAA1zD7DNVIs9qguS8J8Eq90NiKvfR7ZDr9usRfnKcKWxsWOHgG
 ojLZ9JC26nL2b+gxoo/vjBbVki55aAeUgxQGZz0qSU//7QXZA+OpLnwhW+P1mMQrYnuPu/MARCm
 bnmW2Z8D+kbpF4vgOOG6KYY6Xx4vv59wa4mGzYwTy5RnJK9fzo2so8pYw/lpa1A9XCm9gbZDWHE
 6NZYLNQLxkY857AQzQnAMtuD1DqADDCt5IKRK8bDQdz1syR8/VCpUd/NCsYwjbqP/4rtmoVYY4+
 nXsBxk4iuXvVwttd2OTIvw+ikxHFh5MNRIEdCJXtbA+nfzjLzy9U816KqDSzeyaAe22+gQoPAwb
 HnblJwwISfQH0LqYA+1jM4JEUC5SH3i4/XD//3GCfNpIZOrN8w4L3W1eopUVXLmIHDDP0Lt9nab
 xvVkp7PypSMfsI0At+9gRMCcikJJwfP+C2oM7ElLMHgQtDj2KemfCVk/c+WGO+bFkvXVAtBcGOR
 /emT2S12yGD/Gctx1pVyNrxdoAYZVAZD+2Zf4YHnVKyivlzdCOl9aa11AjnmAMRcxS2b4nQyJeb
 akLHRgl131BvtYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXxCBDzoVJmgOy
 UvLEc6TMgO1WyGKt1Bz0RjbwDk3TtJC2p6CtT2qHh+zhhlzIwQ17L/AMRlCzQmdfuzhWqNzolFg
 UiLRMpfXfKGE+Zqlq1450y8RMCbUxkI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXwnfUbn1sSdAb
 9qnZoKGtkIQm2MFTh6qlENYCIOF67XN8m7nYQrxjJQ2wFKOb/VVd6AMy77TVA4s3riA6DR8xne6
 +DDEAVE2qTRiedJAaQsBdfOo64O50paieD3r9BGUTtxnSKYqfxn4shsBy7FdDdBSypV8vZPbJog
 zWX1F3XtykF70cBh+DaVsGPq99pf20usTsyEHw6k2UX999Jv3EHaz5w5vpBZv/jYNz2TV7fP18G
 gx/U/IS8QfKOE+p2JTu5usbNMb1aSP5r0UEE7LoUAP91hyEPI5JCjxoAvGjFYiK8P+oYV4t3Kkc
 x1qao4L/QR/Xqs2lpW/1/m4nc+Cgdd3Qn824FTRnE+J9dvMPYWT4cupezjoymA0BnWC5SY9GohY
 PeIyS+qLm3GiA7etLugyCeIEKYjx3GN2rKCUVGtYZ5cNyj8xLxAS+YNHK6CKRYF3V9YtOEP6U13
 q3zrfj1RafLfegf200g==
X-Proofpoint-ORIG-GUID: t1TBatopkHP92UUrOP5xX9-Fn0M4TThl
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54e644 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mooR1oPkU_hlknJbmfEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: t1TBatopkHP92UUrOP5xX9-Fn0M4TThl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130139

aqr_gen1_read_status() decodes the MDIO_PHYXS_VEND_IF_STATUS register
to determine which SerDes interface the PHY is currently using on its
system side and stores the result in phydev->interface. phylink relies
on this value to configure the MAC.

The autoneg == AUTONEG_DISABLE check is not correct:
MDIO_PHYXS_VEND_IF_STATUS is set by the PHY firmware based on the
negotiated link speed, not based on whether autoneg was used to reach
it. When the link comes up at 1G in forced mode, the register correctly
reads SGMII, but the early return prevents phydev->interface from being
updated. It stays at whatever value it held before (typically 2500BASE-X
from the initial autoneg run), so phylink configures the MAC for the
wrong interface and the link cannot come up.

Remove the autoneg guard so that the system interface type is always
decoded when the link is up.

Cc: stable@vger.kernel.org
Fixes: 110a2432c520 ("net: phy: aquantia: add downshift support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/phy/aquantia/aquantia_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc233879ae1fb2a97758b3df9600ce5..b720e4e9028cc20823297e8bbd239121aeafa09f 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -544,7 +544,7 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
-	if (!phydev->link || phydev->autoneg == AUTONEG_DISABLE)
+	if (!phydev->link)
 		return 0;
 
 	/* The status register is not immediately correct on line side link up.

-- 
2.47.3

