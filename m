Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D59C2BE7CC
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047902; cv=none; b=EXCJW9f5QpSwqtTShYm+rxKLLJCGRUS96gfy0Wcat0uBbzRkLdt1QtMYTZLPOJUlkXvjD2aowjX18mHsQDX5AOWSaXoouSKXMF74ygvArQSiN+yVix9H/sClNApZFmcxFaTGUEJzW4CIAV75C7DPetne/C3gGvuqTktQprQG5G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047902; c=relaxed/simple;
	bh=R1Bpa6Fvy73+xL3P7L887ElbwPPq4/fFwLVlkuQV7Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWimCTCPD+1DngXaZCEcBhSzBooU9J+wfhT5ijJGcL93qblLb37OjlwO1ufqMXUhrGxqEpBlEOysEHklxmP2e6MEg6JUS1LudmPr+sIYwtay8S/6D1ZB6CVwNxzk1sD/FpgWDT6FFiKPMxGZdkEmwl0vwB6mGUJW4UzzSEDq0QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d25S158d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d25S158d"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RNlBG5007716
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3RNoMb86TETM38fjgm0MR4bIq5hfRNj//M20P1hCu3M=; b=d25S158dbMUwLxBm
	R785Dd80o16MVQY7oYklF1CygQd2zDKI/89YN/PSnPdDxigAtHQ7Uu7x6WndWr6Y
	kbnXr2nNoIbbRQ6W7paF+hgHR7FHm2rmGqCQaJp85xHd/e3KdwdjVacZRZUMs6TR
	xF+52srTpnRuniTacA7SjovxmMP63S1tgIu+2A340QmTOjSCL2A8gWvBGHq+2Hrm
	sUva607nq+00q+upnoxqpvnyGZi+/9p+wb66S20GXn+euiMH2ra9MNcA25Gen5P/
	RfUwB7JBbgmRIa0li9JMoKJbjPlfc++6gn/ZNtP1XW6g8UU1WXnKpFTwTWtKDi22
	nbWfSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e7gxjdnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:24:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d6a41b5b66so86514791cf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 01:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047898; x=1759652698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RNoMb86TETM38fjgm0MR4bIq5hfRNj//M20P1hCu3M=;
        b=DovYSDHHKIhcSOCaMdS9p25ahc2UpT3evOq7HZR6rvDqwECt22a5o3UHPFRPrWrDl+
         3g02GOs0ZUNwqv+Ap9Brtoo7j93/Ov1aqgZMBBSnsa7QrPoUzjI4fEEOUrMtoKwdxBFf
         zWhY9Aq5b/jUuK5LmGBrC/uqelq9Yb80OUKKbXzFmpXa0CnWrNTNrUYMQAk+St7ZpTk+
         7O9dfpXCl3+jQYUpvNhEMKwwqAMifrK312qI/EBUooFEu8wDa8rS2gnzYeLEUANlVCxF
         pe4bnI5GqtezjHoP2+5ezxX8ROHUSsjYZ5X1xrzLWDLs48sXZ3PRTsh4R6PEAZJ71/d5
         GXMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWgqR1ffc0TLUHWeuCQkqYkwa6HdUrQWDvFBc6gMZbGD6Qguj0sffhFUJMUm585Fs56S2zYXpVgRmEFg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0rCJ+Dqj+GwBsbrnzu70aEJNbwo2ZFc3x1dV4x29C9amZczk+
	7QtXlikZoE6xDUPTRGljG5sVc6CjIDZmCXBReZzWqR5uflWjrTPgGOb59mzEHDtpj3+OX3yeEkJ
	6tcr+jJEgs/Dk34l12DPF/w6a2Hh5tw3bGioaxH0IQm9TcqZsAPYgY34kzfJyCJaaFQ==
X-Gm-Gg: ASbGncuspV5xsLE/bD8qx+PckoTJl3LzIGctNhcNxORxdQI1KePyaAWyR44qPVKn5jV
	VhMATB/ugBrp4J5+DvQvDsGlH6pGvR9zCnnVKoWYQ/5gI05YY4Vzeui3CIIa7mbfqafyM2zDgWC
	nIWPxBSYcDkngr2UQnVCp64jbu0qGK/IlVWi7Nufz+aVWcj1N8zB9t41o/l6JkvJW5vmwFulfyK
	OSoMPyEdeqUaWpBP0sbo/cx8iSrG+NpvM8E2XA2sDNuow2TIGyyAKKPGprRimB9o3DkDVMb4lXU
	s/JeavWwa79sGaawGV8+958nKPBrtJtWY2Z4Yc3gOwV+8b1RWt4xDHGIDkW+t8zOnEkKOdrFbD7
	h7axxrjzs4RgMJnfmvLXVVTo1hlXfaBM3Ux9e+d3olAE1IE/ECI8w
