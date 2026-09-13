Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307A03EB11C
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302830; cv=none; b=mEmvrlVTYYhNWGkZMizc54B070386mzFO8q+Yh8+9Lo3BjkGxUcNo+++0JsEpgcIHOP4RRrAhNdDfS38YVR5ktCaOv48jFpBZAn7WaCZW31cUPRlmzsvDzzFp6RHsUN9xlRHghb9tuMMDciVKCIB2nm3QvM/dHWUMpWxSrknFOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302830; c=relaxed/simple;
	bh=t/ic0tf39N6W1RFgeQXjtBLIbwB325uktvFQO+N0nJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q01tAaxsl5RnH6PwOzO3b1G4SaxnFCiG7669xKAOeVKff7A8oc+nVLmJZszoViAP4Mymre9RGrgPlF7nTXJExwT/Q2XNG4Q0EmvXSSkl65ZYrxxqDxQXFxc3Qgu5woLgEBa3v3WqptR2l10TDE1dYqXH1+6RoJ/9FMM7XLl3aew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7n0FhAD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K07BOMxw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7n0FhAD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K07BOMxw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAUk0Q1875491
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 12:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=f7HmkIpzv0+5Vv76flnhc4C5zbL28Bg/Lfl
	KqWGDWGA=; b=b7n0FhADcI+IpF5mfr1PX2tBD4EfBpKtmPseVPxYWM2OSjmeWWo
	fg4+eYEcJsIC5rfIYitoEL864RL2UJ3sm3p8/lp6UH7Q8GXKg8rsJpUeQrx3on8q
	2I72efIUvNGgilEalnAlqAweqoQgwoYECompVaI7sYTiVc3sg8vX7N9WRoRVnVQ5
	H2lsg5sST8/gFh6YnK8auD3/7r12VpAwF25R5nykNFlpOKtgpsRDuuFhCFxEFz2F
	B4jR7jrz/PrVQWQ5XUFsJHKKmu53wvfzo5sv27Yuc8dgzC2pzzk8wJ+O9lfSwmd2
	zqQBFdn+UiHaKhAXSL597Y47ZUGZ8vSjxbg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dk8m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 12:33:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so488454585a.1
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302826; x=1789907626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7HmkIpzv0+5Vv76flnhc4C5zbL28Bg/LflKqWGDWGA=;
        b=K07BOMxwJIdw+djMdvgKUP9BR5vnN/D/PiUSu3pDKoFJeEqtTqMXEGRKwSyG3HCi+2
         7Dke6FpfS8X/gi6VWWpBkBW8b/uz5DdtjcqS0nVC68kzF7BbrBKluocrW/xlu0qgRcT9
         LsEamLKVeQ3Y+Ki2MgV7DXrYHo2ujxrEf8jbCGEmryGY1+gdwmi7Sf5YHkV4VHStbZ0s
         cOXKXv0h9m2oJfnSc1+rdbb/obAon2SADo6HP8GFowRzDFt8xdKAqt+fmAZBoUuMMgqw
         XJ4cnOXPeYT9dVEwu3orJsV5mzW8QMfJll4buxah7eOvQvYXr3YEdK9vU3yEG6VDWa7N
         WseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302826; x=1789907626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7HmkIpzv0+5Vv76flnhc4C5zbL28Bg/LflKqWGDWGA=;
        b=VGuhYxWoUeSJmz24+nCZFcpjBalwH4DzL/strBcrJcUBm4UR09ZYyWnme1DDw4CagS
         V6+drFftJb4tPoN4Wxa8spA5ZgT6IgIzcIsOvj+IJWqg8zBsKef8l5q+hCK4x8lTwW/5
         n16d4ETlIpyZRtc6rZOGjTng6JXWmCqITeaMuSP2CtXmF7U4bUNkIzp9XwUkw2nzBK7c
         sF+1lNbrIrBIqCzkzVGZGY5K4vp+o7asw24YJYikBErWjpFNKZJBqqAVVIaPvPWArfRL
         9HUDENTjEl8Bt7jwBWf8qy33TIRK3COCoG32QF61LsrHmhTyrsn6s/ryZobCEPyOz6J9
         ad9w==
X-Forwarded-Encrypted: i=1; AKwUvBxuCo/VP5lr0o7mGr1x6uyjR47X3sGsZgPDD0C/vkGJRoiJYzjcKvsE4mSd5GU6SWSCia84lQMT1Ifrfw==@lists.linux.dev
X-Gm-Message-State: AFuF++mHXtgcQl7iqNUkX/mdBzDt/NWcHSuKyqaJYE+thLWaH3+NgAAG
	AAa+bdR9UBawjBBNGu6+eVfOboKD0Ku9mIZF6QcNVy26aN1e60RU9x+8SQQHceg13l7eJgWkp/u
	0QpAuerjo6zDncBNi37P23s7Hd6HUzHZOLFmV/NSUkqlisstIzSZJep+O7nMOjV+1VA==
