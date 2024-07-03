Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBB479B6F
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 05:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719986225; cv=none; b=O+lCnmXcJD4EVdWW8jC5HRGy3v2TUjA/aXfdBLs4PEmwc8Hp06KPQyYztuZGBXlR/DpNaZnhFfbtvJTmlN6SzIjo1N+6AUt4NHY/3/BLd/ZhZMyg4u/TG6E0Ft3Ie1DgAhXTRIY3Zfa76M20SAvEFPfYYjXC1g5j8j5g1d7CHDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719986225; c=relaxed/simple;
	bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S002mQKsHBnl87F+nDhPdSMTyOLWCbCrwDLBZtb6LmLv5rEMG8x4l1MccUomlYkgJLsxo1WhHyvB2ZKd7QPXK7vWbkepkUgw/1wZVnEtxHGVHdO7hrMsgMB24A6sw/6KiX+yIDISx6dVYsQ8YxicZ1ucfssEFd7kXmxnZf3znRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=OQcMZeGX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OQcMZeGX"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70aaab1cb72so3395971b3a.0
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jul 2024 22:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986222; x=1720591022; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=OQcMZeGXceCIxgOzwehydgPU09OazJ6oejY6w90FZm5hMF5BP26Q4VcBDwzyD2Qkw1
         tbNIdPaG18Voo8LhO+GTyHyAqb0V4008851wSjWtYrGWyfV9+kb7QTajulPXF9hFbl2z
         IURkjFyRDQEwaJYfPLvgufzNduaS23fFtvaP8N+LwhWDVROZkFrmYY8+kEnKpJiOBehK
         w2oAp2FCzQqoFvs+VEzBDd0nEFQ1SOXMJHOuMZ23EPuD9UMopqITYvluE2+fBLnLFOUS
         hyr1YcK6I4v202Fne2wK6BDgP+XcyW4GRBPs2e1Lzu57fBUZkZzgm02xf6BwcsBqjIzL
         gC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986222; x=1720591022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=EAIpcnhzHPBcN+teo9QiDPSo/XRA4nh/KnrKpBZTqS6biRaD5iQeu1EmW5jWE9KLfn
         gwge9yhvbk04QkH2ZF2NEXkHfutPMmOCq+ItxgPsbR3H/FhlL2AQ/ClY26pBharntI4J
         rKKIuHapOnh7wvECu9ZxvR438vnYgVZqZElQLNauDWEDwvy5CwA95okGzbspRoRoxIVf
         IeoshtLQ1nY5qLJJDQRI1EDz4iiph2lVzmPCa2OUNIgMMC/YN6duzPH3gC0y3f2v7nKo
         kdql3OK3VMDCAI2+2X74z7n+ZkeKT3gUQZEuihGXuUpIJaWwqZ6M3N/HevLLidFriL5J
         wlsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1jf4rlIrOJlOZq3wy4BIJtkGErbm0Zs2U3cJuV8WELU9I6ztyuCASXDzqRDzqxImAotN9sqgTNwRTjGU9XtfzL/Yr+2r+ZT6ZUKw=
X-Gm-Message-State: AOJu0YxSM7d/wfnDiP05DPYn4SMV1m+RSouze8/2OqiLbnQat2V62v9J
	9XhgU+RJQ/zJmKrMUC5ySTi6rz56ezOKjLeG/0qI4kHFMG558gBVe9/gTDHbDw6kXLW3JQlOp0Z
	y
X-Google-Smtp-Source: AGHT+IFz2hW7EMifawOpqM4AiD3kcAclIq6iiztRCK1L3Y4b6IKCzpZ5P6BWyV3Fbxcd9CTq6SCKYA==
X-Received: by 2002:a05:6a00:21ce:b0:706:6af8:e08a with SMTP id d2e1a72fcca58-70aaad2acc7mr15442207b3a.2.1719986222055;
        Tue, 02 Jul 2024 22:57:02 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:57:01 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:23 -0700
Subject: [PATCH v4 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-xtheadvector-v4-3-2bad6820db11@rivosinc.com>
References: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
In-Reply-To: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
 b=H8CrljGzUjIOOabCLiAC2ZNGpp0HazfmCxEDWU83VroeOYA6cw7Q1KvMeHXN76EX2cHtVbITP
 JsrlM5MIuFpBDrF5FfDU16a3EB1Ky1H5hrSQoekvqfQ6XWHptRHd8+b
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

