Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D942BE7DD
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047922; cv=none; b=YlvHWcAZ+X17gRzcwW1ySKs1VqMzuDWgiQzaWkSJTIVMzLwmWF8eMR+okCTcIqjVRAQ/bnTUdq4x+Cidhd6UR2tR8QUOJlg1MyijdfdN+d0W4jqyVQSg8z5KKn5gRTWQKWjLE0w2t4G8woUPB1zi1zcOK84mCY7MmBl6bNurNHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047922; c=relaxed/simple;
	bh=vJ6MP4HtyLt5a75BuYCv3CbEFdh6+KuelPeaDQZ+OQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4TgrEAqUbTojtzXdCDr+rxp5/35bwk0lOy1PLuNBk7dt4kF0JqEIpXKM6JPyUGeWVlAJaDyV/MjdPQWjmVMdfhvuY6+W7ByCwvmof+3in4XZf3yBhmR5JcIBSimR4AwrnNFykEdWn0eM/pVH5X6GnNQtMW4dX0ZQKlXtpp4q6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nyi1TU8A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nyi1TU8A"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RNlBG8007716
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=; b=Nyi1TU8AJHWkgYCm
	Mgv7R0ZVX0wOcPUovl7wG0Xnz37w+/sVSXo2xOnDA5fZLQfNP04uFmi3XqhnHER8
	V27tyCm1WzBckV7iYoSaOnrk/9YuFhzSuVVh9vBFpnPy2rDlKrJfAxar4Lmw+TxC
	hf30s2KhImMkUW6QTYYpMaE0tmdL2OqqzOGIEVw8wAeaczRpiDMg0RG3NLdhxtM6
	7zSIX4sVPABYEYHGD3xWrebTn236Du6TKM95MHV8ClPVw4dNHlIMU/HorlOlxhX9
	8gl+QObKHjE+BhIiMu44UtsDfk90OACEMIvL3uv7PAfya2vBjsGj+MPB9Dt+uJ57
	a0vPfw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e7gxjdqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dd932741cfso57581671cf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 01:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047915; x=1759652715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=;
        b=WRz6VNWXPM7ink9gfSIC5VmK9AYpui1yFdrIuLaMgbAh2Qs8pJtuyzkFKhoz3IMMlG
         kz79TAn3wpTx2Pz+FWlRx+7BNBBa3g34d/Cp7OrhlnXfCBLRZgRjHR9RYnOUYW5wVASj
         y+3o+wbFfvW92zWoCr2mD6B9E6zSzT7xe+alTBuiq+ZqMqmf6KlfG22HkUjNbQx4566n
         SSjhnAOADecpCV48vYNFnhu0HDECMPBsHJkTahVldMt2G8/zTPGTctQPnG41l5Zh4jqT
         QBpgWlxXTRx6NxG4z1MwZ0Ssu9VEhjM4xuOFuX1BeiC5ccmFLJwzXaPCHgNParM69nHw
         BgiA==
X-Forwarded-Encrypted: i=1; AJvYcCVtIv5pd30h5HEJgLw6/H8z8LrNi2c34oElYY2HpoPhf0ph7YzEhlCx0yE+zlTIjmDUBLFdSG+qOwEklg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7/HJvLgfzqppfDZPuC8GtUj7Z/AHNLZXohZAyYPe+dgcfjvSN
	YNyySMdX823Gyb2EAHMt82kiv5Zzdf8mgTD+2v65kN0cyr75HWMOE7jTSpd1k6dD0VWZATT6lu5
	kylPf6GSuvNIpYIcgEg3md4+PE+PzCDY/t+HWean7eXpRWk4Ymn0ay2HpQ43o+C/Hpg==
X-Gm-Gg: ASbGncsfnCr2YG47VnzkloQ9W3JSdbSHl8zbRLqW6lXm63upYF+bLn9NxQl87OIRjtl
	4v1NDYI0lguq2f6QX+WoSTQ+v5fqA4oMwXfHKkXBdAGEX64ZKGSHLlzv78WjX6yDQI2Z/7Dzq8z
	hwkCn/pMpRSfsru/RmDqRyS/A+aiThGD9948vSrW92+tUPWl5UnD4TSiozp6d5GQETFVyOc+pqL
	w176tWCiHz+lbLjQos/XBmDv/GZ6DxqgPJBImNIuUElIKN3sAL927UoJNmI6ukkM3MLfN4GZ8bX
	AtzeBP1CfL2qR7y1D2IhB5sHJGl7GF1OLy5EHgGQ7kVqcnsXV6isK7/LpUdnxH3GJZmD7ZuOp8x
	gm5qT9es7pZbjdc1SmjxGYKTRp/rHRB7jj7JghCdvF3B67kJcGPcg
