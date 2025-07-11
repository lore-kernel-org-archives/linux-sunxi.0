Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037431A00E7
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 03:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752206337; cv=none; b=SSwdYSYjnunxsGPVfPKb2j4l+mEMJBhZBY8SG/8P8CKpaBnu8m1D+2gYP+YjZuiNAl7Vre6lRgiHnz0uMNvDhzWegpkQhkGlWuN0wQFkPPrhsqlpfZIbRLkS8v1KCh1xOxCBKMqn3LlXf1EurTlbQcU7qjOwTHqNdC9MZds3EgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752206337; c=relaxed/simple;
	bh=qYVF5nrefqk8ZKCPwYrgT19os3rsqUvuedsH6yMaRYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CdVuXKgeM4pGmWMbvmT0zker0aVyCbiqArvyb5wNihlfHI74peWjS+3To5P6hIVnSPd6VT5jKnfAifSuKnwErJhIHLL66AZLMsoAAAnzrbs6Udf+ZAu3rhstAYlqpuptHHt6avSg+1feL1Z1ZL/qkjVrGpuRPF0srG+M4OSFlZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcdncOE9; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcdncOE9"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553dceb342aso1439436e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 20:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752206333; x=1752811133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
        b=dcdncOE9ntkv/nSu/P1iGEargT7XJRflPLdp6rSQILxfDB30yXkINi1xbDuVqjbzPq
         SI0icH1AgDgCnEjVuI1Yqr0LArFkq3BOwcn7DhL7/KKQzNeXO0zCJ6iy07ArJ/DnT4Xm
         XbFgR1NQQs55YSoDyT8+ZJ/nxhPMdeAzkB1Icd1VpC9pvOvPPeDF16TgMTW4pj2au626
         Fw+WJA0da59heQJ1W+nfCmdllE8T6kAA/sgvTOMUC5PgmzQLG9ZV4x1pgNL/DEOgII/S
         AMZ5cumceMCk45PHNYAHZ9f+QTDJJkUyx2YEJUZ6+jByGWkykrmfoCnik/QsNEcLzHjZ
         +adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752206333; x=1752811133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
        b=p7d51/DKevvoeCRtRVNvcf/lWJThsqaf6x5MzSYQVtSA2a9IOaz0biQIb1TP2H3HK2
         J+qO0hzOp4hh07Yl8gyMvQMqIHIRJZOkWI7tM4O/zA+fVn3h6qSigmZ09SvQUikZUrZN
         cFuxPAeUDWTOyXgoXhARq0VG2Nht9Fn4pJ0QNI+Ay/o8DcN88632+4/nkB5cIz90ED0E
         KIubwDhbKI33nxpobnSwpUCTqfSjBGFvyUqYqdUcto6iGqr2asEaQ6HimEBuD7qvJVDi
         Di3pvor8o2cK2wwGeCrn9UDgQuhYk2J1K4vtkVMGfHdu6F5H5KaSWCHAvRGuEaFGVqQh
         6eAA==
X-Forwarded-Encrypted: i=1; AJvYcCVL+ccr+Wb+oQi/9FjjA+9z7T6j0DfTMPt7uxqU6Z7bVAZ0a+zGyLaH/J0fQfZnFQpQHOFODeWBpO+A1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ1KVKNemnF1+HLDzWASO56+m6LDuZQpLorqOrbskvAZtn15jV
	bceYsi5BOgJSW2CxHum+swGTxE6SaV3Ip2TyGspGs/rs6UlPydM6xq3z
X-Gm-Gg: ASbGncsHmWCf9E6YLXkuEH5FiJhqbuiluCRTlPwu+jylkZYpMAeMtLKhXl1mMZYGp6n
	SvAEfaeBXFl4S3fZkCokU28QO/66F1n2T+y1y0AEAPcNqNSXhCltPnYpl6O5l+ZEuaTJA2vM5kT
	+CFyHfaOa5Bb+xSx8i/U61IhO+Bz3ijwh9kn4a3m3dLFLBHGXYczj/ORCpZ2m4GSnYqhoWyqLTr
	Ekjj/Wytr7Hnf8sWC8OSgW1d+g8i1SRy9Idr8I99AmW5FOgrfn3wcS0yvDZD5RM5Ay3CTMOlnvt
	qQSWTfoDSiEIyVykeebzZiGg1hEdIqCtovti6ha9OlApMUneAuGCOh2KNG9ByXZCUGXlcUDj+uP
	HGet2sYo67qE=
X-Google-Smtp-Source: AGHT+IGkeSBXm/EW3UWMspIGCG+IQIIuepjGaDlwWyIf9NR5Xr+PDLCyR3s4y1gsKiBc5fqAWrIf5A==
X-Received: by 2002:a2e:be0e:0:b0:32a:8297:54e3 with SMTP id 38308e7fff4ca-33053293f75mr4620471fa.6.1752206332869;
        Thu, 10 Jul 2025 20:58:52 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:58:52 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.or>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/3] arm64: dts: allwinner: a523: add Mali GPU node
Date: Fri, 11 Jul 2025 11:57:28 +0800
Message-ID: <20250711035730.17507-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711035730.17507-1-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The Allwinner A523 SoC features the Mali-G57 MC1 GPU, which belongs
to the Mali Valhall (v9) family. There is a power domain specifically
for this GPU that needs to be enabled to utilize it.

To enable in a specific device, we need to enable the gpu node and specify
the “mali-supply” regulator additionally in the device tree.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index dd6fa22f9..d3528d498 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -108,6 +108,21 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		gpu: gpu@1800000 {
+			compatible = "allwinner,sun55i-a523-mali",
+				     "arm,mali-valhall-jm";
+			reg = <0x1800000 0x10000>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
+			clock-names = "core", "bus";
+			power-domains = <&pck600 PD_GPU>;
+			resets = <&ccu RST_BUS_GPU>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-- 
2.50.0

