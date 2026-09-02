Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85653397921
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380250; cv=none; b=XMNtM34F4LpYd6bEHMvdWX52r9pZw7c6Byh0iK0y1CesxxKNSA7thZSK60BsoPHKJNM+Dh62ggjgjzU6TpUmJdbMfrLMARh099HVdjb7MXzoL2I9mUDVXW5TBFD3V26IQ7+bniLIOiXi65lPBhgTBN1UCQhQtKaamNPoCwp/Lw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380250; c=relaxed/simple;
	bh=Nox2+Biob1IFc4ylb+sWvoF3fbrjOJ6ecXJO1gYItxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPJhyIvUDJLvFl1MqvOcc0Xb9CtrUIWu3pkH30wZtjRI78VDqDfbdIAvvs/FB/LClm6cGRhJLORLZf6zHNSFhynpag4Q39pfCSAhcWaGiJAq52Ty7wz51pJA67G5VPprJwYtSDCgx7pC8Nt1qgbv2xpMTfxvEDkQPXdnlg1JMKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHASjO9n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YuxeK/vu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHASjO9n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YuxeK/vu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHAOG1962701
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+W6tpccLyWv
	9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=; b=cHASjO9nJpDVndRqPqR+0ZBZe5y
	S5gqMEV2gnPj4s3n6BEV7NXgRHhdxo2t0J8shBsPe84l25uRRQorpCDeYPC6YnSC
	OKft0Zbq2yoHiHs58iPdkdcmhbsRlnMhwhCK6oxRoW38JR/QJC+pBGyumeR96CuL
	eKNmh88z2yaKScZqwLyJ4LQFBMLCggSJLOZjPef0vdX5LM0qiJrez8p52ZABeQ4m
	fH9g0Es37j/K5/wBfk5+csMuAx+ftxFpWvhK3647Iizdm4lZLTNWKEtdJr3OxbGA
	ohXjXcbEau00q26eI9i2SFV5O3n3QlU5c+RrvTAgZrmy0HdwOiQpjGX4dmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4srq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:17:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so2119848a91.1
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380246; x=1788985046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+W6tpccLyWv9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=;
        b=YuxeK/vukcGJWTw+1abIY4T5HZ4pWr4lNfujfIIUEUHZaObAWfTfrEgN2USuHuQQEI
         10+0Gne7hCW72HHf8IF6uZRMa/J61RXjXrGrW27pyej/VJvR/7udlGde36emJC+jbnC9
         8tyDZRn4PBuzlECTCgz7EtlD77cLeKw+3AEaH48dmyydBP7YshJsmueQNAdUh+dV9QSE
         mHyKRECGUV6VLeb3dpleXhZc/Fwp5A6GCCRWvS+8D4j2qSW5/UxQEHA8dGxO6rp5i2oK
         M6LhvlBxUoETEqueJAljzKwChJbX0Ag81Iqps2ClDISWEdk5Llzq51m0AzJ9x5rRad/S
         VxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380246; x=1788985046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+W6tpccLyWv9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=;
        b=qVAMCbp0thvzVgHloMWmOojJ2Vv0cC1uGZA5oZWBvoXf3iyyxJn84EHwq+n1iQ/xH0
         n6bqmuw8NYgLlJu3yNlgyjjjdI9w+xvhWqnjGl8TxMb9wsTDp8cJGcJjhdpay1qws7vP
         OxsMHoIG+bKGM+01EyoJ6Q+UakD2fAS1BfETDAGtTUkHGfxfZf3GQrhD6f0v9SebCcg6
         NcnDeKDNWPvmhK6GzEYds9bp20QfnA2CNWgHUuufhFsRpecTspWDSByTqa1z3vZAgEU2
         FfO/e0oE2nKDzWfai8i6o3CtDKpG5HvA2D4hnzdH/Cvr7K349KLIgigLKf+cCjL3mchX
         Ebrw==
