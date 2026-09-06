Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7CA3939A6
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Sep 2026 22:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733860; cv=none; b=MtLMlCUyu2Nwo20B3wJCJ7djAA0NWkVetZDOOviA/D8Oh8hzAm0w1+qOm/MJVgdcFNOaKg0Ey6epN3/owsb+ufxo5yagaMJCgqHNF3vJQnMJ8Hp0iEBXjgOmoetpoVRSKEWY8tFj1Qg8Dd74YqoVe/pNLqXvUEnTlV6yUwk2skc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733860; c=relaxed/simple;
	bh=9Do43tfnOOMH9vnpFRKJQymMYEW5k1BPXVMpqO6ODHw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YwWrQ9VuXuKq87kEw4jHRu98/Uc7Vxsru2Ex+edfD16tqw4YJvScw6mZkJPA88v4yfvU70B6mranbq7tGdB2lKTwinuZ0orxi/FjMYh5MWb1PSUQStBHMuOwa+ZeCkxw9EJm1mZJvqexBB74HxQM57lz/nwqeuCbrY7jMxfarTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuMcUrbX; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuMcUrbX"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-497e6956acfso2778885b6e.1
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Sep 2026 15:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788733857; x=1789338657; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R7ofSnDmL0DwZUtbw6mO19Jd2QrlddgbYKJFA0cGE/w=;
        b=PuMcUrbXjVpMpwbnSrmCYCIWh3p67DddkS+Zegzl7Md8KZet5j7sqr8pNqWgT6wiSg
         bcPZrKKjt8ziYWX3XiPQm3gfX6DSVhJ6LBY37wCOTQ0HhL12CaOvgV/8FvicaiClEs5z
         ak/zRWO6+wi+Wxa9HfogxrCkSre2ziBRB3UYS5X6/Wyqzj2LYyFW/NNO00/qDQktjucw
         Vl0JfX9N4bUqwUaPKDiQVHViBMBPtf/iHLYnsVcnf97IbirUnoWrLrG4/a7vsb5cIPoH
         qioqJL5qWyTlTeMP8FgyFRhSDXWHa4hW9Wq8fxkRm/RR68Rv/0X0uGa/p9GBilAgtvSG
         eBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733857; x=1789338657;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R7ofSnDmL0DwZUtbw6mO19Jd2QrlddgbYKJFA0cGE/w=;
        b=VLrrH0OehOYG9iNzZTFuIp0gmx7iD3Cfe34tZSqaFkuC0binX0kxCbUVCLIvGusja4
         6P4z/USk40kuREmvwgLeI4l+PvYII1kKncx4hZSDvM5CsrS+xYXZm9NF5UesjROWh8Cv
         Up4UZvzA78wdwMo2/+1pzAMl8r4mFqfxVVUpOuIXt12ux8O+F7ZhztTDgAWY9MlM52v4
         tlgb8Tx2bu2z+NbULkrPxkXCTOoz/lGLXUME5I4sL0Hp+TFdZDhyIFUiKhGYSdDP8Lls
         +AZvbyUNFq9KSTgFOHmpdggJ0xf47FBimN2eu98gisp3UetXnRKdZoSD2cfFgduf1pG3
         GuMg==
X-Forwarded-Encrypted: i=1; AKwUvBwxE/pKkIp6pkZmYe3CluWGy0Eab+o6Su/qkxglVat00FGgHtYicUw8NPeErxdio9FJBjZfCpMnzgGv3w==@lists.linux.dev
X-Gm-Message-State: AFuF++nyDUABApJwG4ODxrL6eoNy4pNAb4ZYl8W5i81B+xjF0BU/ugGT
	LYF0aLHDgQcxNJiBqDfKrwR4d/t5sfbG7B5j5prXYXvA9JdAxUWkh/XWdF8hCQ==
