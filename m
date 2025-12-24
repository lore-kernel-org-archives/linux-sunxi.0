Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B693826E719
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538247; cv=none; b=ZiSl6CO2ilXsVhDWV7OwtcJVPu+HbMgRxq7i4uDSFb64oEexXvJNuYJUXF5AmrotnV4LaTUdywDUH0dfwWf4wpA5jw0UE8h9bnirO2KJ8zc7OGwniv/ttp6emI5Lg/y2wVd1f3UHU/OiHyv2hupBQCP8r7OID59BSKpxHPy85R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538247; c=relaxed/simple;
	bh=wjvfsQWX2SPvZmtfq/QDNeAsj27LvHfOsz915cSO54Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HBG7Sq7wf3g1SBFvS/1DWIctGo2MVIqefeR/lNC2OQ+4gSyzxGzqvPvKm0lp807Hip3FVaMnF3KVYiFBW4DmpbHAQpg+wN2tgxpwEiV68AfQbT+5aJ0ycuSJxieHp/aBl+2qFSSe+xasZrIho/5zdqhvudIek5EyuuIKSAWvroI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocinDGIN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRxKF1tI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocinDGIN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRxKF1tI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNHrcuC678258
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLWwE3+OeE/g9lVfst6cEgHRxD/v4AAQeIf29KzVQzU=; b=ocinDGINcuRyGvWv
	qgltR7lMm4frTJ+aSKEOdPX0aqzZyqJpD0PaCxOFOPgiQGr8laYQxH2lb7R7e7GV
	StCQHC4ToUZakKAcrVPgk8iBJI3GUxmqXWxjHc+jc0ITFaURqs/zzdephK0ypwMg
	c9+RTYdv7+i4SA5bdkwOcom1HHKM1OVl1zHW2rjDg3VtGG2mZKer/0Xt9/vzIZ1t
	QBiyCjKVR0pAYq4M5lmdEu+yxeZgw7/mFMGtCknAggjID0J53oUXjiHrgmUm4kD9
	QOuCLmI0lP5EuXkuauAhK0eSR+kY8bj4evofy818VH7lrm0NXy5OxS9h7ifZrQCi
	9qeA+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq11a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:04:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb6a94873so107532311cf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 17:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538242; x=1767143042; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLWwE3+OeE/g9lVfst6cEgHRxD/v4AAQeIf29KzVQzU=;
        b=XRxKF1tIBs0S/1bIsb2OkEjCmX1t6lyZMmfniKFpECS0pkmEm/+awAFm3uMXr9iA12
         pyPFRBJaU8Xd9wMrqvidLTopQQrtTzR4juyePG4pxQ74fkq0cU/NspWkYmweLySXUel6
         4cdUEAzKwao00v8mTHAFOYFoF4UvA/Z+viWET8N3c8iECksP78qAfWAcrkHATwuylXXA
         tYmFF9Q5KJvklbA96qtWMtblrVF+0kuamdHeAZQRTxvq4vAdS9kdeesowpFsYkgHDe9S
         7LRk8Y8lr0bd1pxF35bxpxKnFQMve1RwmoDFuRrZZD2HEzB6CAIIiPGX/rcBpIiN7vXZ
         a4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538242; x=1767143042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wLWwE3+OeE/g9lVfst6cEgHRxD/v4AAQeIf29KzVQzU=;
        b=a8NezKJaO9BZJwxRv2WSPyYDd32FXvc2yB65Dr8dyvNyMYatC/5c6z6er+8nNzXXWb
         HOtjGsJh4WEvGlfhiMelZ+jB8h/i8sWx3i7pTTbSWRli2FVvu2V+KlSVMNB7js7wJxxo
         /ShoLWjWijIRDYzViyG/o7QmyZR9qrCZqtVrlB92WcJtv8r5WYZzZM+e4zGPoVJI/4yx
         lzQBLti0OfSQD06oD0hBjgtzvKN4lkur2N3gEaavoDvAnAqTq+LBTT7xL2st28e75FK9
         o9lzXegAP6z2rpBluJMsrJhjQDP4Qfms8IgfydE3cK8X21pkBJvXeWO4xpOa3Lihf8tF
         UjZw==
X-Forwarded-Encrypted: i=1; AJvYcCX2GJcsXS7ck/tfPxJ8ZOQ5/AlhFb2Pc6gzXySXYUdnn6+t0OrUlCq9VTdfxEE4B/J2/A2OGuEtw639VA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzV1aLD8OYLjAbwtrrNxxFDdgbFWqb3VzDMB7aJ7bdhwOh1A17L
	VNFwgjgwCLEGMI9z4BrY4AEWSVyQT5tnrSNsIoJHyv/2V2Jj0lZZwZOaS08fywF2Y/Q6iK1XssK
	KKj55nYDNNhlFZrYGlYFArfNThdnxihKlK8ftxqK1vSekla9pu8cFmVTVNlZfuBpRbg==
