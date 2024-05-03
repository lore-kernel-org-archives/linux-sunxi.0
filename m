Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1778B15ADBD
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 18:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760345; cv=none; b=rNrrkcOcqcIu45/8myA6a6tqzy355G/gch/lZHTsRhUMscmD1HexIVpniae8GateDcY7L3+aUeLnQO5/l1ZppRiw0fjRBA4UDhR7DNcUiNsWIrNIxrxJA5deyGw621JAoRoK9SB1ikFK6mKhujH4lTWzYJHzzox/WMhb6DwvHw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760345; c=relaxed/simple;
	bh=wcB/ebDhkfkPBVDQxoUt3AjUlhzpSXzz59SF5DkeLyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKdPOKQRu8BgX4sqb6B5YD15rxx7A601953Cr7ml9hTpSLoU/QcLA869ptbHpXx0dnYAH8lwM+EzXi8WaFLYUTYQq49EenRNPYqmJP6hJU67GMHSlgZ5e0Jp+Gx+P3MaTB67hUrVhrbf1YKMDNGNBbYLEqFGfgXfm4V95DQsgnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=AdW6EhGy; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AdW6EhGy"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f453d2c5a1so2856b3a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 11:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760343; x=1715365143; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=AdW6EhGy31bmA50pVDrGHalcbbpsbsmrClaiyadCkMH29uyvN3jTKiL+UtXpjvfUgA
         LbIM1o1scE4h7z9JIyxpqxi9uM2jPF50+XmLWA31ZCafOaquObnVhjSWTW+wXEnyBO5X
         HTOy9s+rvy0l48m2e1anABHUHiUkawVmJr3gYhIteM7VXn1sL6Fu6DSd8aUIhbildcYG
         WbqVpLEs/HIPZ4OHGVYOeIdiPmfbeeJpnWegzmUialDNsbXfscbI2tGXz8xLNk+hRpr1
         melFKSQ5lVhcB18Gt3AkzCsqEetJdYmWM2LSspaOsYkhdaoXvXfazLhd2KWPBkZTQn+S
         NEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760343; x=1715365143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=SDIQwID0EU/OEODyW4UwgkMhLZQWcX4PQk3l/l9xccwSuCJ0TsBvn4pmE3Uf/8dl8q
         ukwOq8LQfgJlRKMkuUVZ+5vgm95sJTHhWQzDiLAyuwPj4AGo6UOU0Vjc7yBPkm+GgZyu
         dDGzsDexH7+ZSyzgmBvvAjNTiLBRCv84zc4a/HgLkclHE9ovV7jHCF/No7ICx0SEwt8y
         6BAUUYxjko0XYzkFPilFUhjqTzbB6HE3xfyCbj/rzfqBmqRslP5SP27htNncO1cPyDR1
         g6i5TQddJ3hCBy73dGekkk2zJ02l9q6Neb+XC0owz5gurcGEtGNSdUkVLt84IXVhPRr0
         y89Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0B/oiSj1Ag9fHSjVTOhOZv1HU8eKAwkVxPP0hW6erQ14Y7Uy5Se6TSUCti5Z0aMmMNmm8nZGNRb8odU/8/YUYXGQLDvw1WWGFEQo=
X-Gm-Message-State: AOJu0YwZ+PdEpFaGAsy8xlDIsplGsbBwVPKlRu48+2wKmzXSGKCzW9Ry
	biQx2TnowqcI3Ocys1O9Dn2HGV2NPp3NFQ0b5VcqTXmZ3Glmz5rugbCk7e5MtuQ=
X-Google-Smtp-Source: AGHT+IF7gftC9fEPBK3Bggf4eQiSggGKhcVSlVmTLAC1VCCJYp1g2BuCN/OUrXEqJOUkjFfaFq/CxQ==
X-Received: by 2002:a05:6a00:a1a:b0:6f3:368d:6f64 with SMTP id p26-20020a056a000a1a00b006f3368d6f64mr4353833pfh.2.1714760343431;
        Fri, 03 May 2024 11:19:03 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:19:02 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:25 -0700
Subject: [PATCH v6 10/17] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-10-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760319; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=QAfri3k8PmVP8oWnQJb1YOL2NJYh4cui2R3V9rrymRbcl7uWQRGXqUcdkbJemfvjyjiKlMNx8
 hUbYcNkff72Ce8B0MIDoDdfDtiaumUjXLUkJ+tfHlem018s17zddUrA
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..13bc99c995d1 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -215,6 +215,11 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* VCSR flags */
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01

-- 
2.44.0

