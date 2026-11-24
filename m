Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557110;
	b=RN3F1AeO3KkJ8BhH72pdTYHdIQUupkK14trve8e8jEneAAcGtvs51/lYMlCMJjn2iMaO
	 jcQ8LzkEsHAC37AdTxEUFTpo7ervRxHhNEJe/h2O3N4wolRENfClxBG14K/4f1BCvsRuA
	 5oRoozMYtUG6HvYj+puGGTbrfMO10TpsA9SiNEGYH6o8fvcyNOFN0FQUX57eNKVoeea4E
	 YrPMpdx8tbv9rlNzIzgGBYvKxaaPdKSQXF+igkuGOkEGq3fl4HOzLLZQS80Kv5i4dn2Ke
	 dUDktQmqRAvi0+bsw1Wheet4uWVbtzPKWiQpj6gdG8cWQpci6joXsIS2rSoABfutp8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=;
	b=sXo3x9EmoHTxlOtt5Fp3av4rshaDcWRba9dTHzS/aBWjfVEPQmHywP91JNYvGVLyxx3D
	 0znbN9SDnM9p1Rae5J6rLkgSpkhdI5KdArunNd68T4gCQLzLdd46sV2ZlfQmUgV0WoMQf
	 CmMjsWO2gXZ0TaIH3PP8Q+EQBSHvYG/BVEoGt9orxbP+4KNYcp2tGT+Oh5C+XDzVV51zl
	 /pxdLGToROPAGILQBliyF2GsmbaSxc21FnsOPgtMoIv+sQQcdqtF5OibmAw0bLKGgr20O
	 7+PmZJQ9VE8N8JvlsFyf/+S5ewELdHrerCfrze8/bGz/gSbXcTyY5ZAhIdH/dvlCCIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4ImlHPa;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA74606A68B
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 21:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA74606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4ImlHPa
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so43913805e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 13:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557108; x=1796161908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=;
        b=n4ImlHPasccZ20WLhFfymx7rsOSX4ZBPC7+TEI+Arqdt812E/t5JnAUaApgvBvjNmn
         uNpfQUEOOWKW3ZfGQddFecutKuoQdJBMWRcZwT9g5BuKkhg65qNzs0YXaDwRWvBG+1ol
         9y/I+U/oeJJrh2UyrYwZlFgGK8FzOfUMxPm7lEN/Q4gY729AUxo4XdpP/B4BWDdZMz/t
         qCvTUDzElSu+OzUzrIUGlnKlGM+gyCqsKwdzhwY1r35cn9dMdcaif38maQoals1EFdzk
         u1+qlYnKIuhpvVKx3apMYzK9esydC+GucHT9eDWKXkLPaifWCTD8yo9k3aT5yqrkAqKW
         TE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557108; x=1796161908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzUxS4DZKD6Oufxn59fxSi6iyKfyUkYi9vxneZjQx4E=;
        b=prph2kV2wCZiEsrsIqoWU/Ffre/3rDNKaQlkCqEA0wYVUpYjc/b5OUFFKlGOMfyJec
         hxQmbWMRuexBqUif08TNcZfcHr4NhgO/dcYnN17DHTN7Pcpxghz/ORbQ8jwgV85e3XkJ
         Kp2pP9ETxk+L9fTcNX0sNxIF8vQfH+0MYdKkR90YL9ZkP7A/Bzz/75WDAo9f9tfVxje0
         +R1+rH6ZEirphfVDpGWw/B/p6A3grc7AQaQbVUoJ6uAJHB+2CxKyeXZG8uxKI3+Uq/Cm
         ieT2F6VQCxP8n6iFFQGNrJ17Nh9gWoQBUHdevG107QrO6X5mPeEFQOvyKMTyXKxuibBj
         gcfA==
X-Forwarded-Encrypted: i=1; AL+hErEO76Bwtiog3yxTpbASoA56AQXwFCBY2hp6GBK+nCSqOQQER2azcnUeeUw3ZkdrTLZtAv0m6FgQz2fANQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8QpVcNlsYwuKy888yxQS2soWBZ93/Y2TenMId0syIdbNs1dM7e
	Bucpd8hrnRjYt8rz4ZgIlVjKr7nFntbwFNYsChxliR3Lzp5mnazXAXXT
X-Gm-Gg: AZFdTZcwUE3TL965uagCw6XJSgAY4KJJJwpIEK5ZechqdPq17CtZFmeodnz83dIaWbZ
	gWEu5OYgKyW6+3+FfJZGdv6ysPK513VkR9sPfa7JhHds1xNlYssYL/Qrf3iX1KDxZp9kkghBWaa
	rqWklwCFx6O12jj84j/SvLzFouTqkZipTgeDJ8fmJyXyz7bAJyz7tLBJiKodupkhr35vgXrx+YW
	uGuyWZefz5quiriJZzGqYb1y2DYKAnHbLPOdSBItcx7BYHqSJ25tbRJrhcwXi34JeSBDfTNQyYO
	E3HTxWa9h1IzBkePprqQnQLwRGEpE+5ZfT9Dl9OBzfw9tr9py+gRcNbEbrFV6aGX71cxmuNiEU5
	IEbj5uR2fv8aEuloUfs4a5WvOgov/xhuU4bAzi7bsbl8eiUBa2P93rABXY9UW9a3wAGsM0WuTTI
	WGbjfwa0gEIuf6P3vFNXi8vGqN2D1vBHb9aq4aAk9OGhUvSPxDLH8w2OWYtDYz4mw1wOFiot/cD
	KlK0c6uHgYgVRws99MLqVRIjEw1Cq/AST0bcqHz7jb4cUo6+MX2HjuzpwGkngfcLTPM4db/70HJ
	bl2grEsQ+zK/UTfWLi9P
X-Received: by 2002:a05:600c:1384:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb88816c44mr333032905e9.15.1795557108451;
        Tue, 24 Nov 2026 13:51:48 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:47 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Tue, 24 Nov 2026 21:50:48 +0000
Message-ID: <20261124215048.42074-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PA IRQ bank is not implemented, and the driver now numbers the IRQ
banks from PB. Drop its interrupt.

This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
missing GPIO interrupt").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..fc4d714a96ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -129,8 +129,7 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.1

