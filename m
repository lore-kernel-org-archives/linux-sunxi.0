Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CBE2C028B
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047924; cv=none; b=HZYQBh9KIxVKjJTWVocULz5Pl3Uycp+05Av1sDbmb8AOGcp6J4kOImY9SIpTozM5394Y9E8mRMRt/zjduuTb1LbEX2Bt7FSOVtFw9LdGbSBs5jsTHLsFtDtQWuskLPjWovh0X41CvM3JeXMEhFaB7LGtIm9QCG4AzjWUhJcSHsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047924; c=relaxed/simple;
	bh=L5F+9hmws1ws8sHBg3j3OZgk+hUi3reLwHH9RQ7UEnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QP0zKwJ6ptLS6QWltrXmgHv4BbRANfNncvHqv7nprsxsHRcyahy2rkBZcioSKBcD/q4/qz9kpy8dwAQYQGcmFpmuJU2b7/wvKsCWA8u4t0Gt+aVJUVwZYSBKA3gP1D3AOV3pMW/uTTLn5TOvcmo3VEcxqnmKgpGNPOSOIYBzbjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQwlpWSP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQwlpWSP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S4vNjr020379
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDGCMgEwnjTnK4X9AKh+cUPiYlJXGC7VErq2j1leXiI=; b=CQwlpWSPQTUYPWV9
	T++W2n23NdFXAGo1Oz5z8OuzR4V3TeLUenpqXGIpk6WYUxPrjn49tZT0hSwqL55g
	J5Xt+JQu5RonBzt814SibeYMkhy+zbJZZjccY4PQJ594iadgVRvoihEd+7fZNr7r
	jaqGQqHzycvMp1fdvVD3NTjQXQHTPU7+KhjxYZSKu5yOctkUnqfRvpMI1gY9t3/I
	/kzRaY/Rr/vhFjLdw8XekRdt6WOqYUc0aV5TRNu5KmkaEF4+OFrUsAAYq02hvrKj
	Zrp/WG2XXIb8D5RIo9Mw0GlfIN0a/GOto/OqkHMWqsE9piZYG1kBl8Me8sGetgjn
	XX6KrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tjcw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dbd8484abbso43309341cf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 01:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047921; x=1759652721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDGCMgEwnjTnK4X9AKh+cUPiYlJXGC7VErq2j1leXiI=;
        b=bJl/Tw/HMD3fFoNXl2vYzN2ypO58pwTnFtiEhJgy3LSLZjwShpbbSKPmV8u/pXkDp+
         JWNy6PsKtWFUf4qEyRxv16AjR/SkQA6BIjubbvBvmM/5bKJPe7qX/lN9GIm6ggThlFBC
         0bYnhgMAlahIhAWN1P/EjiKcpCZcEEgOHtviK5GfHJh898RSy2NMxhJG9ewspIU9do9B
         L5BDjSX6haFBiABJhTZoPXMQHdmSlzVFIJrQzCF4Gu0z+GRApxb7RX5jTDg+iwfQRUJd
         jdSOrrGigKU9sbkJz0vQLHetIWj5ovo4XlrQ1WESTfhg/STifhJLF01K52MKI31i9TWZ
         XePQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS769ttIw0vWG/o8kPhXLPxKTAa59dkIvqeZgslrvgF6BGWKC9Rrg2QNFQha16jOUMQW04BN1oSi9m9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSrl1ufXxUr5j6CgDwFZIXCzh0eNkRXk3GoalB3vsUtbWeYjZ8
	tTJHjtylG5keJ1hIdaAJxJLHrxEhEyVrFmY6bmV9+KKkzOcTYp3KSWouTH2ZHfrZLiKnm138V3h
	ZN71BU1UtWL+provm4nJHWqd5g4P8bmZBZkq3xn0SjWy8ZJE6lROkizD666xDwrfVZw==
X-Gm-Gg: ASbGncvli/mGCWdjTP3tvtyS+EOVDlGiatIBYHMMC0wWed4QT+3/QYysbxrdMVFbKVb
	v6khIk2ESOXXuW8awkbljBC2S3LnAt8Rzt9Djhhg3Rq1ptDoyXEcQlgXOeNXUy4MxJ2SwZyPVv8
	EBAQGmPhCTFcjrE39KmxE9Kqk0JH722n9kcWCIKcNAJVnDAaB66a39KxJEQRIlBGzmG09ffTTyp
	2CWYfNiT0SuHN5fufF4N2BPVSnTJCTKcajPrNdtOLr6udDSFwWbofvWA5ys2ww0EXNtOhkFN5SJ
	Ix967kQ9vi3mVGLM7n1v1cq9nvw6ayUq8zbr8OGanM8f7lUUCyWgT5nIGjrTxQP0OxWHIQ5i7sY
	ZV/EoutzAgD+mvxJyhc+NJGAr74trvmSznDQLSujpqGJ0r/FoBD6t
