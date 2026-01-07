Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045063559C3
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Jan 2026 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809715; cv=none; b=hGUhJXM0vCR3MDhXcakW/KikFJMdsOtL6HznXgBTlosN6J+JeuNxPo/LSwIonCPzD/eTaiaDhKW4uYjY4LIjhrivJG0wpRiHpcsbTR8cjr+0uVbog9eqld12Vg25zTkzn+M34sxG1kgdyH03xyQahCtjIpUsrONNO0QEOrKa6R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809715; c=relaxed/simple;
	bh=LT/feZw0CtZODegcFJ+4Vz9a++4eaSKUzh1MRBMJ8BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KWhPDlsDEIvBXwKk5iNvC0qLyrwmC4k7DFzwhRdBeaPQ1PMkUWsQW7NcqP72rdI+xxJ/a8abJzdB/WhlHCeUyL7tyrf4uUdEWsUGZgBYho2JW1IVw2iCE8McTEYEiEikUlIJs0fF4fhwjUpZ2ANgKk7Mfed2FD0vTF2ODnhN3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Md2Ezqvu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvqloOBk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Md2Ezqvu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvqloOBk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H6eQB2454263
	for <linux-sunxi@lists.linux.dev>; Wed, 7 Jan 2026 18:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=; b=Md2EzqvuQa88+NJo
	eO9CT6W6zNA2/mmL8bAXb6GdF2TgbDZwRiPcGhExvC1k/rcBmLe+40l0vu3MF44S
	QoUy/eggghWay8HBTYciFmcK5g2Aaf1FDZD9rolR0ZkMC1fbK/4XwkN295/ny6OD
	7Hj8ZpUvDJbaSgxgOTfCtEZ/BOyzVnuN1jYl2TiJ7O858oy/50DcJLZtCL/98fOS
	wCygVIIJJAKqG1PSF668wIDMDoHtjoc5LvKMAp7ude/wxjONNzUeXjIqQCv44rac
	XA1DZJ9KsfhFk550JzlbWRLh4b1Kazpk8gIsV1iwDBjhCZWAHHgTWxHTv9A6e2dC
	QiQ2Fw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbhpts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 18:15:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b51db8ebd9so776588485a.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 10:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809710; x=1768414510; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=;
        b=TvqloOBkPJocBVNsv2pO/76kIEwtfULI3pQQVj3/z8mTHpbGQagApnS9lP05qQsQos
         8FCyEM7z+5THk9ilanWM4sjxYKrK5lfvrj1hMIG8gPcrFnOAyE84By87OBQEecNXUHHF
         ER1QYVdVFKWwQq5Ef3rm7S+7xtrGuoIYjVWppudisqhxru15Z6i8pYnqzeHY2JpVVmFX
         uI3LTur9/mjdW736r5kkZ6dZ+1pGuUf9qz5bCG8y6TZ3UTKY9DLzsNez+HnnOA+L/uPn
         iR4mcjbMaK0KaZNlbnR5gyiUq/xTp33obp1jGnA9GrbYAOH/E2gQGJz7QXjWJL1s6v/j
         TfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809710; x=1768414510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=;
        b=uK6t/TFBbEmO0J0zY4Rz7LtQEaFEseY814j6k0OTvraTQkNwJQ/csX/Ku0/AG310Pb
         EoSHt3qqLOpy3y+DS0SlOz78L1TY729NpPaouw5V+NR7WQyJ4SsrCc0WkvVsJJM7PU/T
         AibwN6SHDIhlDoowcFi/shpRKJqb36kRqLIcPd9Nhps0EJjoNCFau6GUD3xaIJLdPnYE
         0Z+qob+z4qQkzyONnGu0uAZB1oKgOeRKIjkcs1ZgbksTMwt0YPB6G6YqvFMxO9iK+f8M
         ZBpI/xtHKZLtOzbwEHw0gylEp6DPoS19Obg29zeVfHnyB+85XpevjulLCIgiyMZKH7wu
         N9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVepCoXfNT7fm6+q+GGEY/uFm4/kc+U4Kc2fImV/9LEcpGISxi9EaOOa4NMK2pi+UWhpcjYNVPJSczdVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7K/7Bp530cvNc4hcvflvrUOv5QO7nCsKS8mBM/FGGvy+snW7N
	dr+/0/xC+Yjg2Z/LxmhJJyCYJpeV/KAro1/azfYDAwJIDP3RkxRNzEOqWWVmtMgkOn1x3sYUAo1
	X2mLN1rj5Ufdl6pl2+s4UDRlXTYVj8jSZg1IE7ySGj5uyTM+qAzCbqjBYxYufDRjQbA==
X-Gm-Gg: AY/fxX6qwtQ7nXNyzS/d2u91T8sWJ78UMMKwlzsvBR5hmFnJ2CYAHeMOd9sYrGTzhBP
	So+ziZ4U4LH4yHBBx7dAbhJ7P/gPjUnynhp3Z2n/xTsbDUvmrcDtcIW6LUFuk25EDlf0/sNR4rM
	/1OA5hV1JQJdjNA49bO38LXcz1wlKmkR9LeJWDXReG0VVKhxVpvRjAax5EXuJD769kE2+5kvxvJ
	Ogr/mFFbZx335C6or2csaIJklmiHaDRtoVKy70V+Z/pAm5xNIA6pVoVPP6xAt61j+0KxPrigrOG
	0IGS2Cun21cbyXbpiK9h4VqOm10HmtXMf9X1a2C6bLLX1yix+jR9OpEWzrnvTC5HP2JuIoCm+Gd
	PQq3TpGZ5Zp6YtdO2mNpke5yPBsWj0nts9As3CZhWed8keXsK7LleDpGS0YWYDu3Gu7jT/pPW1b
	ok99NnXOZw60EWGisM29pATsY=
