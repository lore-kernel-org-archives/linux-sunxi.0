Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762213;
	b=T+H0MTCBAKg2hRyoJ98BYKSh/weH2lqXs96wnewjkNO0LrI0hh0RA61xtJAsj+2OUU6M
	 LNBaR3WoLsyxgnM+TMaGQEI7EP/DhoBuJs/+zdbiDz9u7wDp6f+BQdvk+gnsHBoU9jEM7
	 IYGo6GUI0arGT6dhW4to+IYMfnvPjeduogvk8Z+6l6SF6qShQa6/6T60qFKWtynrIwJ8G
	 2dC9BfqNc/Z5X40kLVhEkKqgmg/0+zqYvPoV25DAOlm97U/YXnIHZX+8DQduMRvLAsVix
	 olr50NngYGLtnmGxHzrjmf5P3MNQIQxjGYUgMKdIZEmq/IPN0DFnjCV22GKKMdqFoQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=;
	b=aUO29zLnqGBL6KDpE6GONw9DUxJbee/Oy6YKu47sdfusFiH+2aLo3HvZnobiZcG1Zh8i
	 hlfyRzUuYA2xhFS3K+KRaPbjhHAXeMJkDmYEaSPWfDECBxpg/oVHCfFObLOxaCYtoRoNa
	 Vn8t6kbuuFZGfDb8pRsM1cOcs/NnoDz9M0j3CoF2OxwpUxV0cJbAkhcGex4e6ZqCP9hHL
	 2y13LbhxQczM61C/reTgGcZ/NHe4EhJQcrlVB09fObp6QlNVlg4JPhfX19gAQeJvVm2y+
	 W2XqEYZf0xnAjTQ3j7r+e2LcpObZgsnTrJ81zcg3UTDj4HLkOnUZ4bmUkWeykv0GElw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKoLbXxR;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C274606A31E
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 17:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C274606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKoLbXxR
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49465892f7bso2229739f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762212; x=1795367012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=;
        b=gKoLbXxRvCvQ8V+IwAB6Xp27geItnPwwvmm3RRS9jTmktrR+g0KlElBT4BoynEMZTq
         KyLhN035/fA9IQPBWsuVrIeGGuimX4POGUzQ00a933m0cvCd7Lepe7idqPE5KvSMRwgs
         iDWy+wtnHz+/YlebzR2AfuwDV10dCrWGV7FigNNyBJp07JmtTB7eIpsqVC64YPu3w2Ms
         AEQXMAjTEUIqHVzetoxsTae/j7H9Jox9M4yD1s0AFgTI2rrbdtZKfIBMlnQD/QuKJ1P0
         PQCb5d+qdQ74r5xvvfpLACUPT/b0SWO+bxAUTYnmA2NCjUdlbxdc09ejafbmo+T/lE96
         iyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762212; x=1795367012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=;
        b=XLedESvQVrlL18kO6lpBEBt486anhcvolOJ6QjqjADbQLOviWxv47zTh3JEsQyggEu
         IS+xp4/SF6zJc05fI89gZyEmD3iaq9CY1umcV3nVfdcyzk0s6DibpLYnPQjI8Dpac0Hr
         UcgNPGNtdbgXmxcOjsrjEfH8GqqBx5JOvsyA3X5ImSqk84W/LmzVJ/W7FFB0QR7dh/fU
         /zJUy81TWwc+KLY6LebcqkO08T/YRl+M9GKxqQaDt8XzcbWpYTD7QIbu6vzhlUizfklX
         1dnTzh31tquXJm68ZIaIZYar+FrGbP/1d0btGhIhA+uRLwyHpLpKsRRLlh4IoLVaUEp4
         52Nw==
