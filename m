Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3214AEE0
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 04:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895120; cv=none; b=JGfPbdDxcpO//3M2PATLaTUjzUMTS3k51ErAeBnjSACYBykGtdFcIKK/UwoyVeD3RPVwTYUlFD/036UMZwq/xnvYuswRm//f+BGEc53gRgi0526LFjOPxMFre9fA9jy1Zg8bGylo1iRz3iKCFho9JBBQyr0buF7halX8p6zWkHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895120; c=relaxed/simple;
	bh=dpMQyQf6EiV3FnyfDhr0ctcgVQcOupbnA1FwXdRflyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EE4EjWA955bdZoW7qCwTpzotd2uGVz3XO+J7JSzsdMyHU5t6LB3w8upZ5POf265tlmxSA4arG3Ei+qlqwwZjRE+o3D3VtURKXFH3GQNlGpKE/BSgWMOGIN9jeN7DLKYmVJ5flSLbz6BWqZMlYXZiJkG04jun2RSLzPPpFdyGXq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=upaUNA7G; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="upaUNA7G"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ea2436de79so346983a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Apr 2024 21:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895118; x=1713499918; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89KkigznkOkTkIiVd8Bev6F1MF+EXqz9OwTBLz7EuqI=;
        b=upaUNA7GH4T7b7EXtToHophLkZPPrr1UTH2T3oXXJvgWFale6rtQmVfJhBRfpXtRWc
         SRt058OZeJ6m5LiG4soUfDUbmADjowPZEHFxl20Ql+Y0EGK0cQ2UzjGZTTo9mCb6hQCB
         XNWOGePMW/8GtRoUf+qgwiz3RY5fFuKbe+9nloyk9uezNRty8AArNjJR5MTH1FdCcJiZ
         Q1gtIydo3jfhZ/7v8h7ub6bXAaHWGfG9BL8Un2ozhkZFQyxdkxyjGUecUPe3z9eZq7UH
         9Hac/+/rneY9QX+SbrglVdfKeXcokARTfZGI8JqzotW0W7nBTHC9Zp70v2e0l1BVKSq+
         iA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895118; x=1713499918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89KkigznkOkTkIiVd8Bev6F1MF+EXqz9OwTBLz7EuqI=;
        b=EvEUipuZB6wu7lr6RveHofMhEncySqH5MIFEb2H9n3k4EGtt/6X/l1HBijoxZTJE1R
         pxFQYSJ6zlIyISl8I2NYkGWJimtbit7VWhN8Gg5v0wAXIcqxrN2lK3JZvCA7AwvwO+Ag
         oR+D2GsL+J2AESLPEqltCDhgWILtt/8gD8656yMvtK4VvIBiyEsN7vemhW0kqODll1lZ
         wY/OW7scRj4vXMVGT9S4pwXNNweTtXdB1oaSAkGqVlG3LJ/SX8+vaxZlX3WMaY2LvNb1
         L5rDh1Zz4JrQt1ujIziM4KxoXtWOGMxaSmeHs2HYuQMrwmT/XR6E+qFaKjrwDZ+6Gfza
         djfA==
X-Forwarded-Encrypted: i=1; AJvYcCUhKx2p0iovEjY7ReCQ8nH0Sc1OuriRQ/VbCB+7uHc5Ygua09ar4cElszSA2b9C9oDnRZ1iAgVA0tkZ1qoNykEeEsYGFCFqhhZ5BGg=
X-Gm-Message-State: AOJu0Yz84NdDoeCeYGx1lOWy/xLfhhsFS8zP6TpsaISV7lttmDcJZiB/
	9VF6n7UCotmbsiAelVcPRrqpIX7l2OtV6Uanfv8SAOZhXOdHDvgQ9Rd+PEUW8UE=
X-Google-Smtp-Source: AGHT+IGcw1jnW0l0MGMcAPq0tGxntmRUuPWox6H1ipX7MybXPBxYHdvKCOaV97uW9OMyYzsQMOMbXQ==
X-Received: by 2002:a54:458c:0:b0:3c5:f333:3819 with SMTP id z12-20020a54458c000000b003c5f3333819mr1496177oib.21.1712895118136;
        Thu, 11 Apr 2024 21:11:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:20 -0700
Subject: [PATCH 14/19] riscv: hwprobe: Disambiguate vector and xtheadvector
 in hwprobe
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-14-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1077;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=dpMQyQf6EiV3FnyfDhr0ctcgVQcOupbnA1FwXdRflyI=;
 b=yG9+AKMmuUbWWqUzPvnobYPlplrI2ZeAtqu5dbsmkCx71ozS6qstYkuGJ9cZehtHrREk7qb+H
 OVTyBaKWh53DGh3LtPRjDx7F743TkUYJceC/ov23653q6S2VSI+xJZN
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Ensure that hwprobe does not flag "v" when xtheadvector is present.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/sys_hwprobe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 8cae41a502dd..e0a42c851511 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -69,7 +69,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (riscv_isa_extension_available(NULL, c))
 		pair->value |= RISCV_HWPROBE_IMA_C;
 
-	if (has_vector())
+	if (has_vector() && !riscv_has_vendor_extension_unlikely(RISCV_ISA_VENDOR_EXT_XTHEADVECTOR))
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
 	/*
@@ -112,7 +112,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
 
-		if (has_vector()) {
+		if (has_vector() && !riscv_has_vendor_extension_unlikely(RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
 			EXT_KEY(ZVBB);
 			EXT_KEY(ZVBC);
 			EXT_KEY(ZVKB);

-- 
2.44.0

