Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AEE3932C9
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380308; cv=none; b=KD/dwYzRou98MFjpQgHjwPlt15tr8U7KhcH0ZbRWjxxXnGSyX6Ix7VclgPa9BKoMb4ImXIk7OLwCebj62vEUjlcZEkZE0Wzw1zjzMF0Ei4Ua5AGjMuOBT/TTbRUylX87nPMHUXrMb+FHApp8tPXbSDifXb/3gl8ddetl+A5HMjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380308; c=relaxed/simple;
	bh=vCwMOyKhSya1QsNSc8kio0O3YCBUNVMjPg5E/k/BEuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwtlLRyRBVNxrlgI3tr5Adot0EDaPdWLqkKt3gFW3HvybVz/Bsqb78wPm8+BA1NMO95P0CsodVtCBqPKdrDiB7v4C5shEoQtoHYMfmNiNYPaeu9jvG5hI0gc0MjX7b6uoOya48tWoGcpBgGK8mY8svsHsxIdipTBkBb63Kgi0+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5T54Ehs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gW4xlKzh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5T54Ehs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gW4xlKzh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH8h12417708
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nQGNtigd/fh
	Qj8k99E1cXDjPd48Xc/BcsE7CCfKWZIU=; b=n5T54EhsFCac0SeU5D97p7M0YyQ
	OQP1d0SiagH2QmIaJgTg0EzJqAasz7GbSsSPgUw2R5IJKN5KyjDdv+DO0Rik54jE
	Bw2ZYVdQ/cPd0iB5Rya3x6gJSo0zOOi5xs+R2+lI1ZraYlDfpII2Kju77CMQhqq1
	kK2P51HgZ7pos/Fkkp4EMGCSK6kQA/B3WSACwICogt3xvn0rRFQCCjtomCESoywQ
	hdJHu110huHjIB6qTqqapo0sKyxDfgmizZ5IWbyX/yMQ0sY/FvNGJGoNx8oXqqAr
	mXJHiTmzb2USb616HCS79zAQNlYwqyhwmVHKR2UWQd2CiF/orhDCnJuwgcA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdses6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:18:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7151120d6so23330565ad.3
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380306; x=1788985106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQGNtigd/fhQj8k99E1cXDjPd48Xc/BcsE7CCfKWZIU=;
        b=gW4xlKzh6A+1tp3M+vvej888Py1FdeiTCXnJ02THd6kj2a7mrnwLlCXN6bWsSuTxgN
         poTsm0JfzKRFS+20RjEIQp5YCOxoU2cRylTG74CHYgfhgI1ZCbxUJFHBEDfPUSObXjfo
         HWOe2wQJQg02ZwEo1rMAt20MUxJuHu7w+FPlfNO6G1ppbrMehW+vp/41wo+ql8A4IthU
         yJrp8cCwPNjQkA79spg5RfEzMSpbigLuOefJQQDGhEzvy+lfwdH0CM4VYjH0Ki8S+ojx
         WVNunlIuoStdbaEd2XmNF2j6r236AEkUzT74b3VVk0cnBL4N2nc966Cil/WJ8yaZHflv
         fZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380306; x=1788985106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQGNtigd/fhQj8k99E1cXDjPd48Xc/BcsE7CCfKWZIU=;
        b=iD8m9cRyk5lcWdhecac2Gs3M2BFjNYyhVI93eXIRLhjhig6P0ZsKTDqBfGqY53T8Wu
         f8yyucSCRNjxJ9KxY3CNaJjGALieItqotxt9AZXJSPy2iwBvgi6Ql0IXQSYl3vIAw/Pa
         r7xxx/pcrDFrNjmfgOLw1g576GfHXJloP74nlcbfvIM/IbsvgyqhoS6FpRuZNo37Gc4a
         zi6ei6fE6rSPcFshTagFAI6bvn+a2KTrRrTN71YArCGQWpVOMq32Q3ojNaFb8b2HyJhF
         euQ6oGesWGIkA1BmNlsMQMG5mD2Qp02VcIQPqbMXmHjWWDzjVCLdOG5vgaAo43SWqyRW
         xZ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwo3q7FmG7gZm9VvHXC2LL283QhO/mbZJEyR2BCdwrx68lLQmKclthNR8PQwZK0JYU2w3sQigg4DK/gQQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nCUvVU6bkShBNZRMsrbBczwQx2wh8QK65jerRXuWkRF23nPEj+
	E4XbhRlaifTE6pWg5R2wXBtBsMthuimaocFBKODHUeOsZQz93kpX59ewnEJL0ZrkzG932kHmg/V
	Omxn9v0VsNzpx7W/mSdBxCqoma2co6RhtlS/8osQLdFWdGdzwB3ZHg4V12oKmvvWoKA==
