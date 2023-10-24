Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1C63588B
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Oct 2023 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJE09Jdq"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507d1cc0538so6866737e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Oct 2023 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698167600; x=1698772400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q35Px7RIOLFQ2tv3JiGGnvjx9fOPn74ja8lDfqI7X2c=;
        b=cJE09JdqcYNwVRjwSFLy4EJCYQFXpNYsVSqEqBGErH14xNqusEzqyCF/ce4BtyrZMI
         8KSlct9oQjOpKAB/wO2GW9E477ZU3hnlP6bkJ5mFkm4geBJJH2K/v5MNpTEf8XXCbz0F
         wn48l3/dAo5eG1WRMS5bZvV/75n/qSTw5yHlOOZfGLPQwso7LxJg73Ruu1qdNdaWS00u
         jMWLE2qUR5BG3K0/eYehGDelzcIosbPjM4tr6gtwwkfXfftE5YTdkZgmE4PWzzQ8cozP
         GLPbKpBGA5jSSFtG8lylJKRjhU/1RArBplY6ZA+IKhuQf2QhK/D1CYZG4vKT1ixFQ+Jg
         m3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698167600; x=1698772400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q35Px7RIOLFQ2tv3JiGGnvjx9fOPn74ja8lDfqI7X2c=;
        b=IXS5SPn6GBewqqE6jKD//MduWhQbi8Ihb8Pct7XfW/+X5X4NMdH4Ce/L0yyrvVNSKZ
         3EW4o9CTVoV+xdhAV7bzJUAj0+khEDovGsbs/H84FvrDoeACairYZ50pmagbx92KZfWx
         UC7r3AeAy0ZGxSjxw7OqWbcYJcLK39NMBrvcbKjuoRSDkfxFY2z5E9z1GfTG+yrHLqCL
         EvT9gcTQF6L3PENEB5DlXKo1VoLF1VqkUOp7QNYMXhnjUMt+wNSE2Q//F8wrjg2qKsZG
         n3ZY3ho1SFV4x8c1+EeCmDEpdSIZL4zEcx9Ghxia2ypwg5aJPBxSPS1IEyNGm+fBaKfP
         s/4g==
X-Gm-Message-State: AOJu0YyIQSE94sQVCQbyX5LU8P+n/f0BOUSrR/cLGdOl57mJAXkqFWy3
	4P0j29esKOZOGk9SDOGN988=
X-Google-Smtp-Source: AGHT+IEpe8c+FhGADyyGxC/YOQXGPU6MPBqGVDVSGUiFQMZhx+kKrT8W1MlOev6pkIFQ3ABCFXwqmw==
X-Received: by 2002:ac2:5e9c:0:b0:507:8f1b:ff59 with SMTP id b28-20020ac25e9c000000b005078f1bff59mr8656097lfq.62.1698167599424;
        Tue, 24 Oct 2023 10:13:19 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id o12-20020ac24e8c000000b00505a5ea726asm2202413lfr.309.2023.10.24.10.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 10:13:18 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 6.7 fix 1/2] dt-bindings: nvmem: SID: allow NVMEM cells based on old syntax
Date: Tue, 24 Oct 2023 19:12:52 +0200
Message-Id: <20231024171253.19976-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

This binding supported NVMEM cells as subnodes and that syntax is used
by few in-kenel DTS files. Modify binding to allow it.

Reported-by: Rob Herring <robh@kernel.org>
Fixes: c5330723d5a0 ("dt-bindings: nvmem: move deprecated cells binding to its own file")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
This fixes issue introduced by v6.7 queued char-misc commit:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?h=char-misc-next&id=c5330723d5a0c77299a38a46e5611a584e887b87
---
 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index 0928ec408170..4424c3c5e75c 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -12,6 +12,7 @@ maintainers:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
-- 
2.35.3

