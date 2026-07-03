Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F8331A7B
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jul 2026 19:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107594; cv=none; b=h2IRW/6qss7bkUtWaw1AppoDpiy3lPB5sfhE09Rs5Haw1vHxKibbNrzVhDNtk++qcmW6qqaLVn92/T1ETfdpLmdjmyyLynF2C1MdmwFAov9wRFcnl3jycA30o8YhTozNrD3S4ZyhXnYIGOrVL/UvU1XZtBM4w9rpfR7D32jhJgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107594; c=relaxed/simple;
	bh=cqEZRJv7tWTgKRoN4adZzdInLmkRCuJ5Uo0VyqJuYaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sS3H9nLRqjTdU7KfLlaKy9S8YX2h4WLPnoK5R1GmP3FpuVvrpmcrthmmxGNC704BfWWJmGGhSGA+Zan2CzWaZVW2kfckQqAjkmqYs+7s1XQWzcJiNZO0R7yKTDUziO7TcvPxIAa+69DhBlehwDsadMXQpC5KMX2kyQrRYRLUsqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZuu44D6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQntqbrv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZuu44D6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQntqbrv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HjCor686575
	for <linux-sunxi@lists.linux.dev>; Fri, 3 Jul 2026 19:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kAqGWShsALr
	UvOo44yJ9PZPqBuVxxzDIDv0SXARnsDY=; b=iZuu44D62fDE9nUkMGsQ/kikCWN
	vJtcLEgw6+dGCeIIHuOlMsUIpFKZZGJPJqfdF+O1SYEhJ9Ewxr3bmWpbtRmLiIqQ
	jYkNIvEv+KCpR6MtdXix1MGky2N2ZQ+IKKh/NsqwJzV4809aM+q8nNtoVSj4h9GS
	7ZOJF8MX23ckx9HxrND4qmrfOFK47QtXOdWwXxI5gur6l6dxQmmA/LR6so3jKGq/
	W7A00TMFaZJ0ko+VVC0tHFFvu0ryV81DeIP4S6UmjKnzb0SJmxCATCZFjAZe9zfa
	KCzmbOBkJT97xvyMzhw69zt86W2jJf7+4G93pb8Mz+QzA56HX9qkqRm3E6A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5brnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 19:39:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so2244387a91.0
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107591; x=1783712391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAqGWShsALrUvOo44yJ9PZPqBuVxxzDIDv0SXARnsDY=;
        b=FQntqbrv9RD4XWaGkAPCr9uxWMNl3LE5mDWs8MmpxzV1xAq3wV8JWgTwF419dgXM9X
         zyRQMAi/+8IwA2+aDTIMD6b2XIaRHXSdjaDhP7oDWfTn87LcnrTdQCWBsOKlkNPWqpkF
         bv0fB9EqXWWrjquWPUi6OiAqXwgR3XYKdDdc3UJ/EZQpBlYbL4Gx4404ukGGp9nvVsV/
         sRb592vhMce1SSXZVJ0dYEWhGPqwIWM6DFLz7BJSxwmLJazQks3QtTrTdoT0qfiYNMTo
         nm/YYpe1isOu+efPEB1sjcdS4Sim24pnI8nX0DbsXFB/V9PKjUkVeUBe85Xm9df+QAuM
         RbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107591; x=1783712391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kAqGWShsALrUvOo44yJ9PZPqBuVxxzDIDv0SXARnsDY=;
        b=gXUg4LhXlLxO88S8Nk+JqABRYJD5jXvJwam3LsKT/wuJCZcEx2T776EYX2olu996MN
         TEKEm3cmf8ORW+Skyd8WO6iGhmq2jGV39tyfvXQihdyXZ2wxF8QCErR6VCKyidBQLseB
         nyLOpeccxgqmZrTeHKFN2OqsuhuqG9uSA1GeUUoZXaqyAlaRYX80Dbcf/P5I35jD/9Z/
         CQ6pEI6r2ftlxgeUyE5AMNKBAiqiCEPO+Ei3ugjYGOg1OoBuyxkOWconlou5wMOKnP5N
         LbKgiXNaqqneL+fo7QwVsUv0bvLhsNPp516QD9/2BS3tl6q97PI0c8lNKaNWUOUrLhwu
         tAGA==
X-Forwarded-Encrypted: i=1; AHgh+RrPgpBpZu0qRs5QjDSHsPF+zedmmx5DniKLwb45Ka54Vx4xrRFK4/IEVgHnVgUorYEb4PjSlDpnBaeXzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzD2qZQnhYYTxE6nFyn4vaxHk7yzGF6yuV24QDDm9XowbLwy9Qd
	BbGWONgHBU4LSjQo6rP5pupZJ0RHznJdK28IKRJxkAHWhr/O1aUlf0OazPUaAjZ15gEr6XwJPmL
	JYd1XrNF/JGRcvx/UUf2xYABQV8HMBGcnocoSuPIFtlxtj3YwBm8fXsejCbFV2jGbDw==
X-Gm-Gg: AfdE7cnUxu/mh0Hzvg5yJRSffcosbE5yLGazzbJtU05GitDTEUvR9ZJBOaOSLHq0E90
	NlObpqua2XhDPxhZ87ma4amMboD2GAzOjBheX/4y9zavZT2y0Y0ujjPHbnYiHXXAXDNI42hmNQb
	0yfZMTJTMHzlfgnTSACVetiapc3kHjZCHKv+nrQIeuiOj5KB/5Wm6JbLUlY/pFKPJDP6OIryt5p
	Pdr5OzNjXbNhoJuG6JsX+uhrqGuk1Z6bkRk8vQnpmBUa8VgwvAh7iNe6v7Kypn5Wn894pyvry/K
	jqi5zzjQ1f/u8VCWpMTg3XtpK5awlplQ7o0/0ub/vlwrcBbtaag/iglw2UZNrFXG7EK8bJwEOLw
	kU5vcKZJX0qjHz2cVuUsbPtIxuNa6LeVMadQyUA==
