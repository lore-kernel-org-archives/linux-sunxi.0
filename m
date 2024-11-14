Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BA71E7C35
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Nov 2024 02:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731550891; cv=none; b=ebKgwZDF3HbyZzPL7SwqCyjwXBanETm9nnaSOn+U9SEG8Il/dnyktu+LGghFWro2+0kX0IDQ95ShEz8/d1n8qTGdtbf+uKssAow2G2PINSpuOhM9JaD0RhJBtEga7AgnkoHPbUX0e2yTQe/aix4/ItO/rjm/xZA1Ib76cPAfnfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731550891; c=relaxed/simple;
	bh=nHDw9Tbf0xjTwaOoBZTvzecuhEW8GNONUj+jLJdHZ5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbuv8bpaFMEJvEv3ECZ89V/lnI8wNGJljcFPsU8vIsh7QleZqJcBPcKMSPWq76uKwM/S0yXjW6QeqRCgY2b5MaS7rUksAWBBieGKf6Usgmaaq0+5Sl2WGbDbSmZuGX4hcceid0vGEWDJAB7Ui2HsgKlCiVFrbfmeJjkGoCXMjfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=AQ6h261r; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AQ6h261r"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cb7139d9dso746875ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Nov 2024 18:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731550889; x=1732155689; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPmq++gF8XYGDxo6W13nX8EQcKxVsBpCdjyPJHQ9PEA=;
        b=AQ6h261rgFPkFPuhniBFrNFVG4w0nvebpYYTKbi7+non+LDfyIOvpSF13lisEEp+nh
         qpHO/HJCgiAJAzSk3Gg3dV33hy5db6AWrKFkX74xMvTEMSdHyosN+eqckUfIHOFXPi7i
         ZnpD+yrf6PBrCRpiGTgx9/D54lMZok6LZCsAt4vXuoVQTmTiOGJcpUzElkSGHrv7kuMO
         ehxzrBFdpDyVIlAGRrQDFmj4N29FiqzjL/Tu+1xWWebaelAUNxuejTvyIUmk/zz9Nrkv
         fHuBYGVGY1HBcwx2vlq0WmgV0hKJNaIkdp45Iz4Uj35kHeByp+oyT6U1QYfJ7K3JBKVv
         ifmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731550889; x=1732155689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPmq++gF8XYGDxo6W13nX8EQcKxVsBpCdjyPJHQ9PEA=;
        b=VhJY1xIXkWUdxB9SkI96blmjexB63id88Hasjk5VmQtUZ0pNtn6U9n2Ht12R38wL+1
         qyo73eh+bp9ICDl+4F0EWAcYCLZ1bVScY/cUW/pMoBRjgPY37Djbs6MVzsrhgKBREXlD
         40VAqdbqFe1tBp6sL93GzzM+FkIE1GK/hJVDsEs0ePDzfYJMeWLeBM5iLYb1wLWUGqea
         Oyr5TpxqWcwkd7vIYuufMeC3RjqkZuiNUhtYLb04LqSgEO+Mcpt6C2SO9HrmY4mY1I6+
         vJ+VoJYv7V/o+HCMuVz9hZlZbTV3SMc3q75SiGp5GP5HmY4Y/Tg40Y2Fv5BEdnR8Rgcu
         3iow==
X-Forwarded-Encrypted: i=1; AJvYcCXM8bkGZcF41L3mRtZ9wxMiLHRMpzZYkDkkLgjEyJDNzyQwSBDQsqaOHgKgANa6CX/XoeLQGxOfg6Y2Xw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjVkfLCP3/ZUKCNQJwqZ1bGP7qFn+7SzDqM7ANl0EwJ6lsOFEq
	S1+5dpmcatCChf1vxwdaCaz3dDhTvO30c8C0GrRAsjvhGVTotCpIOU31M/NsdQ8=
X-Google-Smtp-Source: AGHT+IHXs/UC6QXlbxwq/AZdRi0iAZKUws7q6EQOv882glnYxGWHkVDGfxYYccs3BY2ZiZF6gsz8bQ==
X-Received: by 2002:a17:902:d2c3:b0:20c:3d9e:5f2b with SMTP id d9443c01a7336-21183e709bfmr255058245ad.57.1731550889082;
        Wed, 13 Nov 2024 18:21:29 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c499c9sm406875ad.68.2024.11.13.18.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:21:28 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Nov 2024 18:21:07 -0800
Subject: [PATCH v11 01/14] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-xtheadvector-v11-1-236c22791ef9@rivosinc.com>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
In-Reply-To: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
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
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Yangyu Chen <cyy@cyyself.name>, Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=nHDw9Tbf0xjTwaOoBZTvzecuhEW8GNONUj+jLJdHZ5U=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pp3DyxIyu8k/tv/KntPBMbFSKaMMV3s+xp5ss60xkb3
 lXkrX/RUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwEQ+fWD4ZyY1Q62Gp9u6tt5+
 kuvbiOC/kz62z13y4dbsiOyXebX7DRn+l+ckfXB4zmJ3iWHF1IyPGX6G1/5xf3Be1bRS2MNpacJ
 7LgA=
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
index af7e5237b2c0..b49278e2f2aa 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -593,6 +593,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -600,6 +604,12 @@ properties:
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
2.34.1

