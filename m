Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB491F4C89
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513407; cv=none; b=r3uie8Ypi2PW4ShH/zzY7aw3OxQvlvD1P/mQyI1GQvELZFwXwJwoAy8K93HKROi+aGAxppzWzjBs1+JgGgIXTtrgdgv7STckanfK1L5GUW+bhAoCXpdQmb7szFTu3ARqsZx75lN0WU8xclTyEw97ha37CwjmSFqMkmfV8ooj8M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513407; c=relaxed/simple;
	bh=VIOVx9ZFQcN8aP7U3+DXeUs0Ba2NJyVyJ0ONqbKAcgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/nyF9m9O0zaWPmcei3PLTz0lpfN4UwSOH837/+mH3m8936kFfTCnqyhc7q2go2toRPYPVhrWVWa1OfTxKGYyGgtpKWxW3RxQXRg7XCT8FK+MxsSggGhVPTwhPnHNSCXgLZlL6qGWmpl9YIEe79v/y7Ja/8CbpueJg3c03guIpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+5mmYj+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+5mmYj+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U08ifs012964
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMGCzwi7iMqpBSIwuiogi39ZPNmDZ+NlaUaBUi0ePrI=; b=Q+5mmYj+n/VSVLYh
	QoJEjJoCvH+Des/LL/ULV2D2nLttafyPPr2QA4sl2XtTaYHJCq4T+bPQyVJ7CsSl
	sSIV7foFigiuEhSUTP84O9+acizE7obyfGN6k/EJXvjRHRa4ypkFCbTpjHaiezd5
	5/bZ1AL/17zWQfZl/v2+oBXPoChXDOnv+u0eoZuBSqp6g/dxVhNIrzxuMXhbbJl6
	fTzqNL9CiDglo0WwZ8bP60aHCVi1zi9fSMFc+4MZh2Fou+OjxvYFhw5cWxX++xa6
	1zwL/DRLfGpnoltZyvB8GSnx6Nt1crfT9tXJyRD4u4fCaxdXUwXxTe4NEg+ftutX
	1IayYA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615w3u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b31bea5896so2537921cf.2
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Aug 2025 17:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513404; x=1757118204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMGCzwi7iMqpBSIwuiogi39ZPNmDZ+NlaUaBUi0ePrI=;
        b=wFsZO9aP9g4GvNmyw3sOkaP5fFU8D1FhS3gG86K+Jv3YV/C7kVJ4ngbi/W3jrXzZlr
         lD28JJn4i97BUuihyBAvJ6I0IK043OdQIpiSXrHxVa+sQhATFIXpsQ2DFQxqFJJD55xA
         LyF1F/9Eetly5tQ4v3aq2WxCqx2UdfmOAtr7wAHBigb3rebWZzzEjnsEXQWfAmOSef9u
         pln/l0jUgBIZUBc3EY/8VFLSQK0WpqFk+mq4500AkOMiAtwBkBEWfoEe34dHiObyW8Ut
         pJfJD0daadX6tsCyf1MMm1TsTqQklNtFWLUlJE02K1+i2mtV5HMmLR5T6SQGv8Bd7xIC
         jLAA==
X-Forwarded-Encrypted: i=1; AJvYcCXe+ReFZFAB664+5qLoHUugosaHP1fnIYlxaK3LzPXV7ASQxQdKg2xx8fJTwud4no1oh2Cb8vmUARJshQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8+mN2h7XKPBDzdB3dTnkij9IMcNPBpdkLgg07QDEWUtpt4+q/
	TRcIG22WrE78DyBkNvuOQHT0R6Qz8ukNbJuGXZzY+im/f7bPyvKGixUC7zS2XOmxa4tc/1gABWC
	wRaFC2013jfm9ziYzQdcj39KqA+ozyBCQB+2c7tcSBoBHmLdYqeGlTCg+lJ70C3CdRQ==
X-Gm-Gg: ASbGncvEgq+P01LOxMXrbDKo3DFgKTRB4paO6xCN2lA3ud9bRzN0sMd+xVhDNptr7ot
	vTgJvD7FsoPPQDAu5kYQFr6X/pRJnvTkzGwHTY8Q5uMlKm2xG3yeiG1YJvOZoJ0il1DHOeintKa
	uZKyuNPnfdcQhlom9igu8KXdPuyWRj68+0J37LgJe9NotDPAKTX2j1VvR9TQRWYXuhu8v8OjMcm
	6cV38W1ccxpF8JVeOEo8cyPg/CEWSlRPyI5mqEqNQsiWk/s5Ov3q0xrhhYQkqxT8GRCAhD4Q5cE
	6vpJTO3xDJ373H8rqXpQ89M9OogK2W4Wkptx1Sj2fpebo7wg3cPNE4uA+qIxvp7QNm3xWbawxSP
	mfl8QVCBUcv8278gtbWW0sWOLwIWOwSJYiur/n73M9TY5+xRroJjZ
