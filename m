Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBD616D4EB
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 19:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721848449; cv=none; b=ELIUC2bx0Ep+w9QmxjQ5fMMT3vfQEAlWfh4IJNx2OHPIoT6OkzkkrIH3qHhiDL2B+GqLTU+1P/IXExXj7QK8r6ykpxXUh3l3w3Yt5ZIHGx2kLPhqdjqOiZRWp+5W2aT3VBeO0jcn0MGdrAlM9a+4pamPnU7xxmJQuPUDTMB+EZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721848449; c=relaxed/simple;
	bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VwvFpr4PLa8WpDsCPkfYpxnMsC6GYsXCHA2wpz/rFmfBgVprEaPKpvq/Kbmh2V2lxTJyUNhozAIF6aUBh6BwIM1q8uuHjK9QE9eF9UN5y4U9TB314AFheHogdyyH3mzTLPcGr4giza2L1LZm26cj2lsJhmEu9SLNK8Hlj9TUMqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=oVUDmp4O; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="oVUDmp4O"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6e7b121be30so114480a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 12:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721848447; x=1722453247; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=oVUDmp4O4qI8lpk1qzQrB+eKRWDfAbUfAyiorPlyFK99hcGjTkmZ2LZtYwFyomxqJ8
         VdQXsPOtvR/v1+SsUFUI4XMeOKx1hpH4hNd2vxwrwqs88/RnyeFkedD/7buTIjILSNlA
         nht5hSPV1sWwP0rGXREuBFP6tG88RM3i/FyxUv6tRpYwQxWVOyUg3w/SflaqZvsQDlIY
         0VSPWCpuB9oX204wKSy2LktrjDklAJapH9R39tqTyfUvG4uxyWiPuTVQemVjtl0z9rEp
         b9ntinW24qDMB56RydgMDQAoin7eReM680zv583B5UVdp1oRF/lw/Ozgd+zIZPLBT/8u
         Gy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848447; x=1722453247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=aAapXS51dafT0/arnGFEaA+zkxbagNtJ/3RVYTiPbbNAEanTdFCTwKvLFcHu5mPpGx
         vWlTcaliAyfp6R33TFCzLSnaMq+pm4IZSrNuDc1d2J3Rq9+797IvRquJya7Q0/lmQU/G
         NCqVRCY/JCTK1BuNOrbT5kcguKv3azS4zkqtD3PsW1TbXcszi/qkt1I7QQPUsdXa+wwB
         oTl8pQAEjTKrdu6F+fGgwN7SF+jrGZiwVnNBDJ9o69YubaM1kivLqy8rYuucW+5blM4m
         0lDQKnd9CDEWOT+o43HC5XK7+n/erjXFmSoS1TN7XUKnHVg3LBVPOr1ktrwFkUp1KgE3
         B4pg==
X-Forwarded-Encrypted: i=1; AJvYcCVaM+Z/AlVFYKbCQ2wZoY+IkwyQ9gRpQVFabYZqPKn8nsQ5yk/n4F5HZ6jnDhlSlwfnjkKKmRq2ro5W8t3wI5Jvzawnp9ghbGheSpE=
X-Gm-Message-State: AOJu0YyeSfF4VwuxQSfeZ21zIECTqvrqckVhUX0jNg7Q0Mx3yOMAPsMS
	qgWQ2dP0vy+KIEHNhsA2G0wu3vX4oUKhEG7q//EonmB6PYffk/0aau3P5AHqdD8=
X-Google-Smtp-Source: AGHT+IHtxpf6eLL9S8Er7UvbJBMxHlKrbPdpzoeadTvWp1fhgdvuJzDzXE0gomqsRN2y5VYWthLAFg==
X-Received: by 2002:a17:90b:4b89:b0:2c4:dc63:96d7 with SMTP id 98e67ed59e1d1-2cf239438e2mr508418a91.41.1721848446968;
        Wed, 24 Jul 2024 12:14:06 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73edecesm2022359a91.32.2024.07.24.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:14:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 12:13:54 -0700
Subject: [PATCH v7 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v7-3-b741910ada3e@rivosinc.com>
References: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721848437; l=960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
 b=BR79F5fx+1PKOKbmgSX10ig/17c6YGFoXm8Oca9orEDbCA3b+lNgPaFfErEQtWEMDLMS0uZpi
 Hf1XG2FylXYBR9whYF5CWJ5Bf2VZxTdRFId6dweNtTPYn0e2uFEm2qo
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..6367112e614a 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0