X-Gm-Gg: AYBFou0nW1RnFM1h6DfjeZi1sqRTeNDCLMcWPbdMMnk+u0D4wKyi1EL6EZkTqruTtvq
	I+kguhKNm7CTBV2+8l5Zjcl+qZ1Z40v2Tcl4RpmmHpmbhWzS15sneBpIvoCj0UK3LHVO1TCPJIv
	Yz7+F5kijozTmx1zDn0EeCCnp0us14ChbFzkQYZa5Qbb+y13s+DQO+0q68LdV34udmYu/kVv3Ym
	cAcARkF1aHCgQmlgesYbLo2BOJ4guQF9rRlRepUAfvzkPocYhULg8A0Gs8yoYdh5pNgeG7r1UrE
	HgMprTqEXc/1rZyEmFRTMB4dN8cjPQmBbsKtdOby6lS1RVSTL5cwvu0eUbqzPPJ9Ebmx0Fe994L
	vh+JKQqKXl/Py3WDikpjQ0kunWX+zdAJZlsXQj9EKIhVUMMJ4VN31uQoUj0QTqK7IPLpbxgCAoE
	TGCp52Kh1oM8JhNHlu/p6FrS8uKgQ4Fv+Li1TMsSV6NCUz9Of8kXnLU+lF4UpmxOF7taqJERof4
	ckN/oZE1DukHpF+Sv1qidfzWHCd2Y7x+u2H1arYRNdEOvozMxuSi8OcDH/M8cYNvvholgSj7Ya5
	Jq09NpXjZSJ/+lmOu3uT1OYtMrUdE2oxszVuUO9W7VwbdCVnrRokbxSAuPjEo/fI+ku2K83vBho
	50aZXQupyEQhV8KqH4eM=
X-Received: by 2002:a05:6808:30aa:b0:4b8:46e3:e21f with SMTP id 5614622812f47-4b97b4878demr9083760b6e.11.1788733857471;
        Sun, 06 Sep 2026 15:30:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d200fesm8701910b6e.3.2026.09.06.15.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:30:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v10 0/2] mfd: add X-Powers AC200 support
Date: Sun, 06 Sep 2026 16:30:45 -0600
Message-Id: <20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTU7DMBAF4KtUXmM0Hmp73BX3QCz82xqRBMXBa
 lXl7jgFqaVEYvlGM9+bMytxzLGw3ebMxlhzyUPfgoCHDfMH2+8jz6ENGAIqICF4+XRdnrj1CMC
 7FDg5G1QAE5Eka2cfY0z5eDFfXr9zu3mLflqcZeOQyzSMp0tplcveDw/myh8bPyQeTr3tsudV8
 Co5cJesSCQFOaTnfWfz+6MfOrYUVXVDrX1aVQO8dAINetqaP4D+D9ANIAcqSYl2G/Q9QFfAAK4
 A1AC0FpRGcGT9PWBugacVwDRAOR0DajJkfgHzPH8BShmUpNEBAAA=
X-Change-ID: 20260811-submit-ac200-mfd-8bad6d09e285
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 James Hilliard <james.hilliard1@gmail.com>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The X-Powers AC200 is an I2C-controlled mixed-signal companion IC with
a paged register map shared by its audio, video, RTC and Fast Ethernet
PHY functions.

Add the parent binding and an I2C provider which enables and rate-locks
the shared input clock and initializes the paged regmap. Before creating
the regmap, retain the 40 ms wait used by the BSP resume path after
enabling the input clock. No minimum delay is documented.

Deassert the common reset without first asserting it, and leave it
deasserted during removal and shutdown. This avoids a provider-initiated
chip-wide reset of unrelated function registers. Supplier unbind still
tears down linked consumers and releases the provider's clock references;
it does not guarantee uninterrupted operation or wake-state retention.

Describe and instantiate the audio codec and TV encoder as MFD children,
and provide a shared regmap interrupt controller for boards with INTB
connected. Only enabled, DT-described function devices are instantiated;
PHY-only systems therefore acquire no unused platform devices.

The INTB connection and TV encoder cable-detection interrupt are optional.
Enabled codec and TV encoder nodes are valid without INTB connected, and
cable detection status remains readable over I2C. A declared TV encoder
interrupt requires a complete parent interrupt domain and upstream path.
The ASoC codec and DRM bridge drivers are separate subsystem work and are
not part of this MFD-only series.

The current regmap consumer is the separately submitted AC200/AC300
Ethernet PHY series:

  https://patch.msgid.link/20260818-submit-acx00-of-dynamic-v1-v9-0-b8c8d9ad0d83@gmail.com

The PHY remains enumerated on MDIO, its primary management bus. Its AC200
package node follows the x-powers,ac200 phandle for ancillary I2C register
access, adds a managed device link and obtains the regmap with
dev_get_regmap(). This series and the PHY series can be merged in either
order; AC200 Ethernet support requires both.

The child descriptions and MFD implementation are adapted from earlier
work by Jernej Skrabec and Andre Przywara, retaining their sign-off chain:

  https://github.com/jernejsk/linux-1/commits/opi3-eth/

Public AC200 documentation is linked from:

  https://linux-sunxi.org/AC200

Validation included dt_binding_check with dtschema 2026.6, W=1 x86_64
object builds, strict checkpatch checks and a clean diff check. A 38-case
host-side harness checked the actual IRQ initialization and cleanup
functions with stubbed regmap and IRQ APIs, covering trigger selection,
firmware register states and failure unwinding under ASan and UBSan.
A 30-case DT validation matrix covered wired and unwired configurations,
enabled and disabled functions, both interrupt-specifier forms and
incomplete IRQ paths.