X-Received: by 2002:ac8:7dd0:0:b0:4b2:8ac4:ef8e with SMTP id d75a77b69052e-4b31dca7d9bmr6262271cf.73.1756513403698;
        Fri, 29 Aug 2025 17:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQbp4HnJW53TtgpH4goLIxU1betKvFXJivt7Yk4w2HXWAhfhSte/bjtbH3ZPMA/GFEM5dqMA==
X-Received: by 2002:ac8:7dd0:0:b0:4b2:8ac4:ef8e with SMTP id d75a77b69052e-4b31dca7d9bmr6262001cf.73.1756513403243;
        Fri, 29 Aug 2025 17:23:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:07 +0300
Subject: [PATCH v3 11/11] drm/bridge: lontium-lt9611uxc: switch to HDMI
 audio helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-11-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6539;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VIOVx9ZFQcN8aP7U3+DXeUs0Ba2NJyVyJ0ONqbKAcgU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRk4mO/Wae/aVjMwFDeIGRIwNht1W8+SnIgW
 mGWDw77GSyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1aiuB/wLjBle4c8EUZFBkZrH+ITKfuu9NiqqEEnbh20zp5cP/q6DGCXvqn7JiotAYk/2OWe+TgZ
 wibQ6J9oaQdsYHdWszWTqJ+VckceGts93XDX83DH6MjkZl+U8ZmQazE2GM4X8phxTGZUpwrsT7Z
 PDXS9mKbl+23uOJ1Os8+rhOL1tKuMqFeIZEo+ChO/XJwS8pxmNET5bhSBFls35KXWLrGYP9NYV4
 J5+ZfT8+UntW/s1gQvPQB3LefV4pCOhcu9Kw9AWBxi2ScS9jJ0Zzh3XvewVtxknFkFz6JndPqqP
 ZQ0mPlZZl8Gb4f76AWhB8eGhy2KizaEN1C0CmHbU7wwbx3+Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX1P1aGBFleMWE
 9Hys/3ojoY1Luok7JfHlMl2rTJmH4dfjfIfRGu9FRVRz/7tlXDt4Z9coAqDQ0bFyZb9zPu5dZ7Q
 8g5e5PTHGwOnyGs5hUDHDsY4S1nENU6ZO3nqJ/ZePfuf/CIURl8TBqOSZiSD2OGqzCRcQPNV0ng
 c9rZwPaLpIyJKwOh2IqgbYRS/0RZsNHE5toG4mZl3bbu/VIT1wqk2wUbOV1Li9K/NHsaw/pNuwk
 4XJNyWK+aTAPLYB0KFuripyafjZmi/eN4jasQPyILoOG//2LYP8ceuRk/y+kC+GwHAF2ReauVTL
 tNcsiKuFPCcA/LOJnVuWxXMKEUxcE1OF+hDMGjiT0pML651Rmjqeqe7LHSd0ngHenpCHGxgfY0N
 284JPMwC
X-Proofpoint-GUID: XGRNyjsc6kNvlhlo6yyr8-Q8CQ8tIpg6
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68b2447c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=l1vpWyVUGYkh7_PGMaYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: XGRNyjsc6kNvlhlo6yyr8-Q8CQ8tIpg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

While LT9611UXC is a DSI-to-HDMI bridge, it implements all HDMI-related
functions internally, in the firmware. Implement DRM_BRIDGE_OP_HDMI and
DRM_BRIDGE_OP_HDMI_AUDIO by providing necessary stubs, streamlining HDMI
and HDMI audio plumbing (which includes plugged notifications and ELD
handling).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 130 ++++++++++++-----------------
 1 file changed, 54 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 38fb8776c0f441ae433c60a7680aaa6501a8956e..df4661986423a871c006af2a36d85d8103935f93 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -17,8 +17,6 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
-#include <sound/hdmi-codec.h>
-
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
@@ -27,6 +25,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <drm/display/drm_hdmi_audio_helper.h>
+
 #define EDID_BLOCK_SIZE	128
 #define EDID_NUM_BLOCKS	2
 
@@ -48,7 +48,6 @@ struct lt9611uxc {
 	struct device_node *dsi1_node;
 	struct mipi_dsi_device *dsi0;
 	struct mipi_dsi_device *dsi1;
-	struct platform_device *audio_pdev;
 
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *enable_gpio;
@@ -429,12 +428,50 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 	return drm_edid_read_custom(connector, lt9611uxc_get_edid_block, lt9611uxc);
 }
 
