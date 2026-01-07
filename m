Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547635E53D
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Jan 2026 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809723; cv=none; b=EXm4r/9JyId4wxywUnh1/1Ut/AKV/7igI2Rx/ZrOwhefdWlqh0yvoOendyZtfB/waLa1rqfD7uM2MhGKX1tSGlMY3VVHZ7ywYMO4GhwzvkcMccsXhGqVquebNtlm0Dzw/vuLW1vim86lp0LwMdKTJBDebLIQq/OiUzqBpvZ3jTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809723; c=relaxed/simple;
	bh=j/nplc82Uc8n6ck55GeREmF67vUj6ZFIListkklkuXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j42xN8yX96c9Yi/T/C26BZnfP6u5hWy9FyUt9vqqKb8iC8a1jxsf8IeF5prjY/FOa3VK9onaLrBNOR5fxYRgw6KL/vo5kbeYag68AoVF/qY1MHfjUh67WmfMPEQqLjbxNaCKP9T1sT4r+yi1FecT5ICdgHDr7KTyZcqC+lr+W/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpUmQbYb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAHcNf++; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpUmQbYb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAHcNf++"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HAama2453891
	for <linux-sunxi@lists.linux.dev>; Wed, 7 Jan 2026 18:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=; b=OpUmQbYb1j/NSFYk
	Xft3zpHcpuFEAv3CwOsCEDm8TTZut6f7fktTiYhP1reTavXR/x0cZtP0e3AsQjk2
	Kd4d6fr83beQDg7xLfrwhBhAE1TfPfdQLKTzu0NA99ht3KT3l1jDTgchxxzV/8nA
	msygtyBCiUhJg4YwVhjC0/Yw4oEbkJVb5gT29FunL44ATkzFsPDvFDPjYgCoR5ls
	J6Ghe+PxRcaqeJPPU3PMEpgkcVIcCIzeIl2l+M80+JIOz89logld2RC4jfJ53ZQm
	YKlxv/l+pU+RIUbbZPSXmCUkNA3IpMNQ3klIl0c0i1wuE62sfSsCVDo1NuIrb25t
	HacGAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbhpvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 18:15:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2dbd36752so622724285a.0
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 10:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809720; x=1768414520; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=;
        b=VAHcNf++iXCTNGh/ndN61stjjmRlvUpZJYDjOwUCuNOlupz3iGUaHOgcHWBxYX3d0b
         xWrj1M+hZ8kQcblnlRtf4svUsF6R/dSwDPFwi1t7oQ8S5KtXENzQ6G9UM3xFwpaS30U/
         syfvpMvIVMqGzksTQhzcJUyTtLXRWt3Bx7VTr7SgG9tIzHPgxMi//tyM/jd8UeLkly04
         J8FFXEVfCWGSZVFu/tqFLION902ozK7q87vJlDjoLl4ENujYSLTO6EIlt9flQUsX947S
         RCJ1j+jq4L7nnkBJfP5CG2zax5s6EkLpi9MAuZhia1bL/bQmYS5yGzmB9gESv2RrrgIJ
         OyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809720; x=1768414520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=;
        b=Xe0W/EtOlkJ48GofKzQ1/TmIl1q3FH1dV6I/nMPJtmfJYgbpk+eNEIoVyZ6FpJuAil
         Uyjcxu2oT7FEHmrJ8r9twz3I810WiKIXOsV2EbLnLULpyjSlnzFR5oZLRc1L55UttAxP
         RBrbk898DgOrQfBrgUK6YOgDIR8dXeNvk/RC3CpqIiVO/kGTEFIYdiEOT61BNvFcYNWp
         bEY/y75Vo3zkNqIH2w/8fnFywsQ18P3Z/61uNKQmkr5p/TGjD9GZIs8U7/7BQ47G/X5b
         /LokiRq2uN6bb552myMOMt801Q9escOQl1NbYmjhm2VnQtEeAaj3ddPsOQh8HvVM35xc
         ylLA==
