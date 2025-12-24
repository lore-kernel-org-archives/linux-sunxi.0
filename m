Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AB426B098
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538243; cv=none; b=W45qF2sF1GXPkGRsYZFgcI3Xa4SmJL13+SR9qtYYvqw6GusCj87Ku7WkxpdaJ9paZj8KFXqtqo21nd89Mve/6GI0LrDSh1WdmSl5clxK3vTdoQ/adJTv2ZVevEKOqQ3XL/iM3TJaRGQDVQ7BNcTEbzwgecTw7Fjg6nw6XdPl1SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538243; c=relaxed/simple;
	bh=sxrbcfgP+1lHt6WjBr3iluImnNCx0aJDmiljrTHbhwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I2h0kLw7g3y4vVBUfAO6Ctl2GTQgs5boLNsf0BCQlMn1kuuewNKV9Eur/tTPWigTojQrYZoerXJOz6SCKa8BM0a21Ay/waMn5BMsYnKMZqbVOvvPESNKPKl1ZJ4CC3Ahaa46WpalK667tBFRY7dSo2z29I77tDSa/XOSlfLWtVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5FzLQH/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAK2n+80; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5FzLQH/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAK2n+80"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNHwUnN1245478
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=; b=B5FzLQH/4hdXvpfe
	zRFH90K8m6qtrg/XEWhQfEiFLYj2sJlborOxSU6Ve5K1V7hKJG6ddM5f5hLHr9O4
	G5FXrg+x2+sZ9U/OXiaNp/wHJ9rRB0Js17h6g8QCgkkdYEEOM682EJmWdkRJSwhK
	kQePbxHNlL6j+a/BpNbMONLysUtobbr5nGvrJmzoA9yB0sF9cVMuIU6eE0kaGPiH
	9zYXOPs5JQjKabNmUxd4fZ+aeTJlgQvTv72a/GeIgJrwdHaN0Dd/bJzy1t13hpI4
	C6ekVf2ER33wY8q3E2wG5W5TveJk+urBH5JoBUQQ2/ZGy/5+7CIj2iJgKbR7pbjn
	GsKuwg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9csxpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d60f037bso124412781cf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 17:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538239; x=1767143039; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=;
        b=IAK2n+80WIbABgkMI4IKN74boMbcRrbn+hfXj9HnWeXNK4VnieQWOdPvA6zg//ZmpC
         tHANKSTj23osoIuE81niPYEj9FB5uo6obRSNzKa/rbMHIyN/axzBIGMAfrwdOym09RDB
         /CxfK1ujP7I/VVyH7aYdkBqm30PDKZ7yoVisEYOBRgn0BKt3OU2+N4zs+gangS6UD74e
         uf+zeCJjiRvG/FvAOC20dqjGljQ+ZCN0mo5YIc4YV0fm1gnaHSb6v3P9W9Vhu9ETWzEy
         yKpRgI12cTt3xpLdiMHaxjbCT2iokOBn2GPq/YA5Eg0OcJbid5v+oFTBNS3/rbqoBnqi
         yHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538239; x=1767143039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=;
        b=JZNXlrz87SpKw3aPPQOSNptOMUpDhfkzJOcJ+pE0web/I3u+vCTKRk7CBSGLcU/iyk
         kw1Wy0kZFeiGN4AnbaeLbq2X1BjvN/YEPXNDIOY1QvUqNS+GWMYQmO7xaa6ELLlY6zqG
         Z/D4R9IgYJGVmn9C+qULZ5mahhSK4V59NSs+tCGoK+Cb36OkUXdmpGgJDkD14dhTXsOg
         UPL78zma4nJ0QFpw9FnQtTGXYdUCZg0CmBVneL67KoOp5dnwckqZNe2sjV4L5gwRG8Na
         DYwCwIwSTa9SiXiqQ8c7cjdYXWmegbsqS5YYtfIaJeYcx2DYZeskpUMEOkstVS5Jf+PK
         wSjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk6oiuzRR3VnnOj2sNYtG/bKOuT+LFFn9VoBJ/ZXhgD5JHBpDq2CMdqYf7s5bcnajfsxUnubWBWrgNFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YznQ82aPahpLxCMCtaWxdyuISIjd/9JDS2ulhVumrpee6TL3k/n
	Nxx7jv4izDmLkQ56x6l1Q5+7bVGLtofw80HsDw40D9bdAUuMzlBn88V5JNZvMKdF+2PxhafmWDf
	dCvMuiTtdw7vEGVZVPe1fXDSjSRqErzFiLFaQgGLM3wlw9/8nupcCTfF0SRgmqQsH/Q==
