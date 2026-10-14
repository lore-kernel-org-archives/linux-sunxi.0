Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6164E5332
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981430; cv=none; b=LTpaMTMaOnVHM5jcpzFAXRQ9+dlqrkcI/n8mUN97ibxgWd0dTcMknYSqcrXXwN+OJVMFbCn+o+UL+h3GHBkgm5wYMjPEUmKNivsKaV+hLdeHS1f+ZpvneDKAQt3a08CzhqAB5rvEMC+tmCVqfpxfSeNgE9NXUCm92gYO0JO7ZpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981430; c=relaxed/simple;
	bh=2sBp7G5mc6uJL64UNxM6dPPb+46Qh7eHGxK9GvyQ9M8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i98lRp3afr1YFq+uCDTilDnCd5/xxnYuVXAb+ISxl6kJG6O2r58Jm4kNhmUOIS3XruIDYHnc0JtzyoO0+logsrL61xd5UXAaeVG1c9UuCvE7vZeLOelyAI9Vbj1vyoepC2dJo5b8ZY1rpPHgRoCRcqX/U1Ggd/e36gkX88a+p3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlfsYFZZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgzX6oVN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlfsYFZZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgzX6oVN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBWl5t3365336
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 12:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rewnoAte/tJ+Uf3m9Ci2S88OVFipQXBWInPmr2cUEoY=; b=AlfsYFZZiHLF5rCi
	wGlfXU/2kSJ+RvyjkPXizaFvhtZcX3+soS8b9X0bEtpg2jMZ1/KehuZctksYXhy4
	w9GsiK/7mhC3RvdEaF0j0rqYO4HWDnEm7ERb2G+36WyxrWGnY0dE6DebcM/ugyeB
	jcWDmG/3njb5u1KZ+SCDCpOEG3IFdeBR9BKxj0xw1uOjuPDUzMhV27+gBwH7VX28
	69lITh8sNIuvikehQB59dc4gYzSmSRJLtNZ1wxtF94p0evtDy02VaTKHFKw0NBeR
	WsIqoCGxiZowXFKI1j+zcpye3M52Ah7lbkDzsUaoqMPSQPZSH1LDw32zKDvstXIp
	qoiYLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4621k1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 12:37:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so43290785a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981428; x=1792586228; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rewnoAte/tJ+Uf3m9Ci2S88OVFipQXBWInPmr2cUEoY=;
        b=ZgzX6oVNrfJSJcQe081VXtrjn3epRKIFfxCaZ4is4NX9STW9jq2T5ccmCU2qEgzz6z
         7mdcTiG5EoSW16soxrDiXupqFtIOcEwVyhMn2h4xiRwQXmr/NuebNyapLPxJUqzXI2j6
         Bt2ibrupvehUDI6E0vhJlzNAjgppDO3Se1kMhOU7fsGzogYQ7Thb1v6KpeLRYVnAo/i5
         Nu7d6jwBAL4voptPS0ZQjSJiTn94o798I1izxX3cOC3NAam2wq1MRuvZC5m4BuoPMIwo
         +lPq5OovofF2aw0gO18Js7S0MFBCyGoUIRGOdX79LHbZBYwQsJFYdyxv28DQx+/xlU3g
         ilOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981428; x=1792586228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rewnoAte/tJ+Uf3m9Ci2S88OVFipQXBWInPmr2cUEoY=;
        b=UkRPVZlvyckaa/X6kDH5ZPslYW5GXnj6glFm7HsTjnbBYbKe1mTdBkJDYu2bzNkBpJ
         vw8HQH9P/VEHf2SKrfBx7nY574oLspotW3B4mQ5nMM1VhcL8JlJoazXd3aFtpIFpfhjh
         vjMvgNv/V89qxEmI4NmMFb0mNu4YOtNQICJKs1I9uDEUwAD7a2HnTiUDUwj7BKGZuRW8
         o/XqDJuJNWSAPeNIIFKggqnjhavxuJZpjW+LbGpoG0parK5cDNo2m72tCSG17n9JXzL7
         pBK29wDZPtZtUmMVC/2p05L7hg/r6woigwQ8Bp8g4bxC9S0O75zmKTjDmQZ7JbCHaN3/
         21YA==