X-Forwarded-Encrypted: i=1; AJvYcCVi++fzCv0PSWjnZSYf6PW7NIKe+jdbFdI2TOcj0luYMM3yfSGz7v4NhFJS0lMjXqtJYeiTlUs4trK0Lw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9t8zylVhaxEnXlvE+VvvvmcMPfM1hp2CSdFf7xdpqrbHRi7tk
	6ODfj0SMZby8TMixCPRpd4XxwDymhK1lrhoU46uKZi7X1CYJAHJf28K81NOUnuKDntogq9R6meb
	SY+rOG8JTPxOjpEw1f0k7o1naBxHuLX9Ieh0FMrn0uQqMUzG97s2ge8O/j9tACF+/7A==
X-Gm-Gg: AY/fxX4xihbckzM99QxQC7wzV+7A3/hMPsx+nTIXqCjXRgRWQdyLWEkATXMs7brU/5b
	bsXM2oJ1OOoENoelGM9xRQbMllp73zfJ0bRsPgL/u4EdK0zn2xph64G7LQOnmOrhMo6rGQCLpMg
	klx0HObLuBLvuSIqlu4/mq0wuRhRtCS0zN+V8TbJ3Mws3e90cJlqV7PBa8ux/+I6qxYM+VAzt7Z
	iEV2Ms06t7yw+pzNqVSrno6ySwuinZ5EMf6N+P787ZL836gD1MeWxkm02BeTJpMTC1wmoMtkKx5
	bU90Dtd0QjHweA/A+42uF0LHrVqQLh78Le+lM+ctDC+crLBD6rG+5KZptUq5KqJ2IGN6a2VnKqx
	hRtS9dHuBq/DJBfcmFU7XtLtPz8DgzENxI2DwcjcCoqIY7ZgQR7/fDFitsJAX0qDf6m0NOay/fz
	eCzbThjWTs4kiVXttneljbwn4=
X-Received: by 2002:a05:620a:2a0e:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8c3893a26a4mr408414285a.33.1767809719408;
        Wed, 07 Jan 2026 10:15:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUjHXe7uuYeZEqUMuBR5K2kia77K+Kj14ZWPxBppIzS2JiKcdZruRDku2629OMG4LVhagWmw==
X-Received: by 2002:a05:620a:2a0e:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8c3893a26a4mr408404785a.33.1767809718716;
        Wed, 07 Jan 2026 10:15:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:06 +0200
Subject: [PATCH v4 09/10] drm/display: bridge_connector: dynamically
 generate HDMI callbacks
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-9-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6894;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j/nplc82Uc8n6ck55GeREmF67vUj6ZFIListkklkuXo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKlQWZc4/P6jahK/bWP1w2B50/o9TLzfzbdf
 aaZXx2QNIaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1f1FCACoKLk12kYaWdypMvDCzHmH9N8HbMOWbXMZlbluaF79NkCtoNgDonKnKHxYLa9pjqgX17e
 Rvd8pmDpdv2MOg3WP/GMXH5pZGxRG01FGl7SBtEPw2/YXYEskTFSEq6fG4I+tv8X5Ly85MqO9Lj
 9cHsDJOJq0hBFlwxVPg4mvAka59hwWsW69lgA6euCJbibpFCioBMCghtCslqHcxkjZWM/PUGgNE
 Zgf3lcR3ZdkGqSnlQlrowNKspjiwnAe/Q7/uXCEP9N6R5jyGzXlQUqTGFKBPnuzMfXGuvLMm4dg
 RY6CU12eS8wodgZ5W3Ilm0fcBuf2GFwlR9F7fNEmqQh95vO+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX5LnPgdvqHFJz
 6HMfi01TD3DvQQJ/T1fBQknI3/6miYKGF8UyIIHGYG6Kq7oMzshzDsAhv9yzrmverQKmwodCQ6L
 x3hJgqTvzSODcnLQYPtidZuSEkBuh12qXoSQaztMxNiNo2xbdzFvtin6BU93YkkQYj7pusMNaNr
 fwSnX1DpNjRmBvXBFyzcy6Mhi9ZJqQF+uC43f4NNlGY05HqoEkaU783BGRDnEd/MICxBuj5WntI
 COV7AXlEN3UUFUQ3ydZEHhcPCTYFgi/IXJ/xFTdB+fxi5smoEaNhQ44kiX3WmBPbal7ID2462xz
 d5WWXFBls6F/7/JCM8+G90uAUfY0rthxjjwLo4ID79A29tr7Ph7xSUgrjDWRILMVVkZp6PyOBzt
 I8/78L1DEC9I9Xxm5Jg75AOsskWfFNhZn+d3FsPhLm0Ocg1/PLwNyFZ9HJ8qVqym9JNq58KkOfO
 F33qtFGtTvg7sUzrJ6Q==