X-Received: by 2002:a05:622a:4185:b0:4dd:d5ad:a0b0 with SMTP id d75a77b69052e-4ddd5ada161mr94504281cf.72.1759047898441;
        Sun, 28 Sep 2025 01:24:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT1kPr+SGAov5dmZPG5ScdAxxwbVTr7us/Vb/QdaIyPAfJXzB+Vh1Hhl5wl5GH8A9R5uXnVw==
X-Received: by 2002:a05:622a:4185:b0:4dd:d5ad:a0b0 with SMTP id d75a77b69052e-4ddd5ada161mr94504081cf.72.1759047897951;
        Sun, 28 Sep 2025 01:24:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:24:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:46 +0300
Subject: [PATCH v2 1/9] drm/display: hdmi-state-helpers: warn on
 unsupported InfoFrame types
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-1-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R1Bpa6Fvy73+xL3P7L887ElbwPPq4/fFwLVlkuQV7Qc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTlnZoYPxDU4Z3gTveisyzt0XXcXxDuN/YH
 mhxi8pIdgOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1UePB/9divEoptM9vQNCxc18kAVQN3qANEu3nhMR3r4BSfaNzPAgUOW2mNme52A/q2gPVBSnzf9
 ebr/ZjBmks2wcDwW2G2cOA8QHgDbJNdyGZxYRZb10FWI9lZPabLiArqIAFpeeVWK5qKPILTipmO
 3Yg9yyurABK8qpLUIxoUTtfJYwP42ZT33yO2Qy/cSCznvwZNq72XvTwYh09swLDXM0wv+7kRUUY
 z7Gb5CR8PPJKhkq7Vv/X3+HA/zwAvqplPHATfkcNdqltowoMh71+IS5wuGYtpTqaQsZp1deBanC
 xEmQoHpcBTmRcZ1XwWEMUFPeTHNgFqBQHTbf0WXLyu1mQUou
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 34k6ji0oAQEh8X_qWvtLLW4YfP2VRIFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfXzeT1/0ORgB/W
 jUgNcExgrq8D3jEJyJ+tEMVQ0uF1EYaEDkAeFqrinhNwb6hGtkdV8FoYd2G68BbhS769xS48P/m
 rQ+R6mHKwk/pV6kya5SM5yyVFiHUkFpIAwK+UJ64dy/vR3dtHE4GL8NfbDnomJUSpl79KF+TmG+
 fH+wQeLIM7G9jAQL7y9+mKbgrsbsvEy6uSaaycUp9LkKe35VUYBay4KBEEvR3xtr2o8lXxJIjTx
 gNi8KLzSCc+OC+hPmxLPdd3etn/dwgtGm/z2ViNuN+X9e1ZHQ6GCSrQVJVIMBIh5ruuCEK2Agvf
 EPe3u+rYYmcInfSK0w0SJE26mi6LaKp0Gf1OuxPffKpohVpJq/ASQaaEw6qjSHsvx7xXBmaQP4Y
 DkEVnhrHTpFoDSXhr8o4ccDeAn9AgQ==
X-Proofpoint-GUID: 34k6ji0oAQEh8X_qWvtLLW4YfP2VRIFb
X-Authority-Analysis: v=2.4 cv=dP6rWeZb c=1 sm=1 tr=0 ts=68d8f0db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9qaGXxVFTICEpRVd4z0A:9 a=QEXdDO2ut3YA:10
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

In preparation to tightening driver control over generated InfoFrames,
make sure to warn the user if the driver rejects the InfoFrames on the
grounds of it being unsupported.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99a0cd4259dbacf5f5f6651ff8a0ea..e85a6cf6e67232528861521bb21251bfdce6f8b9 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -920,6 +920,9 @@ static int clear_infoframe(struct drm_connector *connector,
 	int ret;
 
 	ret = clear_device_infoframe(connector, old_frame->data.any.type);
+	if (ret == -EOPNOTSUPP)
+		drm_warn_once(connector->dev, "unsupported HDMI infoframe 0x%x\n",
+			      old_frame->data.any.type);
 	if (ret)
 		return ret;
 
@@ -947,6 +950,9 @@ static int write_device_infoframe(struct drm_connector *connector,
 		return len;
 
 	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
+	if (ret == -EOPNOTSUPP)
+		drm_warn_once(connector->dev, "unsupported HDMI infoframe 0x%x\n",
+			      frame->any.type);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;

-- 
2.47.3

