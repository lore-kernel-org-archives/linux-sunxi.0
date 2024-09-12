Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7618BB80
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Sep 2024 05:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726120553; cv=none; b=GyAB+Ah7bmiaD0zwsC3R33le7U/1dpYaaSyNRz1T/pRAbTHv71sqRBlETH30Ur8P6z6x2fVBeoPm3yyJ0FpzZuwdzFj7MA4f0dpHpWHEn57G758XdJRGQgvL2VVntywSUJWQ407S+YSqMmnvy/UkabZEyZUXgqOllUE+STyo78k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726120553; c=relaxed/simple;
	bh=twijwVNwXlRnqiWorC6lSyhzIHtshmEdOl4sTIAcK5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOi9rvcuFBWwSZPUJ0/9Dkt99JcdxvOyxWI45M7oXNdL/WZCoXk9OMT3AIWkRIXx8eYIIPPK+YANjLhTvN1sDLDt6uMZ9GJRf2ekHDKZ1kZhmMpFtd8RNnTM+YAypki7G9Tq9qibuWN7185DbZHiypfK3K38YDMUSAg1FKzfkIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Gmgg1Ptf; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Gmgg1Ptf"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20570b42f24so6797615ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Sep 2024 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120552; x=1726725352; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34tWDw4L8SN+akOs9Do5H0mwwhItc2hNKASWAYLthDo=;
        b=Gmgg1Ptfo6n6BnWaC8tSwYOlWkX40WuCACUlxWQoIbmBRSq7plhIA5UwYatJWmyl/F
         6ELkhM3oLiXMMWIrezZAsBnO77eNEUrDWrpy2TRbVYpgJfUo0uCMsI9NPlMOLT2GDrFo
         n4fBIWxKENRxVvuEXtfFw98yIqeU94cra/2MXlgApPeO8E2eigk2vjzboUmpbfs1OxFs
         K6dYVUMoUvJU3qWuxIxaIxeUTQ7KGpfoB3WSOA0xJ5ttziHTbyUrVny9QRjUnPTiOm/3
         pW7A3804hNdg/oCwEsuPzQ80lK+0Rnh+EorHW+KxwyGP9qJ0ohhSw+cLBHHJ4banYSyw
         08Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120552; x=1726725352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34tWDw4L8SN+akOs9Do5H0mwwhItc2hNKASWAYLthDo=;
        b=ucy0WZu2k2EkywU5I/2cv3FFL2I9sS0pt9DQqubGwJyigNfDickK6FWuwy72YQvLUT
         h5AhTRr7e3hkjUTG/13GpJC+vkaFBHyCIoBzhVkyYJTKPF81206JS/KTfrK3mgaz3D9N
         w6Q8xtkqc1Y0Sl3tvA4ZEXdRZ1nYa0V5Q00m926/8rXMKwzjYDnzLKxzOayTiKyndgRI
         AJgeIFuNumGvqqPZsQNr7yKmxQVOtNj3X8EmYgrvndyf9saJaIznLPRETDCmuXBlAEcJ
         TQBEX1zYK7gp2RfFM2UY/8frT2cFNsyE+7NxTlNDPhW2ScPnzibIQKVLHE6mLOl4HHgr
         Npyg==
X-Forwarded-Encrypted: i=1; AJvYcCWE/mpXbNHRpfHi7ih0PN/PYfjLPawoQ4iqjreGlMi7xV3Px8x6NsTnFeMYpwSv8uE25QWjfKMTRrRjBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLFPphpBDQ/6Y1DnPA17XfJ3r8LfriyP6+XtNIb3mZjAuB7ADr
	84FJz59iswWSkNW1r1IiP8jY8M/+9W0sAFAHyZA9HIIRe46MbX6nWVBpMsHN1CI=
X-Google-Smtp-Source: AGHT+IFiwN7AL0oMOImj8Bb6j31gbdzpkXOKklYI/Dyd/oOvuPIOVHkDWeO1Nnywoc6bxuIJ7G506g==
X-Received: by 2002:a17:902:fc4c:b0:207:4c7c:743b with SMTP id d9443c01a7336-2076d90a1aamr22272135ad.0.1726120551451;
        Wed, 11 Sep 2024 22:55:51 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:55:50 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:11 -0700
Subject: [PATCH v10 03/14] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-xtheadvector-v10-3-8d3930091246@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=960; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=twijwVNwXlRnqiWorC6lSyhzIHtshmEdOl4sTIAcK5Q=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpqjdgupZ/AlK1Q7FNw/u1tnC9ORpXqpi78+DtXKPk
 5uMNrJ2lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJG3rAz/VOd8nRK482XkT6UZ
 tYt2FjXdjPqi+VXavm/u3tKdInOD3zMyPI7n++V4VnP92xmlpRHdhfJLrru5Hwm1Pvs24Vmrmdc
 lDgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

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
2.45.0