X-Proofpoint-GUID: Oxnls662mK3tqcTfjOhfCiX020dLnT8-
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695ea2b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SmQ2dRXw9u10PpR7_9MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Oxnls662mK3tqcTfjOhfCiX020dLnT8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144

The rest of the DRM framework uses presence of the callbacks to check if
the particular infoframe is supported. Register HDMI callbacks
dynamically, basing on the corresponding drm_bridge ops.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 94 ++++++++++++--------------
 1 file changed, 45 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index ca6a72a4cf80..ba8ff113cff1 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -123,6 +123,14 @@ struct drm_bridge_connector {
 	 * DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER).
 	 */
 	struct drm_bridge *bridge_hdmi_cec;
+
+	/**
+	 * @hdmi_funcs:
+	 *
+	 * The particular &drm_connector_hdmi_funcs implementation for this
+	 * bridge connector.
+	 */
+	struct drm_connector_hdmi_funcs hdmi_funcs;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -465,12 +473,7 @@ static int drm_bridge_connector_clear_audio_infoframe(struct drm_connector *conn
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-		return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *connector,
@@ -484,12 +487,7 @@ static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *conn
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-		return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
 }
 
 static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *connector)
@@ -502,12 +500,7 @@ static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *co
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-		return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *connector,
@@ -521,12 +514,7 @@ static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *co
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-		return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
 }
 
 static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connector)
@@ -539,12 +527,7 @@ static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connec
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-		return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connector,
@@ -558,12 +541,7 @@ static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connec
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-		return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
 }
 
 static const struct drm_edid *
@@ -591,18 +569,22 @@ static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 		.clear_infoframe = drm_bridge_connector_clear_hdmi_infoframe,
 		.write_infoframe = drm_bridge_connector_write_hdmi_infoframe,
 	},
-	.audio = {
-		.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
-		.write_infoframe = drm_bridge_connector_write_audio_infoframe,
-	},
-	.hdr_drm = {
-		.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
-		.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
-	},
-	.spd = {
-		.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
-		.write_infoframe = drm_bridge_connector_write_spd_infoframe,
-	},
+	/* audio, hdr_drm and spd are set dynamically during init */
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_audio_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
+	.write_infoframe = drm_bridge_connector_write_audio_infoframe,
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_hdr_drm_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
+	.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_spd_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
+	.write_infoframe = drm_bridge_connector_write_spd_infoframe,
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
@@ -971,11 +953,25 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!connector->ycbcr_420_allowed)
 			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
 
+		bridge_connector->hdmi_funcs = drm_bridge_connector_hdmi_funcs;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+			bridge_connector->hdmi_funcs.audio =
+				drm_bridge_connector_hdmi_audio_infoframe;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+			bridge_connector->hdmi_funcs.hdr_drm =
+				drm_bridge_connector_hdmi_hdr_drm_infoframe;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+			bridge_connector->hdmi_funcs.spd =
+				drm_bridge_connector_hdmi_spd_infoframe;
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
 					       &drm_bridge_connector_funcs,
-					       &drm_bridge_connector_hdmi_funcs,
+					       &bridge_connector->hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);

-- 
2.47.3