+static int lt9611uxc_hdmi_clear_infoframe(struct drm_bridge *bridge,
+					 enum hdmi_infoframe_type type)
+{
+	/* LT9611UXC managed infoframes in the firmware, provide an empty stub */
+	return 0;
+}
+
+static int lt9611uxc_hdmi_write_infoframe(struct drm_bridge *bridge,
+					  enum hdmi_infoframe_type type,
+					  const u8 *buffer, size_t len)
+{
+	/* LT9611UXC managed infoframes in the firmware, provide an empty stub */
+	return 0;
+}
+
+static int lt9611uxc_hdmi_audio_prepare(struct drm_bridge *bridge,
+					struct drm_connector *connector,
+					struct hdmi_codec_daifmt *fmt,
+					struct hdmi_codec_params *hparms)
+{
+	/*
+	 * LT9611UXC will automatically detect rate and sample size, so no need
+	 * to setup anything here.
+	 */
+	return 0;
+}
+
+static void lt9611uxc_hdmi_audio_shutdown(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+}
+
 static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
 	.attach = lt9611uxc_bridge_attach,
 	.mode_valid = lt9611uxc_bridge_mode_valid,
 	.mode_set = lt9611uxc_bridge_mode_set,
 	.detect = lt9611uxc_bridge_detect,
 	.edid_read = lt9611uxc_bridge_edid_read,
+
+	.hdmi_write_infoframe = lt9611uxc_hdmi_write_infoframe,
+	.hdmi_clear_infoframe = lt9611uxc_hdmi_clear_infoframe,
+
+	.hdmi_audio_prepare = lt9611uxc_hdmi_audio_prepare,
+	.hdmi_audio_shutdown = lt9611uxc_hdmi_audio_shutdown,
 };
 
 static int lt9611uxc_parse_dt(struct device *dev,
@@ -508,73 +545,6 @@ static int lt9611uxc_read_version(struct lt9611uxc *lt9611uxc)
 	return ret < 0 ? ret : rev;
 }
 
-static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
-				    struct hdmi_codec_daifmt *fmt,
-				    struct hdmi_codec_params *hparms)
-{
-	/*
-	 * LT9611UXC will automatically detect rate and sample size, so no need
-	 * to setup anything here.
-	 */
-	return 0;
-}
-
-static void lt9611uxc_audio_shutdown(struct device *dev, void *data)
-{
-}
-
-static int lt9611uxc_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					 struct device_node *endpoint,
-					 void *data)
-{
-	struct of_endpoint of_ep;
-	int ret;
-
-	ret = of_graph_parse_endpoint(endpoint, &of_ep);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * HDMI sound should be located as reg = <2>
-	 * Then, it is sound port 0
-	 */
-	if (of_ep.port == 2)
-		return 0;
-
-	return -EINVAL;
-}
-
-static const struct hdmi_codec_ops lt9611uxc_codec_ops = {
-	.hw_params	= lt9611uxc_hdmi_hw_params,
-	.audio_shutdown = lt9611uxc_audio_shutdown,
-	.get_dai_id	= lt9611uxc_hdmi_i2s_get_dai_id,
-};
-
-static int lt9611uxc_audio_init(struct device *dev, struct lt9611uxc *lt9611uxc)
-{
-	struct hdmi_codec_pdata codec_data = {
-		.ops = &lt9611uxc_codec_ops,
-		.max_i2s_channels = 2,
-		.i2s = 1,
-		.data = lt9611uxc,
-	};
-
-	lt9611uxc->audio_pdev =
-		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					      PLATFORM_DEVID_AUTO,
-					      &codec_data, sizeof(codec_data));
-
-	return PTR_ERR_OR_ZERO(lt9611uxc->audio_pdev);
-}
-
-static void lt9611uxc_audio_exit(struct lt9611uxc *lt9611uxc)
-{
-	if (lt9611uxc->audio_pdev) {
-		platform_device_unregister(lt9611uxc->audio_pdev);
-		lt9611uxc->audio_pdev = NULL;
-	}
-}
-
 #define LT9611UXC_FW_PAGE_SIZE 32
 static void lt9611uxc_firmware_write_page(struct lt9611uxc *lt9611uxc, u16 addr, const u8 *buf)
 {
@@ -858,11 +828,24 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, lt9611uxc);
 
 	lt9611uxc->bridge.of_node = client->dev.of_node;
-	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_EDID |
+		DRM_BRIDGE_OP_HDMI |
+		DRM_BRIDGE_OP_HDMI_AUDIO;
 	if (lt9611uxc->hpd_supported)
 		lt9611uxc->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	lt9611uxc->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
+	lt9611uxc->bridge.vendor = "Lontium";
+	lt9611uxc->bridge.product = "LT9611UXC";
+	lt9611uxc->bridge.autogenerated_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI;
+
+	lt9611uxc->bridge.hdmi_audio_dev = dev;
+	lt9611uxc->bridge.hdmi_audio_max_i2s_playback_channels = 2;
+	lt9611uxc->bridge.hdmi_audio_dai_port = 2;
+
 	drm_bridge_add(&lt9611uxc->bridge);
 
 	/* Attach primary DSI */
@@ -881,10 +864,6 @@ static int lt9611uxc_probe(struct i2c_client *client)
 		}
 	}
 
-	ret = lt9611uxc_audio_init(dev, lt9611uxc);
-	if (ret)
-		goto err_remove_bridge;
-
 	return 0;
 
 err_remove_bridge:
@@ -908,7 +887,6 @@ static void lt9611uxc_remove(struct i2c_client *client)
 
 	free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
-	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
 	mutex_destroy(&lt9611uxc->ocm_lock);

-- 
2.47.2

