Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4F36126
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714166970; cv=none; b=L1c9NhPyi2sSc+Idc6CyMP5RR2rwjcuCeTzMt5UFIUgNa5oGOa4gkXGobm4eVeo6wfa0+0MWep0kFQOTHkZXtfPOHlioyrv+ay6AQmEkzwPHvzcuJbGC7+C55if98YIhDH3AMeCkNhTyPJBbe2gwrGN+PPv4nJMxs1VJoG5qMd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714166970; c=relaxed/simple;
	bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zzf/60K3z3+mpA7jkEloWLJqBD3CmbY8JMHjiDwldRhZG4cBoipPTSXwPQCUVPxyYQ5Mg6s6KRyeDMICCbeOfc6CkZx+YlMLDyqNeeeZsKsvcNmCIWAd5mvwZKt7d6L21dKaXyKTNM2mvv9t/FcOPVUfAspf2njF5CPl/hpjjj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=et42yQtg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="et42yQtg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e5aa82d1f6so24737635ad.0
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714166967; x=1714771767; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=et42yQtgEujIlRMudxZlfNjOLEWa2+w1bpuI+x9m7HFeIbg4vFNR3xExBiTTyPvi27
         DJKNI+18NMp9msCAjkN2KDwPZSbs+M035grx9G0i+bAx3eZMMxFEYyUyXGlm7UoRf8Ak
         dc9+PC6KbOBYu+Br+PT+miyyzcfAkeZ/OCkN0OELKkl7DyeR6RhfyAwFuEbC02uGc5v7
         kBcKmPr0VDHAFqt1hHgz1SpkK9fDT50WTj8SjdZwvnYaEi3/9qm/0H+HgGc5turlrI/V
         iiHjyC6ULVwiKJfAv8Rtbw8YHN67BLbxF47P+krKtg0SIAKaOP0gOPwN1/1OL5F7Xn7E
         1nTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714166967; x=1714771767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=hgjAJuTAUP942flmYGHy7WrbE1HdFcoXpQhOSA6zgCaa9mzm+PQkXdrjSRaKFznIIY
         RXDdnb3lq23lRTJmthg8cvIT9H3UyERS0+zytoSrHJkrpGLqXCsmgvaqskmWHQPuV9Vo
         CHFQuK+GnucjV4omJSu+tRhZwrnJXlkrnd2GTxm2VQcEukRDWmpXil6toV7rgKfLuNf0
         LlRgsGsmg1OjgkKh94K9hCK+761KsCa1X2oMjeGpf+w9Quei/vp7P/u2nCTPyUEDbL4V
         QDC2q1xUSHq20QOBn0iGoLYRbLfwOMc7fqpXWGmppOAFVlw7W4fQgmDHrMEN+heCkI+P
         Uv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTymRETXPOMeWLeztb5lI4u3WHmYJ14z0PDICDcIW/W6JCSLIJX1g4kQOxbzAionkbQ6uAWu5WVPh+HBhc27XI4gSkkKv+pRUNv6o=
X-Gm-Message-State: AOJu0YxjuIb5r85MmoYona89C5VWrykr3EBjWgZlgOxUsKCbEDg9PWkp
	jlqJpkWHaNOrmWy5j/SNPqPJefhlMWd3Ge/vH3zQ8O3lv03fxu2iAQEmqhk9tvU=
X-Google-Smtp-Source: AGHT+IGlFC+sWiATjVjZyM4a9iGh03bCS1scNN9odduG8zCHHGW5Sw4IJWA1IOO67MT5kUm71sQ0lg==
X-Received: by 2002:a17:903:32ca:b0:1e4:320b:4311 with SMTP id i10-20020a17090332ca00b001e4320b4311mr1056710plr.34.1714166966802;
        Fri, 26 Apr 2024 14:29:26 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902650300b001ea2838fa5dsm7226720plk.76.2024.04.26.14.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:29:26 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:29:15 -0700
Subject: [PATCH v4 01/16] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-1-b692f3c516ec@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714166962; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=jaORPILErFSO7xhvXfnnGlYnBmdAg6gEwE/qRdqy/WriwYfivrW0a/1HQ1UTuoOhAsFWym1gt
 hQyMCiyz9YsCarHlzfwDbmsyF9vDjGzGdZM+K2GgLhFFCqM2TyXd6RI
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

