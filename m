Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0249EC43
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380267; cv=none; b=J5u/2wV37JahNgIUIKqCljYnHeZAVYGfIrFPJXVfp+vpXBFvSA+jKXQNIrsCwlmf7DbNvAXWQXL3ARoTrgCwMDTvSGu7XOlevMjINQVbI4LCdkANLUXSRonlh1daErTuZ6YGj7PmjaxT3L+dV5OIguxbXoM84+s8kC2/fK3D0u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380267; c=relaxed/simple;
	bh=PVLdiLQ5xZ8gc6uzI0Kh6sEv/ejbkD6L3+C7HSUUoCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5rIW8uA8Bk2BRH0ZrGsjRNltD30Au7vWqEeG5RSgK/eNNeNz1Ofcxkuo5g/C4z1juEeHZ4f19N1YnFs43cnxEuetrNKlVtv1aou1ANomNtkzn489HEcJIg4lltNBiOO5DowL72bi7X8HF0z+yq7GJAotmCmSsw6mO4ATi/9ivQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ow90BtAB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUldOBq2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ow90BtAB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUldOBq2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHImn2686283
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OK2sFiDhiyR
	A3ApBDHP+/4IoRs1xWNu0WL+tMPWx2xw=; b=Ow90BtABdKWP8vEEbn7t954tODk
	ed5Gq2vRHg44uxceRgHe+MUJEVNrD99ap0s+2bZYF6XW4NoSCd8zgBNC5nAGSu4p
	BEjjuyFQtErp+hmYy3jBNHnfMce3vvAkcX+esB7Sb/tXiw2X9y4cjF6SKw3DLHZD
	LjpyC1/OTGudejH2Z3Clr5w1WRSCPAn61zsEKZHauIL3buq1FRd2S88QjK27Cv27
	QKMF5hjaKuQhKS+hftXVD8l5aYHH2MT/ANXSyoK6bRvttvI/SpMvtlbBDv7W1Df+
	7juJZTuSyv1yUuJ1cMkdiFnI+aJnGWEGzf5C9bKdKtLgWIthSu091fT0WCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a858-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:17:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968dfff779so361319a91.1
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380263; x=1788985063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OK2sFiDhiyRA3ApBDHP+/4IoRs1xWNu0WL+tMPWx2xw=;
        b=HUldOBq2dOAxFc6X5VrdJ3xtKfAMny5lLwH1W5w0fpjygzdYTeoml5BKE3aMa3oVv6
         9dLbKvYPP4Wj8G87rcfVsFWPX2nq6o5OH8V3w4BEic8roTWA1hZ+ilIvtF2m1QyeX8d+
         2TxPLbgOc/oddk01fBxQK6V5Q7zSoDlCiB2zyZSLQo0nxe8pVrqNgS4EHd7NKOFHsxy7
         gFS5PWO3cXnoSNFbXFX/AJQSfP6aAhPb8JX3bMI2qncPBFs06kECoQmPVy/Tjdeo6xi0
         afYhm7kQftd8cZTBcxohjC0XmGFQqtDhIe7/XfnaaBQIGS4Gi+7nTe1s7ybqr3mMygee
         7lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380263; x=1788985063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OK2sFiDhiyRA3ApBDHP+/4IoRs1xWNu0WL+tMPWx2xw=;
        b=E1b1ZcRIwUa+IwgZMmwOUzc70COVcv/rBRwUuDSwlYZjWi3w5qi/qCiwV+YfXl1v62
         Qy+FtrTxLbSSxCmX6M8usfW/SYCwqtu9pdA11ISQP9gIi1SNS3Jj9YqYCxNtq2uazPo/
         LDQi6OpuS4cwB8L9TrLXUe3CxHTaKaBczNubi7SYXn+PzaTgQTEamDcXxTAkYxKbnIoe
         BRDXc8jV7GhtA+VQtpi4wYd7eGXSWPXhoIfo/qvoIndFt8yoPrgPu5ZvTlfyWQPZYzQ0
         /GYTj8oHsWKqSXN/QtVp83PkfNw4UmgjHtyzWfwqvSA9jAMVQOZxE0BIvJAkK+nWPm48
         mKdw==
X-Forwarded-Encrypted: i=1; AKwUvBz5MhJbXlUf3CIBAK+ZEENPfS8XehEKxmf8NaTvRWglaHR7nFXAs4MQdlxZm++tLc+WvJ0jt3xYBXBH6A==@lists.linux.dev
X-Gm-Message-State: AFuF++kkQuoob/RCyQ9vkzzMYbw8j7Kw5+oMQppAJMLswaVV6l+aHiPp
	uvhHgLnmzs5VnAbppt5HY9S/PmA+cvr5pyK6RN8QJfQ1CV27IMXUKe2NA0LcMQDNxcKZe6oLnzJ
	6xS+g1hfM5zD0w7awKz1efYjjgx2zA3+1Cznzh+9blwkxvYu/PSFjuYosxYECyNwICw==
