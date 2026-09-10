Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D2522D792
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 00:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789000017; cv=none; b=IaQT3KaQ9TMYKFV6R98e5jOfvMlX5KCJ0eiOKkaYbKabnc8p8daOq04Purh3OA7gZT2rAQZ3ksjgmTwVwjyW8URkGaIjsWCBCXPkr9XHx0rlZkCYv3m37YeE4/qhiEJm+BXtkQnl/3N5dx+no9Qhs/FLBlQY15QIvlkChSUFSuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789000017; c=relaxed/simple;
	bh=RIXKv16Aru2M4tQKU6z+MhEDUZYJPpqno6Opxuayn9w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SRY3mNk7Dsm5dCD38BvgUySgotDkDC4pQJKqlkKFe7EIPE/d87IO9WUUrF8t3egc55w86GYhFUGCz6+esiVUy0LGyQOQL4uM6vozSFs7zP2NxQC5UCWXBk0MIMwJr5Qxiji1QOrZabSlqw42d4ULT9qk4mQuw6d/by7RDjiJj8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGMGHArJ; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGMGHArJ"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-499f6e0bbabso4223527b6e.0
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 17:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789000013; x=1789604813; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Jdgkq5Uq5n6rA9cD2yXMgC3ZncV0Yws6KPpBDh5fU4=;
        b=pGMGHArJSf7WxdejsLERao2B7G2f3xJ7abWMb6epSvsx3/hNa5w6490g6e29R9g8OD
         D9/VH7JobFbd5nrtCws2Eg6XdYcgagikgk7JpwRm5IJYSQH2rvXwqz80mg+A9cPcmCfL
         a5NbAdRc+rlwdx+XfmiQjO0TNXcDP8C+joufmqe5zVaL+2gWplMBSOCMYTaFQNeXgbnK
         SAKpsVHlVpoXWCT4hgLLl2E3eq+dDj6PqOvrSTps6fYQiQ3huSkAadMqN8lor6ZRw8rv
         U84/EPcm8D+EyzCrxxApgR9+wUIyudhlFlX4vJHC+08XPmNm8V4LzNx9LUBhVi+DJmSE
         r0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789000013; x=1789604813;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Jdgkq5Uq5n6rA9cD2yXMgC3ZncV0Yws6KPpBDh5fU4=;
        b=f7ZRX3q0TDwynVoehNPcki8iFRQVOnkKuiV0diS3ELKsBqbnipDs7FVDyQGsRm6lyu
         hW1iSME8GZ/irbAfx480zNAipKUUNnUHwWofAGhucOw8fZDXnVNeHi8bIf3u7AMqMlKp
         9YNay2h4YsOIgkuK3+WNZFnbT0UwnicfnTVGHr9Rza8lUeGztbAb/a104f+ak70dpaWW
         a7DcdxSZ5v7NNjkuQJ/JLKro8JaqhKlsWc+EgwxnnuWqLOy0vqEnYZub4DZP1m1DePjh
         mOzTxEVLUibLtwxe4YlGV2xMN/dX0mZ0DgVplXM5QSPYMKWveaU7dRqxvNGSXqYbxw2P
         n+hA==
X-Forwarded-Encrypted: i=1; AKwUvBxxai+WvensM3yDB6NuW3rT/tk4j716WFwZFZKIiHTTfuEC/DL3odw9wTh993gEkdmVvazbyHbEsgRikA==@lists.linux.dev
X-Gm-Message-State: AFuF++nT270DWjdh1IHc28yghIPSyMIbGOp6I9h2xX/9lVDRfL15NMBP
	xZBg7+voUEu0Li4He2ez6lC8BTJESc0iFgR7SKnLXUG2Mpg3gB1s/l3b
X-Gm-Gg: AYBFou2kvRf/pWNZ/bOCme136/TtJmTTtMmHEGmpvDSr/8zqaOp8y2lk/ZBRLzxefSu
	PUfjALMjWPB79WdnR43ZlDBU14ZYEMIymeYL2dwo0ByVwFAbThwu/nONJjQH+uCeIt6c8MXxfNW
	tsYvKmU06aESavKfPSm/hfyYXrvERcqRvcvKR59Kf/5U7vcxtneO+I3Oi944Pt1Fux55RJ+DsSM
	gC1MDdL0V++1AbfljXObAqILCY4Y+0ka5bebhOvU9RHNAtZ/I6M/wWo9808ZD2coyh7TwZXKXXl
	YRebXbXynu291EnKNSNBAFeZ4khd7SgzWGnohgXItGgP3CpM9JYQjD5M3rsvu8Co0Pb4UYqig0f
	5wNI7WOYp6H/X/86kOZIsncMXQp+byrI9lsfkG7oTS/7FH/b6PGvSIYCqa4qlAviaIekSPgPRTp
	GaxwGH50OQbR+YvnlHCX5U+Ef276cJfxzhGJCUZBeAnRyQqFY3IgAd4tlxzbkxJ9sVgy6hynGez
	UU85sbH1/5r9HUcBK92vWPZODCRiMNkZ38qnO4VdRwFgtiR7n4ZyV5fD3oXVfDEarj7fN0rPrSV
	/O57fCOK/Rw62w2Om/tRLAd9q1Q3ajeDamr7VowzqaHcV9cTi16FPlbAiwn+1SGpN0ZZvxWesWS
	fdmQBJi8yJdhrwo9VaGCAgAxfQ9145jVqa2krpHLo
