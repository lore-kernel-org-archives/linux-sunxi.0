Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E5A4A92F2
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380284; cv=none; b=SGumQ9WXYNGMxlcNuspk50bTm01XSz4yQ30ptE2M1NtrxsBQjZhA7mc1QgFRg4/924CakrrXDIi7LVjBLdL3F7sUK5dcz1pi7zZtvpzYwCrKYfcW8lphG7bK8hYVBiYDV79VfsgGLJlmnpnE0FeWetkMENMhTQ4+x3TCF/lpy2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380284; c=relaxed/simple;
	bh=BbGx83iSNvCp536MoheFEE/PPvalDkUxDExduqCwNOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGAAo5gPZhVZ85BAJVThOfpfr0ehuzMisGqeUelOMUSAGo0gtCHTBcL3e2+HhMoJGSbzSyu2WEXAATm1fup7CrM8/lv1kBEVTOyXoewElwESXPcZadBvSwbxrtDAnRK4aL58N3ZaH00X8AfJVlvGfSjPC0txxyXERndTE8Xql2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqM8xg8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTK4aG/m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DqM8xg8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTK4aG/m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHJEj2524076
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dWK2/qaA/kg
	ie630momcYQ5e7QWvw3Fh0xiIUnGJB64=; b=DqM8xg8oAo4+te9MVkPE+2hkAzc
	jz5r9PJt3nDNOGMwdU/VUpro8XOtp3eHfX/u8HVUvQbu0LWCEtcmP5SLJcrrGspl
	qazsvC3ud6osB0K9NzaAEcU1rjz6QqFJugx6i+mrKgjMZBnECm27NB35J2zRSf9S
	XRpbNtmaL3xkSniXibMGlZNpXp2wU9GMSD8oBDO+O6J/1a4xYS7frja/mRQD2adV
	vr8uhDaiq5bxg56VPEFx5qdC8a7xDrgaQ8Qq8lx3ghdriTlbu0dZFSnmhEbgKYmB
	ya0xA/vAO7hnVf9OUZWz3jWUwUoutjgPdxOR+DWuQPLCFALNsgr1aZPu3Iw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s4nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:18:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2394005a91.0
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380280; x=1788985080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWK2/qaA/kgie630momcYQ5e7QWvw3Fh0xiIUnGJB64=;
        b=jTK4aG/mq4wHaEIQwFgog3oYyUGHpsITCyQWlF9YxlUYX32C7RC9DhWKti8e70iV8f
         Gk39XjfXrpG5LIW4nhUyPsYHKVJ3sKQGZvoMU4plgMwGthSBYS5C/rywkI4nL40m3gMa
         lJtGqvf5az3gDbFfZSmqm5/vqJCUrUkAIqWnHJ2FYrNoFCCnuUhCG5izODq6tSTjtpuN
         I+KHbtQYcUf7gtTJgqdBJynfuCmE0mQmTiOAA8GNq9kU1nT8AgWLEwmqPUHYDHktBMEc
         MujNBRzKaaAIx9UWBUShouZy+Bd2M8bFe6bfG9D/rrwzo1/ehReqKwfrNonX/mW5axtn
         BxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380280; x=1788985080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dWK2/qaA/kgie630momcYQ5e7QWvw3Fh0xiIUnGJB64=;
        b=rYgFEfWmlSNeNQ7kjuMXvp3OzLiudjLAbIJCVEUvYODnYoNv0vCJUNK5cr0HBQeTTN
         ZtVOFUKlKRt4fCqsAWSIUMXdvr+3XETFlaEZTlQ+Cn3bq/9q9/i53r3DQsFSnRoMxe/h
         Rhr5RNgiqWBxyXxTAn01m2DMNJzVrUt4NcWTMnXF5/WnFJ5C4hCp1Kyvd5jGgUVvMtt8
         s7jHpmcU8R9B6fRq2QdQeahbpx4iNiexVVq8h5B/l1H44ETylrwj97B6iCSWojFeBeLP
         M1Zv+PcLjddelDxtGQiRmWBIK9n0+eRq6hTwc8mNFGrdBrdSw1xt8WZ7v+zY80ZLUjSW
         HEGg==
X-Forwarded-Encrypted: i=1; AKwUvByI8WvkQpECo++K2V2dIJWjcpL39qNHDMiqeCljqKZ7uUm5AGMR6cNR2v0AWEJOy8dO5Oy5zTWKIk4fug==@lists.linux.dev
X-Gm-Message-State: AFuF++m8LusSNfncHEMTtmPMLBaEjHTOQ1JISqPFKMK1aDKklVwjVQZ8
	/HXM6+c9LU6L00k0EQHmHvdUwTt4gEB9pc+ueBV8n/SfAecrKHcT8pXmPiK9Qhe0ZJMo5bHNo4U
	EYoXDtlTg1JnrmyiRvqBymg/0ngyDm0Bt5DKGY430sYe2A5E6xSSUaEdaVo0UXdiZKg==
