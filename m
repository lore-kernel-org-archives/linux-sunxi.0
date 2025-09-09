Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B753570CF
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429561; cv=none; b=GcATlwZpRNDSVn/i2aTU76CWn2jpTde/cA8grJUDJwA3KjU4spAlBX94eL6pg7uCLNSju/dhMQOdzPNJMDCe4vPP0RLoVCEr1HggQDrWOcpqkRqfZPJYzQvB04goN8/I/YA0Xd4Mq6dHZtahaN2Yg9Tx3OjghQ9oXDktBPUumow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429561; c=relaxed/simple;
	bh=WvduT1qbRYo9sMATdr0cfogagyWfZym9JAGpyIFdd7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6skYjYEFg2DaREXzgFqvqOpItaLwS5v3W7t/BlOGFiSZBSCy3SLO5YU6JAFF13JNCnkzuCmoFnGsV1Iuu2ieiAnWMgYnCYMYhf2LMKRCVkyAxIqvP/6/7tuz04ts21k0LHXVYD4UHox+VPSJsN5Ob/o9P8EKd+V0TmVYjGV6sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZw9Owat; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZw9Owat"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRWT029818
	for <linux-sunxi@lists.linux.dev>; Tue, 9 Sep 2025 14:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9Z5uObkfX17ytwtS/hkOYbgTcwQucmA5+CIhqYDVSI=; b=SZw9Owat7M+hPDde
	VLW9jWV25LxsHJnfoY0WWEIgpl/+7gBglGj6T5phhPYTcfVZwEPc/IiBBzNeVnx8
	csnr5Bb18zMPGvmsnGRvV1vnFb49dzTsm04WcUvDxnDmHwoUB8OEdWLNqL19hvtf
	6MXOzwVHtnlyniNHCJWc6gNHXlnYtF1gbMXb8IsaZ2J4lwHDMdti12ekoSkw2DJI
	gVF82yZFmarm4vR5Y6iHgbikS3sNa17WPnLnsk8B3odF09EDzEjWXjfHNxNrQnSn
	O6X5x6KJOV/PIJHC80pZOfwoe6EFvufRqQktUI1DRaFDHmmqsFkqukgYLQ83ocib
	Ab2elA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37w22g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 14:52:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7585b6deccaso11463556d6.0
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 07:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429557; x=1758034357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9Z5uObkfX17ytwtS/hkOYbgTcwQucmA5+CIhqYDVSI=;
        b=c8M1CwMbWHVWWH/zNGUNZHfqKH5ntv5v+dxlZ+sO2DWivqU8yWZ/GOWY/0EBaqwOS2
         gFXUJ5qaPlDjeWnV6TDshJXX25JL9q9sPswBlEGddQb3cv33vFgE/JVaAUdxEZrnFRFL
         29oOvAI8wQiThZFUvUSgAnAZPPhDXTVn8umCoqOqcACs21x52GaTYv1OUfwAB3NTBKq7
         yRG3BU6wPj+OcW5YLbcnSVqn1sFxMB/fpgj4rimes4cRbox0r0B/oVCZY8SQBL5ulJyW
         F8C0wdqxVO7VwzXoXy1YkYwBh+rppymw5uK8llEJ6urzOb5RCKgNsNdhivaKAB93ENjb
         iWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3ii2RAWgnXeZ4GUO8HP4Q0EIrE02ebPZgTRgnCyAfaHbXoqDksl2Ms8x+/EgvvfOmCyoZ13xomBQHiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFIkMbzULe0ZFgsVTcEOzMpgkvJ6yVrDFyINTSrrKj/Yq641Dm
	rTNq+rm88Y0EZrqJZj5JzQ3dWVkYVpK4rXJEoJEpGpv5Nr4YNd9v9+WJVxg21Suw0+quv/73GjT
	fzF6/iLP4K6hARG2R4KwnXtvKCRDLOkYrZiWC2EyWPYU/atMDQCFl/dljPuY/YJcLQQ==