X-Gm-Gg: AY/fxX6ifSfXWAeuE3rEsLGHWPmEA4xHVoroM7GCEWjvLIdOeG9iybWOioZBEna8+h7
	Y/K+iV7ump1N1xcBexf/R/Lm2fnPDlSu1D/s/7y5s48dR8jE11sOzrKVtE+t/6xG20//AOfwF7Q
	e0VtYntPXb4s91BdT09+uIAOHQ9OjltudkI5rQLgy7JZsPvy4U9WvfgtElKcG5mkJWPhDiozltB
	93/chZLHB6if8fw5Dmy0yueemBqBr1aoq8couQ55vf7+/YFU8MSAe5TZpTTmqMDtWyDcnBYuzuG
	LtEYDpY5Pe5UBlDpivKyudvfyRF3wdfVH6ck+DN8Jz4kC9xECplLyM233iYyzrBoNH4Au+2RpZt
	eH7cngHmkt3uVFS6Ve2on6DPdbzWHnGAHsOF01q1VliBYOnhRKZyp2Y2GXxsT1yt+wCKisp4L6w
	YbgbsrhRxwKc1B7WP2AEBt/qM=
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr206266891cf.47.1766538241859;
        Tue, 23 Dec 2025 17:04:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjEL6KpdvGkaIQESqzuIk0ruXwS4QCPmI+GKo0q+FP+/3F3vrZO4vptQGCTX9RSoNL/0h9gg==
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr206266431cf.47.1766538241402;
        Tue, 23 Dec 2025 17:04:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:58 +0200
Subject: [PATCH v3 09/10] drm/display: bridge_connector: dynamically
 generate HDMI callbacks
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-9-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6848;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wjvfsQWX2SPvZmtfq/QDNeAsj27LvHfOsz915cSO54Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvaCm570BXj+xIjC/HsGcDtU3JpA7khf+YXS
 u9a7QR7RCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72gAKCRCLPIo+Aiko
 1RcNCACKsTzltXBEDv5JA74NluYiKEOT2sk5yj6c9PVolhP6Av6n3Nd8/t+6XB3cYSb5w1io960
 9wqlW7vqJLAveCu+3Z7ebSvwfcaFyBSv3WTPBayBsfMzB6AqlUWornDKj76LVqhdKVSt7WBuDXD
 vatVEwKidWBUCYmkZVY6bgw3MHh1IavrIwmGwccrpBiOcKQX1569bdMvX2V/vrBdoY8npN/Vf3i
 9xPNMTYOWUmhlvG0QOffuyOf6enZ52Ukumfye5R7tjm0nOHqVQZqBI8rEAzGWq6Pp4W1J9M14XP
 oQc7kGcYfsQuNjirDnckyZJ7oCPqQPN1z3b/dJVZs+CcxwPT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: KzcJRN_mdk6IisqHJvUAGk4YFgj19AZe
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b3c02 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SmQ2dRXw9u10PpR7_9MA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: KzcJRN_mdk6IisqHJvUAGk4YFgj19AZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX4d6ufCWS4Y1/
 1tNJfP6ZjnqJYSW4TKTRIUJwPVO2pvsTypeKg3ILft14md34KvMM/LEUYwfsifFDZ2bcqDhQJB6
 gVxNMGMms/i9AzO8PPrtROijRx1Ne94OibA71Jx/+YQRXtCwqEgK0mkS5HgEdp3GQh9Y05j9gVI
 w2oc/kWtHAscP4QyMS3FeKrRFGma6M37fVbB7EYtQJb9vzvrEzO9acTEHS+uEr68JE2qI8WBLia
 2Fv3VytoPxb8zK4Yrzp+jbtoM8tOptXfUHZrGe7jwnkFjKGJLokB2fuKySz4qCI9XHEoo4M7vXA
 XM2eBRWgI4GogybmD5MLXTgFuCwOcHtmV9hEFTZYjTasRfWbz7W8INVP3sRwU1PMYVcAEDk5gt3
 4ZSYS9oUq61JJqJp6K7xHMI8QoAk1gVJLRSpSQZ6UgOt5T/W9nDMGECXKnn9R9lkEPcHfdmcDRP
 8OfhY78M71C2njIxh6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007

The rest of the DRM framework uses presence of the callbacks to check if
the particular infoframe is supported. Register HDMI callbacks
dynamically, basing on the corresponding drm_bridge ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 94 ++++++++++++--------------
 1 file changed, 45 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index c8858d48199c..2a8f586c6d13 100644
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

