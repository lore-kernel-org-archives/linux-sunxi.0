Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268EF3C141F
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 03:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122359; cv=none; b=VwUhpbyMOODZOldsMJpj6Lb9e740MvXjRF8mbscFdEClNwRMbtmNYSBFOiU5nXiW6TSWh99k4J6j+o5wWuOPlxDKL4VM2oxVaIBNeEUMtIj1wmszvFxhFVm4WAgZ9nUQ/ETBK4/FA2KUhnCcOSgNdhGaZFoU1dCy5i2gXWA5CGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122359; c=relaxed/simple;
	bh=A1STkpE9307vxyyhV24//arWM0j0kn3Imh1Mn5JF96w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqfIwGv/bFr6E1c3iKlWJvLnh4AQbRXoqf10ZOxVyOcF/8WUgN2ksF3HNcNpm6CeQf9ePIp/V1Eh/wKP2dW05rJmJ2iy6IxNChBFyNwEog3k6TzfZvV1k1HqlUKoOX/Ke26u6oAc3pRTHgzdx3PLpBnczkcwxCmoJok6Hm9oNko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IY47efxw; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IY47efxw"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-823545ce223so2086521a34.2
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 20:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122356; x=1792727156; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=IY47efxw6C8gpgDCpgFccRWBDTQlMNr38cfMAT6BruIjwUAyXvzkZBe42Y+VLmkL1c
         fg3GKq1EExtmxqmk8Z8fBcEkTfhCfwDqYra+HSappc4pLyT6+G3zT9HLNhyoqI2JQwNv
         UCklANqMvk/bzS53wxGhWBKzIM/FUFhwNku5tcc7lIUaBuSR5ielUTUXFV4a5HUWUOrR
         UOOoSNTUUx9SI/yZHLqe5xhEcet5qrjhhFdvo7IQlXv0Kifmu2dCj2ZuwaKYLyuZDYEX
         Q0xbBeuGdmjnx1kh3fcRDrOtfpW36pK76pjkOwzoAhbP5mwvsauF7xkLGRL0DeBLUajc
         Zvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122356; x=1792727156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=mRk5pLo8KO/diyr4hhs6uo+3Nhwx0gyVU38wH+uIrcc5kLrMUWx9Z3KeoHzvqylf0c
         LFlel5soFq+yxkWcnopy+VkKCE+ZDB59yrDVQxNVUJyoGpGtF0JSNaneJcwgqGY/j7mr
         y4Xhz8HTHAlgQoV/3k3yUNNqjDxucP9b26gzhYM4OsjB0OJmeASLpD0oBGmuF0PrNg/q
         JvI0KSTEHKbwASJrF23IEkNWiBxi6ne4M0OsIZSndXdnThNKULDGIBkvknMVJtnceI3v
         HpxDoF+IdHfPhGJqlNhjjEwVuh2X0RmpL6hZ9XxWEteI+igoaWLaUfsgLmAy43vqfyfx
         QXOg==
X-Forwarded-Encrypted: i=1; AKwUvBz138nRWMOxqUgWD63Tw61y3LiAulQZK4W43YBlp5cjKROyc1X7pwtwLNbORejB9nVTZtGv6BIWoVGhrw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJAlVtAOtEnXb4xwWYQnaOEfelQucdaHVX88rji78ENVZV8oZt7
	Zy67yEIoqCW8p+kC14r7vvZZY3qgpUKW7qz6dRrJYYoJm6XWnz3xv2I/
X-Gm-Gg: AYBFou0Nxu8BMKEoemQ3mGfeIavppYlUkhRUGO5SsF9CgFJUT5xQaRsYgMJ3lbk6QR9
	TukYmVIFp/6Rz9LXVTB2tHXKBN+TcqAZJ8StHyf7ZQZC5j8Dmvh7UQQvMnLi//Xp0gc9EcAL1qL
	DozFZeAf6oEFdUv4jrQ8v8Vpn+hK2nJyZKel8F9K2/Ng9FG8LnVD19cd44gVTrKe4Fk1pueFPnY
	CAYRyHOH8A0Ryr9tgT7+O9fyMwThgKEYxaDBmpqU2+uAm9jaFwlf1YUGAsgqXTD0BTcaofTYn/w
	cQ77puyXjfujvOhGSWEpiUIQc8xQgEIbnymjT9bu3UbTDszVEkpfFByrOpjJ6e/GCWl0wMJoLx0
	prVAsTvVN4T7VVNeht4KoBCDM/4o/ad8NNOaHo0ZRVQTmjFIygj3mq+EpiURPXpc/OOsYTQRFvt
	8v6zPryv+LEFxNxCiuBYWvoi4+68vktY0zR+NVSluE2uXizWEnlWPGhRLc1rJaDY9y2WvF2mKZS
	JGjEWj7GdbuWp6PFmPCAx5rv8PuHzmgEG1J4fJmSsLHOw6qm5zdahpTxVZ1iNtieO3Q5s03KB9X
	DlOpjOYPSM6tVO3G2bmeJpdxPad6yniT4gQxAa8SpJMHjgZ5drLeFZtaiMG3zVXEArViFmJEUKH
	z3oVM/uREqPm6vqRYxGz3Dg==
X-Received: by 2002:a05:6830:43a0:b0:81c:4784:a5e2 with SMTP id 46e09a7af769-83094e738d8mr20216845a34.6.1792122356017;
        Thu, 15 Oct 2026 20:45:56 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:31 -0600
Subject: [PATCH v8 16/17] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-16-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware writes the bad-block marker as part of the
controller's randomizer stream. The mainline driver compensates those
two bytes so that the physical marker instead remains plain, even when
the rest of the page is scrambled. On H6/H616, the firmware also places
a fixed amount of ECC-protected user data before the first parity
region, whereas mainline distributes available OOB space among the ECC
steps.

Add an opt-in property selecting that firmware page format for the
configured controller hardware-ECC geometry. It identifies how existing
flash contents must be interpreted, rather than changing the format of
all NAND attached to a controller compatible. Without it, retain the
mainline marker representation and protected-OOB placement.

The property applies to normal ECC transfers. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes,
including the physical randomized marker.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

