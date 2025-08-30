Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B041E9B19
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513405; cv=none; b=toUE7SudpzQkCj74bKPE7vMXXW9QDk2QYzZq7nb+QcN7V51H9b6zY1ZijiUQCWJlmLW4zXgdsSU259KBgP36YuK81/dM/mPyOltqYkmFt+gNcL4ouA7vv8RI3WaxmUGo1wuN+Ql7R86qMS0KztFSBLcnMt/rRFgQS7wc/fcrRY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513405; c=relaxed/simple;
	bh=DP8WKS09AQHIP1eUa2wMNyM9LpBbwdIRAz41gdvU1po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAgpeGPVPid2iRrtKHhlU89865SpLTU5wA+4M57Rqx8+ALhROQqM7EzQzT7OwOnS+VeIZfJNMnsnPZNlGH8tLqcQPeuPEJBSgOpTLwIiBdiUr8BcGFUb9xn6ZGEJuMNM6Fym1HxPgtj+3SlhnYQb2R4spPKjkq5PueFUBwyR7oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gS9etg5k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gS9etg5k"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U0KSLY026458
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fFElURD5QRZmLsVqoA3hb8tqFcCE4wfhTZP2ZQz0do8=; b=gS9etg5kSlPjOI9q
	Dr4xZBf9qVgqpsTAtzWdD4ln9CuhebiznCcCdFYeV0IxD6Cy2TKTzSMoehX+04Zs
	VyASDMByiEtgL40oZsldbgzADMdmO8rZHMWIZPr9ccKOUx79Q6GzIw//z5WAGGHC
	9MnBfKrs+LVR1r+gODwfqHoePUJ5o5zZHDzFP7aqjG8+2pZrw3QRaol5+RKaPdtO
	vJW/GoCVmwWmMR4HQ7AROXAut5YFecrwigNnR82NxTb1fowPr5Bf3FpYQKDX0Q7S
	JTOflOOfgcIi0p7wUgTJEXN65tNUIEz3R2Kc2Lm+ZpaNVbRhtJzzsd4iokfMqUNx
	vQGa0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp006n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109bc103bso56211921cf.2
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Aug 2025 17:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513402; x=1757118202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFElURD5QRZmLsVqoA3hb8tqFcCE4wfhTZP2ZQz0do8=;
        b=K5WHbvEcDavLkiNCnVsDkYcuH5X/EzH5N8KFHiBuSelmQC4Eavq9UKiSkHEAc9vVoo
         20GIuWh4Rd8+3mp34IWQBEjyVjPsi9DRw4vFO29sFrndR5OPGhj/1GPdELr/F/fiCgdc
         HpXIJv2hCxua6bosUnZ2NsEMJUXF/YMxGnI4NzsPKjJEs3W1gy7tID65Tkvl8ytV/FqQ
         a/Mze6Ea/He0U4kM8ByiLPw7QSctzSPGuRQkMdOVMx456fC8wIve3RnUSPX2pJocNDfs
         ETtE+nSwadhcN2tlVaimX8QVSuaWtYQ/kPZBPCORkrTSqB535nxfeWMzrHZCZtMwDCeX
         u17g==
X-Forwarded-Encrypted: i=1; AJvYcCV4xzOcrKKMB4BZQ37vnE+OtTq5D5VfpIq/u1UNM5NIwHM/bNL2UQ69lmbXK/A3+6ScrdQ7ZJwbzKLVwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbi4H4RlPCtQUIswP4Gya/lNJ4ap5djzPVZ+Ftm6DXTlq1N8rc
	ss98efrwGQOxdwS5E/Oeo7jSU+GjWduUBR0Z094UDm7BVAdL4ZavjU6sb6drXR+emwtyiKWwaSe
	Pz1Lyfa+GTI0RstCHsAeXyXjqnHeARxPLn2NlqsJK4vZFJwFMQ6LW0TdFMarOgzP5xg==
