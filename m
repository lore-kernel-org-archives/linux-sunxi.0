Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC794307B5
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948893; cv=none; b=M/XgJY+GdlLfGMu/lmAytY9MpdClxQWlApSTBjd0YjLGhdc0hpigqZKJlJZqZMVv00ITWWSTrfk3CkPwN0QWLGHiJUSKoO+F1Ftwl1BF49i9i35r/Gg16k6HKJaqQOusfDshx92p/LmWFPS7+L+QnhZsg0XJCy+/DMRmwCRZ7EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948893; c=relaxed/simple;
	bh=NA70xnk/UNTcZEimYYDwGN/0JGIaZCh/H15cO1NUAsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iDCAjtK1sGaAgxCRmEg43w5x7XNzsu5DGQvEjs/ourAxarKPU5gg7F5muRvaNlIr4SFRaBd6E3nkjCMO89PoFqqlQ/2aek3El2cMW07Le0ltmxFfYSe4JOa8j9l4pz++zFsbL4GcaZsBP/k+qjdnPCkmSAmCH5zi/dRF54pF1So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuHB2Lnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DpZxEh+l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LuHB2Lnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DpZxEh+l"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvix1494374
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=; b=LuHB2LndYAhekP/j
	qqI6yQ1IIvHllU+v/KZAuCsz8E37eSBJ/bOgI8R9w1HloRsQVR/lusbYFphVuRQM
	ncaLznaaOZ+jeHtIqKrsrzK5JCqgTsSRyhCO9cXFZgwr9o6k33sw7mmJQNrb8F7R
	EC4ky7JImgq3CLSrmd3sZh6HesP8U9IIKPPhXIVLimSmDCbIAaSlKexL3PW2Gt1C
	hNXMwOBmK4v7ZEV+ILuRuT4iStzoti5NGJ4uK+4650V8aLn42qktRa1uUbwOZImt
	XTpbLooToXh5GCa7hlWSVWrwLEgxHPy75kUR40ZOGYkjWYalZ4Im/4G8MWbtq+ES
	FVA8Ng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2qh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 13:21:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c2af04aeeso46251971cf.0
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jul 2026 06:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948889; x=1784553689; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
        b=DpZxEh+lyOgo809Twj6XE7BPfdnJer7xLd3QdOVkjixeoV6b72zR+tItoeAgXIgZPw
         TW953dA7RPNLxoAv/JBix85tsKOa3uHZUh5atsNMQq7A2XMaCFV6VPYzpzDAFYeyM7tI
         J9SRVkpXy2lLN11DaPcBvqvtpiHKYVUJq001orfMzEpJkjtux0AzmEawMZqZQl3UOnu1
         IjP7ouwMd5JvwKgAmn+poe3Smg9djnJam4KrqjM6e94Qmzu5z9KVbgp78tEdfBeWutIX
         92n6DWkXvLdxbiu8L2XYkWqkuudkHFBns2cNgETesjxmBkLvEb3gNu7IVa0HKa6WaNdR
         D48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948889; x=1784553689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
        b=DmHazCNTf/1ymCw7UdhPWUU/ZUt9x/pTAmoTQjSGBO8YZvvPfQAtzDWdivsjG8ltIt
         4yEeiNXI73x0TqyGsvHRQjPHTRm/SNSQR/+2+lJvg1DRzvsmhmooZEbeyxJRmj9vDlE8
         o5V/0RfzZLkD/4YoVVMTCB3DBs5Kqge7dkb9YvNwdhyYCBaXBDHEe1Xw+Mmf9XYABwY9
         1+L+jPdsNaEDDdRa8O3V11koXTULJNsHfJ8RY7iTvmSSuCKagdlfNzkudLbAxjm5T8eX
         kz/znitQp/tIt0Lfe6+QNR9HXttcffDxCj7HJr5lOnv8JvrLPLh8aHEf30xphEt+0ftI
         qOOA==
X-Forwarded-Encrypted: i=1; AHgh+RqAm3awm9B4QjB0KLEYzxdfbbH2h5p3tqa0O9N4XsPow6WnRerGMMmGgfhnQzLmaherd01ru89mgO6/LQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsDdR1u4YitXEJqHxp67hZZK3rBLRJVy4vzmPNBuLHLJfcIWg/
	IzzZjHhGk8YK475i8DRhtkJulX5lX3tBNIUkp3qq3ouvMhHu9yqNKp2nicuWplgBmMvDAY67xRL
	GoW8CnJeB7eQeCPF/TigxOB3SzoMYpdlVicniDARGC2/6RZN4JVqNSSrjBNri4NbCFA==
