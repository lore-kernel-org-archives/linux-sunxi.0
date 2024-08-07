Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE3847F4D
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Aug 2024 00:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722990713; cv=none; b=TBSJYEM76GbgAv27AKUTPiDQsxlTMOtEUIVXpwCxArqR2Zj7a5f3lxz2UMcFxvvgYm7ZF2kgcnnZ46dJmAPr8rHXB4j/VvI/IwWK1J/f6nxLTdfuUeE5fdgWGTzVh1cYp3QRJa/7/ihP3fOWseGdAY6rtU4w4n7mE0sK/YuTFdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722990713; c=relaxed/simple;
	bh=twijwVNwXlRnqiWorC6lSyhzIHtshmEdOl4sTIAcK5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qH9V3IZVX4DoHXON9wOOpfWPUmNKyhkWGN3Y06q2sQ/fnBqGdfvv241OuB08miWr3hXs+svTinRZ6R8GvVmYmmSIe5UfaDMwcIxCgXxD6ZJR0XLyn5HrQGuqFtKyyPw4P6Dvgr9bXDhIOwywDQVJ7DACVE5tSfi8sVpkRRWL+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=P/Iwmiqw; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="P/Iwmiqw"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-260f033fda3so728301fac.3
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Aug 2024 17:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990711; x=1723595511; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34tWDw4L8SN+akOs9Do5H0mwwhItc2hNKASWAYLthDo=;
        b=P/Iwmiqw1U/k5DIHnLeRouoERtaqVv29zelAmx0N/+sTP6m5ucuSctBkiYGIkUnGid
         HgH/R1Bwh90g9Q62y6XE02k18RBSG9wTVkQ8uivLrRH+8ddRfPqohdAU+FFYp8d2c9jV
         /rlRSrghqAYv9dfXqcz7dKIVA6wBjT5neWVG1qIz4MZt1tlk7eMYwBwyVDjr86N+3Dmk
         Hafsu58ZIblcMP3Mvye5W2tH4tn8XBaLEnBx/iN9eiVP3tAyeStUAvxMOBQ+OpkgtNMW
         Z0pfW7/P6sfUHIWwA5nlrHbZwDlgcdewChM/TRLF9VE/DiWAGXj7qUwn4JnmyQAd+KNH
         eSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990711; x=1723595511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34tWDw4L8SN+akOs9Do5H0mwwhItc2hNKASWAYLthDo=;
        b=uZAgyjA2pFB5Mw81SceqSid/E0UPiXnaY6yRK/IJyrDaACYGCIVfV7fUmLq9A2rPGn
         X2vH/vcWJtPxIJlyGWLdZ2TIgsvR/WpyRjNcRZ9CjsDxkY2VCimbAyGXgqA8culx5ir8
         6ZqaoClZ3f3Hr5+YaJpYJskbPVSqtzSnDk4BaNAHA4/iI1dVf/I+vSDDgRae3lPhvWkA
         RxVDzTaYI5mm7OtKEYRiO8gl7LCyuaacJIkR1rMm4YYH+SY9VBx0CECJI7271LZxC4pH
         jsRmZcTICM4fhTQAD3SjZAN7L7P1+/dDOffvyIOtyT8Gl41/fGzWutee4VVm5Ex4nAk5
         f7XQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/9TBmUJPk51Q9e5uqppJdY+eymEbDOSxYyWxjrpsVwWAP+dNaGpaihVqMPVx9a/wDHWqBwaHy+cV9udc8gN5UEX3W6wYrDGCqANg=
X-Gm-Message-State: AOJu0YyWaqae0bgkJ1OS3XQEdIYlFqL3IG4aeHkSQotUKZ5elm/q4q9t
	KRAzcbEIKVIrTGdqqzqrL9veRJq2tGovE/GJAg78qws2RWa86L5DSpgad1S5a64=
X-Google-Smtp-Source: AGHT+IHwYGXcB8IEkAHupmpVK0nhVZhhoMXREywsV/hko3tnE1IuMh1Xx52utwzABh32nak18wgz7Q==
X-Received: by 2002:a05:6870:639f:b0:25e:129c:2223 with SMTP id 586e51a60fabf-26891b1d159mr21444778fac.19.1722990709937;
        Tue, 06 Aug 2024 17:31:49 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:31:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:39 -0700
Subject: [PATCH v9 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-xtheadvector-v9-3-62a56d2da5d0@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=twijwVNwXlRnqiWorC6lSyhzIHtshmEdOl4sTIAcK5Q=;
 b=8DznulBYmzcnRUsTl4PU1Nfrq9DX3CsK4UyIPn+bOSuqD+WxzqyupxoffPAdmO9Cn/UjtYnuL
 m95rcERBaneBI+ZYTnjfNE+sqBlPjvW4j5RZ2+DHqV9e0OsJAzGlQtx
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
2.45.0