X-Gm-Gg: AYBFou0DaRawoYXmFr0HJcoy46i1QmP9U7pUiaclGfrpeKI7w4QCzqch/ULlADWwUds
	ACrTtIAPremZUviQlFzf2Xu6AiiwDaQV1F9MFHn3OtsGhOrAuUUWmkM6r84+CrBNBfTIQFkFEXd
	qwqa4qp78+VIgIVg/ewk95E/n8Hm3BlFULPNVc2tQTI4Ac6tMhZi/mkIymWTnutL9djdy5R4tZi
	a4yCNTay/0strJTRBt26IQwTX2kJQlnDvMnyj8YPO07jXznB91nUDaJb9AHHEXnZ7bBG3NUTZ1D
	tjhkZE+OwcM8q+wob3oIKWF48NpJclXYvp0zw7K0LZVItetGglLIqTmfqyj+Q+j4BeUE+VC87M9
	1qpdD3Th7Kx5k29ZiK2U0iixUluE=
X-Received: by 2002:a17:90b:5804:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39b087e4c2fmr1678992a91.24.1788380263054;
        Wed, 02 Sep 2026 13:17:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5804:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39b087e4c2fmr1678920a91.24.1788380262507;
        Wed, 02 Sep 2026 13:17:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 6/11] drm: ingenic: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:35 +0530
Message-ID: <20260902201640.2024648-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qq4BkMCQcLMOH_Vbs_S0hXPTZ-k5I3pV
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a988468 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=ER_8r6IbAAAA:8
 a=EUspDBNiAAAA:8 a=iWCwWg-Lr60CcT_aNAIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=9LHmKk7ezEChjTCyhBa9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX88erxg4WjKIH
 jZ/uEZkUhMAwHFm24aR35e1ZNf8htDtoKI5uJ7x0YI5LYkY6uXc5Ewp/Ot8blGAqeNHeldX9H3K
 4yGSWRk7PfOY6/+PgOIT2FIYoySEI3IvTspzuuOBtRrLvCFYNaolPm0K1FViPFjjeDgh8GOKOSX
 mNaOzOoAsPmI2N7t/3YKRnxVQpbkBL1y/6KYvUKExkX4U40lqzPEDcI/xfQ1ixDmCqzwDUZfyyF
 +agj89y0EMPIuuRxJqJgbdi5Tx03g8J1zYMCB9F95OymqA189hIlBvZgMIG40ezaeWSz6uCn+8X
 7FYdS2s2LqcWxxmqgZf6I9T1I4LI0P8G0PrUBuo/sBb6M9s+3H3OesTlVz0a0WqArJzYMhwof6z
 RVS9aClbH+dLZGAydZAo/CNG+TaJyqrF5ft0KrFIT7i7I1K4clC+BlQUeFSrGSygQZn8XQkBKGi
 lsZtMu1fgZAi52Q4wbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXwpvWViPj8W2I
 Ag2Zvn544RIZSj5KbrS8ZAbDhFllfTNWP4hsvXD9GT6Gl4E91CxGydoyGMui0aVsNitVnFc9MDf
 v7XUezw65alzWTjoBQ4nEAZo+Ib/F80=
X-Proofpoint-ORIG-GUID: qq4BkMCQcLMOH_Vbs_S0hXPTZ-k5I3pV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Replace the hand-rolled devm wrapper (ingenic_drm_release_rmem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource
manager handle cleanup automatically.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 738a80b2550f..2c4dd6ed2d41 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1060,11 +1060,6 @@ static void ingenic_drm_unbind_all(void *d)
 	component_unbind_all(priv->dev, &priv->drm);
 }
 
-static void __maybe_unused ingenic_drm_release_rmem(void *d)
-{
-	of_reserved_mem_device_release(d);
-}
-
 static void ingenic_drm_configure_hwdesc(struct ingenic_drm *priv,
 					 unsigned int hwdesc,
 					 unsigned int next_hwdesc, u32 id)
@@ -1127,16 +1122,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	}
 
 	if (IS_ENABLED(CONFIG_OF_RESERVED_MEM)) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 
 		if (ret && ret != -ENODEV)
 			dev_warn(dev, "Failed to get reserved memory: %d\n", ret);
-
-		if (!ret) {
-			ret = devm_add_action_or_reset(dev, ingenic_drm_release_rmem, dev);
-			if (ret)
-				return ret;
-		}
 	}
 
 	priv = devm_drm_dev_alloc(dev, &ingenic_drm_driver_data,
-- 
2.55.0

