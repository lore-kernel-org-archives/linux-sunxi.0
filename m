Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD343262808
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538214; cv=none; b=F9rrr6rfwNp02F+L0gz1/Q+bCR2fKw4G5Umvt5vtm4Abw0wLHTO4E0tcGiX4rrOE9PZ1sd1osY57rK2YVcXtznyiLsuLgpA69B4I58b+JPLVn3hTMSuBJwrCr803riMePJyAIBa8LQV5OlArlheB8a6nHnMyCt3AMv0tpfg+UT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538214; c=relaxed/simple;
	bh=4c2IE1BIzyhKdA8ekc6Wi7j9/H9RE93hZFloRU4ijTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XqwxuC57KHGN+isikHJdgqISqgLM0c5WmMWdQrzfvnO3s0a5dmkWTqw7dPC3Hnoy6ZyV2wOvD5SBBTKTIQJb/MXVypbt9qUYaOPrgLbzE5IGAWDksjx6IVX1zahU1zVwxLpa6kVdz6uTuerN29S0mz4tgB8+c1UPqSgvzQzmd74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIvj0GeH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bd74gsDh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIvj0GeH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bd74gsDh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJrI64721275
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ptoV5YpYGtgGRLJf4KHHysjARuk6/g5YlYSeU98pZHo=; b=gIvj0GeHpbn8eVfr
	wXnrJmJpvSr5QelBPOCepN4CqYuIJWwOKTs6lBSaqhJ9nAitMz4Z8s7BiucYbTMy
	kZCmDZV3SZf3WhpYAZwbnSjXTvW2q72hTzeZKU1EbekO+rpy8hd8gVvV8OIKOiwu
	cu9qe2yqw98BwjKOH9mqtCGlS3Vn8ZbksauvepdBJdaFm2//o0/LKKGq6QpLm2NO
	FWUtx7mBww1fL1RJ2Iq6hDbbyVxtYbG6/0m7gdbEt4a8c04NpSvufC16W+Miz646
	dHdAX/2lY1Yrgdf6K6cDnFuwX5AhWiU9+3woAWTmN4VEsm5eZFc+FCQVGwIQNV/b
	BYLnlA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt8nk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eff973c491so136690691cf.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 17:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538211; x=1767143011; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptoV5YpYGtgGRLJf4KHHysjARuk6/g5YlYSeU98pZHo=;
        b=bd74gsDhWZRaFcYFtJcwBPLm45tOqX/AD0KCcghqFju+PNenmpY6/smFJjuiygLLtR
         NykbU+t8qwqtOKKXcYKz8wa7/Tn7PBX/6a5GJeXcyWTF2PgKwRSKsOFhxetAbVJANxtN
         HwA9L+x2GDRwL8+EIHZSAdDtawm+YyzGyZxsniHFnpalCWcb3UUrYwzTjTPrkiZ3k1ck
         I5r9IH+xm2VkU8zqRdtZwel1cV4elvytnDEhG4q0OLRl+EXpXeISjg4RcoH/4gYu29C/
         5G0Y5L3kJMJQsOR+HLG01/6C8aZ1XUT7IUHoJgg+7l5vkLAHDDX6oqM3h7BZy79nB75F
         WhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538211; x=1767143011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptoV5YpYGtgGRLJf4KHHysjARuk6/g5YlYSeU98pZHo=;
        b=purYPNFsmYm6R4XQlmTFXmCXC3dUkKVn9zhQvkV9jxKWJPQa6E7Kru2sf4kGpjOAJS
         O8fVwAYSuh1una8htanxoXXEAynYlwhQrxEAOewOdt4snUS/BS0vVknqO8x4u9653dS6
         PJoPEeiTIj/HliREMKezc7yxER982a7xHlTxVcjng1zNUICsb98vmsrr1GeIhlFZNFLD
         vN+wZZbvkPATnlNpOGkxR2WiMwzS6PPgyUTsAL9qqAkZr57ZSwGiYOowcpK1/VuPp7K+
         6yVVHiwzSVZE6igKwmLqqaUI4+lOHqEtUhyTMwF+JZmIiiGvBkiAGycEbKmRtILh5sPe
         R5cw==
