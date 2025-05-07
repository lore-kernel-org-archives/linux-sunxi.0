Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C30528ECE2
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649362; cv=none; b=Mvy9KBCgKlqXKM8zzwPq12MAip2p0PZuS2KeoAEilzBuyYKQK0oe6X/vBffu53jGptN7UXzAHkgS/ucZadRLHmDS66txG4oXseQlgvDw9V3wa83l8hLw+gQWVYMyLPVgsC/QkedwWU71zlcR4nN73NefYg2E3ib9xgc+UfNwKzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649362; c=relaxed/simple;
	bh=WJi6HvyjJdNcHB0v4nqr7RZCPhse/6XW11/HE1nhANg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQ4i59oJoLXCYXuNIjM8ua51Tu/Y5DKUFRVysi0BZrSbtzzfAIJoQtx287WhPNA1b1y0d/YtYRl2UDSxCSBlpn1+fs13AZaRqp1fSM4h+Xxifb+F0crzinaGjB4/af95+G5x6svInABgsj8svITvxtBTmyC2U0O4Bwmn6D6E+dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAgYA5ro; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAgYA5ro"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c47631b4cso135859a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649360; x=1747254160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CStNfNX+Qe9CAKa9kWGR0bBTgEey43qr4WYZEcf8hj0=;
        b=EAgYA5roohaoF8a5f176gG5A68gue/pZPxN/29j75K/lTOIXnsC7ppgxOaznYSR1oz
         vZSCCK6tOdJvdgy3HRuM3V0R6Dby9S+K+TJbryqGaXhLD+jTetqsqcLTa83Inh8DJYi3
         fNCYuNkMuqoz/2Xc5fbMjQBRrQa0OC47Tm1LT520NP27XhEb21FiACqSv7bufabOhPML
         E29ub6GPpOvsH5sC5VXgskr9Zcpwf8ACCvvp3ZdZTWB0N1BXGVXPV22HOLk5af8OdSfq
         mQ6rOEWcYWEb0iclclPnyhHUKBTYlrXRWT4epHmdngMM2X92E2hSvV//ooIZ+2oZ52zm
         o+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649360; x=1747254160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CStNfNX+Qe9CAKa9kWGR0bBTgEey43qr4WYZEcf8hj0=;
        b=lGyxu74Gt5ndj9HvqdYzCp9Kzefcp3KiNQB4624WsGHV7uxxvF05AZm42O2gkIQUme
         CNvmqcON6Jj4icwV0d7siMWNXFFzgYWL3Qyf0WnH248nRrW3bV8QXQb5B3p8tzwM0OEP
         9NSYlkImDopTlnbY8V9Ijm9IlgZeGloui/O1PZDQKT19d0Uuei1aPiKlH2r651CZFSpQ
         IMazBG4ZSKR3/Do5W988PfrsJd4eJm1A7zxz4WsZyQC+vCyo7CvwCZ56nWcCbZPu9uX1
         Tmg7e+JIpgtRleTILoJ/TMjWA59uxgVxcowl9Sk42i8YUwfpYBvppM2ffzvQoFpBRL8q
         jS5g==
X-Gm-Message-State: AOJu0YyFvldCWUSW5ubCRMQ5871lygPSEadgckOWP3dIBjYMY56ttSiT
	AVQJXNvI/NffrV/CN1o9r8iUxo8aPAFCMwhNgWt+Art6XjGlU3bApbGs7w==
X-Gm-Gg: ASbGncvTkxJlsnDmtZLISB/jNGMu9DGRxm+LCJoOhBa2m4Z0E46mIMjrgdQunORkFSg
	d7pX1z4kW+68QhwuFGZsseUhdMmvrj8/97o3u8uxqIO+upRShKW1y03FHjWO1I5oXSnvhMktHvs
	JQWZ4ofQfGPGky4C9aFbPzzxsEkva8BntsnBWgz62QPZWNoKLRv7Y6irrRO1OQpJjg2ISW99pqs
	x0QOPDPt91xs3kC/9t+5CNVPnEOAPzyccBx+klWwjCOrnf0JUaBaRqw3YSb4FuI82yuQgeNFVyd
	degGMKVHyjSRK2odhTlCStg5eYA842q9kJpgJxv0+Cd++ZqQBFnQfr70ISRS
X-Google-Smtp-Source: AGHT+IHU/L1zNpnFPbQN5H7v31jrky1fO0rvKzweVlqImDkjzQ6zRsRlAWp/aFFj145iJs3SabcqmA==
X-Received: by 2002:a05:6830:4410:b0:72b:9cc7:25c4 with SMTP id 46e09a7af769-7321c9bc300mr462737a34.22.1746649360382;
        Wed, 07 May 2025 13:22:40 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:40 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 17/24] dt-bindings: sram: sunxi-sram: Add H616 SRAM C compatible
Date: Wed,  7 May 2025 15:19:36 -0500
Message-ID: <20250507201943.330111-18-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add a compatible string for the H616 SRAM C region which is
functionally similar to the A64 SRAM C region.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/sram/allwinner,sun4i-a10-system-control.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index a7236f7db4ec..976d3320c803 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -102,7 +102,9 @@ patternProperties:
                       - allwinner,sun7i-a20-sram-d
                   - const: allwinner,sun4i-a10-sram-d
               - items:
-                  - const: allwinner,sun50i-h6-sram-c
+                  - enum:
+                      - allwinner,sun50i-h6-sram-c
+                      - allwinner,sun50i-h616-sram-c
                   - const: allwinner,sun50i-a64-sram-c
 
 required:
-- 
2.43.0