X-Received: by 2002:ac8:7d8e:0:b0:4cf:6b60:8814 with SMTP id d75a77b69052e-4da4c39d551mr157223741cf.70.1759047920765;
        Sun, 28 Sep 2025 01:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs63wvjlOp3xMxlD61SlugRb128ix3vSdkzbHU2oqtBagfbingC8Ut4nFepJQEg0y1xF3nfQ==
X-Received: by 2002:ac8:7d8e:0:b0:4cf:6b60:8814 with SMTP id d75a77b69052e-4da4c39d551mr157223271cf.70.1759047920172;
        Sun, 28 Sep 2025 01:25:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:53 +0300
Subject: [PATCH v2 8/9] drm/rockchip: inno-hdmi: handle unsupported
 InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-8-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L5F+9hmws1ws8sHBg3j3OZgk+hUi3reLwHH9RQ7UEnU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDU9uR0Y3DH7A3+x8geiLghZLN7tPC7B3SOj
 e6zCefBhf6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1Ru6B/9PE+eUbg3q9YXlFXZd6EPBBkP5lZgICQEKOE0FuYIcvp6aqj8KRAYaSBf3nOEsYkh6Cmv
 izDSG7gqnOYbJtZa1DBmYqSXwcIYU9x3PqJtOca9yASpRyYkvVH8b9c8vz/LfL2SFkM0iWK3/HE
 oPq0/r5tSjjrJ9u5/+s1evNujBe86ROuzIpMMbVVTj5U9sJ0LQhBHpdBVmwkbN9cfVxuaUmhUo4
 +hHRrX+QqJ0qvxolviQQVzyaLLE7VuP4ZbG/H5NauVJRDGd6YUABlNx7xw9adhsUxwugFv2UAs5
 CL2oRovfS/3sNkx1Xb25MSdesvX4wPFuG9Dy5chHmg0qOIxr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX8IbdfrlS81oO
 GQunLPKi4pgHsqUzxgv8XuogKk6V3/q5RZC76wczSKyARFcujpOLX1wJBmKY9np7Z2mEAkUZGAs
 NIETUvJn0b0X9nEEnPQhghJm+DxN7/AwqrpU+2G12XaOe9pozIwlSVZPu/5IB+SDpcT135BgREy
 TchQEOyjljZT/hvJm6HtvxC8r5sODucBn2S69fPfTyLHUi3OZXYBAMLVa6S5uC3hZY7pGi3dZSp
 sJ6u0uZVfPy95Y2o+K4Nc3W85xAo1ALMdBYsJP/wGTvjzcySCJ2yWeZfSJseEuSXOYPo+lZWueY
 GTjw4vUbzZKzHWea68IxOJ3TAqhZY4vZk+hrBcWDxyQNqGwq4iW04Y2DG0p15CSERZ9yDVQbf7E
 +K+aqpY4u+TW79CkLwan98ft8oAXgQ==
X-Proofpoint-GUID: FflfLXQjoS3l7AJ3bz2N38E4xqOKtMGj
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68d8f0f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uj443JZPoyhSIAxeSSAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: FflfLXQjoS3l7AJ3bz2N38E4xqOKtMGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

Make write_hdmi_infoframe() and clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 47 +++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f24827dc1421cf5e0c1be63a80da23d645cf3f24..733294c6807da4663285ebd482181589c37f960a 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -641,13 +641,11 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
 {
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
+	// XXX: this doesn't seem to actually disable the infoframe.
 
 	return 0;
 }
@@ -659,11 +657,8 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	inno_hdmi_disable_frame(connector, type);
 
@@ -673,6 +668,36 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	return 0;
 }
 
+static int inno_hdmi_connector_atomic_check(struct drm_connector *connector,
+					    struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_check(connector, state);
+	if (ret)
+		return ret;
+
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
 	.clear_infoframe	= inno_hdmi_disable_frame,
 	.write_infoframe	= inno_hdmi_upload_frame,
@@ -1029,7 +1054,7 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 };
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
-	.atomic_check = drm_atomic_helper_connector_hdmi_check,
+	.atomic_check = inno_hdmi_connector_atomic_check,
 	.get_modes = inno_hdmi_connector_get_modes,
 	.mode_valid = inno_hdmi_connector_mode_valid,
 };

-- 
2.47.3

