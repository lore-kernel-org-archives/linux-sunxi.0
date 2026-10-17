Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ECE48383C
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 19:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266826; cv=none; b=Rb7xPasHpTjj7jt2CNJsV4JKC4QEG2u7HRxL3lKAEpR21cFbv/y+ZQLeSMHJKMfAbWemeVGKGsw4Kldcz98tFxExc7ESAD4FL0HwVqojqBEbWrvKcg9dxC2VV30tNkcVS4xLpTtstUsx/D51j9inwgAL6P7PYXJK7LTj+tQ15AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266826; c=relaxed/simple;
	bh=A1STkpE9307vxyyhV24//arWM0j0kn3Imh1Mn5JF96w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MkO+ynDXKhuP/iTzVW5k9UrKXV2Y//q/mPVlgFKBcGiRPYikD7gxkT7Wtuq3pA0zstdIvVBMdTcdFGMExAGBz3Ksfqzl0kAhI3YgfzpyDRxAZ9G+FvpWLcUMQca6m0282d5hgnRMYDS7AFFVy0bzBE9YCYwqUNTHoArX4oQWom0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECebXROB; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECebXROB"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-84751a20d87so112353a34.3
        for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 12:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266823; x=1792871623; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=ECebXROBa+4KIRYxiaunrFY3u5ogsQr7U3ahOK0Ml/jLYZDDG1Dsnx/Z/qhIj+9pFE
         OdkhfzF+gYL9lvvYQbOKRvA8empAa3++93JjBLWnHrtB5Iu3b4aipXIcbsk6UiLVb+Hm
         tV8ULHeQ96Kzvlx/mt06mKqlI4y5eV+YighiEQX1iT8k+wZlajmvJHXrFM7Vo4PeQXzh
         nkkm27iJxu3vrDG8uJnWBOTgJ/JO8xV6EMoYxyEue5KtwYbpujsEu9U6KO5TznjBXIov
         EBnJf83JFFzSeXk/7i0MiTHvEVKnssegfcbT1Q6jcRWliul9ww37ERCx5ZLqIJVZJyJR
         7zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266823; x=1792871623;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=Z4hPCGqSHVxGawWA4e6GpSrQUvlS4V7jNgIoMggTW0o+vd/L+dDjeVoNKuytED4GYG
         OnklH37d+LRgMrqA6p0DR277CxDDBM6ZpLdrTFc3WZRFNMnaCESCe/1VHjr6+T4n3n3v
         o8YdSPCwawCqke1PmyS1gT9YK7QuI7HE/EhuTqT86hJZWxgRkyjFBpYwL3syF7Li8E4I
         EWVcTYrHOtvCeUbzOnuelMIzhxtjWYZuADJPwC5OKHVavpR1DQE6Fl892JqRq14WdZuw
         z3a3ydssZAlTzQK+5u2864RV4DnSSPDX4outM4kLoIcSa0+mpeakc2fbTlbqD2iOI9mr
         PC0Q==
X-Forwarded-Encrypted: i=1; AKwUvByUAu5RL5cO+BVJSSjD+y8rUt1SVfuZNxWhZZoPWf4UuhS8V9PBl81m7GS6pa2BldyJm5GRd2HLzDnx/w==@lists.linux.dev
X-Gm-Message-State: AFq9FYIxqj3KmMv84BxVP8N4EDlGnhJJb+Y2KLkZcVjBanua2LR/iUvE
	z/xn1WsJtypwQ6roCrFRQtDgSAwUV2sT9SjGrjZ64W1a+Ek2vSlx8v0x
X-Gm-Gg: AYBFou3HXrysEv8arYAus6kXi2MTCeXL4O/zXYp7I0m3jSEh4YDOyQFDQCrKwSNWK8k
	Gy+/smCoRbDFz+y3Bi/6whZsEs4ixQaxvyZuVpwGvA7aSM+PO5f8F4oFJKFWRCh0x5Du9ed2wAG
	6FqCJueZTEY8Fmy8SJtWA9bH1F+VGO8MTCay+IMs70HQdIGIg2PX+yaPhhXFdA8O9vkgDEIncBy
	IlvQG1OCwT26b8c1LBlkmkO++CpypuqsNm9AzMWBQjci0PekYUJ2wKsL6Krf3hjqS9mC76EA4Io
	sRJ3hMqw8Czwv0PAxFm1rIvE+HWfPf6GzpwHLa2EW+UK6kmsizyiZRutJ3d3ZYzfEItedzFytI2
	NTGwFNmYQwIDazIX8jZTCb5ZHRKLxpz02lSnMIVNyGDvVi304Z+OmTYGHB6aPFpcLJeSo1ENPin
	WWcDDfkTqUMV2JzYAo076+29VdggvoO+7iLslcXv3/j9y4ILnemyM4tedLZ2g4CGYbZAKJtOAgl
	8lbBTZrh5tSNpzCEej19xAVCURjtWvHKcvd+BuO5RmGIwF3NcFRSYBc/haAebHujl3tv1F2BQND
	0oqwRiecXyGzTg/WhJBCOhz6U/fFgPj9aLlIR9GsVdkQbY51BrPSW39D2OPQsKiS8wT2rQpgVyn
	JuDwCkzD0Zr2JU3kI5vVZKMTJkOvEZg8GED68O4X12JU=
X-Received: by 2002:a05:6830:4389:b0:806:3072:240c with SMTP id 46e09a7af769-84501cf7377mr3819310a34.29.1792266823279;
        Sat, 17 Oct 2026 12:53:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-845b9e280dbsm2212064a34.19.2026.10.17.12.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 17/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
Date: Sat, 17 Oct 2026 13:53:06 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-17-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
Content-Transfer-Encoding: 8bit

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

