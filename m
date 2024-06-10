Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E6BA2F
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 04:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717994739; cv=none; b=lj+aFQ3QtTs0rnEvhWDL8+AlTu8IUrvsgjYGW6tn5JChgddO2t+mztiFA7QysORkrHE9NBs+zktLy1wfc2RnQ+KvKrgs7BG3Oss5QDueLs0wGuanUOgjBOk2K+rL2VqIJfcQeEUrZTObz20JtL1dbcGmHFurFdWZ2BxQ9PTmzf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717994739; c=relaxed/simple;
	bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6SOYe2mizWuO73M5LjfmfWwBMhv59FUmdTmhSvpeIurGM5mS/Ov/7oRuJxH+6pJp/+k3xz0SGYqrVqHOLla+v8oQ1T3145qpEDCi0FhOjMNO/Lavly+QnIWcEHso9eVwu/0lR/JyQfV4yKGPFrKuqzs982p6J6Kg7qHxG9KtcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=amsoUeqT; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="amsoUeqT"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70599522368so270030b3a.2
        for <linux-sunxi@lists.linux.dev>; Sun, 09 Jun 2024 21:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994737; x=1718599537; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=amsoUeqTHyrVa/Dx55K+tVPIpll8wQW6mqZgX2ZNS66iPICKw9rbW9medhHcwN9rSn
         l1bfCwDBuZJIPu6BWC1gBgE9vKZSR7unNySnpNTbM0Hc327rh8O8GoHm31qFYM7A42VO
         XtF5pCXCKpLzBsAOtjeNpUU0IWGpNz4OmkpNsor8zS5fTwRxzEpfdYX6hKBd00hzsUMw
         Swxbdh6BcjqV7bn8174b6mEHAcSiT9iZRe5RFJjh9Qgw4vR1A8nPiYyhxV8dR4L8X0Ka
         IEHclaejoLAInJF2ri7N0Hkkre+ggVl/Ums04P3xBtoUxehPmEAmhuV7tNXfCqqTJObP
         zHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994737; x=1718599537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=MzV/OiIZR+qBySmbP9PTV7UF3INOo1vXVTuwtNBVaI9skhZ8Ie/x2jCrKWpwPoud1m
         lfvqLLLix/HZvt2e4A3V2bU9DFyxt//gTnYMNPnK0Gs+1Vmw28b6eRg5AXPMVhM3mQ3o
         4JdWA6HcKtrf1dFzabfDZumxWTPOciVG7oh3sETtbA6oavxA9togygknztDhAtYme6H2
         8H1MMF3S2enSj+hQM0UKJGpHQ1RG0DX0bNXhjiaWFY71ZyGX0TZMsCRLYniD1FnZ5A/0
         hxowNmULkNionB7v17nbf4OmWaCawjigEmvutiTFXDt/ulGeMMm0UflIZBFKxAMmISIc
         m5vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjN6//y47yghLN2t+R2LpfD1VZlKwqKEYvGlxdOdZIIqgKPSCGIWH4k7bYJ3EpZj4T0MmXBVIPMsRUYUqpyRrpn7j0iJJrcbo7+i8=
X-Gm-Message-State: AOJu0YxncG4IUuiCKMAU3Da2DiKrla63jYeaHsH+rjfU37nfRjW5HwRq
	6XZGh2jJ5Dnv3YuqsgApF0bEAV5h4bHydZ0x1NrNZBFlSnmTuvTrMwfWnrxJPN0=
X-Google-Smtp-Source: AGHT+IFWDInJoRdiv7yy4abVtD7rjRBD+5cj0P5U/4ieBFQEcEQDeMGkcWS+bxqhxTSZ6IUNdGy+uA==
X-Received: by 2002:a05:6300:8088:b0:1af:3715:80c8 with SMTP id adf61e73a8af0-1b2f9c72398mr7890004637.46.1717994737211;
        Sun, 09 Jun 2024 21:45:37 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:36 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:06 -0700
Subject: [PATCH 01/13] dt-bindings: riscv: Add xtheadvector ISA extension
 description
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240609-xtheadvector-v1-1-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=IOAoxXefLtnxcb9/gkClYMSBjiej8R99FUDNxVj9T92yij8sj0PIqkxukBdOvfHybExsRN5MX
 8IFqt96IbAOBrlmGCI5VVCTbG5L+9+BjW8yNnuO22FIABU2PMBnuOK/
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..99d2a9e8c52d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,11 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
 additionalProperties: true
 ...

-- 
2.44.0