X-Gm-Gg: AY/fxX7g2DX4YVCqPlVv+cxC4xo8UQZVSE24FXFUP+gz/3KuOqQa+xinSBL4fywUAwP
	fo/0uMpIu/SErhkUKj8yd6p0HW8PD2E4CucULXribOERGfsYjdHFt9IMBDfQlakQTI/++sNDs99
	NFp91k1NBNRt5Y4NObFoYConfkB+j6IBJJGD/QsqUaiNgidk6ZqG0mJwMt6FuSB3JV02HGKiAUc
	wLuRIgAqT/ldHFr2KrKdIXWXngyhRdWOAdqRift7PmcMtxdgAfbwGp4b97cnitGz0dXXV50d1Et
	vJMKEPpM/iBgzRr1ntfZtxTi7/ugdSNwLe3u1oghzYwJEGpv1gFYJ18vo3uMf01xZJYwPJ3niRo
	FbqzVWFcZ5q2f5XuVTJORW3gut5DwtycehoxhHB7qRxl9/W5CdR6vvmZer1fMzUpFE2+6vj31nM
	QLGgq6WEFxcsRpaRXWUZTcrPY=
X-Received: by 2002:a05:622a:4d0f:b0:4f1:cd72:f22b with SMTP id d75a77b69052e-4f4abd98192mr256225971cf.52.1766538239468;
        Tue, 23 Dec 2025 17:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQGuGT0UI/67dXu411P/e6eStajQsFB8+nCzwFqQBAvO4esgI+rdZ+y7jVSLNcipwTefBy2w==
X-Received: by 2002:a05:622a:4d0f:b0:4f1:cd72:f22b with SMTP id d75a77b69052e-4f4abd98192mr256225241cf.52.1766538238937;
        Tue, 23 Dec 2025 17:03:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:57 +0200
Subject: [PATCH v3 08/10] drm/display: hdmi_state_helper: don't generate
 unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-8-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sxrbcfgP+1lHt6WjBr3iluImnNCx0aJDmiljrTHbhwQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvZLWWWNHwhc00YhsGGHeZN4blSTiSB4fsQ2
 dICD4LJEyWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72QAKCRCLPIo+Aiko
 1TXpB/9MY/IAmp3a91kMBGdYigbcoUHZMxaQmuYtcY1pIt9hLZ/xDG0HyDeKfdb4ZXPmrbxM+Lr
 sZHIZRai5kkZBYBHRbs1UvhqFPaEKWCBVQ2Okq4Z1fFonAOh7dEtqQxrre3ELHCo/ljQz4N4wif
 r83ry1FetVmArWVlTeM2HjwKHkCtccISoiLzXtBF/vjY/mM4/GPwg3Vgf2yuvlfOviragLloVE3
 bKNPzT63BmazQ/jQ/THvNVxTXxfLg7YxC6jPXiOFdD16vj7gkXrw6SeuFK7IBzesw8H/JFK5eGM
 6letmWY47KyLynSka/FTDRJs5TQaxz+pxi/8ZGoJLndSd0+D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: PVxPOYdhnPdnrPE6EyOkx40DDazi9HCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX7WJU7DtUJcHl
 XVpZsXAF8H4ZfUOG0EbZGtCkZdXmbg+ulrQuo0XiACv5VtH7D9RLjB479h2COh5onrsTxTjN5E3
 LRfWonIrZ9xW2WISfKTIO7umieYuMms4pnKTSaXP4Yngw62K6yg+N7QwEG0r6LkOL2OJhyuh3vs
 GIZUG4cgidUnYPLt5sDYipoDWad/IK3A+VclqHF7+Rwisrjsr5TeFcnCRwYq0Qk+05v6Wz6+Q4T
 F5jkmakKbbZZhbaWIsTtCtmF3m7O3WpdH7PDp+N2OQWSxSER0rJeZ8+q5MSlWVB0ogqvwg7qy7E
 SWw3n8/JM3urh4eoGIjlhGKWDSsfNcFaTt8Hvb8e06THo3rRR7z0zdMK8dnNIAtmWaB9gDV5UDb
 be0czkBoNdoW7b79nozZzf0jjEyuKWHmaS5Ym6oB74oWINml670sT/dfa/ewuFtm8NLCcy/J8SL
 vrFkrIFeVnB3Qr0dJIA==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694b3bff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dmsjDmb_ix4f0IDqKoUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: PVxPOYdhnPdnrPE6EyOkx40DDazi9HCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007

There is little point in generating InfoFrames which are not supported
by the driver. Skip generating the unsupported InfoFrames, making sure
that the kernel never tries to write the unsupported frame. As there are
no remaining usecases, change write_infoframe / clear_infoframe helpers
return an error if the corresponding callback is NULL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index e8556bf9e1da..a1d16762ac7a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -718,6 +718,9 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->spd.write_infoframe)
+		return 0;
+
 	ret = hdmi_spd_infoframe_init(frame,
 				      connector->hdmi.vendor,
 				      connector->hdmi.product);
@@ -742,6 +745,9 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->hdr_drm.write_infoframe)
+		return 0;
+
 	if (connector->max_bpc < 10)
 		return 0;
 
@@ -902,7 +908,7 @@ static int clear_infoframe(struct drm_connector *connector,
 
 	if (!funcs->clear_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	ret = funcs->clear_infoframe(connector);
@@ -928,7 +934,7 @@ static int write_infoframe(struct drm_connector *connector,
 
 	if (!funcs->write_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0; /* XXX: temporal until we stop generating unsupported frames */
+		return -EOPNOTSUPP;
 	}
 
 	len = hdmi_infoframe_pack(&new_frame->data, buffer, sizeof(buffer));

-- 
2.47.3