X-Received: by 2002:a05:620a:284d:b0:8b0:f8c4:a5ff with SMTP id af79cd13be357-8c38939548dmr415672285a.23.1767809709953;
        Wed, 07 Jan 2026 10:15:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNnSAiO2TN35uowVz5nUxPTarPKtrJKczFdjq8YtoRDL79CU00FYbWgXjKjI0hV5LSFGnXqg==
X-Received: by 2002:a05:620a:284d:b0:8b0:f8c4:a5ff with SMTP id af79cd13be357-8c38939548dmr415665885a.23.1767809709293;
        Wed, 07 Jan 2026 10:15:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:01 +0200
Subject: [PATCH v4 04/10] drm/connector: make clear_infoframe callback
 mandatory for HDMI connectors
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-4-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5425;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LT/feZw0CtZODegcFJ+4Vz9a++4eaSKUzh1MRBMJ8BM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKkh8Uw4zR96uxdfP3B5zJVi4OZsf/KLRV9b
 W7ObW3B+sCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1b8ZCACVHXOVdotvxgogUT3C9rJjVAwz5C7cHtd38CQCrPUocd+kYKlETxwvuPGlVJvCHUeAM8X
 5/dbL3WQ4QoPcR1iBb8oDv1v6oB7mJeoOsV/aJpocz5lRWP8NYncKNG1ePRkGEpeU3WHjpZqIFS
 kYhO2EzWmB1sJ9inh/CWFfZvf4ElzxfTYGmj/kCkM/z5sVjYqKRiqW7x7HsR8MtVNsWKFqCfk3V
 dVqKuC0OSU4IUdW2h3I1weh+JiTliULMhONr5eVnvaNom/JZ5QKI3oJK+lJB7grw4QWcRHvOVP2
 EkMSiWdtnpNVOEWxdQ2Q6yJ+NQAxzjfP/bYkeyAmuPwG08rp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX9NFSpbziTesV
 y+HzcNPGrfLoTHBTRDgYFkZ7QCpuvVzDUD50gicawvVudpwZXY5IVG1JgV2XL0Z1jE3thv8xSxe
 iqSW/z16ClrYUDgRpWENiZQNqp9jyyBVqh9g6CMkP6o6tn7BWuLQOZl43ooBLSsjmkxGWxdwdS4
 +Ig1Dsy9741vf2O0vzmwlzUgekakaIO0HObQdj0wPxjI6wZucz0CNwAh0o8QW7OIEFU8JdXmjq9
 49eUtkNZhY1SsWN2w2+hGD3/6O2VFMUZNOSEzQGsIz/qaPwzBhjKPVZN1TGT4gbnBvNFK41yRWk
 39Za0oAcFcyNQDVoJoyTtdVEA/G2k8LuIIaIGElo9kYoSVRmhZRQYyG8LN/R5s9AgLSqpa5ImQ5
 KYFXNMCzUKt48PthQxxyZmuFtd7LHW0lL7LfKfR0uB5MhSYZUMGv+2rb5zs3Gklae/YJmkry6Hg
 EhgBabpH6t4NfyVHkOg==
X-Proofpoint-GUID: GPP4V_72ybXAcXf4WJwLPUJ424Ey_OQp
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695ea2af cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9fyoTQa5ixSHU3Y6h0oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GPP4V_72ybXAcXf4WJwLPUJ424Ey_OQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144

We already require both hdmi_write_infoframe and hdmi_clear_infoframe
for bridges implementing DRM_BRIDGE_OP_HDMI. It makes sense to require
the clear_infoframes callback for HDMI connectors utilizing
drmm_connector_hdmi_init().

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c                    |  4 ++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 15 +++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 22 ++++++++++++++++++++++
 include/drm/drm_connector.h                        |  2 +-
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5..40e025712c9b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -600,6 +600,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	if (!hdmi_funcs->clear_infoframe ||
+	    !hdmi_funcs->write_infoframe)
+		return -EINVAL;
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 22e2d959eb31..f356ea695ae7 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -25,7 +25,22 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static const struct drm_connector_funcs dummy_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 80f819a9ff5b..cfa14a6eb97f 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -78,7 +78,22 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return ret;
 }
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -91,6 +106,8 @@ reject_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -103,6 +120,8 @@ reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connect
 
 static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -2441,6 +2460,7 @@ static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_avi_infoframe_write_infoframe,
 };
 
@@ -2543,6 +2563,7 @@ static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_hdr_infoframe_write_infoframe,
 };
 
@@ -2790,6 +2811,7 @@ static int reject_audio_infoframe_write_infoframe(struct drm_connector *connecto
 }
 
 static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_audio_infoframe_write_infoframe,
 };
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..4543833acdec 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1253,7 +1253,7 @@ struct drm_connector_hdmi_funcs {
 	 * called multiple times, once for every disabled infoframe
 	 * type.
 	 *
-	 * The @clear_infoframe callback is optional.
+	 * The @clear_infoframe callback is mandatory.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise

-- 
2.47.3