X-Gm-Gg: AYBFou0ufAKVFY/G12fo9E1v1Gjju+JQamXI14fMww0e78hyUFgX5cclmAiDR2FbvLo
	Zphi6ThkVxeFLdURfAW2xI6emwT2giMUZLoDf6K6z4io7/H/Clq/Vk6XVeXwdpciQBj3/Bkb8Dd
	XqQG2DmMbdUrVREvTu//LUNzcJAGp6hezS50gdkpGAp7e3TilP1onLEMq96lFM8OBiU3k7dN0hF
	/5Bq+9m8/MQmYSTUnbETgYgAzE7xeRHWIdtyZrEcIoPu8h/O+8bTKFmQVJVXQBvPITW8deCETPF
	7SGNu3xHScyufXoGTVJkc/WiMLAQf17fISiHK0wZMvPsj/PGQ0TK+Ja3GQEkwkbFd/I8zKgTa0+
	KOojKwU0z+7V0xtQ=
X-Received: by 2002:a05:620a:2608:b0:939:72cb:bae9 with SMTP id af79cd13be357-93a1875c70dmr190604285a.32.1789302821086;
        Sun, 13 Sep 2026 05:33:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2608:b0:939:72cb:bae9 with SMTP id af79cd13be357-93a1875c70dmr190598085a.32.1789302820486;
        Sun, 13 Sep 2026 05:33:40 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e69f02c92sm131403175e9.2.2026.09.13.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:33:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: display: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:33:32 +0200
Message-ID: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22457; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=t/ic0tf39N6W1RFgeQXjtBLIbwB325uktvFQO+N0nJI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppgbdMNBpo0AnVIy4ur2YLrkt4SDEMjNBcmQQ
 tLi/y/gxliJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaYGwAKCRDBN2bmhouD
 12C3D/9CPU7qgE0K/4X7lvjxa5vavXw/cLVgs1jasrbMM8VKmuC+xgEGCbNOfkfXTR2lOdzuqlz
 vuuWpOzbCUbXSHYM1+ZEP4SFXzxOjtW4QCjuuH7lBnFBUrI1Lq12YpJDhoORYdachYihnCT2h1Q
 6kEnDTWiFbFNdISfNE8riq0iDN0YzBIR4ng6bRsZWhOKZPUKXjm4m+R9TlY/p/QJ4EAH5ZgspSi
 Z1ZQZFyV/bMEiVauVUOIPCIt5qhr3UhwOXf4T90qUvTjU5ANGwyNgSra7SK4vKKUJMKmOoJkft9
 gRQBp/KZhOaWd+XD4Tsw+/JpuvTSOges34QKAgFZJPkOxRqpVQ79JtJ5AcaA8nr/m4KLeS04ASJ
 6RRlNteHb7dLeWoVVJX+A4MwNZ7wbHf7CnJpNVAD3xod+k9I3ElYuLn/Rx3uYqBmE9TtWIiEAoU
 TucsUHnpKgwHPBiHFkVw2Va75luCrvITE8a8l5QmRLMpuTLCfzIWD28ZBpUWBt14Ro48lxBNX7X
 h5QXliaQGAacI4SGSzsCqL7SboSgK86r4dhJaoNtv2etdf2VLbzAE8bc21XAVdOCETsHKzaQBjg
 4nbgYRUsnxwMEO1BcpgQHGtcFnlKXIIN0yz8MVVt/eqLvR1LNgRPZwP/vSwtxmjdoXrz9HiZN2z E6iSMWa3Oi3k2HQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX/fAbcqLmltdr
 gfXNlSv6m8KFWc8dSK6SFKo4btrf6Rt7yyryhHvo5yf2O3j2CyHNcE5KDAcvTFGHxg8dUNZfh5s
 455R7rmDeTP9X1cmaGypCgYEOBJkD+NN0QEDzwKjA4XWlVKeQoZ8/Gq1+PMpaLCpxP6PIXoVeCu
 IrSKLzk2CfiBwvqbLCq85ievF22BhjwqxUQINYotBRKzVe39FB/DHMEW3j5zp2wGg64QLgC+iPi
 MzNLQDftxaEuINQaDtegf/pEZkHfQngiq6DkxnxdAizYs1etWW0GBq+uOGEm7huJIw225LJGF53
 1UYmIF7igi8c6fpm7vQ4hvw6vINQoiYoRGxanyK/pBf+NO8kn0PTCJDBgov0KD64nZma08dSSbq
 eh3z0NFi2rs9DzjETKiGemLOn9ePW1FrvIuarPYb1kwMdA+nOU3TTKkmGwbX0+YBUcGyTy3p1km
 EwXxAcK/8KLTKRlznjA==