X-Forwarded-Encrypted: i=1; AL+hErEU9MSEJs3C0Dm5cWuF6Wsfvl1KRDlFx7qGigm75RloZkTrqlOtK8H1goSiOKlwBH/ZlEenDNxH+UDRmw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+kmC9KzzVbOQVWRdoAdNA7QcaN/d7Ke9ljVJsz6ppbvXnqIFyw
	pLFTY5scpy9Nl+a+sW7UTxrmhslymxsMPc/FxiUoDGnbu2Xe08jUMU7v
X-Gm-Gg: AYBFou02UCsuVidmGsc9TP5TgqdEb4l4RgO5H4VlT2ghpxULR4yWDyA3MrHXVf0gn9a
	2r1CH5ctmAQYD7fVyVm84wHNTI5HKpAbJ08ci8Vgdbazx7/kXMwCzJnHs7UMkyOQ1Qcrej8+NDo
	xlmVOl8npz30zzeXPyYLWRlx2WSGwB7g4+r8oX4JIWU8/0jO27r8+WGOjcXko6QGALUktycg7nR
	9zfvOez1g4wxNvium5ZOO6BiOF6akwkCn7nvrkun83HtTiwhBdtkVsikQJY309kllWWlDyDljU3
	+Nn0XKzcogwOltFNrqilHZSPAwph09qPT2qSh0kyvO5zdxhjqntjQj9z8lBHNZRiLV4OADrBDKf
	qXWCwqrNz0V8bhTIBM/58TdOS6l2SbLorv3283tYWQjKbSyynErz0Yc7QsZSzyMtije67oNGr78
	w8e60AxvgAsrsl8GRvNp2AZF2tQRdyHb+/jR/vduzA6+xEnPy63gt/uVcNJoOSFotszMHU9yqDu
	DKbw4FqSA0U2NsLN22sJ36sVNMDOa37iq6sYSRt+2ZP5CUCHGU303Jfmy8QJ7P24hi9M4dIg52t
	kS9sB0wt752ErPsx+nNYXB5zVNdXBn3ELQdUHZLAUeqpQSmnF1HuPt+BB4UpJAkE+cALu2XWm2R
	jFqM/3m5FuhD2FTs23nXvr+f6lTSBPU9DWv837Pxf6jF/RoRnvVxNRcX119OToZmiqKhPQeWg3a
	2IeJ28UWlMfnM5yASJVgaANHUUHr4OdeVV5W66fzBWmm6fqDiLdmPqUlzOOZFgm1KzW4BgAHycq
	6bT8RkvRUxk0Y5X61h8QCiQepsSBbriRHg=
X-Received: by 2002:a05:6000:2084:b0:498:be72:6371 with SMTP id ffacd0b85a97d-49c713aa624mr18863165f8f.21.1794762211674;
        Sun, 15 Nov 2026 09:03:31 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm16719512f8f.18.2026.11.15.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:03:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: h6: orangepi: Raise CPU regulator max voltage
Date: Sun, 15 Nov 2026 18:03:28 +0100
Message-ID: <20261115170328.34338-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdd-cpu regulator on the Orange Pi One Plus and Lite2 is limited to
1.08 V, so the OPP core drops all CPU OPPs that need more. Depending on
the speed bin, that caps the CPU at 1488 or 1704 MHz instead of
1800 MHz.

The limit dates back to the initial board support and isn't a hardware
constraint. Raise it to 1.16 V, the highest voltage in the H6 CPU OPP
table, as was done on the Orange Pi 3 and Pine H64 when they gained
CPU DVFS. The actual voltage still comes from the OPP for the chip's
speed bin.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index a2a2e4cb0256..57b137755227 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -207,7 +207,7 @@ reg_cldo3: cldo3 {
 			reg_dcdca: dcdca {
 				regulator-always-on;
 				regulator-min-microvolt = <810000>;
-				regulator-max-microvolt = <1080000>;
+				regulator-max-microvolt = <1160000>;
 				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-cpu";
 			};

base-commit: c3b0d2bd3ba62c39c131e80d940cabbb8441bbf2
-- 
2.43.0

