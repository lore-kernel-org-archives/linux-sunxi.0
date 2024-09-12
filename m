Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4B6188A35
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Sep 2024 05:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726120560; cv=none; b=jC6ZzLhJKs/59g/NwUk/dYNO7XIBUHoDDn2jKNKOQ+mlk01M8rB+pKNPkh7B67hNefYNR3D6KA6fPNsi+ooa29BK87epg1FEeH36o3vR4uwqs8+6Z4T9n9J4PY7VvGJP7GKjMQS+LhgRkX/ziVrcefBD1+gt5MhtoUywCZqzvYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726120560; c=relaxed/simple;
	bh=/SkqORRprGraSlNdCA3N7P9uibYmHsQsfL3EwVWnJvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5B6aQxWJlF127gemMirkDCvZ7zJrlS68dNb2GHUAEtynLh/M9Opppa2C6OUn37yndrf+6SjEkAinX5om9S6Y5UVq00jsMgQHRh18eRQDs91tXB+o6EfEyPGvmb+XGuuuvnPurrydEdEdkKil2VxEOnLEhI+CUV1d6+UuN67gA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vLCI+aJA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vLCI+aJA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-206e614953aso6475275ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Sep 2024 22:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120558; x=1726725358; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC5zCLZI62pAjh3MZXl2DmzWweDYeenNtUhW+BVEweY=;
        b=vLCI+aJA3JmECRkSM08G6s3GUjuf/d0nwfMrzsCXRfgCy+2Br/5U40IvPvZsdm8Z5/
         dxMEh8L9GKeH5DeVj0iXfIY0+L8eEJkZwH4I+DJxL/omF6eADpVxwDVpiIfdt6aL863H
         2MbrQ1Wwkep/Wn/TazhQwqROFO8p0TrKCEFC8EEB4cEGgcq8swtv6vUU4ytvvx2QM/DO
         /OQRLi0rPuJfmcsOUbSjOB7ltHQHgzlPmDcDLCO50GGc77967gfyI5cTCUbbwBnilJ0F
         3b9ASBmLWLPe/GR0irn5CAkeD6/xvyNqTE8QHoGXUHOmSKfefpoEYbumyCqYqT013B29
         vBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120558; x=1726725358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QC5zCLZI62pAjh3MZXl2DmzWweDYeenNtUhW+BVEweY=;
        b=LxdMGxNfyi9ydLCMFJpgvXr6TRiOIrg/TcNCXP5r/U+dKlmj/6ykrBSFba8kGA+JMc
         jPwCEKAoNE2M8XbUPiAYGQG6h+lDjrV21ZPBcDlEXY7ovptdALGVSkdUOpZHcb9n4mH6
         J8WYIDXF86ap7Mrv1WIP1ml+vo3nkeCOjg6in6LXBEmN3vuqen7fdV7kR26C26/nSsGg
         yfDvSOX7nrIAwS4y4Bh1L57tNVgvz25q3onowhB+oRs5P8P/0Zfv5PlwCj0ew9O0Rwvw
         r2MT8lOoa2SE8IlFG9Vb7Y0pX2yK7oyXbdvOaGA0PWIViyoI7VxeOUsyZ2fH7Ru6/bjU
         TrJw==
X-Forwarded-Encrypted: i=1; AJvYcCW+sQQwJFnFoaPSBkadgvE/6IbEZwJAwWO87fj7jJOUKjoTqOhbN0X6w/S0AP7GwP9abLhwDRv27cIDrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx6eqyCyCG4UdnWjBCL3lJZeDua2AgOxR/WiAK30wRQ1fnKHbQ
	/GW/9+FFJ7LAPigdKl4NJ8iTOjvS5U72RltgLKNrwcQMHBQt4S4gIdmhIbWbF5o=
X-Google-Smtp-Source: AGHT+IGyDCzQZjkQHkJXtnWNtioMB6ctq+/3Xni39dhHW8vmk0vcTDkokS2omVuMqKCmz0Pis2iBfg==
X-Received: by 2002:a17:902:d50c:b0:207:1708:734c with SMTP id d9443c01a7336-2076e31f979mr25362825ad.11.1726120557914;
        Wed, 11 Sep 2024 22:55:57 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:55:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:14 -0700
Subject: [PATCH v10 06/14] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-xtheadvector-v10-6-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=930; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=DIdTxrF0tPCTSVf2TD2d8xS0VDMxpxf73XTxU8DNXFU=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpmjOUPYZ0uVTnX69zzU2OC36c3lXu8jeU+emTV3HF
 sS2tzW5o5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgImUnGb4H/6mcBlT+5PDddcq
 mEIs/EWF7tvNM/wy2bNfgf/E2QyRCEaGKRJ9P6slZRemCE29I+349qW70NMJUx7HqUctlvt859w
 2JgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

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

