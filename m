Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E9F2BF002
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047909; cv=none; b=miSi/qb5vSoBrjcVA0lY9uzVg3Veav3wnL/xrLww9Z/dxZW+EHdHC2VW23792qsKINTC7NGAxrfAN7Jd5WmggBRz92f/JpzfoRyiJdBPAiBHePlmrQUK3MtXQWwxNaW+UsY4UMEkRYwbVtJ2AOG7RCvtzTrtdMhzCT3GW/5X2GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047909; c=relaxed/simple;
	bh=RSyQmL3DOBdLluC0mSQhrTNOeUIpwQM2CI/HP9Sdsjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UkeSJ9avnVPG2mGnFRXY+NjVf2a/ACiChsuzb5BMK7yYHYIfhsj/s3gqfA3+Xjri/8oAMMF9Ze1L9U7MZjTPled9h9WVfoMZdt5EfQWGA2o/qL0s3ibGfaVUCrSd6IG7AFbz/JMXGaCyOJqN7rmwkn2hnDC/qijHaesZ0IHVokI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxJ3zEoX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxJ3zEoX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RNeRDP022035
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdzGoFZ5vldYBAKIaUfbr5FtLEdMR0eBXKVSBRB4ksQ=; b=LxJ3zEoXn4xTjN3G
	SQH4Vtq2q0AsIs+qTuvPQ+dRa/vm1wAOkFOy8SYuUba1RRiZu53ndc4LUm2AVtdv
	n4qwjBfmAWnaOEZN0QmdmGgfjDOvAPbwJXkZRM7yyVZp/fionxLbgmuJI9AXSQSM
	o/vfLBOWBuovDrfa8f2CA0yGZ6Wu7fu6kekGx+SivxQa/3gvF92NWMT58OoWFzdD
	AQIx1nnwrYx9VaZiLJxv76sowzdWM3G+W3i9sGI8TMizpb+YlIeMld32g0picEUu
	hOskKdtredV8Cij2Aax/PMmfy96lqLYQAt8o5CRSSF57u63xnU3u08xZfmwen3KO
	h4xrnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59mtrbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4bf1e8c996eso78435061cf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047902; x=1759652702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdzGoFZ5vldYBAKIaUfbr5FtLEdMR0eBXKVSBRB4ksQ=;
        b=l3phDB2S+Px+qaeVz7yZ1bWDJxFVJi32fqlZVmaQGoq7NzItAxAXviVhw6/K1ERmST
         nXVFzuwL31eyKexUl8+JX6cS7BOCIhZNxuUbhY4CWDV14r1m8sOt1TQWMSdVmeouIXeq
         786FGa4e6w0VH7SUIpGt12xy39PRNiU099hQfHp++i3hCpy1jSRh4B60wOq8ZmoBO82P
         MNFxhF/g7oyLkhY61P7qoKcOk/yDcTBDz8eSUQWhdcLnMy8Cesi9uf972I6Te/mIPbe7
         YAKHPOwo0t3qsmKG4hgRmsNwkn2Z7jGkzidyV6YCeBxpN5j1N6XVAQK6fgaRll//OnZI
         P2hg==
X-Forwarded-Encrypted: i=1; AJvYcCXJrIgCotjDprJkgdBB9dJ1aB78ZiywZpXzDHgZoyEWOPdoZ9AqRM37FX6qrmZNtE2B+Wvdjea9YR0tZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ7H4H9khdwpVhxw9YJSFc/htBcxqqag9S4hbKZFrfptDw9/QJ
	BXMfNg1tM5JkdHY37zFk1pS3LtdYfBEpDl4pfyWlLS21zRuWhuzhHr/jLkNGJ0/WOieafZERwBM
	FSS6utKtsLznxu0M6KrwPVyhcxid22xWoJxz8VwD/UT0qezPfnJ7S5mHmz/FWBaE9ZQ==
