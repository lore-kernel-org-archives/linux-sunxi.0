Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40894212FAA
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935097; cv=none; b=QLpC1ZLVO4DNKIevvoI9g5rsYlsR48/QvfvGSYWiCK4xni3GcxkDPjuVG9j6gXWcH12aUn9EjqZFuyUYyLVaNfe7LlUjhM4CwxZ0gfoZSotKZhjvXw9Sjcopkj6swzCWoyFzgjrWI5J1dU3eYH/lcaLCxOSGcRoaSH+pRuzCceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935097; c=relaxed/simple;
	bh=vK8TFXgm/6X3TSi0UvfKUVov+3NPXXiYH1OJryZTxNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bOCgIDPm6Suzz+0ElJURMGnaI+zM7ewhz8qd1p+SyNV+FAQ6Ler3G9mbXIRaQfQ5eoN8awMc0nd/2UfRWPpeUC6UFI5340hAR2/b6kBaUfwD4OwkW5ziSWqIdHVdwj4tO2LARQlvSzmbarPEbmhEeI6bABi8zhYe1Gjw3NHr6rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZoYnt7h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZoYnt7h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX78R032149
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=; b=gZoYnt7hLaHJQoqC
	JzECZ9VqglR5tUGGs4UytufnXaEFhcqEIOVgGTs6aK/wVfcTVheCoRVFKMt1Geja
	pCYDwBoVZyNB/MTNWPvGz/JtmJtccddO1DRD4GHyZc3fihkOr3V92U37E8AwS8/V
	pREkBaIAeavpXJuywT1ToGIBhgkw6dNqB57uX3xS8QulE/hETBH5gRJNgOU2HV4C
	9qEBY0P8djpgRXoi8ZjNMXAtP+egDkzAcKHd2dzh8gITc+SEQL1bvZ+muizjnf1Y
	bj1ZCsEGwSy74lxYjUj7FW66XN496M6l4Qf06WrdPR6A7mca74UYrZDzl26JfLzh
	Ld8nkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rmh8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b31bea5896so30779621cf.2
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Sep 2025 18:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935094; x=1759539894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=;
        b=S/XlFbX86nxBW+ScdI8w/LHfLv6ilBPKko/Xp6LU2khO2ES2T1ZNiCrIr70Z99G/ra
         VkdZW48U8tkpOUFNbPBqPsA5KBBokqI/iBtRqv4ZlpxOmmml7AGIGy/5DnhsHptH+y8w
         8OoecTpjmLGtx6d/6r6ac/Dw8tHAj0utg/GP/WqJquc7nyb+HbbLUURx4PzsdJO+W2fv
         MWCagwWIhclRC/lYzK0z55gGhUYB+ljnn0yyOFWsZDFt61a0f6GH8okCyWhSpmmziwqt
         AoHOkqOQVK4fEQOPC7PsG8EP37LUwomOFse/5oMjcZ4X4CoJKAHmTU/2zufbanLc2laS
         sa2w==
X-Forwarded-Encrypted: i=1; AJvYcCVWXOwGpSjpO0tlENs5kUaaJh2ZcZ7NDFDDJB+cjwvg+3h+BoQYNOZHjneptCubMT7/nNi/waXb3He6yw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1Fe/IcC0wdrjMiB8xxgClVMp1z/ffEM4/Y4Z4/nMpXD1z0b6E
	StolojsQ34b5Q4ClelD6K1pcLCqmdFH15M4kDVN6xtm2jEZkJt3XYsXhFJr0rT5J8ehJvOSxKJR
	bVSBXZHsiXiDpcgU8G2CxJ6mcTfKGk/+LmMekYDbSGvk54XGr3s0ucPrgwcLW3irVLg==
X-Gm-Gg: ASbGncth19FaHxwBepF0pTw52fiqIqfpQHwR50jalRTCulNQ9j+R8FBDLwnOdFfp80j
	zCqk8wzJ+hkpPAw1JZdjfW8all+M04LMc2tFyIGVku/pDLJf3MYpGmohJ69mXgrTiThFdLE+JlD
	uN/sZRLKqXxGfF3IqH/d5ihFep+5gwO0NXEokrb3mwGoey7vG0kK+hu43BgdtRKxCkrdHBWhBjE
	TiVfDcAgyXU/n1BG3badYSG67uEidKhH4ICtJ3PO5+riumr1CA3N+QDwhkgDTxYpQcU8CcYQ4gD
	noaOlZDO1Y11Xkz9qupmss/KPcCdB9tnmgf4svQnDxZ91iE3h5xiVIWNBEEcyvM2T0Zi7cFK/uw
	KbDt5fE2Ia6pp5Opp5vzOYGU4nsAdIL0bNNIlsIziPZCgLAV4qTYp
