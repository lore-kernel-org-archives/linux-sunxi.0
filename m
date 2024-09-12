Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD25188930
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Sep 2024 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726120549; cv=none; b=hdT4oNF5L3fyuSH29DudVdec1hvMGtJAGzrkeRyhF55Rx4sRSj74oKpOXDNexin3S9m5WyvHsEQ8pRzUnLmVMriClyjvd4Il9f74Lp7nVWX7uW/0F80Nu9+Ke6h32l77TWRqDDAil0pX9viy5gYZUgyfv6V3DrqRqaORca+N0n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726120549; c=relaxed/simple;
	bh=n+1uXcpPSzDKbEZ3gf2yswWeiNf7ojNdJOC78EyvEvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJAUXW5Yu5Sue+VYmGhITgjKnIf7uYE/8ieVPiwyNvVvgR6HEwLGnQEYMbP1I4bczUf+65GyOfXGqVFraODIp+2RmS1QxO4ugJUNe5936gZ8Jj+FTyi5UPEROUNJgvQv94h/QlG/OY4TQUXB71+adPclnG7p04tEycDUSZhGulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=3TlEcHos; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="3TlEcHos"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2059204f448so5685815ad.0
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Sep 2024 22:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120547; x=1726725347; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJ+D4p75bjfTb0EItLpHxQIjWmqIJlAlnUMhz5TxedE=;
        b=3TlEcHosZ09YqgJA5k06ilJd1p12sjFfREe4CFXfg3IQIdnaiz6F0UjKqyWieb/btc
         IVbgl39kRw2TOaNgjmEjpTW8I+aKO6xLg1DiDtfgbroShI36JTTNXRbb2rV0yRgpZsB9
         wpCoHmZPrspca/n8GVkoKgkB3eGmbSXS7YnUPo8VmOq27yQTD5qpTgL1kb5Qf/bWfiHV
         5V9ZL7PnDAQvTOE+KC1dVAKERi0xXgdx+rPGkLbYpU0exRUJkQ/NnIJWr+j+OpRc9qnX
         Gbz3F4YJmKmAZAs2cAR28ZK35yvt8XyP89V/undzbV7A0cuuQD9eHP6Zq3Yydhls5GtE
         5e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120547; x=1726725347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJ+D4p75bjfTb0EItLpHxQIjWmqIJlAlnUMhz5TxedE=;
        b=jIUDI8f/RIFQzDwKdJUI+w9PiGy8N3chb9s+oppyqOTtEubCGUSP/AyIcfcDEfzskB
         vtJ0gJ/RUn77451QYAL42qoFwWERaYLtOX219P+xVFV/tQa86rPvX9TxUlVQxvI/CJTk
         p9wjK7ZEC4rBMqHyJkyKutJ94foeBFXG3fqC2n75JD3NDpQqmsmhf+bQ9zk7iy6Q9yzL
         CXoVcK8Tgrr7o8YmoY/+P4Ms4A2c0dUCtOVo2koa/OdmkASjWkD161PmIg52C5VKZx5f
         voYoEDj7AKjxH1EBGjPIz3Ko7oXyCNTELfyvVKzFHmhmcMSIaf06PJhX85zPWu3vGfPg
         3+RA==
X-Forwarded-Encrypted: i=1; AJvYcCUEHi6rryoevMq655I6RZ/7Ep1KBRRC+5nEa3yAIJHCLomPJjP2zpaonzNTLIKMjngYFlbNAvwV9PdK0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1amamVp3L6lbRQru4XL0Swnjj2CezNMQ8WdBPMrKDz07JdhOo
	LD3CHwF15QDV7CDByylGDPCmYN9vsGZDuv556kP1zQR+vVLFt2GdMeFayl0naqI=
X-Google-Smtp-Source: AGHT+IG9O0CsFGhPXNWP6Lh0fHcN+qnZpsCNiZQA7ou2TZYGAxKoqEVVtduYd2aqXpKrOB/KDynEnQ==
X-Received: by 2002:a17:902:bc82:b0:202:4712:e838 with SMTP id d9443c01a7336-2076e34805fmr20473945ad.14.1726120546804;
        Wed, 11 Sep 2024 22:55:46 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:55:45 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:09 -0700
Subject: [PATCH v10 01/14] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-xtheadvector-v10-1-8d3930091246@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=n+1uXcpPSzDKbEZ3gf2yswWeiNf7ojNdJOC78EyvEvs=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpqgZ1w/w/ftku2TJD4uz+t+3x4iXX2BNW5b+/WQo6
 8bjN+eIdJSyMIhxMMiKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjARlTOMDF/jJh5VvijwP67J
 VKVJwXXLN+O4Ccpr4rb16DJeSYqLLGD47+eWbnRtrtIkRe/gq3cFjFfOFeOyVO+O70hJSZ+nude
 JHQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..1a3d01aedde6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -556,6 +556,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -563,6 +567,12 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
     allOf:
       # Zcb depends on Zca
       - if:

-- 
2.45.0