X-Forwarded-Encrypted: i=1; AKwUvBw+zBW2tVfwwcxpx7ti3eqG6d3ShMUgWCAe+jE81ujfBqRGoedcywyQLl744vXcwyIdOz5niYL+/6ehmw==@lists.linux.dev
X-Gm-Message-State: AFuF++nvkvBR2oIdsQo/aNQLLQBbJC8Ycy1CotSo8N3CevXh0GY3Mue+
	XxGek9Hz3/6idXJyrTeBccZmACViPBYV9s5jNymYMZuRIzRzlNXzhSW2oFnrlQar92fCf0AkIPZ
	t1uJnsAjaj5enV8YCPHpceHbDIBgIRRno33MVwb0z/lCjHkwIwxPVLOTe4i/R5juZeA==
X-Gm-Gg: AYBFou0wHvUVxPhGLWm6aDpqAyci1adXcJhejFW7G3CHcaYX+blpffoOZBPQBijMRqW
	x5vr+BGc1/HohnfnKObiAUlMryIGM7iv44Otn9qLlDg4XEeoLDytAHcoKRaGK4PUZOMIk5wkWoY
	oxaXPUt+Qp7n462C8jc7GGn0zxy3n1ertdAc9YonbdugViBF0pSXMJr8qdnsbSqeDoS0BDBAsUu
	QsdRAMIulN0VyC+Ixcts+8+4vNZlzV2bST/pTtvi0yD4d+pGI5go+JqJa+wtbQaXjn5t6IUb4F0
	+WYlv5UzQ1wGISkekVLNeTcoudtcYnTbdRr4z6WaFigcr63Bi+PnqKMrxaD67Wm0FELh7l91Jc+
	pf2B7MbLcXgJuOuguaP5GLrjow0I=
X-Received: by 2002:a17:90b:4e8b:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39aedec54d0mr11465787a91.5.1788380246174;
        Wed, 02 Sep 2026 13:17:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8b:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39aedec54d0mr11465704a91.5.1788380245604;
        Wed, 02 Sep 2026 13:17:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:25 -0700 (PDT)
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
Subject: [PATCH v2 4/11] drm: komeda: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:33 +0530
Message-ID: <20260902201640.2024648-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX+OBVLY1Wjq7s
 r4QormK8owW0F4eNCvWrDLi3oowMc6Kj3XGNnoO1Wg+/VLm9OARPIgJI8Yc/ZNG2KUwZIUu1x04
 CejWA8iTscdb2xXEXV1WCdU4Q+y4RfdI5opSqo4fftIm3CmiLuosnBYAlpFE4n3wXsnA1y2JYSR
 uHBrKNg3rrRIHwBAOFR4I6t5+3hWEvSaKQWUDVBc76PZfq+ZKRLjBhtUbHar72t8XdKN0Bo1hL/
 NuiyT6RyfyAQ2Wr8LPbqWoIa10QZANGdDdTnZLiN0JjiiooMSNzlbVRu+JeDJSALbofqREa4ZiR
 u/ZZz3ZJpAhbv8il6G6VOQ8CKm81Eo9i4P1qfc2GQOZj+XnHOd8IDjWz5WwDCcjPQzyOBmqhTMH
 6ZCaQqCSfSogIdGBJNuVa67+0qbCQgYK1xxNbOLM24ArA0zp6Vun6bGz8z6lCItvs9Q9GMnTotN
 iMu63Vrxgg/o2b5NvEw==
X-Proofpoint-ORIG-GUID: R6sJKl-D9r4AUkrk69PkkYz9Bfm4WEke
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988457 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=8sfNmL5Et35J21XlSqYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: R6sJKl-D9r4AUkrk69PkkYz9Bfm4WEke
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX9HC+UAIEUOUJ
 6/J0F+jlsWI2QKr/gFYwxQ0EWzNv4gtA63wponA5IQSn8167+6c8PcQZMvTEeXv3GKJHxfGwkb2
 +tVZeAMZ9foT4bkzSHpnI/DdcXj0pY0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 9aad1d1d28ec..8016f5a68cba 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -145,7 +145,7 @@ static int komeda_parse_dt(struct device *dev, struct komeda_dev *mdev)
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -292,8 +292,6 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 
 	mdev->n_pipelines = 0;
 
-	of_reserved_mem_device_release(dev);
-
 	if (funcs && funcs->cleanup)
 		funcs->cleanup(mdev);
 
-- 
2.55.0

