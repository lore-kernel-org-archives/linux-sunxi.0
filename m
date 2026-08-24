Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64F4403AFD
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Aug 2026 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566159; cv=none; b=CpXoT21yGCtIv2bUq7Irw0qOEGprnQnXTygpAYgH26WfURbCSTBo+cpRUIA+wSWLOYnmVHEHGvPCSSjY5vWGjpBeWDfV6lK/2MXg9rmU5s2qdwJtidMw3FZseIpbmsxNfInhn1eCSNhyZO7PIOX8onknD37I6JJXyNdEiWc9i1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566159; c=relaxed/simple;
	bh=rt+YiZukszKHGQvjLh5hc6FPjItUlYmWlb0CsbP8AGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUv1St/pcrcSYlJfqUI8/HxsiM9+fBvhPPWN/ySl/6//DqXw0ld4bQuGj5IL/1TpIUK0bnSjUtsjn5nuys/1FK7E6p19SRRzrrHadtkSsxGb1fIVlmovDT+ycaEOMmOGAGSfug4ZJv8B+ltWtfZWjyEY90yxFrZKjTSqlQTvVpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icKcqVDe; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icKcqVDe"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ced3386430so33356765ad.1
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Aug 2026 03:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787566157; x=1788170957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8YaeJXoEsR+KIxdOfRdm9BJRSQRSpPIKEb03BqqpcM=;
        b=icKcqVDeL0/EOVI6VHNKNJR34i9x7CuMmIH2tje54zairu0q9nOoNPcTmOgMRqyldt
         FgAEFLS/BAr5NpUw8eOoye+v9M4O8mW76a5Krfjt24HuHJ5ruCwPmlOhQt4wI+zNlel8
         Jcf6JD11pisVAJVvqFzFARVMjLxIJve7wVeHdh/JzSsc5/0tQAfcvGZ6YoBJHJ6sgXn2
         Q4iBIgXWNBio4hFB16l9ErjVB1hVBcR7v3iLjh+WaaEHOARttpdP+EkdzzY8OknLNPkA
         mg3cLL4JLTtOjBTbbbwc0iVUfX9bdJqVE4RTurgaZHC29l/tycoZp0o7333g4fgPP6Kf
         0VWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566157; x=1788170957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8YaeJXoEsR+KIxdOfRdm9BJRSQRSpPIKEb03BqqpcM=;
        b=qJVyXfXRkJBHSPT87k7ylq4u3+Q/1VIuhn1tBDAriu9nkvrPyYknsqLaiF2R/yGL/7
         wk1OMahmsub1wG8SAYmB4upm8h6eBFtxoDXaoKpqPG7Gl0R+/+JY2tRSwt4Bjqob0BLV
         nkl9ySfAy3Br5xsbtkPuJ1SDzbcja8+HaxSfVUr4fxFXSXqJwGsZ7BgCfpYWhXnV1VIf
         5PhWmAvz1l5FxgBvpjhnnqZkQgcoL6KDtYFkdeL4F3WsRl6VNBAesx5aI/mmccJZl/S+
         lAqm287Ab6CwBM3ojNRk1jJ9j2dSChG9iNcZ+kdwNvz480kt4SMg6q4C05FCCLHQflj3
         DaWw==
X-Forwarded-Encrypted: i=1; AHgh+Rom7arFe8VcKZ8iJ7ekx5Z3R3xxs2JYgFcGSda4p6YYtsOhpmJM1n/kd1XC4I0k3uJbFfzMWr29sodoaA==@lists.linux.dev
X-Gm-Message-State: AFuF++npmPtgNMReBc+KkQ/Q9wC3BIf0EXvKQZ9YA29cSdouK/7TmhBL
	fLvu0z62bve6v6fNjG1QcqYYFLo24+emfnoi7bpXQVfZPQeQM0lfCxLs
X-Gm-Gg: AR+sD10hP+smbqFeyCRi/7wkHJNKlT2GgDMHn+40efwOtfq0xF9QxKx63BsVlJjHuld
	JjB24vv0EwY0IN2a9xvo4z2ma6XlhpsAJFy6ox3zi+AxXN/Vd0HSa1XSEduN1qHv3lgUuV65o0X
	fZifSuxAYo+fKzWFbdUDuGmMoLxdb6NYlMgCn2TEqvuHAu17QYZ346nFJuSnedF8mE95UW8JbXF
	Seh84WMtgmmqZ/mgH4Xf54rRyA+Sg0sdrLPF9gwTKnv6HDhjG8eiObx+eMK/s8K9awbX80w5DMM
	X6CP+i6ORWCM38Igwa6fviygYSuWFQuS2YBreiyQ5cdx6hmhKuInpwZnyjs0QwlFI9TF+pCGyqW
	EvVrr/CcCuT7Jr7Vc/bw+V3Y4zOO692m2U8wlWayga6yxzCZUaJ1CTSUWMo7D3Cd8bZWRDjgNj7
	ocqrA3SkRR//wbZ/97ET8dhwnqQLG892QJ7ltRTI6nW9JujnLdrsqTTnx0smwBZvxLJt2q8HDgq
	d/miP4dqpAW1Z9ZcEnOC2tXIj0B154Vx1fgCPf9T8yKJxC75KsaB/PSiU4cWLA0IKMrMDH10llm
	CIDT
X-Received: by 2002:a17:902:e802:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d64b0c8bb5mr447392395ad.10.1787566156947;
        Mon, 24 Aug 2026 03:09:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761beasm15666115ad.5.2026.08.24.03.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:09:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Roese <sr@denx.de>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net] net: ethernet: sun4i-emac: Fix IRQ error handling
Date: Mon, 24 Aug 2026 17:09:01 +0700
Message-ID: <20260824100901.31675-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails.
The current code checks for -ENXIO and therefore does not detect the
failure.

Check for a zero return value and convert it to -ENXIO.

Fixes: 492205050d77 ("net: Add EMAC ethernet driver found on Allwinner A10 SoC's")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/allwinner/sun4i-emac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index 42174249ef61..942454e29488 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -996,9 +996,9 @@ static int emac_probe(struct platform_device *pdev)
 	/* fill in parameters for net-dev structure */
 	ndev->base_addr = (unsigned long)db->membase;
 	ndev->irq = irq_of_parse_and_map(np, 0);
-	if (ndev->irq == -ENXIO) {
+	if (!ndev->irq) {
 		netdev_err(ndev, "No irq resource\n");
-		ret = ndev->irq;
+		ret = -ENXIO;
 		goto out_iounmap;
 	}
 
-- 
2.43.0

