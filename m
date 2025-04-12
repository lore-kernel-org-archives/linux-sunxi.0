Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA91419A9
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Apr 2025 16:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744477026; cv=none; b=jhSlBwAaEo6+I9COOI524j7HAS4IJyjc5WU7BpotOHoUUCZawYktoNlTT79GD74mfhjC26SPVRpp2/nkBSwZrbLCQwYTTmIALsJ/unfCqE6HY4SNCUW0jZoHy9UrlLNiqm2EYjsCacyJ4t3+cKB/L3095Z9hDTELR6YWX7Jm0HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744477026; c=relaxed/simple;
	bh=RzycCxqtsOnySu4060tumn57SXIWNnavKbmzSVy10HU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g16Pj5c7xMY1bY+Q52mjorU0F3CHNAtFaWQEre33n7f+uY21VwQJO8Zu50Gp59x5C8FvV2WbPGaCepg4Nuu7SuUvicw0JIYvLAamx5U6J5FlWVlzCHA8dLIo9QqhXwkOnj7rqSIIRIsR2FKVplFT2iypKjBQfL8jEy4fFIgid40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Attpg0D3; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Attpg0D3"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c55d853b54so51031585a.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Apr 2025 09:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744477023; x=1745081823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OAUNtzrYtxLdmxfVBvMY5Gk3k0kx42SFNBtSsQElR4=;
        b=Attpg0D3bhjVr3kCT2HVN6GPCk4LqKeELyyqhXEuA+U/YcR5DGVBxe98rq+z0iyLMx
         IyOotjjJDojY16TF5MbVQE3XPFEwFgpPTV1x7djG67zTsVuFIBAoflWEgo4nOsbH+Ymg
         XSNdALu18qyFSQyY16JqqgA/N4mgnZ7VGfYHIW7tirDkGOcSKYi9Zb8BV/xhkVy/AMzR
         9Wikn1FxH7P7ZgXax5dVubQWnLNeWxZwkm0i5efDl9D6NqIt+2F+LC1Bbg7qZvFQdsW+
         csoPpxfpMn+32TfuPLnUqiz67DcWhrCsWlGz4nVzYFR9IAt8g2bGeIj6NP9pV1fhDxwM
         vGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744477023; x=1745081823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OAUNtzrYtxLdmxfVBvMY5Gk3k0kx42SFNBtSsQElR4=;
        b=siK3SJFWEPTCCYbENyWM9iTtbEo+7Coh7RUeWCLp1PfnVS4es6J4w2NSajbajEXaSi
         Dp9Da5tRE7pONZLTq+kd7WqIdjdIGjWlTLNL0Hmwxr4wiOPyvcLlYrV9x6ojb0KnUf74
         3My1nQbdfxjb/yW5iMJFBKl2K6uOcWlZ/oD/hTzxxjLWS25PX6LXIpp0mF3uKKsCO77v
         Ruw9NfkW0f68x1+CY/D6B7GuPkCK97rU20CejiA1sjALndmrk3MPKmh+hK7AHdPKpW7O
         LGOcUBSsMKEdMw2TR89GTVwa6e1h7QJt5kRvg99sX0loz4gvsQzXl7yh9mWVg5zpjLpq
         QUOg==
X-Forwarded-Encrypted: i=1; AJvYcCUYEBD4c3M/24qo0HT7wt15E3K7lyHN7G7jQaT8YXtkME5J7uiTLRi58scafFOcELBSY0Q1hmYrdx0Lfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKTy13kP52z5QwPsado9SUtcGJfLWtqYM7pFSMLt4Zc8L5k4ve
	DMCLMP49Jwh0BnN/ZzWepg/rrEb8k3vFIxxh7T1PUDqrlDyGzptz5eIh
X-Gm-Gg: ASbGncuJSXjbxc9LBZLLkPD+BgI8P943+TPmx94crJeQ0qxn3SA3uNQjYL0A86OLdyA
	oeTxtndpzbg4XwJvqWGPk/IAied1YOhgG6x+Nt5NxJCQ/1Xkq0AHiloGEulDsRrOVvY5lfNEGoP
	JKGAt+ARQJW8Jbxi+mfVdPxqoPkOGof4TfrE+wcFCef7ozyYApCa5ZX9ePjKIt1Lkw8dbnwTNoO
	FRVGzpFvEduQK1uhpORlG1B2EJV1C1vjVNoA5Ro5W3bxaft2re0mipRX9kSLXa0uT/T4lmC5vUA
	vlQH1i40za0aBbQPBRnp1alqcG3SR9Ey0NczEkFykLjKM3sS
X-Google-Smtp-Source: AGHT+IH8bGQWXcYiS6oP92AvgrToxoeCNlaJKrS6pTKqr+tWtGd4xgrw6ujWrk7k9KKOoduS3EC6pQ==
X-Received: by 2002:a05:6214:1ccc:b0:6e4:449c:ab1d with SMTP id 6a1803df08f44-6f230cb46cfmr37544306d6.2.1744477023136;
        Sat, 12 Apr 2025 09:57:03 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea106a2sm52300916d6.115.2025.04.12.09.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 09:57:02 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	arnd@arndb.de,
	hdegoede@redhat.com,
	mripard@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drivers: soc: sunxi: Fix possible null pointer dereference
Date: Sat, 12 Apr 2025 11:57:00 -0500
Message-Id: <20250412165700.2298733-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_get_address() may return NULL which is later dereferenced.
Fix this bug by adding NULL check

This is similar to the commit c534b63bede6
("drm: vc4: Fix possible null pointer dereference").

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 4af34b572a85 ("drivers: soc: sunxi: Introduce SoC driver to map SRAMs")
---
 drivers/soc/sunxi/sunxi_sram.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 2781a091a6a6..1853dcc806ea 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -122,6 +122,8 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
 			continue;
 
 		sram_addr_p = of_get_address(sram_node, 0, NULL, NULL);
+		if (!sram_addr_p)
+			continue;
 
 		seq_printf(s, "sram@%08x\n",
 			   be32_to_cpu(*sram_addr_p));
@@ -134,6 +136,8 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
 
 			section_addr_p = of_get_address(section_node, 0,
 							NULL, NULL);
+			if (!section_addr_p)
+				continue;
 
 			seq_printf(s, "\tsection@%04x\t(%s)\n",
 				   be32_to_cpu(*section_addr_p),
-- 
2.34.1

