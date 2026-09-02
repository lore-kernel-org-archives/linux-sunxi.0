Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444A649CF39
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380301; cv=none; b=VDNW0vEUATN4vujCP/pD9Rg/FlMFxdJgIZ1VNo/8bNbS2hkSmekoOTey/pV/nUVejaDxXNEkDHa4W3WFA/eC7Xhj2vQ0KnNQ2tow3DhUjk/T5G9tWDERb7M3iyQbv5FoNmjfC3ZviT5z/Ip9YSYi6GaBkhIVxkZHq+jX9UOuZ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380301; c=relaxed/simple;
	bh=rCMWHNOA5HoO5RmOOcczDfLSmfIqCDDHYRNI56qgYo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtwlhN43flQBOIE7XGKkfIZ8xL9E9bKurlKHPUiuAB49ZjWXrh61Sy40BA0FNcw8psjHNfIByJQxn//MmKPlRYXgP1YAau3nrJI9jtj3Aofpy6neSDiObN0ogz2uOMezQgcUD6CmOsUPhS37T9sxvtJHKkftoD/hWUqf3KIVH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4/xxysH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixoWSifJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4/xxysH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixoWSifJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHR7x3044797
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c6HQDZCYEIM
	syPfEAWg93U0OzA1bvoHTLf63dEO3qvM=; b=D4/xxysHu6h5JqhAcumyeOuS3B8
	W8HHU0fAh48XcC6p1FWpCc2Nbh86TBNshywT7oaRRWlnNNGj16e5t8MJkIl0qkg3
	QlE0KLApseLXQGMF/TkpZph7x6/qwS3VGBhQ1yQaaay0gsb5lbWSfZKY5MwXlzPO
	SWK+FZWTmf61Vr2egMo37bFGQmD2M08uWW4WJWts/XSXmNiEpoWQj29wYB3AnRMG
	oerW2EcPR842lQMgQNkheGBnvx4wVE9HKfFPSaEy2lHtx4dN+TadUgisT0+mDKZf
	MpZfNS0m23xfe+zQsYROXrYO9VBk7cxQv3AEwOItzm7SU2pEAXWFA+pi+RA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2tbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:18:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2198569a91.2
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380297; x=1788985097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6HQDZCYEIMsyPfEAWg93U0OzA1bvoHTLf63dEO3qvM=;
        b=ixoWSifJnRqLIBtCw/m8wB4ygapKeXTSXNFuBP7rpLVqjyS8Wgsr8NkQ5kuDaGhBNS
         zCu5yqeLqw6EVPs04JxBDnmUgz1gX6L3gMZ+hbEJlLxMTG12AtVoEGW031IBgxg4qBFa
         nRoJcprbN4Oc9IIxSWPgjr8ycQrQCo6M8tHAJM/d6q95LZmbUdu4bM+pThsFF/6uSKVR
         eAjL59MfQMBW5F03usq1QxJrOihN17XWLTw9WaqskBpg84qsOjXXZSwOmN08HnBUdlId
         ftQr1Xfo2zeFTA1GhLTKYtqKz8WeqXjSSUId+2na/wKuJwS+WrmSHNZklmkFy6xiEukG
         g4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380297; x=1788985097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6HQDZCYEIMsyPfEAWg93U0OzA1bvoHTLf63dEO3qvM=;
        b=VHQch0I+trf4qxvjJe988eaztFq/hfYPTA1QzeCixaUFw2JFi6o/nLSlYUiff6T0kg
         mklPTDjLFcCQc5AeAjYtNvdPOX4XnzrXHnJL2fVdYYVw1HEoLzZEhnKtXYdiswg3i7dY
         7KdHnpem+STqyla6SqPLVU474S94Fy5leP9hS10DQwLOsNNv12E1hbtWSuoz2z66Zagn
         3wYncsJat5yK9DNeklLn2TTaO1vRUQrtnEzz3OceeuX8+OZREnESxMRTLwpxmI7tqdB3
         7rJ2JACFaXmMLpcXe+TAI9W15aBbq3znwL7oT5rVNgND+qd0F2AnGtFRU+/NrmxqLThb
         3r3g==
