Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108835E1D3
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354919; cv=none; b=Wy6PqAvmcmRnoGFtU3Zm6l5D6/CojlS1+98DMoF1tdqq8v/ly+q0HpUye30HYUPjjVsaV4ZqqPeR7dAZC18rizgCTSZ3flvmQ+/iWuwjvzwNhqTmT9gE59iFwn1HhGx6KSKP+zPybAP5Bd09Ii4F1EQzQZlMhfqzhGt4w004fIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354919; c=relaxed/simple;
	bh=TnmhAN7UAS2ynuFEOPQLlzD2wvbIo/yeVWwhOMqNS58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ksU66hQt3ClyGX1XLQLkBdm1KaTU3yzXtmWjlwljSLDnJnEbeaGM4msUC/KcoPGKeohIFKVvwtXtOkcuuQOq6+LCpVSECa1X4xRY35Kh9TbtrMN8m3wQ5qc05dNz3TG0hu82w+cpI6nbKj25MG1BDETWhEkPP6lUeqVkou3psEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3KZgpaQ; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3KZgpaQ"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-804f7045f3eso379768a34.2
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354916; x=1789959716; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=e3KZgpaQmsIHDrHGMhgTraFFfD2wi14TOJFkG5QP8hYRt7LquGGXhjkoP8thUSDtvx
         Q+rFIGktoTaerfNp8wM7GZUoXkGxeOuVuodf5CAXrbz9CvQ3aXHslTml/Sbw9WIuah+r
         vuHD8X2tQUHe0aQvdJo7fJd0qmSDzvuyV1tdpITdgtE861515LPnc3MvG3tKzEIGIM/p
         hUMNnDfrMHWPd+s/YgZ7OikBcjlzj2wRDNOaS8h6dqfP2ckR/+9OZ0vEA3hlfsuNz0Bg
         yLAJTu7HjL3zaJgk7w+IwJ3B28j9MYnLDwaYD61R+Lko0n5UDCBlCdxg1kI54DfqRxtr
         RzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354916; x=1789959716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=TOdGzzVKxQmcnIzapV7VBlHp+cMKQsizJxbuKQQ3rcPjTh+ye45aC5bbJzRGyvuWeG
         9DTgdelsgESx06aM+lGB841wI1/BYJ3VRFzAQOUplo6nM1yOV/v1lD88OUMlj5hiKijx
         eay2qaT58G1BaJLtaNBHYCzZ3VsCU5pLVSeta9+2M2z2lTgQiGBuH3xILiYNjd/6lLoH
         S5EnUc178Xh9WQZ9kUuxViz4eb5YmMyUfR8AFO4VHTxZTd1ceoNJjE4Bq0wxiwlKyByW
         rIIK75wUkJw8/Mb8NiDeVFXnx6sg1KcIRG77tUTb2k2+I4O9DLPKkAD1QRz8FTaO80oI
         VLDw==
X-Forwarded-Encrypted: i=1; AKwUvBwCjBvFWf77RG037OdQ57z15F0jPAg8S4nOare2Ug6tbj4PLeN+LLO+JdAFT2Kcf4cOWyerHVWGI7aSlg==@lists.linux.dev
X-Gm-Message-State: AFuF++lDBOHd+qxMHOSuU7PnmPp8FB2mcZn93u+inkeHRq8vxphhAUfV
	dpK/TJ+lotPJ7Rb/ieLXvUo0JYcjlxbP1isk42ycsBJx0kaZJYs+DNWx
X-Gm-Gg: AYBFou3dIyGXJE/AarAoUBId1b+BbT6dPXL8olpQs9W0mlXT0o6rF2ieMKxsnTvrzsl
	sjn9RKGLjTg1liVRQLrE/rv/oSqfwYn2nhziXyk2hy+OTYB3K/EuTea79T+rwVFxQfYC1aIUvvF
	zSX93KSc2GWobBz2qCty9uVY8oEOGxE9jpDHq5BpgnPxCr4NBVY4Y/2z4y8zhdplWmPWtL0l+Qe
	r+ZS16GExiy7nPCXqTWFO1sqYPFRX2I1pZw49gaOiCPJDZiHckR8OUh6T5eE3vRcV72WRBRUy4I
	pcXFrWF86EQ3SPsv2dWlrrSSLlBPMNYqSmMLk27f6dlr+DWKzu7BihySThUO8iOHQmv3Pl+tD7v
	vujhDgL6AO6t5Z5dIPH7XWA6uZorW3oNrTGxSKe1keImuk06qqGVnRQGyw/tqmGbncgcaakps0S
	pO4ARms3pwIssxiErp+jnAvI9F2rQp68ruSX57Y64OupnMRtZaigYCGDvscJBU1Df8LPhpZlnhW
	I3zNRJDOc0uhSU1SWDw5VKjUbsxOQ7AHjygKSSthWOgBhDU0/42dFEtZiVzhd0/5a024tRO8L0Q
	oKfEPAB4AzkUUJHScEpwf9vDkfmxY9B5DBjyyLQt5uNqdsHOhViSg5WwIGgrfpfi188fkMkpusm
	VS8kCrOhY9q3J9GcyR3Eb1eO06IhM3jeCLwPIQmpX
X-Received: by 2002:a05:6830:230f:b0:7fa:ab72:9dfe with SMTP id 46e09a7af769-80899b4c24bmr292105a34.22.1789354915667;
        Sun, 13 Sep 2026 20:01:55 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:18 -0600
Subject: [PATCH v5 12/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-12-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property selecting the firmware's normal-page format for the
configured controller hardware-ECC geometry. This covers the
vendor-specific randomizer, bad block marker representation and protected
user-data placement needed to access BSP-derived images.

The property does not change raw-access semantics. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0