X-Forwarded-Encrypted: i=1; AJvYcCUzWYs2N6HIebasBjK6yoGgiGMGwt8f0bQ0KIKBdzOv+3krYMX+HckqkgcKLUReDbKCjygshSti10HitA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwrxLQRko9m3Sd7tOAZaRyxt3H+ouU5N+14FKHxm1gu1anEMsj
	eilCd0C/oDakryRwiRiMCsJmJjZjRE3uc0Pl3pOEXKN43NWeSgWqg9nIvInsjCbZwDRBlJIMZas
	uKSXfoIc/iJ9hVm+s0GDVpyh7FpjHSmUZipQBeWySU53wlNlKygiyZoIdBwPIcvZ8gg==
X-Gm-Gg: AY/fxX7HLBewTZd/O7ys0UfS5OsbcnK26bwRWshrpNsyoa4WUXZ9E/k8dIIv5JRmlCe
	S7evtfuFSAGE5DCUPefPvcooV7DnTKwXB/nZ9f59ifJqZ7Y4eJ4vIZYy5575JPiW1dSMLzK8wo3
	SOeI7c1h/+ycXU7DCrJ37ZT4Ht2aopcV0GsnKEv6oKJ1yRxsS8TpOTebqMmKNc6SsXsTbDbnThl
	ApownZD05Yg/WFkz6PVFmCmBX4pCqulk8d0wbhaZS2H0tBGnEGRZt/FKyZGITwwVchdmyJEkLAW
	OhxXKbMzgJ6HHHK043yKnO4Yyl6lEoEw7Y+uASWGGiDcjpBDCJnwFqPFfxky3JKl8dyY10V9xgf
	w3+tSX0Q02GlgWU/MtVUV7/dyZiEljiNpKkJABEqc3gPJP/EoD4vH2txn3mScsxDqunUmqJdVZ9
	W7otITA/mNqZaSu8heB27Dl3M=
X-Received: by 2002:a05:622a:2514:b0:4e7:2210:295f with SMTP id d75a77b69052e-4f4abccf15bmr243879781cf.13.1766538210657;
        Tue, 23 Dec 2025 17:03:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2zGu373peB7MX1qjZy0q4jVqd6qNkCBDuXwSVgEQTyt/BLEgTukN0rowiAa42hXU7+E3H2A==
X-Received: by 2002:a05:622a:2514:b0:4e7:2210:295f with SMTP id d75a77b69052e-4f4abccf15bmr243878991cf.13.1766538210095;
        Tue, 23 Dec 2025 17:03:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:50 +0200
Subject: [PATCH v3 01/10] drm/tests: hdmi: check the infoframes behaviour
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-1-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=23481;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4c2IE1BIzyhKdA8ekc6Wi7j9/H9RE93hZFloRU4ijTo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvXcxW2jIpPeezbmraLDB4RzhRncsqcEuY/j
 p0d6qW0M2aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs71wAKCRCLPIo+Aiko
 1Y8pB/9N4zzcXVbaCQf/lN/+ysB8X6rw17vrj/cVY4xLnABy1fO2aSkyIucNPrfvWGd7VNFJmUV
 0yB+ElTc9Cu69aMcCvyPEjqkm5xJRG7bldzCnUt+PQ17aB8KVQxs+8cJIMdCsZdAfK0NYpsCxYS
 fvHIEgrZwTix9h0qu4VcK0M+0pMYY+RLaOvWl8K4YrqZ2wrAMaqdEsG8JpK0309n6usaYU1YqYT
 CqIMwThd2g3c2kl0iEo8N3R8P8elAPFrDExSIZ+Z4nHwELOhHmuG8fWdoPP7OaqYe9Nn0+GH+P/
 x6SyH1gwcYfl/hX10V9jrSXJ3VUbc7x9zO1VKe2goP01IOQP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694b3be3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pqfWdQB9qOw6z5IVkt4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: LArXR35gFaqzhhxKQjDIEnW1eUxJiDOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX3fOPCCKMLCHJ
 umK9H6gUP9Pnyp0int2zRxbtBVuS5+piBpj0JRzsGFMi5+I4HNErFHdZSDr/4C2EakcbCT5BbLq
 gpJ1gt5M/HGp2SyiTLOP4Slr5rhZpyE1JxOxG1I1pbfNVcyfmGSh1vkHl8LDwH8e0VNZjjUkzDM
 lfU1zjm9OsnmsG70b1MBCeqHkuNr0fY+tNp+5llRw8bE5JCIaYMHqJda8aZl7u5nTWuHcY5wrCP
 IhBc9rYUPyD6/npcDyRl5aYQ2vsfWaM7rZQapxaA78AD6M1FJ55wzDooeOH0updoZIsaTyJvwOp
 2GDeJjeSQo8cTJeINHLAzYABT085yV/ZN+DPtcu88VGXhKhr5tJV+Ys3TFPXcNdvUSDRK2f/nZ2
 piP9jKwdEwSM4znHd63vR5MzoAS04u+f9YU8hnNVCeVIBZDp6L88A3z2ulIKe9NlPeYRJGsBpbR
 FY6Wp8T7LqYRrxeFIJg==
