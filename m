Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E510125B2
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 04:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717994741; cv=none; b=fAq0T5u3kLV2ByAkWXSeREj1jnB3r2k0d+tkpvPUcMSUfKnI5OO0g7oIYdJCN4cDIfZKGS4YmBg2G9POoCihP6Z/wGuOY7W99V2IO8iSB3aSVsGFaIwPEP6M1/XsAMplaufBbAFCVAmtjhxo3vACJWdm8rzYm10mJHwmeNscT50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717994741; c=relaxed/simple;
	bh=kilTkVt6+s7AVwl0Le2KXls/6mRYwW97PnRFwTEsmd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZPVquxn8/sjSr8Gf2GoeM4UVn+vTHuL583ZWnrTLaj/DZchJalzKwyRNbeo2KrEcGS4TKQh0xF5x+Lz+Ct0tIRq7qH5ZonwMfRN6ZBKx8B0xwFNoJ9zrvou3iRu9dFj24H4y3bR6sRdZYxvykGB6ZAORs7wZ69kz8tWD4/SRz7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=O5tJ67qB; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="O5tJ67qB"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso2294494a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 09 Jun 2024 21:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994739; x=1718599539; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnsoWpv70BH6qIUNn0TaawjhriEvRFbQJi7Pz4BWmlk=;
        b=O5tJ67qBzV0xMc+3l1dwgMkBtMr8PyyT26Kb/hgyp9hzjUrj2bRiL+rvvRYwblav4F
         bk4YCTZ5cZdWsNIQTSIpOHv8/rH8iT32X19xkS4a1zCEfLJLKLodFSm0HlrIXIATEOWT
         2HEij3AUbo5zHyC6rTfPn0t3fxRzSFHOc9v/F13jiFkmfyDMc9JiILSlsIk0SqmtfUSD
         4JSzeNldvuYgeONLRss/wwQ/RZ7gCTaHEP9iqFhPOd8xRvvWkad2pjP1CFSPBTjeWZ/M
         uR1PUi8sXZGi+McJtrXBT7L4qboFgb71egY82F1smVEXxt87iyQoUY5oHz2H9CBQbu/o
         e12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994739; x=1718599539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnsoWpv70BH6qIUNn0TaawjhriEvRFbQJi7Pz4BWmlk=;
        b=ua0JoaGFuqqPyJ/xU76na/tl0msjkTtK9oPc2E+SDDCaK5m3Mxm2SVUSsC3cbZ0whJ
         MJaivZdfr5nG9jcCxGFH0WzidisvqoGzH4FY3jyMwv/RLwyM9iEDt3Uvgrei3xLojgPq
         wFhFvVQ6yLMY9ONyf7OJ0hImTGmc0ODZKik0w8T4PY0rRKsDyny+2II81LnqcKMa5f0S
         GfA3QVFbZw+KQGs9asREi4+b+GVc42dbMI7Zr7pxmvDUyyVCwTqLbXajF/AGmyCFEG3M
         RkMNJbCjs43nA6DRcbGb4FufOrkbuvqDgUymGnqUYti97NwV2cnLOxfzC7TtrWvNTFci
         /yEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0IYe4GPDvWynC2OzThFAHk9NvnbHkDc8WECysaiG0XTgwY8Cjt4K5TBGlP1oApNt/IfyOMHW/40yGq76qnZJdXabU3WwmIKZ9N8s=
X-Gm-Message-State: AOJu0Ywe9bLK0P2fIBCsKX+V6IqQQiAXIF+XqM9e3KX/vlqhp2z9Hw9c
	vLdtD72xCcm21VEejIkmj5cAxdSWLEb3QoTAgiLNmWSIbZpf0f0YExX1Pf8ha9o=
X-Google-Smtp-Source: AGHT+IGAB+vWm0sGCNa81cmJyCujrQf8On8Y+GxMGYRiKcexYZGA6hr44N3kBkh31p7uFMVCcWAQvA==
X-Received: by 2002:a05:6a20:3c88:b0:1b6:4151:6158 with SMTP id adf61e73a8af0-1b641516226mr4498267637.47.1717994739324;
        Sun, 09 Jun 2024 21:45:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:38 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:07 -0700
Subject: [PATCH 02/13] dt-bindings: thead: add a vlen register length
 property
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240609-xtheadvector-v1-2-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=1303;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=kilTkVt6+s7AVwl0Le2KXls/6mRYwW97PnRFwTEsmd0=;
 b=4RRz7xmpcb7CA1ZMWQZlS9J8l2HdlB2OzfAfqDm1wbd8Q0dPdolWk/sqmZ90bsZ3IlYTtYYew
 po+8/cap559D5Bi2X+IDlt6JHWqySfqydxCXpaM/iRpkxwpTP5F3ksW
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/thead.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
index 301912dcd290..5e578df36ac5 100644
--- a/Documentation/devicetree/bindings/riscv/thead.yaml
+++ b/Documentation/devicetree/bindings/riscv/thead.yaml
@@ -28,6 +28,13 @@ properties:
           - const: sipeed,lichee-module-4a
           - const: thead,th1520
 
+thead,vlenb:
+  $ref: /schemas/types.yaml#/definitions/uint32
+  description:
+    VLEN/8, the vector register length in bytes. This property is required in
+    systems where the vector register length is not identical on all harts, or
+    the vlenb CSR is not available.
+
 additionalProperties: true
 
 ...

-- 
2.44.0

