Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E416C685
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 19:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721848445; cv=none; b=NzvC9H+aAqyo1F1Yjpf+dsxcc719vbBWipGzQ4KucTJkCJby8GLtAgtUjeBbLxqY67j15662AzSShYzQBqfZ6Vccd3UOQQe5FLVsXQ2+YAqmjCq5Dd95K/MEmJ4lfL6o7Fv3PMI4KYm3t144znxHc4NQPmi/OAnE7B/pK59Q8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721848445; c=relaxed/simple;
	bh=ZzH0VgSdYutk/uKY2omj651o9v+E5HP1BijtgXJzAp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CDnM6FTqeAoHw7NOe2yiZrknhTxyON5c7BaFqDS+LSqXp9xuDCGb71228XR8lmzpYv/6MPNIskmCOpglPLzNQ09EDURxlwH29SoUzyRifNxv8nN5GVrqN1mMtpPE9O8xR5HHqOYFrSEPEusMJDEHwWeAG4IOncE6lAMt3pHK8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=m2t7NrKg; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="m2t7NrKg"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7a1be7b7bb5so129767a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 12:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721848442; x=1722453242; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=m2t7NrKgZ7nz3k3BdogNHns7IS/a3re6VL77LKKXLwv9EkEBBDHWOiajB80QolmETD
         akYaPuua+l+pYtDyKODXa8aXPpKKQEp/X/TqMPrD93aaL7go0z/crdYF1q8GRysMYEz8
         TLL0jDM36W6HaAjzVtkxO0XArbELZ6uFvHXkdKhMPbikOkXIhz4gwLL0jx5JtciT3xka
         7w9hPqTd+mtLLpE+GC3GRJxPsIY7PsgtAqdwQUUzQibCdX9qBBpt0KZjLjGys+AUaVYS
         nkQByAwPhVb7lnePsyD51nwGzDZgSvrAPNOxpAyQoTSKfkPH7gq4VeGkfYopdrE1otgM
         ztRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848442; x=1722453242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=EIZZk66AJbOO+l/jEMS5QKn/Hh6euigPAphvdxgJif96Rv83MVsGjb3f+m4vdPlTF9
         SkQxboK9kLSgSO2rUjmqz3C/NjQLOn5y9Dpzs91NMgLk1nX+TWAwjG9S19APj5dH8S+x
         iFwcE+3iaG/IGORjoLrGMlMQlKLGOExynwpP78mqzXGbCNPHBAD2DnSUE4L9HR/v6vO5
         SETmQF5ODN2WswCX6rC7qyXzVM5ltUiHFah4o/skV8pdpWxyn5JJcOHa7gCVHeIWJRpZ
         CA8WIYFS0TmWvJcukw9+eUbOVcpkFvd8pEH8Lc765D5t0AZlux5rvZjmsIgV+i0FtOkB
         H9IA==
X-Forwarded-Encrypted: i=1; AJvYcCXXy+6KfWvyFYw2o/JzvsFoJCsNMy5UBVubcjx7Qd+I+3x2NIuRenyGusbysT9HQVjbynBbFwrSHxOgvChOPEeeJQf/e4lPqRiCGfY=
X-Gm-Message-State: AOJu0YwQi+jIjLNyqkxuuOFRhc9Z9EVzxWMdVapTsaUzV8CFXVBgxJFz
	NUv5sGH2LkDUsk4We5aKSKu1pBdg9WWnsgfzhVUuc4iYlsWizT/+C89k4cX4BLA=
X-Google-Smtp-Source: AGHT+IH05meby4+2EXjFgjam7LAliTRmTubnFATA6oDUhsso55xLxKhzyGK68nAM9BHIX9A04skdVA==
X-Received: by 2002:a05:6a20:72ac:b0:1c3:b0d4:3e8f with SMTP id adf61e73a8af0-1c472fb13d8mr1037520637.14.1721848442605;
        Wed, 24 Jul 2024 12:14:02 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73edecesm2022359a91.32.2024.07.24.12.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:14:01 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 12:13:52 -0700
Subject: [PATCH v7 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v7-1-b741910ada3e@rivosinc.com>
References: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721848437; l=1788;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ZzH0VgSdYutk/uKY2omj651o9v+E5HP1BijtgXJzAp0=;
 b=dR5c7ckZTs1cKin6Lbis5zjwQCaBrNTRDODqsLLnFPnwcJ2p+c7cE5w58tm9O4LgIawNkO0cT
 pquX6jLm+C4AKGK5w/+LXn1eHmAkdm1FU3PKqEqJgnv3qi//AIF3pgV
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

