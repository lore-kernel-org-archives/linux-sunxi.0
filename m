Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3F253E08
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 17:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710179287; cv=none; b=cXN+oIEkU/+hEJOXGy+FCi43ipxWoBT3Dq4ljWOujkSEdMboBRomGjPqjm2tTVNhTfHanVNhJXadE4+/LFr1Lf2O7fXNtnBT8jSzSceaUG+sjaFGrM3ztI/R8eG9gBkAbVheQN/PHGXVnOZcnuePWZ2nmTwKmCPNz4p+uApFEco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710179287; c=relaxed/simple;
	bh=imBPUSGabX5HBFgzKPX5esrERwd3Fx6o9pGvNyZ4AbI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cz1Y9j9gNi0h2ITPqH6cl/8q8SIBtsIeibdAaEO7retCLyXe0pvgQdELPeQa2Fn0lx2tbEJYunA37OoyKSIUOxSm5dlh0z9ggT/hhsQ7NeUJ6PIv26w/fMKfzHE0j4SCATRyfnLDHH8YP1pns8RziixzY0ctrphZA0/eQLzlnmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDDLlYLt; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDDLlYLt"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56647babfe6so4997565a12.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 10:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710179283; x=1710784083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecbBCBCe15Y100JmWAWGOrkx0ptRHMQJFdIhslePcMo=;
        b=iDDLlYLtsF3FuS1eFN5M7Tl75vxcURmxfLpx/E/Wt+xyY8tzQ9fCtdoUw34Qy89UZi
         sGvwvwd7VttytRPQVMy4qWNakmciV+METmt47Icxh1ZimvE6y5lp6IpXay4ClRrjnUoU
         XbW34eCDUy7kUzR/eJ9T5yI3Hs6w+w4J47md9Mblq6gRnjCp3yTBjjv7vrMHG8S3+Bvt
         FCF436sRLYnDd7RebZQPdFg79ufZ+oVPXdUF++aFRJVahKZhP5QmWd9S2icGlGxgMkK9
         ZhIiiFIWjYojNTZEj/dqNhkAP+SdyIizsU5BLqBMDdV5r9M/h2/XhjdOVqUnOE8nGndx
         FVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710179283; x=1710784083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecbBCBCe15Y100JmWAWGOrkx0ptRHMQJFdIhslePcMo=;
        b=Gr+g7N6SIYPhxPon5Ez7uWYNZzIcy8K0ju0nu31b5e8PQIJiU2xHBHLTeaMw+CND36
         JwLkHaa70bLUrwLhr6MUwKKiiXGUx/mu1c3nkMd3b38lU99OzFq5AoL0G86OtOPbWITj
         1Znqa0c6X/sreclc3E6OzTWgdPG2c7vC6ypm/pW4xh20NKFYdspO3fT+P2o1J7YGpMZh
         pB8X4kyb8ty3KEEVYPkib6L+x7JgohOLFnaE8d9i27dw9pU6Bj7SA0650RRAl+33Fj4N
         naVhbjlQ9SEOcgq5m0XK56UA/mrAvhwYqHJS09FfNpsfroD2/1VGPHWVPymr2IHXfaUX
         2Guw==
X-Forwarded-Encrypted: i=1; AJvYcCX/3Fao9ztigfHBeuncUzIlqJGhVVX8Y7S77jp/ZTqFZe5p48qybRu1sqUs7mwu05AIldzQ2qx3k9pKvP6xEbAhGCa4fgOi8n30MtY=
X-Gm-Message-State: AOJu0YyWtqLovQr3o6eXjMKwSPHlY7NG3lCvQM3zVL457/titMtWAYeC
	c21fIj/cDYkC2VIeiAqIOAjh+pbbE6GFV0jT96XF4wO08by4juJ1
X-Google-Smtp-Source: AGHT+IGO67PecI1sgFey0dTacs9DhW/y+oL7j9v6XDu7UhBwavGchYeiuRmbSt9P4nJkX+FcQLQWew==
X-Received: by 2002:a50:d483:0:b0:567:e812:e44e with SMTP id s3-20020a50d483000000b00567e812e44emr4840330edi.18.1710179282652;
        Mon, 11 Mar 2024 10:48:02 -0700 (PDT)
Received: from localhost.localdomain (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id r24-20020aa7d158000000b00568525ab2e8sm1757060edo.55.2024.03.11.10.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 10:48:02 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
To: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kamil Kasperski <ressetkk@gmail.com>
Subject: [PATCH 0/3] dts: arm64: sunxi: add initial support for t95 tv box
Date: Mon, 11 Mar 2024 18:47:47 +0100
Message-Id: <20240311174750.6428-1-ressetkk@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

T95 is a most commonly known for being a box with a pre-installed malware.
It uses Allwinner H616 and comes with eMMC and DDR3 memory.
This device comes with two versions - one with AXP305 PMIC and another with AXP313 PMIC.

Kamil Kasperski (3):
  dt-bindings: vendor-prefixes: sunxi: add T95 to vendor-prefixes
  dt-bindings: arm: sunxi: add t95 compatible string to list of known
    boards
  dts: arm64: sunxi: add initial support for T95 AXP313 tv box

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h616-t95-axp313.dts  | 138 ++++++++++++++++++
 4 files changed, 146 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-t95-axp313.dts

-- 
2.34.1

