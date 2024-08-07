Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20FF71B52
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Aug 2024 00:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722990720; cv=none; b=ljbo7CKkbsKUn97Js9HPZTB44ad7wI1GFkhrWAqBBNRf/ASlMMXZJUtw1KGhkzqvKg6E30Izf9W/KJ5mpdJFSzum51jKGWUjlY4yMzamXPLbLYNzN1CW6GWP/eJ+htHHZ6WdSRlEjPretY9fgFJagV+ffF2hAyaYwlK3bzZD3z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722990720; c=relaxed/simple;
	bh=/SkqORRprGraSlNdCA3N7P9uibYmHsQsfL3EwVWnJvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nATm+ChPTODdL1P1VI0yDSPd6RX1fUPHsTOvxZ6NR33gCu04uTZyr+4GPbWEH1jJBj33GFVxWCQPib2GFxVBP35+5ghNl1Jm5LYKq90QR22kolsGn8x8ZRHkP8OoPkZ2FMQOFOwcPT1C5/X7GDiUltg4rLn+lX9v7B2RqwwK1oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VRuoxDXP; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VRuoxDXP"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3dab336717fso768170b6e.0
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Aug 2024 17:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990717; x=1723595517; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC5zCLZI62pAjh3MZXl2DmzWweDYeenNtUhW+BVEweY=;
        b=VRuoxDXPwjy0Rtunhxz606JksieIiuc3Nt+xWIYkKp5HpjHE6KgoHkywKsyGcJ97dJ
         wePwPg7GT1pFNirlhrUwAMYl6ihFv32qXdktS7LqqPylyIDFGWGl4SaPT/qbUDJmMDsC
         t3sRRJhn/bw/+gGSTFiisSOFPoZQuTop6zNovr8B5SJQdxoBfTkXLAWkmTCEYLi8ggfj
         hWp/V0pz4wZJ8H8K6oKOeMkTwsZYYJ9Ne874X8dZtU5ArmVkno/zXiKR7nNQ8cSw1t4J
         RRZMRSb+D4EfTyiDuF/abL36i1AlWtctzLHWjH6qmIeJ53eMKvpXhTVVfjirc8kzwdNw
         0/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990717; x=1723595517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QC5zCLZI62pAjh3MZXl2DmzWweDYeenNtUhW+BVEweY=;
        b=BHnWy9+r7D91ynyKUc5AdHcVdJ967GCfuQzVpzuB7xcjRoXOT/M/j/kUerXXpXZmBU
         dhmyGxM2OnxI4iKN8P+L5fTUTzXhV5Pz5i7U/OHMe+Tt0GWLHSXEFwTaw0p94eX82owj
         si8s1bwG5Rmneq3P0UhrkdLAvduYbavq700B+gs8YSfCiNOxVPxyEhWCIsmzCunYWK7i
         vbaIgS3ysJdmawgBEwGA9CkyW303NunExG8ltybKEfFTSqw9JpPOPYxVmS8lWKOGzEG9
         QE78riJB53kT+LqhAqVelwabqWBXR7ApVBfE4z59mFuxu/WN35SM+5x9Qp17Hez0Fa0A
         PjWg==
X-Forwarded-Encrypted: i=1; AJvYcCWJwBlTMCnyF17muDsmpyTFsuVz+7R0+lCsC2T2Sm6t9TUzkMb+DLitkeK+3JBxRDh+OYw6GVTguS/G9U06amzMY/IxHt0B1EUjxPc=
X-Gm-Message-State: AOJu0YzD6Zy3tfaoJdgdsz3IOLkgpu2OmIhfmy4gyDrh6rHBF08ejeVh
	/FtSHGbfCXstJpdhfo+YLSRUo14GHVIXYQ8RhAsOQ6ewWNogWgDYR1svBa/OjJI=
X-Google-Smtp-Source: AGHT+IEomO2rWS8N04dkJc59Kgkws+mWDwLUt7ddjCqe47b0HovPqN/7PDFgjz5yTN0u2e47G0ibbQ==
X-Received: by 2002:a05:6808:d48:b0:3da:e246:36f9 with SMTP id 5614622812f47-3db558310d3mr21688532b6e.31.1722990716821;
        Tue, 06 Aug 2024 17:31:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:31:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:42 -0700
Subject: [PATCH v9 06/13] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-xtheadvector-v9-6-62a56d2da5d0@rivosinc.com>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=DIdTxrF0tPCTSVf2TD2d8xS0VDMxpxf73XTxU8DNXFU=;
 b=tCigg/1A4l8IsEtr1/y9NTwTRU5XH+2Tl9Svmx0pkqdzZuPXykgTqvIzRfkbgnNWcTMSLRxxz
 q60DgQzkkPUAT9JnB8p+nZJ8SdgxaBb3cQ8syWdxfgoAzaldKwS912B
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
2.45.0