X-Received: by 2002:ac8:6f0c:0:b0:4b7:964d:a473 with SMTP id d75a77b69052e-4da4b142f90mr128891521cf.52.1758935094005;
        Fri, 26 Sep 2025 18:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCRYZFPLybi3qgiEc4tJcxO1VyFYbxX33ezwhqjsW3+EcQSWcPI5GdH+++nldPjNtBnOGTzw==
X-Received: by 2002:ac8:6f0c:0:b0:4b7:964d:a473 with SMTP id d75a77b69052e-4da4b142f90mr128891121cf.52.1758935093547;
        Fri, 26 Sep 2025 18:04:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:33 +0300
Subject: [PATCH 4/9] drm/bridge: lontium-lt9611: handle unsupported
 InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-4-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vK8TFXgm/6X3TSi0UvfKUVov+3NPXXiYH1OJryZTxNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zggUzK2RvlXjuBJ58sQp0MZK2qxX9MXwdZgz
 Jxz9w/I116JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1cOFB/4pMZYQgMm5haHVkWCLHoQ9SVONscRZipQty6kqJqyPqWCaV98QNX91eGvhLm45TmM66lW
 UMSazUEX/mcxotqCXzoNpmP8i7D7KtpC1vBVvSDWSgqVuEq1fV1mluRLvnNgiqkwrWc7qQDjVUQ
 bdhwPL5nXbF7LBtbDCZZptQZ6/tJdk3JGtKzlP8oniHvtNyoRiLPZSTuhxFMrVZAgPMHJktdfrz
 j0o9skVk6q910jOxpvy5ZrEXRcgtdZmdXW1d2vY2BUUrt7dTu6TFmybylrGkVpD9i7KJuu/q8YJ
 LD/SCriTfziUQ7jdmHCgSyj7zlO/IZIBF6loTp1XcETV+Ejc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d73837 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: caE-Ts0rSMedV3xAvK9-UnIHDVvRf3O5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX2AUEqi05KZZ4
 /wiKlNrbeFdmVzCX8dVD5dZXmoTBqlobHK4XhBmyjhqEo/IwRyC0+dSqch1pVmZs9iD8V3VF1Ah
 KVjtvaRF0Kc/0+J43WD+0ng0aUn17SizAoHt4JtAfLGGZjnjN1m2kk2Bcj1jaJcx+kjJ9a4IZlw
 6DFQKC7OJCBZTwIr9+oEGNIYcWEUhm9G0JMjG3CY972bOxReIniOj4D+PU9p+XknpOJJ1kszDx6
 WIIqjxzTfCdOF13y92Nsb6X02l6zD4Dtk3SCt2VS6rMMwnLXYJStbN+t2uOm9TalAo0CF5tEmgl
 dnRt9kSyVi3u5S3krDj+nVqBWBPDBUkLz8N/WA+E7FcrKb+X3xAOu9KDnQK1khKHxAQaOjwvqMY
 6hFWlpHNLFqucZcQJ7DyBdLOTUfvyg==
X-Proofpoint-GUID: caE-Ts0rSMedV3xAvK9-UnIHDVvRf3O5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..9c2c9887d2d66968eb1d50544a257d5999bbdded 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -869,9 +869,7 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask)
@@ -910,9 +908,7 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask) {
@@ -925,6 +921,19 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static enum drm_mode_status
 lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 				 const struct drm_display_mode *mode,
@@ -993,6 +1002,7 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.edid_read = lt9611_bridge_edid_read,
 	.hpd_enable = lt9611_bridge_hpd_enable,
 
+	.atomic_check = lt9611_bridge_atomic_check,
 	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
 	.atomic_enable = lt9611_bridge_atomic_enable,
 	.atomic_disable = lt9611_bridge_atomic_disable,

-- 
2.47.3