X-Proofpoint-ORIG-GUID: sygPptE4q-OwNp4mJTXgx512xmJ-8hCk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX/VoB8dnRrxmB
 J1Q6aX6Fex8uM5LMbQDHFl9MWfybVAP6+GKJT0uE07tTTE4yXLOWYkvftZJgHY3orXCKk+srD7p
 lajHSWv71SfeO3FFhRuW7UV/L7NUx+o=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa6982a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0YAVxFya4kk6LBs_cYMA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: sygPptE4q-OwNp4mJTXgx512xmJ-8hCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 10 +--
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml   |  4 +-
 .../display/bridge/lontium,lt8912b.yaml       |  8 +-
 .../megachips,stdp2690-ge-b850v3-fw.yaml      |  2 +-
 .../bindings/display/bridge/nxp,tda998x.yaml  |  2 +-
 .../display/bridge/toshiba,tc358764.yaml      |  2 +-
 .../display/bridge/toshiba,tc358775.yaml      | 12 +--
 .../bindings/display/himax,hx8357.yaml        |  2 +-
 .../bindings/display/imx/fsl,imx-lcdc.yaml    |  2 +-
 .../bindings/display/imx/fsl,imx6q-ldb.yaml   | 54 +++++------
 .../display/mediatek/mediatek,ethdr.yaml      | 90 +++++++++----------
 .../display/mediatek/mediatek,hdmi.yaml       | 24 ++---
 .../display/panel/samsung,ams495qa01.yaml     |  2 +-
 .../bindings/display/sitronix,st7567.yaml     |  4 +-
 .../bindings/display/st,stm32-dsi.yaml        | 46 +++++-----
 .../bindings/display/st,stm32-ltdc.yaml       |  6 +-
 .../bindings/display/st,stm32mp25-lvds.yaml   |  4 +-
 17 files changed, 137 insertions(+), 137 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index c731fbdc2fe0..7b11cb5e5f6d 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -119,11 +119,11 @@ examples:
         #size-cells = <0>;
 
         panel@0 {
-                compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
-                reg = <0>;
-                power-supply = <&reg_display>;
-                reset-gpios = <&r_pio 0 5 1>; /* PL05 */
-                backlight = <&pwm_bl>;
+            compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
+            reg = <0>;
+            power-supply = <&reg_display>;
+            reset-gpios = <&r_pio 0 5 1>; /* PL05 */
+            backlight = <&pwm_bl>;
         };
 
         port {
diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
index e4e77fad05f1..af9ad07ef08b 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
@@ -84,8 +84,8 @@ examples:
                 };
 
                 mipi_lvds_0_pxl2dpi_dc_pixel_link1: endpoint@1 {
-                     reg = <1>;
-                     remote-endpoint = <&dc_pixel_link1_mipi_lvds_0_pxl2dpi>;
+                    reg = <1>;
+                    remote-endpoint = <&dc_pixel_link1_mipi_lvds_0_pxl2dpi>;
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
index 988351f3cd01..2d2dc9c046fb 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
@@ -107,11 +107,11 @@ examples:
           };
 
           port@1 {
-              reg = <1>;
+            reg = <1>;
 
-              endpoint {
-                  remote-endpoint = <&hdmi_in>;
-              };
+            endpoint {
+              remote-endpoint = <&hdmi_in>;
+            };
           };
         };
       };
diff --git a/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml b/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
index dfa6ff6f115e..74539132bf94 100644
--- a/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
@@ -104,7 +104,7 @@ examples:
                     endpoint {
                         remote-endpoint = <&stdp2690_in>;
                     };
-               };
+                };
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
index 1205c8e9de32..0ad55ff8e330 100644
--- a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
@@ -106,7 +106,7 @@ examples:
             video-ports = <0x230145>;
 
             #sound-dai-cells = <1>;
-                         /* DAI-format / AP_ENA reg value */
+            /* DAI-format / AP_ENA reg value */
             audio-ports = <TDA998x_SPDIF 0x04>,
                           <TDA998x_I2S 0x03>;
 
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
index 866607400514..23c5b254426b 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
@@ -81,7 +81,7 @@ examples:
                 port@1 {
                     reg = <1>;
                     lvds_ep: endpoint {
-                      remote-endpoint = <&panel_ep>;
+                        remote-endpoint = <&panel_ep>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
index 258dd9cfd770..8a0d8a66a9b0 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
@@ -161,9 +161,9 @@ examples:
                 dsi0_out: endpoint {
                     remote-endpoint = <&d2l_in_test>;
                 };
-             };
-         };
-     };
+            };
+        };
+    };
 
   - |
     /* For dual-link LVDS display panel */
