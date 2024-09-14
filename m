Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0317143723
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Sep 2024 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726308427; cv=none; b=f2LglGPA8vK1KY1CzbW06LF37F2/Muz8Z6kiqjA/7hQAX+uQFICeDWqR4mklkQh8ec2cg5beEA4vALj6HJXS7RlCvXoR6S4LNhqbppIE5TnzqmJdYfjYYLpHVru0jIaEzacaOICeBcSwVh66kRISUB9tR2aFS2kMxnPmyOk/P18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726308427; c=relaxed/simple;
	bh=B2uo95TFjLNThhU6mneOTIuZhASXTkzS/sf9qt5JAbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RtX1/wx4GsFuWf+dYHC4HiWejrieeb2y4GG8sncZFkgtYqmGGDNARR8uKbqV6p/XYZ0q6oq3UA85DKaGHOwhWaFPB2sVco+Ba59tZVw4IN+t1zCRvtLgf7Yom7Dgxxjpnikt4qt/cCEKbR5J5o0bCvul2sXgkFJ3Dy4wQpOZtTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9fDDHUq; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9fDDHUq"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c26815e174so2066665a12.0
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Sep 2024 03:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726308424; x=1726913224; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oEIrC6fkjUDhUytmEyujyx/BPZ/Dm0y8aAc80KqecXk=;
        b=X9fDDHUqqVemgw1Idozao/q2QvkRC/mDl3LneZ5VgSQPGZYkn1TMnpC5/oq1gJuZkL
         NUJ7HzI7Ei2JGZMs39xbsgiYxnG4HfdBtU+J1c22SojkeyLisQ/h+2ogdO/K2nZBDNrW
         uiPAvfwwKm3F3DsCEJ5fIRHfAQgk+Vr4dwudEf3NHUlAaWNk/o0QKUv02oVbZ0QbHhab
         gSrNXboHGe0kGrrAikaAQ2sVKH7pbHQRN/9p395VF7mIC+bK6Cerb1WlfBcmI5Enzl1r
         g7SetIoIBVF6rOVxbA06GLf9udupHc/ht7wWy6p5YUjvqAdbQTfAtCQIBlNGanqaYFXZ
         LgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726308424; x=1726913224;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEIrC6fkjUDhUytmEyujyx/BPZ/Dm0y8aAc80KqecXk=;
        b=ZxujeZVDU4+l+MRBlDaz7cxFbLBRd5K4CG1su/326imsRSdPuz2XVurTWomtvGoiCo
         KsoITGF2vq1td1w0FH2feJ4KDamiRWKiAJmnRsOyL0jcM58/g0/TeZsheYTo1hkoY7Mc
         RPoFDngpW4cXvdCihSn7hEY5LKUgYplV4Mbs80BgjV7H+4lgM4+Fv67F2peHMKUQTyxq
         H8aiUR4XwrShCZ2UD+zII8l4Er8wAniGvtR1AnFBNK+I/oaeM+cb3c73TCkdguW8auzz
         3B4jEKvNUycBvbDptdJpdSOPA51G2megcQld4BmNtKWnjANfp/hYjtW+TSCCAOz5WYEg
         365A==
X-Forwarded-Encrypted: i=1; AJvYcCVYtLjmHEEpeHtogF1yX9N2b4H9jhprWn4rMVcrF4O0D9CZS0Yl98kdeJyrwoiJy9Yil+g/d4wG+mqp+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwL/otrR/6hYznOpKDURuUFrfiDm4h7ti7AQm0R5MrMMh7WMK8K
	NB7Y0h/Z242jGe7VCgWSizUMI20TjDj4pkO79BDRH2nHeRq+7Hey
X-Google-Smtp-Source: AGHT+IGXhJKaMfZi7R0EnhsiSO5qMw+KJZP5yHlgmcZg4J4vj0+/2FLyveFNjO4NJ+/HQOISxQcnNw==
X-Received: by 2002:a17:907:94cc:b0:a8d:6921:e17d with SMTP id a640c23a62f3a-a9047d1adf4mr547920966b.33.1726308423034;
        Sat, 14 Sep 2024 03:07:03 -0700 (PDT)
Received: from cleve-worktop. (cst-prg-101-230.cust.vodafone.cz. [46.135.101.230])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a906111aa91sm61961666b.97.2024.09.14.03.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 03:07:02 -0700 (PDT)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Date: Sat, 14 Sep 2024 12:07:00 +0200
Subject: [PATCH] arm64: dts: allwinner: h5: NanoPi NEO Plus2: Add
 disable-wp to mmc0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240914-b4-nanopineoplus2-fix-mmc0-wp-v1-1-12f54f0d6620@gmail.com>
X-B4-Tracking: v=1; b=H4sIAENg5WYC/x3MTQqDMBBA4avIrDuQpGklXqW48GfSDugkJKgFy
 d0NLj8evBMyJaYMXXNCop0zB6nQjwam3yBfQp6rwShjldMWR4sySIgsFOKyZYOe/7iuk8Ijopv
 b1o+O3i/9hPqIiWq+/5++lAuw8lKSbwAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726308424; l=918;
 i=cleverline1mc@gmail.com; s=20240824; h=from:subject:message-id;
 bh=B2uo95TFjLNThhU6mneOTIuZhASXTkzS/sf9qt5JAbM=;
 b=5Lrk4c31YFwAF0a+C3UhpMwhNyIjmtsc4QT30mPA4izeJ8UHvH/xMLNfmKhpSYe3KIDe0hyIO
 tiZn1Q+K3/0DbIMaaW9nHZBO+HNrRs5ChBEj9/rFZggux9tF1/X5LOw
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=CQifx5FUgTQKAoj5VCYrwYHi235AkXQ5yT1P6gkaBxM=

The board does not have wp pin/switch for micro SD card (mmc0).

Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
index 526443bb736c..18fa541795a6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
@@ -136,6 +136,7 @@ &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	disable-wp;
 	status = "okay";
 };
 

---
base-commit: 57f962b956f1d116cd64d5c406776c4975de549d
change-id: 20240914-b4-nanopineoplus2-fix-mmc0-wp-9d77fb9e6513

Best regards,
-- 
Kryštof Černý <cleverline1mc@gmail.com>

