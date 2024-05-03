Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6CA13BAD2
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 04:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711627; cv=none; b=mfQf/wzizJS+iHUM9hCzH+KE01bSAsCbAMsRXEFALvhCoK5Pctxf1UaKjtpZ1D60yUcgHdq3hiRiEfX0Sfq/NZEJuajEHap+sAaKZSEIw4sqwdstlFLlJBKEwhIeQUfl/NdVPnb2RCmJZlSfNGh5AwC9TOW/EXoBvKRbxLCiTY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711627; c=relaxed/simple;
	bh=wcB/ebDhkfkPBVDQxoUt3AjUlhzpSXzz59SF5DkeLyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juzPVp4bSRZVptvW8+TeiSP7oz6uGgO00gBlJgcnb0TFdn4xqWvzJ1wKQDOYcTvuWGWcyUkWM+C/e/KmYgkzW+2+4hiscbtlL6GL26oKqmWAzfxH6n4OggV+5wPq+sTHjU3cjjksbWzmEFiMcztTpf9D4KvQ9Hpt0V5SRZ4yaTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=k9MOcepX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="k9MOcepX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ecc23e6c9dso15583415ad.2
        for <linux-sunxi@lists.linux.dev>; Thu, 02 May 2024 21:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711625; x=1715316425; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=k9MOcepXm3FlKElBIyDAlyH1WAgcHBh3dcM4rRfG6nTFe83CwZAt4a9Vv1TmVJSTiO
         djPL8yOMhd66HxlbO76nH3Rc2ixUPV9giykjjqtONFaqcQM2W7jOdSZ4xhUJBg0ipf+R
         gZ6O16CzGFE3zm8If+vTyxty52r8SX+On0GfZjCzzFS1lVJTpCppudmafQ6ZJmri+lVY
         +Nc7j6sAwAeMxFG0f+KFPGaWPu3HJM3o/d2wZpE2cf+0qGZ4XMbBJXwl4+yvJm9A6K5U
         9fH+asWZ6VGvt+m4QmsKT0ViDT5nLGe1TANo5YYkE2or1fDP75FtEjHnG0mJsdN4WpaO
         sJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711625; x=1715316425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=qg9AQ7YQ1wtE/hcxTh6yL3lonsesKEazb+ahmWxEE8gW8A3LzB/HUvp42Kb7Mot+qu
         QcqJtGX3OxinCsMlmhbmx3gK/U4XZ/7C4OrezW3aO6JJtvPZuFt4Jvh/b/aYTpIRfwKN
         VuShBtXZiMMusRp82XKFvkRj6xcVmNoxEDMysLpen+fHj9i0XzgtbpS3S8uXLB7G21Aa
         ZBPiQjr2XGXExawsoheGPpmX8MoT88onIgZIf9ttYIiv2tdA7chuUQIxjpq0A4AsFfVj
         gAF12UzKNcf7lpAh/X2SFNjuvjxS9qN3hq928JDuXsFj7uq/FGuYgDM0C95csEK9V7lS
         5k9w==
X-Forwarded-Encrypted: i=1; AJvYcCUOyY/pBB766zzjyaSZWzq/oOmduIkeMvcPzVUH/1UylNbdzAtawxzBbQJOQlBZ4Xx9KbmPsRXziwMzZPePlkbZx9CTdYbVh7V7Ioo=
X-Gm-Message-State: AOJu0YwV5ZqBpJ6vO9ILu7/qfrvOcdSIoZT3YQjTQAOPr/VaSBYH+gQp
	qJ9Ngft3keFPr77Fp/e61rfHL/3syHPtaDkaEisicTrvHgnlvhq9Xa5xf2Bk1V3qtdpy7l7LgN/
	v
X-Google-Smtp-Source: AGHT+IEsLo+sJPSi2a0Hv7lEXXuplTtHBmjvJGQqJ+J4Qga0XMWmIW/w+sEAMQqk0rkMrnR+elhy8A==
X-Received: by 2002:a17:902:6bc1:b0:1e3:e242:4dc9 with SMTP id m1-20020a1709026bc100b001e3e2424dc9mr1627010plt.33.1714711625059;
        Thu, 02 May 2024 21:47:05 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:04 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:45 -0700
Subject: [PATCH v5 10/17] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-10-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=hL7t9YD70TVJ9RCYIa7iCFmk1VSkj7KUU8JdWDeJG/jxY1JZSDl/mWwHtuMDQBiOJ0PIZdgaR
 iKOSKxqaBWZA1yRAFkHEI4kLmPLYbdTrOUVL8YrpVvOwp9MjfHRvnF6
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