@@ -227,7 +227,7 @@ examples:
                 dsi0_out_dual: endpoint {
                     remote-endpoint = <&d2l_in_dual>;
                 };
-             };
-         };
-     };
+            };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/display/himax,hx8357.yaml b/Documentation/devicetree/bindings/display/himax,hx8357.yaml
index 34c3b89bf003..bafcd4418d5a 100644
--- a/Documentation/devicetree/bindings/display/himax,hx8357.yaml
+++ b/Documentation/devicetree/bindings/display/himax,hx8357.yaml
@@ -74,5 +74,5 @@ examples:
             dc-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
             rotation = <90>;
             backlight = <&backlight>;
-       };
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
index c2b29622bceb..84610b5690c4 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
@@ -110,7 +110,7 @@ examples:
 
         port {
             parallel_out: endpoint {
-              remote-endpoint = <&panel_in>;
+                remote-endpoint = <&panel_in>;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
index 1646f41d8f72..cee1b504adf9 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
@@ -150,44 +150,44 @@ examples:
 
         /* Using an of-graph endpoint link to connect the panel */
         lvds-channel@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
                 reg = <0>;
-                #address-cells = <1>;
-                #size-cells = <0>;
 
-                port@0 {
-                    reg = <0>;
-
-                    endpoint {
-                        remote-endpoint = <&ipu_di0_lvds0>;
-                    };
+                endpoint {
+                    remote-endpoint = <&ipu_di0_lvds0>;
                 };
+            };
 
-                port@2 {
-                    reg = <2>;
+            port@2 {
+                reg = <2>;
 
-                    endpoint {
-                        remote-endpoint = <&panel_in>;
-                    };
-               };
+                endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
         };
 
         /* Using display-timings and fsl,data-mapping/width instead */
         lvds-channel@1 {
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            fsl,data-mapping = "spwg";
+            fsl,data-width = <24>;
+
+            display-timings {/* ... */
+            };
+
+            port@1 {
                 reg = <1>;
-                #address-cells = <1>;
-                #size-cells = <0>;
-                fsl,data-mapping = "spwg";
-                fsl,data-width = <24>;
 
-                display-timings {/* ... */
-                };
-
-                port@1 {
-                     reg = <1>;
-
-                     endpoint {
-                         remote-endpoint = <&ipu_di1_lvds1>;
-                     };
+                endpoint {
+                    remote-endpoint = <&ipu_di1_lvds1>;
                 };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
index 98db47894eeb..6c0edbae96d7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -158,51 +158,51 @@ examples:
         #size-cells = <2>;
 
         hdr-engine@1c114000 {
-                compatible = "mediatek,mt8195-disp-ethdr";
-                reg = <0 0x1c114000 0 0x1000>,
-                      <0 0x1c115000 0 0x1000>,
-                      <0 0x1c117000 0 0x1000>,
-                      <0 0x1c119000 0 0x1000>,
-                      <0 0x1c11a000 0 0x1000>,
-                      <0 0x1c11b000 0 0x1000>,
-                      <0 0x1c11c000 0 0x1000>;
-                reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
-                            "vdo_be", "adl_ds";
-                mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
-                                          <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
-                                          <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
-                                          <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
-                                          <&gce0 SUBSYS_1c11XXXX 0xa000 0x1000>,
-                                          <&gce0 SUBSYS_1c11XXXX 0xb000 0x1000>,
-                                          <&gce0 SUBSYS_1c11XXXX 0xc000 0x1000>;
-                clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
-                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
-                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
-                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
-                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
-                         <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
-                         <&vdosys1 CLK_VDO1_26M_SLOW>,
-                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
-                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
-                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
-                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
-                         <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
-                         <&topckgen CLK_TOP_ETHDR>;
-                clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
-                              "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
-                              "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
-                              "ethdr_top";
-                power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
-                iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
-                         <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
-                interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
-                resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
-                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
-                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
-                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
-                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
-                reset-names = "vdo_fe0_async", "vdo_fe1_async", "gfx_fe0_async",
-                              "gfx_fe1_async", "vdo_be_async";
+            compatible = "mediatek,mt8195-disp-ethdr";
+            reg = <0 0x1c114000 0 0x1000>,
+                  <0 0x1c115000 0 0x1000>,
+                  <0 0x1c117000 0 0x1000>,
+                  <0 0x1c119000 0 0x1000>,
+                  <0 0x1c11a000 0 0x1000>,
+                  <0 0x1c11b000 0 0x1000>,
+                  <0 0x1c11c000 0 0x1000>;
+            reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+                        "vdo_be", "adl_ds";
+            mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0xa000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0xb000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0xc000 0x1000>;
+            clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
+                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
+                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
+                     <&vdosys1 CLK_VDO1_26M_SLOW>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
+                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
+                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
+                     <&topckgen CLK_TOP_ETHDR>;
+            clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+                          "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
+                          "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
+                          "ethdr_top";
+            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+            iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
+                     <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
+            interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
+            resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
+                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
+                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
+                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
+                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
+            reset-names = "vdo_fe0_async", "vdo_fe1_async", "gfx_fe0_async",
+                          "gfx_fe1_async", "vdo_be_async";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
index b90b6d18a828..9af876329e6a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -112,24 +112,24 @@ examples:
         mediatek,syscon-hdmi = <&mmsys 0x900>;
 
         ports {
-          #address-cells = <1>;
-          #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-          port@0 {
-            reg = <0>;
+            port@0 {
+                reg = <0>;
 
-            hdmi0_in: endpoint {
-              remote-endpoint = <&dpi0_out>;
+                hdmi0_in: endpoint {
+                    remote-endpoint = <&dpi0_out>;
+                };
             };
-          };
 
-          port@1 {
-            reg = <1>;
+            port@1 {
+                reg = <1>;
 
-            hdmi0_out: endpoint {
-              remote-endpoint = <&hdmi_con_in>;
+                hdmi0_out: endpoint {
+                    remote-endpoint = <&hdmi_con_in>;
+                };
             };
-          };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
index e081c84a932b..6db87f7d70d8 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
@@ -51,7 +51,7 @@ examples:
 
             port {
                 mipi_in_panel: endpoint {
-                  remote-endpoint = <&mipi_out_panel>;
+                    remote-endpoint = <&mipi_out_panel>;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/display/sitronix,st7567.yaml b/Documentation/devicetree/bindings/display/sitronix,st7567.yaml
index 2eb6d00b5a25..c007718541f6 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7567.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7567.yaml
@@ -64,5 +64,5 @@ examples:
                 vfront-porch = <0>;
                 vsync-len = <0>;
             };
-          };
-     };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
index 53560052aaf0..1b5f4317dab2 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
@@ -101,35 +101,35 @@ examples:
         #size-cells = <0>;
 
         ports {
-              #address-cells = <1>;
-              #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-              port@0 {
-                    reg = <0>;
-                    dsi_in: endpoint {
-                        remote-endpoint = <&ltdc_ep1_out>;
-                    };
-              };
+            port@0 {
+                reg = <0>;
+                dsi_in: endpoint {
+                    remote-endpoint = <&ltdc_ep1_out>;
+                };
+            };
 
-              port@1 {
-                    reg = <1>;
-                    dsi_out: endpoint {
-                        remote-endpoint = <&panel_in>;
-                    };
-              };
+            port@1 {
+                reg = <1>;
+                dsi_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                };
+            };
         };
 
         panel@0 {
-              compatible = "orisetech,otm8009a";
-              reg = <0>;
-              reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
-              power-supply = <&v3v3>;
+            compatible = "orisetech,otm8009a";
+            reg = <0>;
+            reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
+            power-supply = <&v3v3>;
 
-              port {
-                    panel_in: endpoint {
-                        remote-endpoint = <&dsi_out>;
-                    };
-              };
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
index 77058a5ccf68..81c7772de25b 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
@@ -119,9 +119,9 @@ examples:
         resets = <&rcc LTDC_R>;
 
         port {
-             ltdc_out_dsi: endpoint {
-                     remote-endpoint = <&dsi_in>;
-             };
+            ltdc_out_dsi: endpoint {
+                remote-endpoint = <&dsi_in>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
index 14e042156179..f8e43c5a656a 100644
--- a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
@@ -114,14 +114,14 @@ examples:
             port@0 {
                 reg = <0>;
                 lvds_in: endpoint {
-                   remote-endpoint = <&ltdc_ep1_out>;
+                    remote-endpoint = <&ltdc_ep1_out>;
                 };
             };
 
             port@1 {
                 reg = <1>;
                 lvds_out0: endpoint {
-                   remote-endpoint = <&lvds_panel_in>;
+                    remote-endpoint = <&lvds_panel_in>;
                 };
             };
         };
-- 
2.53.0

