Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66EF13C9A4
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 04:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711638; cv=none; b=cSl80LvTTpY0uhYueUTPkC1BFCwE6bHuWlzGS4q+QTfm2K5dU1EFx5Hs4D0aAY+tnMJQN95NdiXNZVQVG/Sn0nPx0AJOa9EoFPjF/8VYUsGC/paCVVBItlpRu72o6fjSBNNfz6qJDd3FqdB8a5tRTEOP8BKItXvPGapfvpi6d1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711638; c=relaxed/simple;
	bh=VVos6nAzmHOy7EOA1ppaqJ4Dx+U57WxCTD6XuCvS0Gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aq0ilIxNGwNBauVC5kmf0nmaQkMKfN0rore4Hkq/9XYYZUTbdWL9b+6ffiQGsU2nPbUfKjJjjSz0Gtrr/krwsdY1O/4iyTXSf3u5ozKthOt8jS7B7vahcNFwseLnAPm/JTOKE7JGC7Y3WwG1Lgz40vvhhU4KTJFRlzehHUQiU90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=q9kmCjGc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="q9kmCjGc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ecd3867556so17298535ad.0
        for <linux-sunxi@lists.linux.dev>; Thu, 02 May 2024 21:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711636; x=1715316436; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3SjbYRlfVLcKXzSMNjYRrKo8hPdxAu3bA3GNGrI0mQ=;
        b=q9kmCjGchC5wiIiAiuBfWpQxVvvf+H+rs2q4Zqsst2azHn6d/RSMjFnI03JH+I64jv
         ajWxmGJ+c03mPQ1xUnyFkhkNDSJnHwldzIiFZ1s+FIu2QKT+GEazx3CvHO2OnWFrEcWC
         JKcGAonYU3FJNOzUw/QFrarI092Zt/jq+2WtuTeZKm6aFFuE8b5MYVySO7lSauSLzu1F
         74/uMELfXH+/zV6tHpjAatEVqmKIExRR8lNWtNzclIcz3naYEI4f6GasPP/eZs2rf/Dp
         N53BNOMzmLGW4iF0jFOoigyQdNZqMk0JFDoORdaca0/Q9uzremCNNXSDE6SfskvDKyNa
         MGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711636; x=1715316436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3SjbYRlfVLcKXzSMNjYRrKo8hPdxAu3bA3GNGrI0mQ=;
        b=t06xGy/MrIpCEDE2haluf3BR/dlhgt/wkkXvspyRdrWzzlsA9wMkkTY7wNVnPIEaHt
         bPowup1pv4zTXgKELqGtl57f5UWFj5oxrAZwLxyii9Qofj9nhDscXmBvw2g0AtogGN+r
         NQjQpv9BpXEctzWLk+6lEKL3vZWTkg+7KkkZk1xjebTYKs7C6J5ke6mchnETLTt1iTGu
         yqaE9LCT7FqX0U58QfKrkdlbEVrAIW5MCMiApqaDhiof3o4lBREW6pJC/4VKTgnpsyTD
         f0r3g8a3EumYtioVA2XH5yxZcEefzdXcsWwBsCP3VldvDexyq6ZWp0wCgleUbK3ujYPr
         EZew==
X-Forwarded-Encrypted: i=1; AJvYcCXv+ZUT97DE1SXcDOUTWET2N35kZZqbwCiUx9wc+1S+C61C7K8QzelpjDsf09Z2JMm6A/F77nwGLS4LXOqVn8oWUxwE5eXbnbcYygM=
X-Gm-Message-State: AOJu0YxEDwxs2IqYcRZVssjssVyfUp59vXKBEN8TKau3jPzCQ4dhVP4G
	AKRAsF58KlscUqBuZZJc9RWbfRbLP9z+0HmOL4O9PhDK6icn+sAm/AUnbhaXXlw=
X-Google-Smtp-Source: AGHT+IGM/dp68WsaICJolpFnJ7rVWv8zpuJnZkNE7iR04J0tEr/yBdhTSU5oueJaXbYqQhfKWlcWFA==
X-Received: by 2002:a17:902:d484:b0:1e7:d482:9e09 with SMTP id c4-20020a170902d48400b001e7d4829e09mr2156048plg.7.1714711636126;
        Thu, 02 May 2024 21:47:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:50 -0700
Subject: [PATCH v5 15/17] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-15-d1b5c013a966@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=1205;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VVos6nAzmHOy7EOA1ppaqJ4Dx+U57WxCTD6XuCvS0Gs=;
 b=6na65VRDMTnnCy/+6CqiPA9pKtnlM1Q98D2vcAEWM2LB61+5gCXnut4ekMn7J31diUbqo7FHE
 zcnD9r7WgrtBVI5ezwnTpIeMoEFwFXIDsE30Dn+rGlOO0XYaU2+kgye
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..b2bb305140aa 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -210,3 +210,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.44.0

