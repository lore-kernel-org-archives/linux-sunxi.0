Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05E51D362C
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Aug 2024 21:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724792488; cv=none; b=Nacn3mJPMqclMN2wwW9ejvDrevH3Lc/D6S69mcLBRx0z7ACA+1tSaQOng/XXRU4X9cG6tsPalsMPvRhBxSVkKKU4xdHD58JtQJM023tze3+tqM8tOBQ0qSSpC64LMHRMikfvwVroMXuf4FgJDJPmjVFlDwRP/GqJYSvPB9aWy3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724792488; c=relaxed/simple;
	bh=ZUQNvjzepWA4pCK8RLWIXzlmS349ucRwrxxaYBZS3Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCUddjInOg20OfSM+TZJ8/391PvzbOHrDRNzxLACVmmLO0p8jUNt64C+N1nM+nquISyBGeDJMHJpFv4sPEmVVDaQutekVHDxuXBVwxFLVr0vvB9htWU+v5onG34z/cWIRqq7awDFLmKMPlsN4dYikevpnfePHyCbq3Didw2S8oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6nx+iSq; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6nx+iSq"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5334a8a1b07so7379052e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Aug 2024 14:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724792485; x=1725397285; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=557eQ0nrkCY+/ANVkKP3VQXQ7163oT4FiuaAuauOfKc=;
        b=T6nx+iSqwobdQ1xatOyXUhxSEcPaFScEe++DVxKrJgabcX8t3QShBuGwr80VlJkOz7
         cC2iMUghED0Sm/2Rr1KS27xkqFpEuROSH2Yh2vUQCMM/2sxxMi1asfeQeaivSfUXJaec
         UyVzHc93al31dxG0YErMIuLEoiUQKQOnULRHergNZKB2g0NC+RrmZDbRb6ejYi+1g3tZ
         1126kiJzfHLYWXazYNKZS/IJ6BReMHL+DVdZiowGSrJg62wzRtDiV51c67IS/ZXRFOzK
         QpOsSpyvRBQkCQP5hVIoXya3rHAfsR16AtLR0zi02WwCMf1vzdsNuWuB9XcdOEJiok2K
         grjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724792485; x=1725397285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=557eQ0nrkCY+/ANVkKP3VQXQ7163oT4FiuaAuauOfKc=;
        b=jEOsH3RGIzbf7y3Jum6tlta8FdFcWy9/d0JP10CdLAasE8mYCczGpYirpwlfFVdiy1
         YP0SxxBbEVFHdG/x2HXo6rszTR4ql3q/9bnDVQrK4hWK1aUTiBgdHp8i3fv6xwWJYZYV
         DXkv4Qkw60rdGyWmxGTZiLzsn9mGdl9CV2vhlViukMm38ob+D73J5UOzU6hgPJzkC5H1
         UeL+FxTmDqFW11jOoodjglKX3Ai3hPPZ1n62bVoIn9gXtXVfH9kmMpFiNr9CSFDstAkC
         l9LuWHZlaybqNgnYN5uaHU0dda5oc69S7dmTot7Dap7/cnAStkr4ITqYh7rxdmu310Fs
         yYrA==
X-Forwarded-Encrypted: i=1; AJvYcCWhE8Zdn2siAjRYWU4wPSe3x2d8Fj8irtVh0Gleq2XQMBcbtzXq9i5okadHf5hkcIdCnN4U85U/b7dX3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuBrPyBtK/IU2mvqH6T8hbwa8p15m7VhmvNevLax3HsBnjl6lO
	wMWudrCC+n+ft+FGeYJaSZzL21i021sIK5yVMWApctejpnNyfxqj
X-Google-Smtp-Source: AGHT+IElOZVXVj/FlEZ3fbmtBkOLSrsihpcHyRreC5BIEGKSLXXKFN04zZD8UqjwCA5j+FE4FKXBkA==
X-Received: by 2002:a05:6512:3da9:b0:52e:f950:31f5 with SMTP id 2adb3069b0e04-53438832e67mr10098468e87.18.1724792484028;
        Tue, 27 Aug 2024 14:01:24 -0700 (PDT)
Received: from cleve-worktop. (85-193-33-82.rib.o2.cz. [85.193.33.82])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb1c3114sm1405835a12.13.2024.08.27.14.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 14:01:22 -0700 (PDT)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Date: Tue, 27 Aug 2024 23:00:44 +0200
Subject: [PATCH v2 2/3] Use regulators for pio on NanoPi NEO Plus2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240827-nanopi-neo-plus2-regfix-v2-2-497684ec82c7@gmail.com>
References: <20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com>
In-Reply-To: <20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724792480; l=958;
 i=cleverline1mc@gmail.com; s=20240824; h=from:subject:message-id;
 bh=ZUQNvjzepWA4pCK8RLWIXzlmS349ucRwrxxaYBZS3Do=;
 b=OhH9WG6Wv6Z7PRWzl1EICmfw7GOLJF8ftG+PLNKrN978hxBL+u9qLUob7ALa9BomlnNZ/FhFT
 BEERtDUuzqqBHX0a/5HrQR62Z6mGP4Wyw9rbExnS+yHEhGYtAGdeoVt
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=CQifx5FUgTQKAoj5VCYrwYHi235AkXQ5yT1P6gkaBxM=

Pin controllers pio and r_pio will have proper regulators assigned.

Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
index dee4cd82636b..526443bb736c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
@@ -171,6 +171,18 @@ &ohci3 {
 	status = "okay";
 };
 
+&pio {
+	vcc-pa-supply = <&reg_vcc3v3>;
+	vcc-pc-supply = <&reg_vcc3v3>;
+	vcc-pd-supply = <&reg_gmac_2v5>;
+	vcc-pf-supply = <&reg_vcc3v3>;
+	vcc-pg-supply = <&reg_vcc3v3>;
+};
+
+&r_pio {
+	vcc-pl-supply = <&reg_vcc3v3>;
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pa_pins>;

-- 
2.39.2