X-Gm-Gg: ASbGncu/hbefRocwXnf+sVCcyRvnHE80hFI7qgO1YKNoZE+ELd04ud6LRj9XFvD97RV
	qaXwDKEj2RmNsLGLjif9xoyKLy+hW9bCoqAPUJY8Mneptk9PDEuT2uNWXB2ohH2mHo3AVEfE2Hy
	pdKA2M89r8J29/DWAfW7QIniw6VPlMe8fky+4KykxZ55vohw34vq3AdIcvAjmizUcVr7ZJPAcvq
	Z3yZxP5lovEubT1OUOwuZEbwzP999ELN+RVKvUjT5EizBCxmXOKihn4ECmNf7jyDO+V5uyfKDmM
	UgJ0ZmnlvdHb4bTr6QtAlUFJU5OxUHkhdblUV0gR0X+4DJMtZGvkDUKphK3J5JHWNs5NX+e4BwY
	VkwCo3T+EShuW+GL9wBUDBBRRiv7uTo+fzR92YunCxRpYHxdcXcjO
X-Received: by 2002:a05:6214:4009:b0:720:4a66:d3ca with SMTP id 6a1803df08f44-73933639a08mr113606676d6.24.1757429556939;
        Tue, 09 Sep 2025 07:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPHL4NfJJ/zE5chnvOJ1HeidR9Kl8e6gYNpoM3SLwwaEavBYImkLXu+5zH8Ed3CkO98L4A0w==
X-Received: by 2002:a05:6214:4009:b0:720:4a66:d3ca with SMTP id 6a1803df08f44-73933639a08mr113606016d6.24.1757429556265;
        Tue, 09 Sep 2025 07:52:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:08 +0300
Subject: [PATCH v4 10/10] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-10-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WvduT1qbRYo9sMATdr0cfogagyWfZym9JAGpyIFdd7M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8b4ByVcFhNzN6vL9g+i6Xr5Ru20ekBbEAdJ
 +90fSIYze6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1WdkB/42MgipULdDGBHhJLj9Rn2m9Z+xg8n2+dwVvzMmGYgpA+PltLj7B5uOaXeKjVbIhMn7eYy
 Tzms6FQKTMnjfCE/3nJUZbGUl9kN8NBaJn9uXq14HKdFTcm7/m9nN2XW/f50ds9jrb83lrS+WzG
 1d9IvcNI2kh9ls+VF2uX750NKeykqE9uqnwxU88frDB1V/0wW632N6YQOrfX47F59xl3Xx5H9Mn
 nLXDnZAAIRGfTxDehtuvZo4ncNgOzGciZR6MuZQi0E/gquRXdMuCez2EHR03zdWeJWONeOAx8KL
 XZfA2cwtxgOTNy+164ThuwnMGvRhfMoUF7t/uJwK4H8+Gh+O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ULaSHqHcNiE5F3_Jpjo7AUwinNKlT6uf
X-Proofpoint-GUID: ULaSHqHcNiE5F3_Jpjo7AUwinNKlT6uf
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c03f36 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=Yc4j0DFJudTMt519TXkA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX6PRR0azbW+rK
 Hl+wF4boX9OPV97pAf0gka6vdMsA/Olmt5oMDCHxl2Znnd/cmLyj//1OJ4J/LrKuUehmpZ3BwE5
 5sa40766TdZlA9lWWX2aoOCATRFcpBKMCnQehZZakztCH3HP6jCVW472iFBlDgRvmHIe2Xd2sED
 jBujJ8vHnsQJOGbw9/JmtKA/As74NNp7gYQ9epb7BCRWagRpojSeDbT6ZJYCl/sZpZgmSd/BMtj
 eddNn8jOh53yACfjeC56WHyobpKrPoupu6ffCH1dqUiaDGDsCTqco0YU7n4/oI8Ht4XbFZcUahH
 N21DQTbTykje2fE/S7pBrPT+xQ78do3jEKFu6H1RUNgwLbYBkzTl4/+PRVCH+0utO0okJqtm2By
 mXqEBRom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

Sending Audio InfoFrames is mandatory for getting audio to work over the
HDMI link. Warn if the driver requests HDMI audio support for the HDMI
connector, but there is no support for Audio InfoFrames.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 7d78b02c144621de528b40b1425f25e465edd1ae..35e0e79cb683a68af813344aa86c154c3a5531fe 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
+#include <drm/drm_print.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
 
 #include <sound/hdmi-codec.h>
@@ -178,6 +179,17 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 	    !funcs->shutdown)
 		return -EINVAL;
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
+		unsigned long supported_infoframes =
+			connector->hdmi.supported_infoframes;
+
+		if (supported_infoframes &&
+		    !(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AUDIO))
+			drm_warn(connector->dev, "HDMI Audio with no support for Audio InfoFrames\n");
+	}
+
+
 	connector->hdmi_audio.funcs = funcs;
 	connector->hdmi_audio.dai_port = dai_port;
 

-- 
2.47.3