X-Forwarded-Encrypted: i=1; AKwUvByxdg+RK7C1Z9grx8wqAjRAHZlriAQYdhgRbxqajIF10TyK6yIBRaiG8MSqPcuOmEiD6SbicCxUdwdwSA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKtTJVen37p9ucpR2rF9seThf4RPmNbGuAOtIwqmUkIIPcrhUUf
	okQflKOtsMqYcSicTBZudDewoWKlxSj5eidorXA+c33ANNiBv5J+cdT+4qlTUKoExR/uoXBJUQO
	CzK4KHsG4/BQ06vWzSBtWeDUmOmhVqoTd2Q+uR+GTCTx2jnyfQBCXhbWt7f7yqLJfKQ==
X-Gm-Gg: AYBFou2YKeSG9lBzMy4TE527qOmIxczMew1hWhHvOK/qe9FQiIAHH+3+AUdrrkyabHh
	zKiein3wHkLkG/j/DcZpgxj337n7pFUxyvdxFlNlFAvABAHlVbwssSJwr/nVjK//hAPGmrpaDNe
	Y/n2kEvO1+jncVgyFqUYXned4ZaxDcu3gEEpvet1+yXLCK5mGKa7jwfgOqpF+qATOT6W+ufYsD2
	8EyhC85AjS4/oL5QXJda8/Tfm95tkOfgXaWWsxjisI4lmMsYAlrzXnFa8hQLWPNj8R0IGPWKsk2
	LAqUJMczHoWl2F+FxCHvxjGAATR+tXnBFB3atdjDXjGJdyriE77o6NVcPZqn4/ya0xvfjKgH+ON
	IslSZXkj441KD0dXHn1VmTdjuplHc
X-Received: by 2002:a05:620a:44c4:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-93ebd282089mr2546074585a.59.1791981427440;
        Wed, 14 Oct 2026 05:37:07 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-93ebd282089mr2546067185a.59.1791981426847;
        Wed, 14 Oct 2026 05:37:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:36:40 +0200