X-Proofpoint-ORIG-GUID: LArXR35gFaqzhhxKQjDIEnW1eUxJiDOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007

Verify the InfoFrames behaviour. Check that reporting InfoFrame as
unsupported doesn't result in a commit error. Also check that HDR and
Audio InfoFrames are not triggered if corresponding features are not
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   3 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 485 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 119 +++++
 3 files changed, 607 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 3f44fe5e92e4..ec58fe064d86 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -5,6 +5,7 @@
 
 #include <kunit/test.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_drv.h>
@@ -48,6 +49,8 @@ static const struct drm_connector_helper_funcs drm_client_modeset_connector_help
 };
 
 static const struct drm_connector_funcs drm_client_modeset_connector_funcs = {
+	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state
 };
 
 static int drm_client_modeset_test_init(struct kunit *test)
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 8bd412735000..bdf14a0623b2 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -40,6 +40,9 @@ struct drm_atomic_helper_connector_hdmi_priv {
 #define connector_to_priv(c) \
 	container_of_const(c, struct drm_atomic_helper_connector_hdmi_priv, connector)
 
+#define encoder_to_priv(e) \
+	container_of_const(e, struct drm_atomic_helper_connector_hdmi_priv, encoder)
+
 static struct drm_display_mode *find_preferred_mode(struct drm_connector *connector)
 {
 	struct drm_device *drm = connector->dev;
@@ -138,6 +141,24 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 	.reset			= dummy_hdmi_connector_reset,
 };
 
+static int hdmi_update_failures;
+
+static void test_encoder_atomic_enable(struct drm_encoder *encoder,
+			      struct drm_atomic_state *state)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv =
+		encoder_to_priv(encoder);
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_update_infoframes(&priv->connector, state);
+	if (ret)
+		hdmi_update_failures++;
+}
+
+static const struct drm_encoder_helper_funcs test_encoder_helper_funcs = {
+	.atomic_enable = test_encoder_atomic_enable,
+};
+
 static
 struct drm_atomic_helper_connector_hdmi_priv *
 __connector_hdmi_init(struct kunit *test,
@@ -2323,10 +2344,474 @@ static struct kunit_suite drm_atomic_helper_connector_hdmi_mode_valid_test_suite
 	.test_cases	= drm_atomic_helper_connector_hdmi_mode_valid_tests,
 };
 