In earlier AC200 hardware checks, a writable common-register marker
survived supplier unbind and rebind. The provider and PHY completed 100
deliberately overlapping bind cycles while both device links remained
valid and the 100 Mbps full-duplex link recovered.

With temporary codec and TV encoder DT child nodes, a second 100-cycle
run verified that both automatically numbered platform devices were
removed and recreated on every supplier rebind while the PHY continued
to recover. After restoring the production DT, no child devices were
instantiated. One hundred pings in each direction completed without loss
and 8 MiB transfers in both directions compared correctly.

The latest revision was also booted with both MFD children enabled and no
IRQ connection. Twenty supplier rebinds completed without DMA-mask warnings.
All 42 child probes verified DMA-mask inheritance, read the parent common
control register as 0x1 and obtained the expected absent optional IRQ.
The PHY recovered at 100 Mbps full duplex; 20 pings in each direction had
no loss and an 8 MiB upload/download round trip compared correctly. These
child runtime checks cover enumeration, removal/recreation and shared
resource access.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v9 -> v10:
- combine the parent and function bindings into one complete binding patch
  (requested by Conor Dooley)
- introduce the complete MFD provider, IRQ controller and function cells in
  one driver patch, reducing the series from four patches to two
- retain the existing sign-off chains for the adapted binding and MFD work
- allow enabled codec and TV encoder nodes when INTB is not connected;
  require the parent IRQ path only when a TV encoder interrupt is declared
  or the parent advertises an interrupt controller
- add an unwired TV encoder example
- move the existing 40 ms wait before constructing and publishing the
  regmap, and clarify its origin in the BSP resume path
- use automatic platform-device IDs so MFD children from multiple AC200
  instances cannot collide
- initialize the parent's DMA mask for its non-DMA children, avoiding
  "DMA mask not set" warnings during child enumeration
- explicitly request level-low when no upstream IRQ trigger is configured
- keep INTB disabled until source masking and handler setup are complete,
  and disable it before releasing the IRQ chip on failure or removal
- narrow reset-preservation claims to avoiding a provider-initiated global
  reset; supplier unbind still tears down consumers and releases clocks
- Link to v9: https://patch.msgid.link/20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com

Changes v8 -> v9:
- deassert common reset without first resetting the entire chip
- leave common reset deasserted during removal and shutdown, avoiding a
  provider-initiated chip-wide reset
  (reported by Sashiko and queried by Lee Jones)
- stop storing the regmap as unused driver data after dropping teardown
  callbacks
- describe the audio codec and TV encoder MFD children
- add the AC200 interrupt definitions and shared regmap IRQ controller
- register only enabled, DT-described codec and TV encoder function devices
- retain Jernej Skrabec and Andre Przywara's authorship and sign-off chain
  for the adapted child and MFD work
- make the base provider depend on COMMON_CLK before child support is added
- require an upstream interrupt when the parent is an interrupt controller
- credit Jernej Skrabec in the module metadata
- exercise child enumeration and parent-regmap access with temporary probes
- rebase on the current MFD for-mfd-next branch
- verify register-state preservation across supplier unbind and rebind
- Link to v8: https://patch.msgid.link/20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com

Changes v7 -> v8:
- identify the PHY series as the current regmap consumer
- describe future MFD children and the MDIO/I2C split
- store the regmap directly as driver data  (suggested by Lee Jones)
- reset the chip from the remove callback  (suggested by Lee Jones)
- drop the revision log and inherited-driver attribution  (suggested by Lee Jones)
- add Krzysztof's Reviewed-by tag to the binding
- rebase on the current MFD for-mfd-next branch
- Link to v7: https://patch.msgid.link/20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com

Changes v6 -> v7:
- drop the managed external-syscon helper and AC200 syscon registration
- leave the regmap attached to the I2C provider for direct device lookup
- reduce the MFD series from three patches to two
- Link to v6: https://patch.msgid.link/20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com

Changes v5 -> v6:
- split the MFD work from the independently mergeable networking series
- put the merge routing and shared DT design at the start of the cover letter
- rebase on the MFD for-mfd-next branch
- Link to v5: https://patch.msgid.link/20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com

To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (2):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 231 +++++++++++++++++++
 MAINTAINERS                                        |   9 +
 drivers/mfd/Kconfig                                |  15 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 255 +++++++++++++++++++++
 include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
 6 files changed, 524 insertions(+)
---
base-commit: b07adc1a304c7ca9ac25a01051561538757363c9
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

