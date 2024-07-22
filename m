Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B9B47A64
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 21:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721685499; cv=none; b=QT4Ks/w5zvOedgYbCNCCvjzC0uGeLRb6kGQXU8fG+1mZGHijQKUgC1PXzHRnjq29EpmeJ70lm4R396/XzM26TP0s0ReagbCmLn1eZK5DD1FvkpHRmi+59Qn1D5v6vG5YZb2M047bkRlFwfedxur+mjUn4Fr4O8MIBrq14CIFCjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721685499; c=relaxed/simple;
	bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJx9f041ZsZQP/WN/giOloqtotSogTueTcGFZ+GKXm5fnfweuezJfXnoTQ2F8aDVdHtLa6z+k6pqSQmHal4UituhSkYR6Ck+E9olaZEtmxp+szf8ToLaOXzkvVa578BHTBCdiNfla+YRJsFX8WvRM9O4tob5dMVBX51hUGyJDAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=SYFQlr8+; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="SYFQlr8+"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7669d62b5bfso86899a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 14:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685497; x=1722290297; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=SYFQlr8+g67CZEZI3rbKDxft7xWHEpUWMJQFVGFfw5A2yhjjTDjI6fjLFkIai0TTHz
         RUuxm4clvJD3uH0UL9/v/J/YzPyVWu3xbfKTMsw2HMsSbAtM1dB79P4j81R/dsPPbiWp
         Mm0gV6tXjRfWnPd01xeaW6ZlAdA4MVj0ytPewwQZpfyywgxRxYD5iM23piHzymCp8Au/
         i7l5DHCd8IERGLHtt8pRENi+DzUT7IIl8EtzuiHyExwipw0Xmwi0bzS5ceZPUpexOE2b
         CKjZJ193b9x/g+zeiO7sKaEebHmdnNcpNLTKnVL5s3H8nWRsgFfnfNUHN2sXBn7f0AhC
         AYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685497; x=1722290297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=rGjVqiTo2SPecQqIDcvG9OLiDJViUz5jH5T0pzC92LTmr1wlQuNgEZ+wTc2KVId0lS
         hBiJtTpfO466YuQNjFlZ+8x4r50Wgx4b+O/L3i4o/2+9elQvEdy7e70KU5jufZoA8scr
         2gHZT5QqD6py3PREwt+6LEZ8UT7LSbiaJuovMOdCpUJZEtvVa6c7a5obYNm1ySHyhmEX
         6A+MW7smZzSQGbVbjPVTsWxR60fh6jsYC2YqPXpB5PfwUWu+gT1hyGccv+4ma34Tldjo
         43HykyRS/ovvAWavAOE7wX2BlbiZ17vk342cMV/wcAQN7TgqnOQanCQcxYE6DbaskIPV
         nktQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1A+Aq3U6Pw56fad/0TxR2Ju1j2qOptqMxLEWR8wWEjsng7X/QSvWqju655wk3BgGZfNmpWg/e5jQuDfn8oH0Ak+ERLm5LKqbizbU=
X-Gm-Message-State: AOJu0YzQ7+FWI2sG1PrcUfnqKuArL4CDcO5nYskN+po4KJuSFsG9zxIa
	6ChzbkX7PaNEXkz6ez64MqIAW4QEWGAKi57x+p5tnRHzuNezBhgLf9o2530n9kI=
X-Google-Smtp-Source: AGHT+IFIcgz7HARCdDrV5W8AAjYNm6XpC7WdcgHj9xNl+u1lsoc3o8CsMZxn17S3ppWeaBN7sAGQTg==
X-Received: by 2002:a05:6a21:7881:b0:1c2:8cc4:908a with SMTP id adf61e73a8af0-1c4285db7e2mr7544150637.46.1721685497425;
        Mon, 22 Jul 2024 14:58:17 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:07 -0700
Subject: [PATCH v6 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-xtheadvector-v6-3-c9af0130fa00@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
 b=0QcF5MOvwNThO8NaS/lKWq5VAiR/iEGql6uw4zAt+lOorHLAdp8R5/hl57aFXb0GgjrdhiJy+
 LF1VgV1VUUSB4jFlWmXdN0rWKHp5a/ASB87utx28kucPM7yzo/B2hBx
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

