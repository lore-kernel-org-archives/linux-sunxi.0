Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938272;
	b=5XBniaIE8QssLMit0j/guCrVH4YlrXa4HAOwwuhtdG0zs3EbvwCvePUXp8nisvKbFF48
	 yLQrGENeF87w+qXFt23aJyEDsUaxr8461zhnh9gg42tD12zuAKkx5fMd+uTLt8WTprp5x
	 Mr9paalbh9+sowgDfu8aH0jUCtGEgNa2X/FVx5Ne66L9iCQEsvpIBGJR2IY4/LnO4EsZM
	 LTw57W5JmeMRsagHLL/MUAnr+OFGjqw0i+WsSF5YTf7HqUuMmYNKidNwufUNabSDE41wb
	 Jp4cEKuCs9rUMvSfUtAWpVKxUp4fMPhl+ihPfcS48cidDls9RexkAVXlsl9Yi1of1FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
	b=yEj/3U7XQbT7eRNchgVl0CEVtXrOn0OPg/WSDQtR8xW0AKfkmnXykRtKGqeOOBB5zoTW
	 dt+zr9dQKa2YPND9bg56P/Ro8+RwyIvvOUPtWDH5yIr1tDGhH9cKNsIDfynIx+kr9FSJj
	 h+Vcz6fazXwpQchDhGIcGQCLDsdY1XhmF+UsS+8O0L6F6U73PJfIXlxGa6EOjAb9tpTQu
	 TY0rWCR1VmV1RwCwIOI8x+3JeU6/6Cixv5BoaXM5N4Uc1TFO+Sdg/i/OeOkgmr9hyx+mq
	 TcVwHuQgvabKZlPCdHRSG3/75dYHVeA2RIqInxMq8CUGnL8f3CaZG90HCa++8l+z1Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Psykdf4L;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E4E606A31B
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 14:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E4E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Psykdf4L
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso7432145e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938270; x=1793543070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=Psykdf4L8IxuOazcgTPsGyNaAy4NlvupHsrV2+nmDZv7Y+sYGP+2c96fG6G4PjtsLW
         PNxOglF3xzSS9uL8KZTrceBVsgoW0yt6xUnfsLq8MuEI86dqpBOwZvGzT1E2Keip7e2J
         c0w1NyHo7EzerKW4xXd2PYxqSFQw4cOlnPQcDk7utu7A893uy+RNwFK9HXGSBOxtx8zT
         IhKARE1wQOtlO/+Nujsc1JPUeGZahwRL0afVnwoyKlMHlaFixV8qbKn6HnyoNARnTBj9
         3EaD5Z6FjlujTKIceZb1AhcI6iKbVveSfCP4HdJZviLLiq2d7nf0o9OpygPNjiAhitrZ
         5/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938270; x=1793543070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=uxNxHam7kFal4ks2wLnPw4SFlrfjNkrND3AHNDGUtcOsKhDp1aE3GbWI3PaVijE9eZ
         8bFyIBAgE67StwRnv8xP2zHBC0t4JX0sXDfxEYNmtJjJiz/Qm81MQOJ8Gsl4b+N82xC8
         80rQ+Hn5RwMdbLBfwgclm/aaza2izkX7otSPY51sb8QxkCNn5tu5zXHigItthhZj7iR1
         xOQdgEmouM08fDXstvZuukPKlE6N121zsSGAawa3n3WeAAOafqyCRkxy3w1JVwWo+pzz
         L5Jz6X7ByvIXO8FzJzWY7at8b1VPfu+bjqHM99U1pm2BusZqN1IvzdHrZByqC8LYyF/y
         UKkA==
X-Forwarded-Encrypted: i=1; AKwUvBw5JqI7iBmZqfW3idNLrGLKKWpYl9NyLwa6+Xz3qFFsJzXi37VRwxMEErZIJDi73MPAgeVFz1498OUXOw==@lists.linux.dev
X-Gm-Message-State: AFq9FYL8bMjIhAsL1/cFWX70DR6lPIIUdhtCTkw/6jin6yjhAVJmeicB
	UnKAp9fVBILWNZ68PJzA2bfrdG03yZb5ZvcIbGDIwyQaW/rXJV6wO5sH
X-Gm-Gg: AYBFou1YJBY8unJFjALZv0hH0gSQU2M6xCVScl3+n7zwlMKrvWAc9yMjs0gvYUWQpKq
	kd09znk93d1RPCE7a28k7CwNxb7Zj1+bS2tfcTH0xwtxQpPTjTbAZs2joStxR0jNWrnxidF7Ydm
	NXFg92PfWQrtk53qzFNXQHn+yVKuCy3jLzyJqI+2chQ1Hs9V38aFsoqR31AuBh6uxCaanHHvgM3
	v1+R2d6xY0xSIMDwpxI+p4id6ZSk2QxyEedak0MTprP/7rdVag3YgXsDQi3dGcE660uP5zZ+b7v
	PHPd5pXuWcTA5LiTRN0Bc1wuQU/rRZQ0Vu00oHLD+SB78ySO7q9zA0ooWp4TAMIioitfO9b1S/g
	tS8KZ/pE+8CErzodSQIWkkoLHLDA8z/70Dt6mLF+gMQrUEK4OsGcnRInulbkvezUIrDG7u4e26Z
	DqrU3WyXcP7XLZ1SrK2sGo4MJnvZ3hk01CA/HgAEFKhWf5rMYBItLhxs/wLdIX/uOBeeFBPvFG5
	SbtGf6LM3hblSzObr+U2Kb73KzdfCQJssk7RP8gYNjxYZv364/GF6XO80at4f7x62kLZPHXQad0
	dqPKWmF6ZYUGJg==
X-Received: by 2002:a05:600c:3491:b0:4a2:40:8d2c with SMTP id 5b1f17b1804b1-4a35acbd31amr73775825e9.26.1792938270408;
        Sun, 25 Oct 2026 07:24:30 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:29 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Sun, 25 Oct 2026 14:24:12 +0000
Message-ID: <20261025142412.112216-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
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
2.52.0