X-Received: by 2002:a17:90a:e70c:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-381122ebda9mr5933735a91.9.1783107590249;
        Fri, 03 Jul 2026 12:39:50 -0700 (PDT)
X-Received: by 2002:a17:90a:e70c:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-381122ebda9mr5933658a91.9.1783107589588;
        Fri, 03 Jul 2026 12:39:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:39:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
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
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 01/42] of: reserved_mem: Introduce devres-managed initialization functions
Date: Sat,  4 Jul 2026 01:08:14 +0530
Message-ID: <20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX7nMDc4/RgudF
 lIIaBDAQQWIxdiFy1Ndvlk4bWxJLP+ZRRK/pITUnPJrTggpqXs6ghYQc/YoNOH2M0BytW36glzH
 WrMsxb5c5fYYTxorEVUdd9VN2VB9MZ4=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a481007 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=C96w-YAaP-Zupzk_Mv8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Ejf0dvB59sQYqDZgsThcNy3_99065Ieu
X-Proofpoint-GUID: Ejf0dvB59sQYqDZgsThcNy3_99065Ieu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX2s1uHwRgPSqm
 F2c/Dfk9/xKZqGXKaozH57YkiOEE73IquqC26hAEQEPNZHl3J+I1p9deNM65jI6Hnwv9cFpqj/e
 /qhzRcg+aLZXk1J9Z6HzQi6zpXgSbagq63tSTDftsAl963jDKtLMXlkFIL5wjNN3O4wQDxyrwq5
 t7QX5whVrfcn0oiJem5gBRRBarZzFihIrzXp9FGpIGZ/7XKLdt9ztOVzv51Nv4SOjxPzD0G2EE7
 pfiYznmI6xfIAxt5X32vV2CQn1z1TZGhQNiOd+pVbTecWz9hrQ1ZzmHqpMqA5MsbNFxpmKdfEtk
 zkBWdVsllGeA3nQBHaIpX+kxJjrpVQ288rLe0YHNDzqVNueFTmgVJnQBFwvILnEzMd+4SKo1jVr
 ggIeLE3XQUkcZM5qYcS8CC/SFmhJ4/ruxhUH6s+cgib5Aa9cWxPN/5HA9PTwcJBt+2QHQZBnIID
 x2BLoD+/11nC9Txtujg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030198

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Introduce devres-based helpers for of_reserved_mem_device_init(_by_idx)
to help fight dangling references and ever so slightly reduce the
number of boilerplate deinitialization calls.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/of/of_reserved_mem.c    | 41 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 25 ++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 82222bd45ac6..b35541e9fbe8 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -787,6 +787,47 @@ void of_reserved_mem_device_release(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_device_release);
 
+static void devm_of_reserved_mem_device_release(struct device *dev, void *res)
+{
+	of_reserved_mem_device_release(*(struct device **)res);
+}
+
+/**
+ * devm_of_reserved_mem_device_init_by_idx() - Resource managed of_reserved_mem_device_init_by_idx()
+ * @dev: Pointer to the device to configure
+ * @np: Pointer to the device node with 'memory-region' property
+ * @idx: Index of selected region
+ *
+ * This is a resource managed version of of_reserved_mem_device_init_by_idx().
+ * The reserved memory region will be released automatically when the device
+ * is unbound.
+ *
+ * Returns: Negative errno on failure or zero on success.
+ */
+int devm_of_reserved_mem_device_init_by_idx(struct device *dev,
+					    struct device_node *np, int idx)
+{
+	struct device **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_of_reserved_mem_device_release, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = of_reserved_mem_device_init_by_idx(dev, np, idx);
+	if (ret) {
+		devres_free(ptr);
+		return ret;
+	}
+
+	*ptr = dev;
+	devres_add(dev, ptr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_of_reserved_mem_device_init_by_idx);
+
 /**
  * of_reserved_mem_lookup() - acquire reserved_mem from a device node
  * @np:		node pointer of the desired reserved-memory region
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..b9fd78123d77 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -40,6 +40,9 @@ int of_reserved_mem_device_init_by_name(struct device *dev,
 					const char *name);
 void of_reserved_mem_device_release(struct device *dev);
 
+int devm_of_reserved_mem_device_init_by_idx(struct device *dev,
+					    struct device_node *np, int idx);
+
 struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
 int of_reserved_mem_region_to_resource(const struct device_node *np,
 				       unsigned int idx, struct resource *res);
@@ -68,6 +71,13 @@ static inline int of_reserved_mem_device_init_by_name(struct device *dev,
 
 static inline void of_reserved_mem_device_release(struct device *pdev) { }
 
+static inline int devm_of_reserved_mem_device_init_by_idx(struct device *dev,
+							  struct device_node *np,
+							  int idx)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 {
 	return NULL;
@@ -108,4 +118,19 @@ static inline int of_reserved_mem_device_init(struct device *dev)
 	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
 }
 
+/**
+ * devm_of_reserved_mem_device_init() - Resource managed version of of_reserved_mem_device_init()
+ * @dev:	Pointer to the device to configure
+ *
+ * This is a resource managed version of of_reserved_mem_device_init().
+ * The reserved memory region will be released automatically when the device
+ * is unbound.
+ *
+ * Returns error code or zero on success.
+ */
+static inline int devm_of_reserved_mem_device_init(struct device *dev)
+{
+	return devm_of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
+}
+
 #endif /* __OF_RESERVED_MEM_H */
-- 
2.53.0

