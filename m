Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6782E36F6
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jul 2025 02:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751770655; cv=none; b=sq7qIJnvyg7uOLUT1OuDhIk6wipcaXBv3zQO6THXQyc9chVGh/x3zLmXwvbJVCPbVP2mteNYJUZLdP4HdampRj8AYx1tAhNwp6LRMM0WALjvfiqWz67UGW2EyXh2fIBVRYIqszqcKaQB8gv61fpnXavAumnEYNQOv4wFFGWT8WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751770655; c=relaxed/simple;
	bh=IVBiCayxxjuIoAWf7fWUyLznf6nyKVFK0/CzMq6+NGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7lnzUFx6jmtbBDbxGjX6jLSfDIYixAUE7GqR8rlq9rjTV06DWqrVKYBPrOERw0+dPN7spm6brBxyqYCO2j3bHibsbonboZnhYqF27mX66Y0a4DxSAhveoun687NOIkvj+WStyCJYDgFrJS3mOGMDmG4WWRRb0aX+Sbwwpyl78I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKa/gf0o; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKa/gf0o"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso30120251fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Jul 2025 19:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751770652; x=1752375452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
        b=LKa/gf0oa8QiaYxPrh3l4a47F2C47C3jWLAZ1hStq4uRpbZCDJf8uQxlXSgUw6Vo+h
         Ly65vlbGwNVOd6s3m2TMpb8zxeeqiyE13jWKoCs6RAxc3IGFaGD23SZ5NMQv6T5+aQZq
         RWDLpb7zyYLkl7YuVdi3xZYImvSyq2MH0Dg9Y+JIpGck4WQLsoVMceekb5sDwpt4Nbz8
         K6K11yw4dPp9tCoLeU849fEWQzpBjhDrKGrBsL6G+Z5QUymU6IJFBo07VJmZmjcFA7Dc
         dCVrmi39KmpTfkbkSsxr13SB9KYijwVHliS+V/OxQnOcp7hxjkmyjpR7josSgGQ1Pa1T
         0iaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751770652; x=1752375452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
        b=QTwcHews2/wF5zvz7kELx9//GshFCdUkJM9j7tLfyqId3HMA4ZY4Dcx2dZnKosHZAd
         DV1ezkjOU7iC5t1z+pQe2t5GnTiGdFHCvpPHtw6m3CQ02wzr/RuGxtmSJWLhfXtLxL/l
         y5a8yobR+zY1buv2XtPe8lD5VbwGGq/1yFXgOVTXkXASJFBLeT4XVZib8mpO0Kfqtn4O
         fi/h5cmHb1krFKvfPpXBWsVT2GTAoz4jaPAEZnK3vbuB2QhwSIXHZTErRemHMeXhfI8C
         hbu8XNhH5pQzVJqryAw+sFYy5DVGY+2MZHErN6PUp9i1iTIuKVcPtO54ZbT30iaiL8Xw
         /oKg==
X-Forwarded-Encrypted: i=1; AJvYcCVXb1wSiUcSODHGXjHsqdaaF28OaW3FB3aBwyWngw97sVt/5A+8Yfo9UlvjL7isTzvAAPqEHJKPMk0wlw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0SWqcIUS0pimzVc7wzApq8N23Nt/Behh2GDn5ewRDnIUl6iH6
	+hIEEXKLiLcrz9Q09VLwGhb4tfn1K59F/UaoikIqQzQMx1Qc2rR4hnt6N/dk9+mjB9w=
X-Gm-Gg: ASbGncs0w+pxGtTUqDcP84lwK5anrT5XXWLyvsS3dptTiK60Tz79ZeAhUl7fj9fYiAC
	J46s80/cu2FCOJTYdFvml1dPnF23GUNvCIDXugOoRM4kJAZg5C4dyIBTJc/XO49/s0VdWP/NCfC
	gqXp9qYFINLs+UccGVTnfsq44twnFMp2ArpJt9inNNb8Owsz1Rsi1BTwtAcIH/xCUMec4VwHkst
	xnWwnwHcsNlnnPx4lkHy9WwAjv+aSbk1BxIV4vGyd8nygixUvHSC34gS6JJbbm4HwXLKfN1oHbW
	rP0owAMuT+1AApGkePUErJTfaNI5vleKGjwHH7J6nVxAoBXvt6njcZd+Vv3r4mYys/SkatQ=
X-Google-Smtp-Source: AGHT+IGN0Pll4L+siyWkYqepxKdXBDqJA09V3lw+p6WVOCV2OpsJJsEpsce/Z0TPbGFyafElS4Xm8g==
X-Received: by 2002:a05:6512:145b:10b0:553:2bdf:8b87 with SMTP id 2adb3069b0e04-55641a4f68amr1665035e87.10.1751770651927;
        Sat, 05 Jul 2025 19:57:31 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b7b4fsm788573e87.198.2025.07.05.19.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 19:57:31 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: allwinner: a523: enable Mali GPU for all boards
Date: Sun,  6 Jul 2025 10:56:23 +0800
Message-ID: <20250706025625.2707073-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706025625.2707073-1-iuncuim@gmail.com>
References: <20250706025625.2707073-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

All devices based on the A523/A527/H728/T527 processors contain a G57 MC1 GPU.

Enable the DT nodes for this GPU and specify a regulator that supplies power
to the SoC's VDD_GPU pins. The other parameters are set in the SoC dtsi,
so are board independent.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 8bc0f2c72..553ad774e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -66,6 +66,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index 59db10354..a96927fbd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -54,6 +54,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 142177c1f..b9eeb6753 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -76,6 +76,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 5f97505ec..d07bb9193 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -95,6 +95,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.50.0