+/*
+ * Test that the default behaviour works without errors.
+ */
+static void drm_test_check_infoframes(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int old_hdmi_update_failures;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_EQ(test, old_hdmi_update_failures, hdmi_update_failures);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
+						enum hdmi_infoframe_type type,
+						const u8 *buffer, size_t len)
+{
+	if (type == HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
+	.write_infoframe = reject_avi_infoframe_write_infoframe,
+};
+
+/*
+ * Test that the rejection of AVI InfoFrame results in the failure of
+ * drm_atomic_helper_connector_hdmi_update_infoframes().
+ */
+static void drm_test_check_reject_avi_infoframe(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int old_hdmi_update_failures;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&reject_avi_infoframe_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_NE(test, old_hdmi_update_failures, hdmi_update_failures);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
+						enum hdmi_infoframe_type type,
+						const u8 *buffer, size_t len)
+{
+	if (type == HDMI_INFOFRAME_TYPE_DRM)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
+	.write_infoframe = reject_hdr_infoframe_write_infoframe,
+};
+
+/*
+ * Test that the HDR InfoFrame isn't programmed in
+ * drm_atomic_helper_connector_hdmi_update_infoframes() if the max_bpc is 8.
+ */
+static void drm_test_check_reject_hdr_infoframe_bpc_8(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int old_hdmi_update_failures;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&reject_hdr_infoframe_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz_hdr);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	/* Verify that there is no HDR property, so "userspace" can't set it. */
+	for (int i = 0; i < conn->base.properties->count; i++)
+		KUNIT_ASSERT_PTR_NE(test,
+				    drm->mode_config.hdr_output_metadata_property,
+				    conn->base.properties->properties[i]);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_EQ(test, old_hdmi_update_failures, hdmi_update_failures);
+
+	new_conn_state = conn->state;
+	KUNIT_ASSERT_NOT_NULL(test, new_conn_state);
+
+	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.output_bpc, 8);
+	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.infoframes.hdr_drm.set, false);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/*
+ * Test that the rejection of HDR InfoFrame results in the failure of
+ * drm_atomic_helper_connector_hdmi_update_infoframes() in the high bpc is
+ * supported.
+ */
+static void drm_test_check_reject_hdr_infoframe_bpc_10(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int old_hdmi_update_failures;
+	struct hdr_output_metadata hdr_data;
+	struct drm_property_blob *hdr_blob;
+	bool replaced;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				10,
+				&reject_hdr_infoframe_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz_hdr);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	hdr_data.metadata_type = HDMI_STATIC_METADATA_TYPE1;
+	hdr_data.hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
+	hdr_data.hdmi_metadata_type1.metadata_type = HDMI_STATIC_METADATA_TYPE1;
+
+	hdr_blob = drm_property_create_blob(drm, sizeof(hdr_data), &hdr_data);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hdr_blob);
+
+	ret = drm_property_replace_blob_from_id(drm,
+						&new_conn_state->hdr_output_metadata,
+						hdr_blob->base.id,
+						sizeof(struct hdr_output_metadata), -1,
+						&replaced);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_EQ(test, replaced, true);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_NE(test, old_hdmi_update_failures, hdmi_update_failures);
+
+	new_conn_state = conn->state;
+	KUNIT_ASSERT_NOT_NULL(test, new_conn_state);
+
+	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.output_bpc, 10);
+	KUNIT_ASSERT_EQ(test, new_conn_state->hdmi.infoframes.hdr_drm.set, true);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static int reject_audio_infoframe_write_infoframe(struct drm_connector *connector,
+						  enum hdmi_infoframe_type type,
+						  const u8 *buffer, size_t len)
+{
+	if (type == HDMI_INFOFRAME_TYPE_AUDIO)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
+	.write_infoframe = reject_audio_infoframe_write_infoframe,
+};
+
+/*
+ * Test that Audio InfoFrame is only programmed if we call a corresponding API,
+ * thus the drivers can safely assume that they won't get Audio InfoFrames if
+ * they don't call it.
+ */
+static void drm_test_check_reject_audio_infoframe(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int old_hdmi_update_failures;
+	struct hdmi_audio_infoframe cea;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&reject_audio_infoframe_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_encoder_helper_add(&priv->encoder, &test_encoder_helper_funcs);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_EQ(test, old_hdmi_update_failures, hdmi_update_failures);
+
+	/*
+	 * So, it works without Audio InfoFrame, let's fail with it in place,
+	 * checking that writing the infofraem actually gets triggered.
+	 */
+
+	hdmi_audio_infoframe_init(&cea);
+	cea.channels = 2;
+	cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
+	cea.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
+	cea.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
+
+	ret = drm_atomic_helper_connector_hdmi_update_audio_infoframe(conn, &cea);
+	KUNIT_ASSERT_EQ(test, ret, -EOPNOTSUPP);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	crtc_state->mode_changed = true;
+
+	old_hdmi_update_failures = hdmi_update_failures;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_atomic_commit(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_NE(test, old_hdmi_update_failures, hdmi_update_failures);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+
+static struct kunit_case drm_atomic_helper_connector_hdmi_infoframes_tests[] = {
+	KUNIT_CASE(drm_test_check_infoframes),
+	KUNIT_CASE(drm_test_check_reject_avi_infoframe),
+	KUNIT_CASE(drm_test_check_reject_hdr_infoframe_bpc_8),
+	KUNIT_CASE(drm_test_check_reject_hdr_infoframe_bpc_10),
+	KUNIT_CASE(drm_test_check_reject_audio_infoframe),
+	{ }
+};
+
+static struct kunit_suite drm_atomic_helper_connector_hdmi_infoframes_test_suite = {
+	.name		= "drm_atomic_helper_connector_hdmi_infoframes",
+	.test_cases	= drm_atomic_helper_connector_hdmi_infoframes_tests,
+};
+
 kunit_test_suites(
 	&drm_atomic_helper_connector_hdmi_check_test_suite,
 	&drm_atomic_helper_connector_hdmi_reset_test_suite,
 	&drm_atomic_helper_connector_hdmi_mode_valid_test_suite,
+	&drm_atomic_helper_connector_hdmi_infoframes_test_suite,
 );
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tests/drm_kunit_edid.h
index c59c8528a3f7..f4923157f5bf 100644
--- a/drivers/gpu/drm/tests/drm_kunit_edid.h
+++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
@@ -293,6 +293,125 @@ static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] = {
 	0x00, 0x00, 0x00, 0xfc
 };
 
+/*
+ * edid-decode (hex):
+ *
+ * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
+ * 00 21 01 03 81 a0 5a 78 02 00 00 00 00 00 00 00
+ * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
+ * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
+ * 45 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
+ * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 32
+ * 46 1e 46 0f 00 0a 20 20 20 20 20 20 00 00 00 10
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 92
+ *
+ * 02 03 1c 81 e3 05 c0 20 41 10 e2 00 4a 67 03 0c
+ * 00 12 34 00 28 e6 06 05 01 52 52 51 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 4e
+ *
+ * ----------------
+ *
+ * Block 0, Base EDID:
+ *   EDID Structure Version & Revision: 1.3
+ *   Vendor & Product Identification:
+ *     Manufacturer: LNX
+ *     Model: 42
+ *     Made in: 2023
+ *   Basic Display Parameters & Features:
+ *     Digital display
+ *     DFP 1.x compatible TMDS
+ *     Maximum image size: 160 cm x 90 cm
+ *     Gamma: 2.20
+ *     Monochrome or grayscale display
+ *     First detailed timing is the preferred timing
+ *   Color Characteristics:
+ *     Red  : 0.0000, 0.0000
+ *     Green: 0.0000, 0.0000
+ *     Blue : 0.0000, 0.0000
+ *     White: 0.0000, 0.0000
+ *   Established Timings I & II:
+ *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
+ *   Standard Timings: none
+ *   Detailed Timing Descriptors:
+ *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (1600 mm x 900 mm)
+ *                  Hfront   88 Hsync  44 Hback  148 Hpol P
+ *                  Vfront    4 Vsync   5 Vback   36 Vpol P
+ *     Display Product Name: 'Test EDID'
+ *     Display Range Limits:
+ *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150 MHz
+ *     Dummy Descriptor:
+ *   Extension blocks: 1
+ * Checksum: 0x92
+ *
+ * ----------------
+ *
+ * Block 1, CTA-861 Extension Block:
+ *   Revision: 3
+ *   Underscans IT Video Formats by default
+ *   Native detailed modes: 1
+ *   Colorimetry Data Block:
+ *     BT2020YCC
+ *     BT2020RGB
+ *     sRGB
+ *   Video Data Block:
+ *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
+ *   Video Capability Data Block:
+ *     YCbCr quantization: No Data
+ *     RGB quantization: Selectable (via AVI Q)
+ *     PT scan behavior: No Data
+ *     IT scan behavior: Always Underscanned
+ *     CE scan behavior: Always Underscanned
+ *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
+ *     Source physical address: 1.2.3.4
+ *     Maximum TMDS clock: 200 MHz
+ *   HDR Static Metadata Data Block:
+ *     Electro optical transfer functions:
+ *       Traditional gamma - SDR luminance range
+ *       SMPTE ST2084
+ *     Supported static metadata descriptors:
+ *       Static metadata type 1
+ *     Desired content max luminance: 82 (295.365 cd/m^2)
+ *     Desired content max frame-average luminance: 82 (295.365 cd/m^2)
+ *     Desired content min luminance: 81 (0.298 cd/m^2)
+ * Checksum: 0x4e  Unused space in Extension Block: 99 bytes
+ *
+ * ----------------
+ *
+ * edid-decode 1.31.0-5387
+ * edid-decode SHA: 5508bc4301ac 2025-08-25 08:14:22
+ *
+ * EDID conformity: PASS
+ */
+static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz_hdr[] = {
+	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
+	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
+	0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38,
+	0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e,
+	0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
+	0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x32,
+	0x46, 0x1e, 0x46, 0x0f, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+	0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x92, 0x02, 0x03, 0x1c, 0x81,
+	0xe3, 0x05, 0xc0, 0x20, 0x41, 0x10, 0xe2, 0x00, 0x4a, 0x67, 0x03, 0x0c,
+	0x00, 0x12, 0x34, 0x78, 0x28, 0xe6, 0x06, 0x05, 0x01, 0x52, 0x52, 0x51,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0xd6,
+};
+
 /*
  * edid-decode (hex):
  *

-- 
2.47.3