X-Forwarded-Encrypted: i=1; AKwUvBw1zhrTrhXr+hdmorV0NMX0CKs3zyaZ7p3mAyNCyLz2MoY6MTeR+qcLj75VP/DoYTJxcKdSwbGkVnqywQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lD0XHMQtEW1P1qwKTSwTzReFRsnCs9VfIUkLJ7uzQMNu+KPZ0U
	LvlbA9V72/5x7xZofB4jgrMoIYG3CrKwwmRKhin1xyIvAV5izgFKdTeTOkDhBmSzDN0TCG5Kvaq
	K1lzkBOCUby2/hGknRN3wuU1yA+fGv99RQ0xL5/CIpylLijuEE1pnOSHKBkYYNFO/4g==
X-Gm-Gg: AYBFou1xDEjpx6UkLnSl8ip6ZS/C5Xf1Ua8fMShL3oProGM5ADZasrRxqN7YM9Iv5Cn
	LUBUMa/8h8my+SpQPZciO2Q+8nUJ43i4xE3e8Q9fj9/98xBaacryJVtt4ZQ0oVH/s9pbAEV9jQu
	ryhu99eM0+/j0HiSK5UAhhQgqHmGhq7LB5kX9gW0Om5E6ASsABseQd/FPXX2gZ8tuRVTZEToXR2
	2NBLeWbPOC3TCmrLbjX0AC8UWgCgDO8lQHANkcFcE1UR1EtI20660I3n1T7R/47i5Z0L89v8dhe
	XUE3FEIhgafdW3c9j/243OFKtwvj/QsLbe+SSzg/lrmouccDjp8k46LbiyYnAYsJUH0nQxGPVit
	FxfE0nejXctJZhNGQPowrNr/QPWs=
X-Received: by 2002:a17:90b:33c4:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39aee178de8mr9152938a91.21.1788380296969;
        Wed, 02 Sep 2026 13:18:16 -0700 (PDT)
X-Received: by 2002:a17:90b:33c4:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39aee178de8mr9152869a91.21.1788380296440;
        Wed, 02 Sep 2026 13:18:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:18:16 -0700 (PDT)
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
Subject: [PATCH v2 10/11] drm: aspeed: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:39 +0530
Message-ID: <20260902201640.2024648-11-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a98848a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: bF0x04yya53PRiIURwuzLFYYQVHrYcem
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX2sfguj91HrVI
 fD6KFn2MhWXv31oe19TCIhiOO/VX4M7XQ0BPy197+EnWs22my7MR1CYLfIHBQoHu2nCGbDIwNNi
 G6+WfAuhg4AwEFtlbtYEpFt1dJ9tUeQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX3sEYF8rbN9PF
 SSeZdQ3DuBfHo+MIEuuiiVqbeABS3K5ZsqjbSjOI1gQFuQSulvYuOU3vYXAnxZN5jqVtO0l9rPr
 mYCt9osAesLyxojZ+W5+QyNUDC3g2oqlZ1OZN7JZHSRKJRFDYKq0dD478QtIFdYAYdExsCFtMd2
 py3OCPsMpHcMsmMfwtiosJBTi3cTIua6KjWTd2TXtBEH7g61YsvhmDdtgse9EYVw3Su6ze/Y4aQ
 BaKoEzXQXkEZojkROPUT+3ZbSjTnlKe8P1Ag2Djy2wm+R+tTikKzd4my0C0O3fiStyY1z5RL78P
 r+8Q5O9dmz78WLd6PLp4V+g67gIi4RuH+tRAjJzE2VYpdUk8rrbM61iMU+23J0faTO5BDEGNDln
 Cp3Xavb9NkxPhdn6+dpcE5hDHtcMi1fQ3sEM8TxbP/iu3Yrm6R0b3bNcmKI1LEJ4jJR4s4CJyjg
 BcZFL/FF3HSDEwLGVRw==
X-Proofpoint-ORIG-GUID: bF0x04yya53PRiIURwuzLFYYQVHrYcem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index d4577663a1f0..2c7e54fc35d9 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -168,7 +168,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 		}
 	}
 
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"failed to initialize reserved mem: %d\n", ret);
-- 
2.55.0