X-Gm-Gg: AYBFou1U8CeVnH7cIXPm+85rBQYvXIN4Kenb4jZ4iCtjg6Osvakhdt3eC84kDSMehv1
	KKD8wBOiK3pljP+IIzhrwWp6828GNhsBQ5jk8zbMnPkGXqvgPh/rhpPG+Vj2J6jWQpBDddBWVgf
	i17Y1ExCqe9OsVGpFwAG6n2NnzjwpmP4FAAqjfWD7+refaOvlTwWM00Vlkyx4vlH7sQBRKDYifq
	qq1G5GF6ZF0Domwxat3M5g79rFQAsPE1jPwGaCTdgXRgldgu5uz4JYGyyelja/5lLNsV+y9jqAI
	Z8NDOjew26/0gGOED5EiKqiDSxfFAfq7RO2QYqkNwY7iBTWbAQhVdhx2lcmx0d9vw6F3hHnxO5o
	91saY8tZFl8jMw3MbmpVtShs4D2Y=
X-Received: by 2002:a17:903:32c2:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2daec646e99mr78475835ad.7.1788380305622;
        Wed, 02 Sep 2026 13:18:25 -0700 (PDT)
X-Received: by 2002:a17:903:32c2:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2daec646e99mr78474985ad.7.1788380304847;
        Wed, 02 Sep 2026 13:18:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:18:24 -0700 (PDT)
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
Subject: [PATCH v2 11/11] drm: arcpgu: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:40 +0530
Message-ID: <20260902201640.2024648-12-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a988492 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=lEtn7xO9CsvGDZioIccA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: GwN9vNnc0AFk6cZRdG2TgpTSpzTaIg7P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX3cupFlk6hGBA
 /BC3GyzkzqU3ylBUU+noXkMfAX99kA9xFu0BdLQXZrSh6ARZEuy76KSvnCJlvNKqDwloAaOHlE5
 FX2sQrUvgT1lHdthjjLq7zZk8C0Qt8E2Htx77kVYV/h6t3aASrrMruwc+hJEKxXoGF7fjU3kCqq
 JExsSMma++R7PKLkU/xNJhhSaFMz/d9fhRcnWZhWvvSZEdNfL4zdqrsWgwGPi2VQ+P+9NjTpRZA
 BibeMlgA9F1EYzeN1FEVTP2IDP8Z8oc9W4ZYvNeHvqBI7tc1gvl04MhZ5lQK3DoC+J8AxoBBTfW
 gE7dfkRtINee2fKmyQouqVaoaEST6rUSvfFTxZ8vo5Zn4k3Wsjjp9U3Tu2tZDePm31PyaVayLii
 xQMXU/mFDJjZ+v0A40gny//hOZtMhpRieInKE5ktNabTTL371uzzPIP34yWtKITC/83J7WEcIXB
 FmT4Z772JFptxisPoOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX/R98X7JwZknn
 ihhSONwM2urXhvVXLvklITU/LZ2isxrcjuJeMntqu7X0HoUB+5ximsdON4FaDiG0HIk4p7oHfaB
 +zYsGUvGOnUYFsPBzzeGqOx/Bxrq9SE=
X-Proofpoint-ORIG-GUID: GwN9vNnc0AFk6cZRdG2TgpTSpzTaIg7P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the optional reserved memory region is released on device removal,
fixing a missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..fa01407570a8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -278,7 +278,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.55.0