X-Gm-Gg: ASbGncugyxnEZ5SceCgBPaJ3C/GZW6RazjfVn+KgIukvYV6W7vpimlOngmGc4oOAES6
	b7rWv2xzWAuZgzetB6RKyI84yskR4j/9s+lFoGRTNLXFVb8UQoB0g5y7Ry/hoxRT9mXyjvyBcqs
	VqdElVjexvDQwp/1+1sz9ZFLdC54I+vzkocXq/+9qMyybYMC/XYxeDV9uYU34+Kwse5nINmtFXp
	q2t0pQ8EMo+JroLwUWJUqK6V381KJJYpRCbHAhwUJ0xdCX3tt66LDV93oZMc8eKgOPFN6B+929X
	LIXEIO7B6jiiJyYUd0l93II3aNj9k3cuiWfk7ueseGVHBECzHGUe7Gm7YKocvPjZncxY7nSNTHs
	ietQRUa30k/TGxwjHjRFAu0QhvBrkv5RAaLnu5xHEb3oR/iQE8wx0
X-Received: by 2002:ac8:5716:0:b0:4b3:a2f3:47f9 with SMTP id d75a77b69052e-4da4d220650mr149549951cf.62.1759047902077;
        Sun, 28 Sep 2025 01:25:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtFk8H4RKfXlQWtvvLw51nsL8yQliUuZJcfQS6snZsdM39Enms7DNwGsz+hvLT3ZcB+X6JPQ==
X-Received: by 2002:ac8:5716:0:b0:4b3:a2f3:47f9 with SMTP id d75a77b69052e-4da4d220650mr149549611cf.62.1759047901607;
        Sun, 28 Sep 2025 01:25:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:24:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:47 +0300
Subject: [PATCH v2 2/9] drm/bridge: adv7511: handle unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-2-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RSyQmL3DOBdLluC0mSQhrTNOeUIpwQM2CI/HP9Sdsjg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTzUzaZJp29ycMmG2wiJQ8CQv6AiE3Huv86
 QOzLbdX9AWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1bRHB/9ZjQ3i6ODCvlC8kHJqQmp+BMbnjHu7eHQ6dlWCRwTGbec8cJ8pUEOwXVArbsB/tXUek1Q
 HgczeUkd/5Yk6k1Fji2tKIa1Kvje94YIVlPsM0F3BO3kANjvD8z/jeiMrM7drR2iyWyKl+erXzy
 17ORLOpVUUbSI1WqursgSTSOWhhotsqgAbGiZWKjtxK+bhwA3yAFucPTQsInzOhaGtxfkxx1766
 o7UfybNWfhI1RVmA6KLPi84+IKf1vS+nsFU/vjt8C9bKTkS2pO8nDf6a+sLwRIuwjsWXd40lkWv
 kWFbjZS8V0oblNyrBSDE9iBEqUAdfJoQJu4ViT33wChiVcvX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: WRh1sIx7i_EFvYUsFHG7g7azQ8zuLnBb
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68d8f0e2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: WRh1sIx7i_EFvYUsFHG7g7azQ8zuLnBb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfXyzX7DQDQbdEH
 ZEvaFA794BfJXvq0lIOcUu/+viK4ak41mhV3vkrNaQr9HKVhsJ0SZarP8GSvqC24alPbOr2h8VS
 q1spy/FxO2KM0Zgvs4dZDKGfgV+ICgNcKtfj4QgN9WFgqg0FLRLidfqo0JHWu5X6RaKV0TgWpxb
 XwyNFClPFdGfnRMgzEWYEArQ7ughYguVxZBUkkZ/SuEwREndn1wRmGFONeQ28A84Na6q0I6K+BZ
 JwiPBCrxwVlEujBCbazP85TCYtHKQMc1W8S6W2B06/UCv3haN4GPs+NseXJc3OeAK+Siuud2VG7
 obSNrPHJJsi38krIn1vl7RAh13+mYjG1Huy7ynS8Ulg3VZZcibEE5HnDbNbRpiRe4XfT3BREz2r
 qHvqhwG5Ub3avPU1CzeKITbIOxqx7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be8654130758e69ac7ccbc73a82cc25d731a5c..241f02143f59322a814b4b277082637d59be7d5f 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -906,8 +906,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 		break;
 	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -966,19 +965,32 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
 		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
 		break;
 	default:
-		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
 }
 
+static int adv7511_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.mode_valid = adv7511_bridge_mode_valid,
 	.attach = adv7511_bridge_attach,
 	.detect = adv7511_bridge_detect,
 	.edid_read = adv7511_bridge_edid_read,
 
+	.atomic_check = adv7511_bridge_atomic_check,
 	.atomic_enable = adv7511_bridge_atomic_enable,
 	.atomic_disable = adv7511_bridge_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,

-- 
2.47.3