X-Received: by 2002:a05:6820:3405:10b0:6b7:8415:d797 with SMTP id 006d021491bc7-6b78415d88cmr13815338eaf.66.1789000013189;
        Wed, 09 Sep 2026 17:26:53 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fe2fbf5db8sm10182789a34.25.2026.09.09.17.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:26:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v12 0/2] mfd: add X-Powers AC200 support
Date: Wed, 09 Sep 2026 18:26:49 -0600
Message-Id: <20260909-submit-ac200-mfd-v12-0-a44d6bc30a4f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTU7DMBAF4KtUXmM0HmJ73BX3QCz82xqRBCXBa
 lXl7jgFqVEbieUbzXxvLmyMQ44j2+8ubIglj7nvahD4tGP+aLtD5DnUAUNABSQEH79dmyduPQL
 wNgVOzgYVwEQkyerZ1xBTPl3Nt/ffXG8+op8WZ9k45nHqh/O1tMhl748Hc+NPle8TD+fOttnzI
 niRHLhLViSSghzS66G1+fPZ9y1biopaUVufFlUBL51Ag54a8wDo/wBdAXKgkpRom6DvAboBBnA
 DoAqgtaA0giPr7wGzBl42AFMB5XQMqMmQeQAErAW1IQioRJKIkYJHF5oHQqwJvUWISkgKwQSvk
 zJ2Tczz/AO9vlxwVwIAAA==
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
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

The X-Powers AC200 is an I2C-controlled mixed-signal companion IC with a
paged register map shared by its audio, video, RTC and Fast Ethernet PHY
functions.

Add a complete binding and an MFD provider with audio codec and TV encoder
cells. Describe the audio DAI, analog supply inputs, TV encoder display
graph and optional bandgap calibration in the parent node, without
separate function nodes.

INTB is optional. When connected, pass the physical IRQ to the TV encoder
cell for shared, threaded interrupt handling. There is no DT interrupt
controller or private IRQ domain. The ASoC codec and DRM bridge drivers
remain separate subsystem work.

The PHY remains enumerated on MDIO. Its separately submitted driver uses
the x-powers,ac200 phandle, a managed device link and dev_get_regmap() for
ancillary I2C register access:

  https://patch.msgid.link/20260909-submit-acx00-of-dynamic-v1-v11-0-eb45e89ef918@gmail.com

The two series can be merged independently; AC200 Ethernet requires both.
This series is based on the MFD for-mfd-next branch.

The binding and MFD implementation adapt earlier work by Jernej Skrabec
and Andre Przywara, retaining their sign-off chain:

  https://github.com/jernejsk/linux-1/commits/opi3-eth/

Public documentation is linked from https://linux-sunxi.org/AC200.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v12:
- add Jernej Skrabec's Co-developed-by tags to the binding and driver
  while retaining the sign-off chains (requested by Conor Dooley)
- add Conor Dooley's Reviewed-by tag to the binding
- update the companion PHY reference to the submitted v11 series
- Link to v11: https://patch.msgid.link/20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com

Changes in v11:
- fold the codec and TV encoder properties into the AC200 parent node
  while retaining separate Linux MFD cells (requested by Conor Dooley)
- describe only the optional physical INTB connection; remove the DT
  interrupt-controller properties and internal interrupt-number header
- replace the regmap IRQ controller with a shared physical IRQ resource
  for the TV encoder, omitted when INTB is not connected
- mask all sources before enabling INTB and leave per-source interrupt
  handling to the function drivers
- pass static const MFD cell arrays directly to the core, without copying
  or filtering them by DT child nodes; share the cell initializers between
  the IRQ and no-IRQ arrays
- map the function supplies to the parent using MFD supply aliases and
  clarify that the distinct AC_LDOIN and TV_VCC inputs may share a regulator
- remove the DMA-mask workaround now that the cells have no OF nodes
- drop the binding Reviewed-by tag, which covered the earlier parent-only
  binding (requested by Conor Dooley)
- Link to v10: https://patch.msgid.link/20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com

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
  regmap, and clarify its origin in the vendor resume path
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
- rebase on the MFD for-mfd-next branch
- Link to v5: https://patch.msgid.link/20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com

---
James Hilliard (2):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 168 +++++++++++++++
 MAINTAINERS                                        |   8 +
 drivers/mfd/Kconfig                                |  14 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 231 +++++++++++++++++++++
 5 files changed, 422 insertions(+)
---
base-commit: b07adc1a304c7ca9ac25a01051561538757363c9
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