X-Gm-Gg: ASbGncsLKaWlM5u9IeXrWZPYxbtu/hLMXQrLGLlbIoTIHDMdd3y83Tw2qZT5Kt734j2
	tHClsjgjmyEXb7JNRZulzgKTsQVjyhn6u+AleoBAYdktmRbFuPkkkn4vkOHE8MJrFHZqvdm6pie
	V2cymq3tDuDNRgd8K+YK1i8GhBP1pWbZhvQqoZNeivSmAoVaZt/W9kau2fTKuOJwXi7zqcwSFXv
	XV4n+WXtllu4XO9pgGuDCxAV7EKCvnW3vS2vH27fUXfUtCuFsJb5ICdQcXQkIy2C9vm8RWia9Q+
	Tg69vcoL4jorCP0Rq4bchMlsWrsFub2Svo9XDXb3d9HMdJxfEGun5YPa5AWB+eqwcy0r6dydxpr
	zGc49NehvraQzL+hpG9xiDZQQz6AVE8jPCT5WI2gpSGqeAndZ8vmt
X-Received: by 2002:a05:622a:5c6:b0:4b2:dee2:6498 with SMTP id d75a77b69052e-4b31d8607eamr5635101cf.28.1756513402160;
        Fri, 29 Aug 2025 17:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwgTkXP9pj85NxwpdQc0ae5nNZHcprVUGekqFYFf3riFk956UhGONyyTfF4B6OsdIgaiSMUw==
X-Received: by 2002:a05:622a:5c6:b0:4b2:dee2:6498 with SMTP id d75a77b69052e-4b31d8607eamr5634631cf.28.1756513401513;
        Fri, 29 Aug 2025 17:23:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:06 +0300
Subject: [PATCH v3 10/11] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-10-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DP8WKS09AQHIP1eUa2wMNyM9LpBbwdIRAz41gdvU1po=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRk2UNRsRCHOJKzLD77zC3Q7JVu5+ElSTKGc
 O0A/oyeiyuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1d8OB/0RMEMUbmxG0SYUoq630dkm8bopfypsnF25uIBgBqc8fbR40rj2Z6O/aFjiC4pxNRKtv0T
 Pb3wXjEx8igMQQyVkYQs5YH9EizhVoDMP2qbMuQD83N2hhtJsjCO9NIG5nBEgGmQDZXWFDqU4gn
 NbRVO+Cz6af8mXjkexPYvOzEvQceTImFY/x9fqz5j13/z4q3QwePf13Pxhvjbi3Ggp4tvM10wqX
 jp4foOuMAal2wFUF9OzE9JeZB5Kuv5vgwi7qeNFxyo+/bSmE60uO0EtP+Ab9Yhdzc8D/TLSUHnP
 MpGBkAz8OvKT70KC2H3AaYh3YkgsM7FphRVhkLoXKB5BRL88
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: C9xG9rUXgHTcdZcn4R_JvRhHU8JDf1L3
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b2447b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Yc4j0DFJudTMt519TXkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: C9xG9rUXgHTcdZcn4R_JvRhHU8JDf1L3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX/bJq1nG1bj7t
 bqDJOUOHXrJBBfAw9EEQ7mmHaVshcNWv7fmd4dc0A+gEMdvsCPolsc1GojVeNNANN5/Ta7jFl7L
 KlZAS+ffb1CpfLsJC99vQyvcqMX2rBIjDp8fTj+lVU5pvm3kZQltfRr8cb54Z+f/0GPn9lTnqvm
 /oTuzzJZB1u7r3UMIa0PQxzCpYVRM+CRF7aIDvQsOa4UHSQVW0ijGqUZuBm/Eu/KpQhExrq2FJB
 Fugaiy6QLenAiHfHc2n98OtExmysNHWKvGtvv+8Nd8NpaAn6JHnxb+tHRAckwDRfVqwpBOv0nmw
 nBk9sxR3pTXyseN0kGs3YtHVgzMbi5N9J8I/qS6feRPaOpvo3so1QeReRkBsQJo/DA7xkj5QdTs
 DgVhbHWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Sending Audio InfoFrames is mandatory for getting audio to work over the
HDMI link. Warn if the driver requests HDMI audio support for the HDMI
connector, but there is no support for Audio InfoFrames (either
software-generated or generated by the hardware).

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 7d78b02c144621de528b40b1425f25e465edd1ae..dfcd0e3b4b0d7cd6adda78dbe9d6e3f65e8f7ffe 100644
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
+			connector->hdmi.software_infoframes |
+			connector->hdmi.autogenerated_infoframes;
+
+		if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AUDIO))
+			drm_warn(connector->dev, "HDMI Audio with no support for Audio InfoFrames\n");
+	}
+
+
 	connector->hdmi_audio.funcs = funcs;
 	connector->hdmi_audio.dai_port = dai_port;
 

-- 
2.47.2