X-Received: by 2002:a05:622a:47c5:b0:4dd:584:1429 with SMTP id d75a77b69052e-4dd05841fd0mr134553471cf.81.1759047914452;
        Sun, 28 Sep 2025 01:25:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwfsS0Q7LOoaRPfQeD9zvDgobB31SXOr4kE+JJnvQnCOXD4rZ+uP+6M8YxXGzoygRLIGjIwA==
X-Received: by 2002:a05:622a:47c5:b0:4dd:584:1429 with SMTP id d75a77b69052e-4dd05841fd0mr134553161cf.81.1759047914018;
        Sun, 28 Sep 2025 01:25:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:51 +0300
Subject: [PATCH v2 6/9] drm/msm: hdmi: handle unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-6-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
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
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vJ6MP4HtyLt5a75BuYCv3CbEFdh6+KuelPeaDQZ+OQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUyU7rCSa5YzapriRO9eRiYkhaqCHGmx40e
 u2QgQMrjL+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1c1+B/48g8XIA1mGiOfBerCYJp2Fs5T0zJCKW9Jx4v3PO9b+8QxLYHib6tzym0IumYyly/k7z4p
 aUIpTczb+3zc4DGKfWFnoVBBcTbT+7bBq4805NeNbG7sEYGN5sH64Dx1u+jhfGRODdGJ/E+hDt3
 JpTbshDXWQN/kpzysIXBESgmxv1QN9TZLzCY36KK8KZcY2UZJZ3BuJ+BsHvTwvqrBLm+DD9MXZw
 vI3gknUTNjHrk5YskzwrvFAzYF9tGB9mA9SHw9SegZAAmf7YWzW8SJldbp4vPyMDTLmT6TOGA4F
 JXeghLBFIPITZh4fDuHuLiz5X/nbdlBhKMJwMBQJqDnFjqqw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Gh9Z3lLcxZk26tbLqurdDlRI9gKaHDGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfX49SQB10WBO5v
 0pZzFvYAVboeCORmFILlWaX8i78o919pNVbxuEpqIsmHSgmANt+cMfZUaBkTvJrMrm8hcnaUTmE
 cyEcRZONb/W6jrNGom3iHXmIiX2IC1LCVZt0yVAtHLMp6In3vOkdtJLGWdf+2f6+6gP0dwnE/9l
 S14bzE3zMZnRzjKaqLImjMk1L/GxW7v2D60lHhP81aYyX8yeEpqPjnDuMgcjyGGjnJMjFOWEfQs
 Zt60COhg8NJsDWXGBO6Dqm2B/k5kZpNou6Q/iNIfMxGW/+WL3fam8mm/DqKVYNKicd3bl3BdIwm
 8ONLN7r/EFtk6JPjsT/FUCQClQ6wALioyI6OTH3qW8IqfIpLWVZ+XYjyGfHON6XmXmmO4deQtju
 GdS4lfhDRNstqC/elLMWfOdGOxk/lA==
X-Proofpoint-GUID: Gh9Z3lLcxZk26tbLqurdDlRI9gKaHDGL
X-Authority-Analysis: v=2.4 cv=dP6rWeZb c=1 sm=1 tr=0 ts=68d8f0ee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B-oVSsyST8MYkDpc_wEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270025

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..121239a01cea334c3e7c789ebfb54df71515db28 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -248,7 +248,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -273,11 +273,23 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
+static int msm_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static void msm_hdmi_set_timings(struct hdmi *hdmi,
 				 const struct drm_display_mode *mode);
 
@@ -452,6 +464,7 @@ static enum drm_mode_status msm_hdmi_bridge_tmds_char_rate_valid(const struct dr
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
+	.atomic_check = msm_hdmi_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3

