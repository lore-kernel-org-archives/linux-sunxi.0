Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E556F06A
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 21:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721685508; cv=none; b=GKZi5chiWQ70iWqMK9roG5MdGna6O3yt+ns3gyL/hPSaBgoQlMS5kP/nqidPD41Yrthd/fIX7H/ZIyts7CuS5anC7ApX3t9+qZ7tUYu1/WzlcPSYcbmziBAxv1w3aWRQ6de6YPg0An2D3cRTmRRWG2FsZg2C88X5VH4rctlc6uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721685508; c=relaxed/simple;
	bh=wrX0uryyy89vYlAinvVr2O6QBZz257uuEBuSnzas59I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bUX+5hxNgGrFtrr/j5eEs18wC1J2OmrR8J17SgkEkh7j/8k2Vo38WPp7lVZvmLaD+9RJgJ+c/zVNZEzog78JbvPTTWee12+LcT9AwaVJe3w9YXERxMnFUsxCszxLmUkQii5AieQlzN79wb185NwDrgkRIiQbqdBp3n/yewJvgzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=EK5nznWu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="EK5nznWu"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc5239faebso173145ad.1
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685504; x=1722290304; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=EK5nznWu7ZkBxdHtjhGdydIWi1KJTo9//8tQ5eu5YlSJJpC8YUrxoCIhhQ+3AjVBiy
         V2qixvfpcIDbyDX5+Gz3uhN3C0DKCsU9GFW5Yrpw5+YECyZ3ZwvuPeNkNcjWrMIwAduw
         ABWZcS5YjtSCxShl7mAULuwFOsq+5LDaRV1io6RhZKQmfIo9HWCGKussK2ZMUyiwZcLu
         gLNneqgCxGrUArAGFXCFL6YLwawgK7hMK9jV5lbgCImbGxLDthoOonrM/m5NUP84jo4s
         0tUxwAIptPeAC1Vy6Vj/BTfEZtAQCwPm0G58JkQ1hzjyILs7xOlaYRMNqeuujPaQ70Y1
         a5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685504; x=1722290304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=FmZVHfIIOEa8NgH2X8zr1+AFP4OPRTC/JLSsBHH+hoji0JOKEqp/nqXmrh8OUAKfYZ
         KYDxh3WmKLuReAEVXSjjxa66+nfF50/VXEOesZ+GvugOG11FzfOLS73dG0U+vC9hJgwR
         vcY5iAk3R/k6A2wh7z1MpZI3xj1/WJdjVUl31OWjusndX9bojfBWTeUEwLPMkV9WCTyC
         DvRkj+VS3GKoriocJca7Lmx1kTC/iwgi1NiNRuqVK0sUxKSHvLXLVHsUHwvbxMoJU+e5
         bo+Q3ZubXDqqmddSzoCHGtv95A4xat1UR5wpZEt2vZ0qdVMIeapX5sr4xsdQ1k+FFSOG
         SQrA==
X-Forwarded-Encrypted: i=1; AJvYcCVDPY5im3ojd1U3yG24+Zm6QsBwdHFYG5N0wATRxRLxrRhxG9GHBaQ5pjEk69bhgeQ2JaCyEnX0uc/9jL2afcuoxA5L1X0lqK/+zdI=
X-Gm-Message-State: AOJu0YzLo3NI2LoBIDYfsnLFOWWh79foqSQtkzhPKTEI0gpX32i4Up3z
	wCFrfMQpU4P6BvveGA7iNY5qCb+smbEMk4L+faIgnS5I2U82WnamZUNjC50GsS8=
X-Google-Smtp-Source: AGHT+IEoJN1pCcgoeebixEMdeRFm+lX7Fz51AAK3F3aCHBFtjYtz91oZywD8oyA7iNOCpmg2SBax6g==
X-Received: by 2002:a17:902:e5cd:b0:1fd:96e1:802a with SMTP id d9443c01a7336-1fd96e181ddmr34308645ad.59.1721685503730;
        Mon, 22 Jul 2024 14:58:23 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:23 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:10 -0700
Subject: [PATCH v6 06/13] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-xtheadvector-v6-6-c9af0130fa00@rivosinc.com>
References: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
In-Reply-To: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0jkC45FH0LUvSVfvCEJuCBZ027fqPbAipPAnc4zFoN4=;
 b=0RZc5Y7+dPFte3RfQycOhdYrS0o9oSHCnJx5nucXwKbADyIcT6a8rMi+tKbs59EJDNFM7h/IW
 hf3xB+tD++5AswmTbacfCC/pWDHRloSyAPnBD8iVQF4NrrEQ4Jj9uG8
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
 arch/riscv/include/asm/csr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..3eeb07d73065 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,6 +300,10 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151

-- 
2.44.0