X-Gm-Gg: AfdE7cmk5mlc7mqZYR/QTCTYhAi4mUWJZNddh7KfeiEYX6xKcyhtuAOgDu5NeMoGk6D
	pPEm40swcdgijgJQifHdUp91nm44cBzIcZSfUJmC+5boUAqNb1K6mgqAoW/oc2kkN2SzwjGVI+5
	7SMWa1L7IldRFPkmRmnJJ2J3Wvv7G/aDm9S7lrizZH5CT7FxEtsIdpDu+y3075kdQdKZbVuyJFy
	QgtzXt/Au6134YkO9FnVx+JcOiF19payHmSRR0KG7YwjD9bm689tuSoCVbKKvSx78NJCXu0zPNw
	m2yQYv2HHr6k35dzqfih2SROvHUTS0NBKDUdLjJpmBSF+ObBqoxdDK+pDvFONHhREZnJMSUv+3h
	dvvX1jLVjeBZ8bh/SFBGamoT032nkLpMkvgIbuC7x
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-51caa0bb46fmr141764411cf.19.1783948889507;
        Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-51caa0bb46fmr141763741cf.19.1783948889084;
        Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:35 +0200
Subject: [PATCH net-next v13 06/10] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NA70xnk/UNTcZEimYYDwGN/0JGIaZCh/H15cO1NUAsU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY5/+vs2/qf6ixq4/oND2Zx6UG66WUho2k1N
 BESE3IZZ9yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOQAKCRAFnS7L/zaE
 w287D/9ZdNDg6JWXdurG/2dzivQeLaVo/7EtsCSyerxef3uIlCFZXmkGtM9e5iwQwgajmvVUCn3
 JTuk3xBjg+Z1rKC1kB/R3MjBD8PhEW+E+xtyv0ZfJ0dLazOINtSW3GAlW8X8jCLTZTcdvwEFdzY
 KIC9IY/wiiZ8QSRR+AhHjb5oF9P7v6JqeoqmJjeOZtJfRdnWMv3WpoIwpkP7GEtoICT4ADSsMVw
 dZ7DKd/klrXJmNHOgxtCE3Sa/tiWHW37EyzPjzFDFIJcWktXMWkFucKsCab66xmA8dxOPc8oZCa
 J1xm+gim/rKwzek+BM1739EJ5i9AauUDha1WT5QrTL9P5+3SvZ4zNLwhomOEKkLoZghbp6Pbepc
 XYhKBRQQM4vu1cZJi7F5bb9E4ACR+buWVjXcCeDZANXlHHtlPmOHekz+wJ3Ua1YStpgBkEAzKk2
 dFiek2jbRDX7KFBUTDPBTBIRkqzc+Y7sXl/CwPYbMw8Afeddl8kY4dpRvzG29iFvQmjSVwHcAbe
 Lgkz6aIJy20PcDerwJKefrtBj6Uri6D3O1qhz/Z+7KvVbnD2CZq6zoC940lmSPJUt47jeAh1VDn
 Uu5E/R4SosFE1DGpvef7KgKjGkKrEm7yAWoep/YaYStb2OwTec/khkzbk+W6+0EYIeUbC+syBv2
 3gGFk01Yg1NAiWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: WOVHcq6vOXiGhHa3zhJrecGr28BUbPGJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX8w1wQCrFSeUG
 r5cjiibENXHT4C2IEAcxJEyEkkLqSFb41s1xUVzD37o+xAQIk0WvEP4jwrON2O27aikiEmHkJXf
 cFsPTY4ktnthggHYAZAei20/tP7F3VkOtsCT6ENbopXAMKamZ57tVv8k0PwgfHklRKqVtSTwTUH
 I1+W87XNw45nNcbsCO+NwcDdRTn0qadfwngwYlAPqzsZZr8Bd7+BhlvKTPCYPpd2aAc0ptz7fz6
 +rP7IH/JEyXnkjr4+D7Dq7esH5+ob/9cx7hplQ5CrwF/hvGkvsijAx1RiLvRb1ci7QgArjNXVOO
 HxmCFqrIbBhqmsb8Vd8iCsXjmwFtpoVssZeVL5gCZzavxljgew42pLIyUfUYGITHP1zITNq8jkc
 3EWOwtsQaOj0/AMn1rKg4ZydJa1NGG3ibXA1Mk0Y+TpD+joXTK8cQ1lYvOGO+cPQ2PT2keccLCO
 CeirLyC++WvP2AN1zig==
X-Proofpoint-GUID: WOVHcq6vOXiGhHa3zhJrecGr28BUbPGJ
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54e65a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=fYsbkC7JaC8eFfGKQicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXw3cE2laG3Zfx
 2HxNwDDOuDYqqDJNEjV+sQPr9eNjcZ94/5FUvDuijR+AUvdzmQ4w8GHLytueRlKyOOH6AczXX2b
 okl9HymyjqPxjbdJd3Dr9va5gg07qsQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130139

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
index 47b70b5e706f221c01f1c0ae3b1acafae6641165..9d19203ae4bd7dc17aca068f5eb88ff830e4e906 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -632,6 +632,12 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	struct qcom_ethqos *ethqos = priv;
 	int ret = 0;
 
+	/* The interface mode is only known once phylink has resolved it and
+	 * may change at runtime, so keep it in sync for later
+	 * serdes_powerup()/serdes_powerdown() calls.
+	 */
+	ethqos->phy_mode = interface;
+
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||

-- 
2.47.3

