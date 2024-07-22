Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B779944C9B
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 21:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721685495; cv=none; b=U158+RwgIQTZkOqTfK7YVXbJdHbpqD7FjxYS691FML/kZ6l4DwfNodbXl8nPmgtclXjD4aJW0Rdzcg4sIOO0kImu0XRwxPOT0OO58BmaGj4ljH8XIbks7+Zyz4mj/pJErKcaKnf6cG3Z4qqNSNCApdF6ppkYFoDsBliFwByqvMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721685495; c=relaxed/simple;
	bh=ZzH0VgSdYutk/uKY2omj651o9v+E5HP1BijtgXJzAp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AI6+1lGJFLyC1t63vcqUBBx2/SWdTop08vN3BTOU/l9DaRtgNEH1rSFZTZ1yh52w+I5wv+E2uXGay0c2UaEpuwFC954ufQaYenOuEAmLvWZCvfYphrz+o7WbbldVL2k7az20y8U4onXJ43QA5vSDsrlVA8AcxN2ZUhMNUHCP2YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IxtHn2WW; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IxtHn2WW"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc658b6b2eso1251355ad.0
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 14:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685493; x=1722290293; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=IxtHn2WWT/mhQhmzzq3VqHfLEvPddcxdEzWvNeaXYEWk5DLWdKBKvz+XiqnQnT8920
         OnzMmAlTRxLpjcyaAPlS2IjlYp7T1Dsw3hUc47w8I566nr/KnK0sP9wke8yzFTA+u/ze
         YZoYkm4JwzmxFJR3XE/TZDfWIeNIaIFgOuGlImC+lnBONPeRckJ5QWvD0y/dKWlZ/eaB
         mNAonK63x247oENWwhtzLILSR+T+wTP+FLkH9d/9tcnu+0cmvhvMhZvc+oJtH3PdYume
         NOcOfLqoc6kHNmudZymcTkjQYjPgG2Q/jRaS8uIYXNSLyb8zS0xiwsimOTCbOaRHmoBv
         vuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685493; x=1722290293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=rEiPLUMw9gAJHTHiGRM7EI69AnzH6DxaStTupcZSc2xiYHwlqW0XOvS09Cmgml4UnY
         84NIIEvokFAOnyn3FfPjdgQ/aEycDRg0nCEtGklkhu5n//1kI+2vdlk9Odhd1MyT77GH
         NWP6VTrkECDHw09LcucgUkdZXb4UTsOhdj7EvffIvhV8TfpnlA/pHUB7LVyPMd0yMYWZ
         c6/61weaK2BJ6cmdq2wgR/c3nu1VU18F3rMETenYtRPzNAIOWI28PNpWhgWBVgrjiOeV
         uUOqPJblPjyK/meCfz6TeWBV8iYPWrKa2jYIzarOB/qQM3hCCBrDVrj1AFUuT/qe9QZ7
         h0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNhTDKrR5uQFprdI6p2cq3uUdig7KP9+WHTjtlAbI1xvUR/5WDjm9KG6SCaGVO1QfH1ybiVHjKYUiUitFIjux12I4YbhOkEQPIfvY=
X-Gm-Message-State: AOJu0YzGiVMpa5McV/qlyc3Q75mio+vQr4YIFICJnDq9aIvZqZfxmsa7
	rBI3t1806jmOSb/qY+YMDEA2SPbUu0mJ/iBuSqXLx94sDZ9PH1mmWy7SXysHAvg=
X-Google-Smtp-Source: AGHT+IHTkfkTbO9687i4Pn2+RihIVEo5h0oCdzVOneV1P9azYW/tvjOn1QPbNPDGhVqGXxDgJEBHuw==
X-Received: by 2002:a17:903:41cc:b0:1fb:7c7f:6447 with SMTP id d9443c01a7336-1fdb5f6b353mr10313025ad.25.1721685493071;
        Mon, 22 Jul 2024 14:58:13 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:12 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:05 -0700
Subject: [PATCH v6 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-xtheadvector-v6-1-c9af0130fa00@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=1788;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ZzH0VgSdYutk/uKY2omj651o9v+E5HP1BijtgXJzAp0=;
 b=nZEeYwaJqqmvsjfP3STCkMzgTO0YV5QHpTcK9EbgMZdRapnAEgagfXnzOhMbcFXpInDpLxRU4
 H+rbxMq8H8mA7REaKmytn+kSbxVFuc5Ssov3TqrIQwafO799xnPzEis
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
2.44.0