X-Gm-Gg: AYBFou1uHx1ghNZMqxvqE00ccvYORrOvFRiJbpVVO1evPfCj5DpYESk+VobozVExZJv
	MGj9PGu/7XQ3zPf7VuZIu2OObbFy7DtXNg6kEeDOi/3qzr2h9nC6DzeulQV3BR8xU36zypIgPAR
	zpARUVmrqepbDml/WjEOTUkxI+QfIH95FAoX5cACy9W8oqFWaLXNQFOBsxDfmoNwcj8mAogqfy6
	6/qPV8MiAJomPU5T9kTVcsVH9t33GiecpvpP7wfOVjIjL2PdaoaGlzfBcpuJYngfHqhTbdueEkJ
	QVaA24qT5WMTdpkcL62R+lPfB4IyCIdgbFDG9s22yiDNhv2W6P4KZNcuL2hXWSCSeG+oqKouMfc
	S2wkPzYypABgrs7R2vMssFbcB+tQ=
X-Received: by 2002:a17:90b:2687:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39aee1f9788mr12319153a91.24.1788380279854;
        Wed, 02 Sep 2026 13:17:59 -0700 (PDT)
X-Received: by 2002:a17:90b:2687:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39aee1f9788mr12319070a91.24.1788380279338;
        Wed, 02 Sep 2026 13:17:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:58 -0700 (PDT)
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
Subject: [PATCH v2 8/11] drm: sun4i: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:37 +0530
Message-ID: <20260902201640.2024648-9-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a988478 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=UuaWy5wPpgFSIu4BNl0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 4U1VfOQn1iqaXKDStNYw5ttLnDOxrWwx
X-Proofpoint-ORIG-GUID: 4U1VfOQn1iqaXKDStNYw5ttLnDOxrWwx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX8+b55apAHpY+
 tKrMzzhQ8yXw9LoiXZiALiktvnMJgQyHZEl4r+2kzqmsZReBs6MMRFV12MY+TVFHBRsQ0OCnZT7
 xsxTWPCeDp0ABx55Qw+ChHWclzMtVBfy7siSzaUthAdeilz75U0hHiJ9iF/GsOa5PboX8QLC4ap
 MIXwYJxsLk6d1XMonVm3+D0MDqI5br2gYkKpapDA3nNQ2n+hGH8DDgOm6lbbhB0I7A+wwPK113I
 dKnVmLHMsj9O1Mrd4MibvZYNW+UbOQjwU2aK+9UumWH0l0bBLi/HR0nwufzAtuqImItGotRiTBT
 xupsA1v1Ro2T88dYnAhY4y0adseqg45AxYJbuhoOzt/nc3JOhHtMAdkACLoDQk+eSCyIKXsN4h9
 cK/ghTJXuNHEXsG4AwK+AqtbFVlfHDCNQ9re0zfkT6B8sOhFV+67PnOiMtKgvQf9RM6I57QX+td
 VGAotB0aM3sSQ6JdVww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX8AoMS6rQGDT1
 HFdpi/QqWglH8fm1jHtOfHm5DeV3zlwsM8i653USW3Ln9NIbU63UolPuTrpCHollbotlIdKLo3w
 ESg2jKX7DiVvbIFiFSXXDSls/scJbQE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index e9baca360160..c24f96bdd135 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -80,7 +80,7 @@ static int sun4i_drv_bind(struct device *dev)
 	INIT_LIST_HEAD(&drv->engine_list);
 	INIT_LIST_HEAD(&drv->tcon_list);
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(drm->dev, "Couldn't claim our memory region\n");
 		goto free_drm;
@@ -125,7 +125,6 @@ static int sun4i_drv_bind(struct device *dev)
 	component_unbind_all(dev, NULL);
 cleanup_mode_config:
 	drm_mode_config_cleanup(drm);
-	of_reserved_mem_device_release(dev);
 free_drm:
 	drm_dev_put(drm);
 	return ret;
@@ -142,7 +141,6 @@ static void sun4i_drv_unbind(struct device *dev)
 	drm_mode_config_cleanup(drm);
 
 	component_unbind_all(dev, NULL);
-	of_reserved_mem_device_release(dev);
 
 	drm_dev_put(drm);
 }
-- 
2.55.0