Subject: [PATCH net-next v16 1/7] net: stmmac: dwmac4: don't program the
 1us tick counter without a CSR clock
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-qcom-sa8255p-emac-v16-1-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>
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
        Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2229;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2sBp7G5mc6uJL64UNxM6dPPb+46Qh7eHGxK9GvyQ9M8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3dl4m+qpuql2x9Vuhi+JubZ+193cRWj0/Vsd
 rhj3qvfaZWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93ZQAKCRAFnS7L/zaE
 wxR0D/wIXdjVmoAyOQeH7rB9q9+tq0uz6+cpOevgEQPFym6rHDfDydYuv+Yx0TwmDKaVxqZEqA9
 jkqxQdxY0HzAlkxLaSYJL9dSajCUAOaQizKey3sUqyZ7gTnQDdYKJIM0saQvyScb+N+VM1CDA8k
 nCOaR4A1ZkyhRe1eaRwXPwqDRV23Y3dscokhHny/y2qlzPrjHUcocoY9Pxz2mKFyd/1dPshepuB
 ALhQTHp2qyGnx/sbNa40NyMyYIxUSOqLNpg7MPPZ/eHcKYgkGdFKBuvD2nc/aTbpFGHG5jyxLP7
 frCLl5Xa+7k1cT8qg4UPQXAjT5M9VZGOy0QgPZLiQMJdI7DjYAqQCNwAjEPF6Bdmm3tpaZetRLC
 XgnGVlbnhs/uZHx/2whbV9/5bXedTCMQikDfotazCFTGCdTIo+U5ShDYDkAFqkFxFAMdt1Q77RU
 FrTnQ/+A4OMvVXId7/C5hRBwuLsxeyoEqwLXi7guVcuc++nVFS9OqFGBV0mCz2L/Hv3+M0qQ3SK
 5kDrgaYLzvgplw4JYzqeNct7wnTR6M+0AxpMQbSCzDQKiIXYKo22NyVVXf8wZNCzpQ3j8Wix6vp
 14Gpzo8HiHXuQp4PsyR+VZQ3zaYmSmsJGP8CN32EV6T2d1AeDhgTNRKD1oP6kJRByraeJ6rRevV
 024vzSVRofGO1kA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: kUuiQgLShDW1DQDhhlWNtjdSZ2bxyP6a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX1qMk6rv+K4MM
 O3rsw/KCuGjPE0mxjDJV3WXHVEBTbhWfsjSEruPuL5Ps8z202Ylg1nr9zjyLxlAOWS/5BCG+Z3b
 wXVxR6ugi46gHRZgWT2qXlEdFYFP8Q3mAVC3NYWwaLfr9koh/nUqihOoOng9N7kFdep5Dw5WKsk
 GWhue80Lc7zZtQc9wYEAHuyvSc6ZcQkqxCj6HPsBDa5F27Gz5sVYkBGO1FVk6PntSvoFZYbz9s3
 qJE2R37BsAievJ10w0tbOkTtEUaKIAtU6Japti11mM0JCdNFxFmvLUh4AZJ2tD+448os7ZKUxPQ
 ACw/b90gSSe30M0RilI+sp5s/SekCLDx0qCuRrCWgOiqCKLJNldQx7JpLcPAehbZlZ8ZDr7+JYE
 aInEMGFTJihkz7mQhfrRJbQKN45SdKh8p6hXRqtjBVtXZiaUMMGjDzz/o7iv/inuwReg+MIIaVI
 OFHb8UxA46pLnvlBG4g==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf7774 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Xm6EMxWvXKbCXn_Kg3kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX2jQFOqKD3ZW3
 T+JDfYw09oXaitJq/tKKVzdV/t6GvxUXlMS+CN0irl7xRdExSzl5usVi0W0qEkkfTWDyMudsh2u
 J0jpBTxyqEdGDiDeNAkrNL3DDZaIxHE=
X-Proofpoint-GUID: kUuiQgLShDW1DQDhhlWNtjdSZ2bxyP6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140050

dwmac4_core_init() derives the TIC counter value from the rate of the CSR
clock. If no such clock is available (for instance because clocks are
managed by firmware and not described in DT), the rate is 0 and
(0 / 1000000) - 1 underflows to 0xffffffff, which is then written
to the register and can break the LPI timers that count in microseconds.

Leave the register at its reset value when the CSR clock rate is
unknown. The RX watchdog conversion helpers already cope with a missing
clock by falling back to clk_ref_rate or returning 0, so nothing else
needs to change.

This is first hit with the Qualcomm sa8255p ethernet, whose DT has no
clocks.

Fixes: 68f5d3dc2808 ("net: stmmac: qcom-ethqos: add support for sa8255p")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/179052656185.2160803.1751830002645522416@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index cd6c5d6f42b5445918f277a2b4168d8f473bfca1..259e2ebed8c14dfdb9318da9be03c5f1dc9b1284 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -48,9 +48,14 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 	value = readl(ioaddr + GMAC_CONFIG);
 	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONFIG);
 
-	/* Configure LPI 1us counter to number of CSR clock ticks in 1us - 1 */
+	/* Configure LPI 1us counter to number of CSR clock ticks in 1us - 1.
+	 * Platforms with firmware-managed clocks may not expose the CSR clock
+	 * to linux, in which case there's no meaningful value to program.
+	 */
 	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
-	writel((clk_rate / 1000000) - 1, ioaddr + GMAC4_MAC_ONEUS_TIC_COUNTER);
+	if (clk_rate >= 1000000)
+		writel((clk_rate / 1000000) - 1,
+		       ioaddr + GMAC4_MAC_ONEUS_TIC_COUNTER);
 
 	/* Enable GMAC interrupts */
 	writel(GMAC_INT_DEFAULT_ENABLE, ioaddr + GMAC_INT_EN);

-- 
2.47.3

