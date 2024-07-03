Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0B549641
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 05:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719986221; cv=none; b=EzCO3XjFqWsqdk1ZsAXnLg0IDw3IkfNA5P1Xi0MsewjRfJKQs83mqamd4DOBYwi4ObPZX92RGuIu2nqRlENyhEpwXpoUVUu7WCOF0duBvoxeBuGDP4ebpdKGqHzr3JYItSwqja7VItx2yWzsW8P3Gwv/lW5iSkJKCzh5gF1LdGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719986221; c=relaxed/simple;
	bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnZ41mGnACNt6KHES+a2NQZ5Y8Rwx3mYoTbT+DoDqrc8R6vUuviCsd91nC/fgfhQmNWk+vo1pGbd5s/Ptuj427M0syD9NYgX4g0iskYJxV7K5V4FZbYc2GbmeK3scbgccEvn9pn3zO2+BcCegRNiw0VHiGpkUKnlbxch3JFi0HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=td4nvZlS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="td4nvZlS"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70679845d69so3402630b3a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jul 2024 22:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986218; x=1720591018; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=td4nvZlS1oW3AD7uRe1NO/wlmS5AYa0zhe85UKZbWOTXIfpvMMk9cF6mkQWLkmhxOU
         nqjfSqne8mwDTcMxTFVDIL9yK8bT+naTs/ktR1aBI20ELqBfTHiTNiDcpcX4mxy8BT44
         YgbkkfUwkI00Q52a8yQxCsXu9JSqSryA38s86udXD0GitpQggiTsIGr2TBPXGSrQ2HFx
         S7XIkGXmFP27EJjU1qn3RVb98nIszxjCQcVTJFPDiwGFG81SkBNnD37H/2OqwioJzLdX
         tb61CseF0Oz3XShueQqzDB4/hisF6ApCJCedzmu2+/fP6a1k6aLaDHPe/3yw12kyR2SB
         YaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986218; x=1720591018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=ljm+wx/13DJ+ctpGVLvHiwKYUqd64yASjz5dCnvUKfNxl/VsKli5jlNmKbUB6veLA5
         DzTF8R5hNtOHhEVGXn36p4/YzEmjq9AfbCv0vJ516bfhOk1oTSOjCL5/p03AwnqZYRyR
         o1ZK5boM2BO6Htdc2PBq4VjjYiVJtgw3s6Nanu7M254stg20i6rouyamLUu0wQujqPw9
         pzErIjbneNcKX2X/PremEbe45t/8pMswIL/Gq8X34IcI/daXlOYxfpXTTcPG1a0Gcxfa
         h2z6WxwqTnvLSqrNpM6BGTcwsWuldZq1Sf4t/TwzzmaeyjErGEVD5tW/1zihkOzPNXDc
         DGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+k5x06qNqLmJW6JCqsFMYOjsaPRRImHDjlUrJfQbG1xUxc7ofo4BRRbygwxcRE2kozNTO0BbBOSeuMPMJAGDToF2i1PswweqMkzc=
X-Gm-Message-State: AOJu0YzSOZRrxPKXwvtPeK+Xy+LoBlZUyD2aCWOmmdhmUONc3gj/dUMQ
	jD6Odjgvc9ikTO8UDyZgaP6MIlwgPNYVk9pbDg/X2SKO5JTuFSp1MD9wa5aEGqo=
X-Google-Smtp-Source: AGHT+IFPk8bGhxxDiE9oF64qKKmdU13pr+uT6OiupoAHAaV7v4GIvDN9xb5Nma3yWPTn3YYLr0hhkQ==
X-Received: by 2002:a05:6a00:1d02:b0:705:cade:1f50 with SMTP id d2e1a72fcca58-70aaaf3b8c7mr9285409b3a.34.1719986218135;
        Tue, 02 Jul 2024 22:56:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:56:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:21 -0700
Subject: [PATCH v4 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-xtheadvector-v4-1-2bad6820db11@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=fjkJVEjEBLAONoqiHUcNpBFefDHSX2nBp5VtKJ5OXWsis/l0j13kilKZo1JDNR6OZx3nchXrc
 DUHnx4vUzbPANcO+FajO56TrbkiU7rKqHSQIij8AF4+2aTbvHjpuDP0
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

