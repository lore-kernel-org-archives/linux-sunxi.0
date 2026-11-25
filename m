Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594719;
	b=5HqfvrOVlLOBAkltH/w8n/HDzf3N098zQSQGMjm/135E6us1cgCtEL0tOxPeFvJqKPdm
	 OWCBS7WxSoNVILvDli9Z2xA0BQXJmAtVy9usZhZc4wp8/CUuGJzRD+BQS4oBG6uEfcWPa
	 rvIUvalrHzQBl5+bShkMrbC9uyxKE5jYEPucpw6mvn5ZyUfZ7obMh9eZ2uMJeBq9VcJZR
	 okjyD+o4MLHAkr5l8p9JpR5YOp58+PKz7xQuFuqYeRvDyKGOg3hWjpVS8ptr3aZArGiF7
	 J/3U09I0jtRA6Dx5QssLhyEf+5qgPOuCBoJEGf5GW4fBBJPhOrFdUSV21BCb53s1YoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/d7omdutyT7Cb8KlDK3VPfYliFLIORx3uPcaE4jX3us=;
	b=oWjNNevq1ZBS5aqqj3Zv2POl5B9h3Am3X8hZ7WPS6RupD5JhparjzluDhrFiR0zynEyu
	 MEGz9KGH1K2QJoXnQNvodg8fLejuUdRY43MprW4QIEgxdvWtK6PcqbG3k3xe6rBf9y6c0
	 Y2brLrkGWybKhOAPI+h9N729UKcupdMdkNdouL68aEnquy68ED9Nf2hsA20gWzkGOtF40
	 XYcDj7jHpPStwHlRLDl/jyoU2u06LwQ6uIzs1R30iN7Zg0c82PddH2O0y7CPDVhMRZFFW
	 61/71FY7nAqV24hIG1SubFkh8+9kuQjb5py8jeRhyUIT5smlkrA/ZEWQuz4Is5EgQ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygYJRcBV;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5012A606A32D
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 08:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5012A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygYJRcBV
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4b563403c7eso1407249fac.1
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 00:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594718; x=1796199518; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/d7omdutyT7Cb8KlDK3VPfYliFLIORx3uPcaE4jX3us=;
        b=ygYJRcBV7QaUj+reg8hz862FrmCdtMV1IlY/qmDlqdOvUeazimwZtsCXUB8P3HC2zp
         qK+j/o/hN8xHvmHAmYXk6bBTfIwyhqiDA/NhNhZIt4lSCU4YgR1/6AbVZcwYRnO2QKbh
         A4fz6GeKWNG4UBemGuagF0hzNbGuquLJLXHxTkgF1cbrzc+SQM+taBAd5vKVDKfjXSrE
         ZxADHEqT+47UkcFTCKJ620YDk35CD+inTEPdxcne2d3naajvIaBUSCVtvpctH0sLlp0C
         h4zfOu61WiitNQMGeyBzpnJMfR6qU31OkePQDohUD+C0E9R6TUMtFQoEovLuhKmzg2Rf
         Qj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594718; x=1796199518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/d7omdutyT7Cb8KlDK3VPfYliFLIORx3uPcaE4jX3us=;
        b=XE/acoM6Ucl4cT2yfzU4ajJLoeJSPEKhxRObsZVo7JP9JX28WnMAZWgc1S8uZdz1k4
         Ozxox65UCe7VkKI4Lrv7BuJ5J55yMXvSv+TDqpK9hZuy+eZ8moWWhR/BK2BsrXFQvNQj
         EhO5iurKx4ovtF0OpNIMdOWIPQGz+qskVznfINHJy1zp3ORdEaxFlMNWUSCskhaltXyb
         QzNe3Y9M4CF5bvM6VjQs5gFTptrrlia+xYB9RN4Txnbg2doCTmNkWvwrlecjWImeAZSz
         6JH/WzPf02ZyOHj5XFW7L7CdvWah0tOaYvC6zeic41fyOJdKy1gwdDitu375R932F1eP
         jmjQ==
X-Forwarded-Encrypted: i=1; AL+hErGvQGjYiGtMJb80vOA5KnMqybgGcj9x9iVdOkoWoKuDkMKggRcx/I3GrClcOLJnCHJFUim2Z2qzIc0TOA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/91tXx4A7pEdfbZM+KX3eM72jqy6LBMCWUInvHv7v5CMaX59Qe
	QB41/8JrA2y3vs7Oc5xywtQazbEB++D26qMa+H2FktQL2X6xKf/04nRY
X-Gm-Gg: AZFdTZe7l941dg91ygOrqUROaV74KFgKtkV6g/0AYABwyZU4xRjS+29Ye9Y55vZnrzf
	mGTBOqEaPKLX3UUV/TB+rrPhC3fcwWfzQZ96rWYX4gdKqD5xuH/tEH6rZTq/awEL3v9x1CSRRPL
	DY47DJcdZSW5FNPLOsfevNAdVhzwMqYCcrAp2Hut6sURdn6mLWaMvmyYR+oNOJ+cVdCYbKXSrGw
	qYnxYmPLuYRGZ/5FYnASnEb18RynOmK163XXMb2GRQEWWlypU58z7GtD3IpS+0O4miGJ3Jqm43g
	ZpdcLnFCnWcYK6Fplvj3YhyLFYsoxBXM9RMpp0MHDlkOK5+/vRElcOA74CcAIrGkg3D006PVCXO
	4pZiPYuBEsFuseS3hNxHLBz7w2MeeutW1wn6Pf9zkHE2ZNivw3cKVaKCQEBKbl8Gg4WyZ9XLH3m
	Evz7U9jrW48z0czPhfQ92Q/qQ/dp9K0q8H3XR75aG/XP8ZdmZ+zoelbeX0haLpoG96pJz7mL9Zh
	GHa7FGvzNQVfk9NuWP80Dv1H+EF7DaqeLJoYNv6A/u3v/vQEBl9pta+T93n42n0p3hh04X75h2l
	mnvgw0454TPiIprlSDZ+lr/yWKaSDQH9uXq0dxzkAYQ81RNl4LzaO1CBUEZsNS1zwfFIDN6/lgF
	3khpQxOBaxnzKNLm0h3UDflvJ5X3LNeAF3gwdIwL+x8z9VrDVmwrPmKA4uz8jLpo3qnqT4BcV/J
	+No3Mu7J41ekDKg5kFcEPOHQE15NlsfPK8TpxYZu/94a6ufHLBTNo=
X-Received: by 2002:a05:6871:7a5:b0:46a:c0ff:feab with SMTP id 586e51a60fabf-4bc7d94f9ffmr14000992fac.6.1795594718208;
        Wed, 25 Nov 2026 00:18:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 01:18:30 -0700
Subject: [PATCH net-next v2 1/3] net: stmmac: dwmac-sun8i: align EMAC_RX_MD
 with tabs
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-1-4de03fbde087@gmail.com>
References: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
In-Reply-To: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Use tabs to align the receive mode bit with the receive error and
threshold definitions in the same register.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 0ad2203f76c3..379108e3da32 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -197,7 +197,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 #define EMAC_FRM_FLT_MULTICAST          BIT(16)
 
 /* Used in RX_CTL1*/
-#define EMAC_RX_MD              BIT(1)
+#define EMAC_RX_MD		BIT(1)
 #define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0

-- 
2.53.0

