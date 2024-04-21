Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EDB2BCE3
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 01:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661518; cv=none; b=p9MvM+D4AS04Ola6ZKRp2xKSEPYWhKK9x9rU9ooIBOcBTj6mpkyX3+xfH0B+0E7JsdIgy7su4/UymfmBvba+qe5jUw0bqNzrj33RR7zPgSDmHT1ur4649pExUF1KieCwNa9B+1sEJf7jCYfFrlZv+pLXkKYiqtWgLtoEifoJjTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661518; c=relaxed/simple;
	bh=SMnAf1KoXdr3XQZFYlKGicPpJwlvTYKEN0qx5DZFIIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cn73JOcsrHNSV3h6nLGWTH96IKayIyjq+Sow0Msodi79uQjIogl988I13ml/NDVLKEerhyGmdZnRH+rTwROQwPefCCTttS5OfwhN5M3Tadk1vPo7HUgY4jB2h63phjIgPRHQLNJOBIr4uexcEvc1C9NFemqGOPtLcDCFDXvWq0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=UMQrvq2v; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UMQrvq2v"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6eb7a0b3fe7so1985793a34.2
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 18:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661516; x=1714266316; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C51oJZVlVAvKgqHOYlTKvkb9Lst4yR5a6EpKYVrVIWQ=;
        b=UMQrvq2vrkev1TaTuQt5EwB3uksqxkVbaPXo/kegIYnnANWL0QBSREjU9B24XerxLR
         2HY5P58SypCkSskqoAC6XPHTUNXvPqzR/2G2FeJooUHFL7nekOcH5LpKcyOir8p64+ov
         vyBA+NGYlu2j4s9d+iEQPPcVHT6AP9YNhodpe1XjIdNu9WwaAoHrqQa+tpP6xsvCTIc0
         QKA0sR866FZf1KHZX3DYzRQxpdClDJZHGCz9dRWlgirao4r7t2C9s6pwQjW7Xa+rFy8J
         xm7sboJBSmbCYCiKcsgmOlJ/wlqqaFJw5wLJgX12RIu/zYdbBMlnhb340ZaOszZOjfx9
         GG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661516; x=1714266316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C51oJZVlVAvKgqHOYlTKvkb9Lst4yR5a6EpKYVrVIWQ=;
        b=REWMgtwg7c1kpedgbq0oT+XMRlNFJdhDOy+GRLb2SAQHwl3XpOg19okudtNNHxd8DI
         oc/OS7q5Ei9aXdtxcBryMqKgYlxU16WDWKh+ku1dEdNwdRaaBErO5fJPWy/+r/K5Alsr
         x8BXvFI2oBZTiXAHpc7cSy3PLt76dQNB+vP/KwjLp2XJ3FJVY6zV2pWLfQLFA3aEOAAm
         9Liz5wyeQ/zwiNGTgS+mxyhQFRm73mP2BIRTjTNPGgSylnfykztO9Vd4S9oh5od89wJ2
         Vmt/a0goDjVVN4Kx0aM1zlp5/m7V/BF4mylfjcLU4C78Fg3W9FMKO9GUVbRgPvqymQex
         LSNA==
X-Forwarded-Encrypted: i=1; AJvYcCXgksiCMnS2WtVYnO4WBW+AY2f/RvTOcShgmuhO9dAnP+EjQJtp3Iu57x6FJmI+MBvhuKLpRBEzTxPO6l+C9BWaygSldniVt6rVkZY=
X-Gm-Message-State: AOJu0YzPa99Jl7OCD7Fr3mxffByx2ZpSZ14sH5q567sfBOUXA4sLxffB
	5VvuHUhxmWxtM/W7Zp04YkbQ7JK7BCLiHsNQbL6F4T5TLcxLjrkcDNxIC1MBQIk=
X-Google-Smtp-Source: AGHT+IENYknI+Zklhvw1/6eWC1GH0JmKeh/I0kIxdoG8bvXxlMe6ywbK9ABjZzu5BfvNmYbkvyzc5Q==
X-Received: by 2002:a9d:6454:0:b0:6eb:8435:6d with SMTP id m20-20020a9d6454000000b006eb8435006dmr6447023otl.16.1713661516086;
        Sat, 20 Apr 2024 18:05:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:05:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:47 -0700
Subject: [PATCH v3 15/17] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-15-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=1205;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=SMnAf1KoXdr3XQZFYlKGicPpJwlvTYKEN0qx5DZFIIk=;
 b=Sr+Ck23MK6b5fBCWQnfAjC3XDtevTk9/L5rpG6sRcM1JIsKOpPpV6wfWEpjZQrv34owaXjk+c
 T8zyReFWWSJDaCUDm2n9ubLbo5SiTO69cKWy2i/xPXXXBX1kkoWi79W
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using the key
RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..b2bb305140aa 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -210,3 +210,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.44.0

