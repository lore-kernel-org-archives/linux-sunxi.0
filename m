Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0282E3EFFDB
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Sep 2026 21:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788815001; cv=none; b=naidx4NGk6VaXTdRuCasmVdg2jSHUtQM7j/H2qnHrTiTSdLyiIMiL3kwCvuCB6xFrxgyKZdatmOe/O9iFUvJK7Vciw3Wif0ak4fH9Fvtx8S25flkL0jM2bD80cOboWmV1E33c1TsM0gsFyLXoX4XONQRJ/vxvM88+nPPQZa49ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788815001; c=relaxed/simple;
	bh=/1RHVGzVNTgjUr8PjNpOmFphkAaZ4GaE7T5O9Vq2giI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XRU+LYCLJDDI6NFNVHDY1idq44ceTAjbkAKkcqAQDHpmA4+GaaCpYc8yDbol3txDm1n0KRymhniTbiKygmVQcBwJmwg+2uw8i3VkCzL5uFvchbzLzs6mxKcrHGimXsMF/sIt69ms/gZU6qjrRmGAt8xVsWDeVOMLjMvzpWZwKP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTsaL10k; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTsaL10k"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb6573bd52so3703961a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Sep 2026 14:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788814998; x=1789419798; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tpw9Qu/qg2Vc6uWyZCIa2wBsFTsdsQiRWzmo291uKVI=;
        b=GTsaL10kYFJRMp79s8utgt5idwRuIq7IIeeaYc+LUEH9/aYtMLnA9Q6oiVBCHzZvA8
         9XTrWTAir8xa8wSZctIonaDUlNQX79nvZh9XiUAgjAfDsqMjb22h4tf4ZZy2lmSU0Bix
         C5iyzzGVwRjAbvRF/cAj+ChAyCPcwKFEmJ9ptERZz4UayEop3awwJsLlHpNUqrYUVj8f
         CWZE9LbC2Ww1ZfWWlhmeXcCFlFS4rUQNu/XHA5ihyoPWhSXyzXfh/fOTHUnmSh2GqcLY
         JljyGrYBnvSEnPf8XEccJTLFE/1Lt4ni76PesJxiyWUW8UP92hlBAjr4FA++EeKOCJrc
         0kSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814998; x=1789419798;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tpw9Qu/qg2Vc6uWyZCIa2wBsFTsdsQiRWzmo291uKVI=;
        b=kMnLZUdHMiMbLY88+l7n/AiTU+dgaHw9/VRMJozsuEjxJk2+sKUr5NeVacEE7hk9Fr
         p88PRSzOr5lBYduV52bHVlcIQ1uIhVY69q0R/SpSAvpbBuMrO9spWwSG88h3M821R7gg
         dlyI+wrN72Gtj7FdTfBG9sK8RzLmOUDfA59PP3H7Q9t5F63n1Epm0b8S8inaMbNZdWPA
         QP6ZwPyiewXLC36qkxhaxoThKO0LC8bEs0Hp2uwXeQtthu+WOPkCyGpTaIUwWY2Ad2rj
         b86LPXOwtOOSUKY0d11EPsI16qHhmHRvZxYkFMeqZeqjejkCkVUcmKwyfadp8ahavQG5
         i92w==
X-Forwarded-Encrypted: i=1; AKwUvBwqYgD1HK+Gdt8bsuEISiHouiMNSlTghfJmMMAQ+Zyer+NbSsainT+tdePu54kRAD8wLMFSOqvFd6A7BQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nqlZiizn/aLNkhhBz5k/5lqyd3OjO9XJ+zHH7P+VgpKkQbnx7h
	hyOp2yV5rbvZN+M59LseM7oTGKFQhvMa3UiPoP8Kf87U/mOPkWpILpq3
X-Gm-Gg: AYBFou0PTeCx9EXvwEFE6yWgYDEWDBF2uKtA1K43yAq8Llupb7milv6nCx5h+y8Znoa
	vJpL7aBjkTT13MOsJKl41iCohISXnJ1XQ1pmmV9LvdFc08uQEk2jGVtiZnAGAf1Dgq70z9GpToP
	MJjh62KiBBBBhGqlc66dXhJEM9d8SP1KnLrdVQAECjtQ7LRS8tR+EUbqhoosMB3ISCm0LD72ZOb
	c0koda5hXTaWo2wM/AceZ6IAyupg/OfOWYjp12msW9Lix21MYxzXc3mJn1mgA7wmB7HYihHsLPl
	j+EFVEhf+Rk3LCA/Za23VxK9mLP9q9CIMhiAviDA1RS8dGEm6DeboKbumcjYVzU1REnxes256/U
	Mc+vYBuTdVDKGwdwOufbL/KGUoayWXdSi9HAo7WbK3tkebWRRKEMRS5xzuxNPdJSdIAjdKLpZ71
	P4OWcr4Dth/kZV8aRv9bQSMJzf+W3ZBPTIJFQc8ol4lslEzDrab6DLdXbqweg9+jEH0X1T7K3tm
	WubVo26U7wU7wXm06vq0Od939ZGe5p833+dr1caXwEA04apiXujV1Fq0zPfuRzQp9uqZzXTzket
	Gw6BpYQyHzZPf6xAse0H+A6IISoiGEJrESwetmqiie+6ngOBe456EC6SZOpuKgL0c3lMqMKY8t/
	OC+HBLO8Xgx3CtBLJNRWGqT14rwW+DQ==
X-Received: by 2002:a05:6830:6736:b0:7fa:5c49:5237 with SMTP id 46e09a7af769-7fa5c49544cmr14692047a34.16.1788814997753;
        Mon, 07 Sep 2026 14:03:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fc68d5ae2bsm6640077a34.3.2026.09.07.14.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:03:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v11 0/2] mfd: add X-Powers AC200 support
Date: Mon, 07 Sep 2026 15:03:13 -0600
Message-Id: <20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTU7DMBAF4KtUXmM0HmJ73BX3QCz82xqRBCXBa
 lXl7jgFqVEbieUbzXxvLmyMQ44j2+8ubIglj7nvahDiacf80XaHyHOoA4aACkgIPn67Nk/cegT
 gbQqcnA0qgIlIktWzryGmfLqab++/ud58RD8tzrJxzOPUD+draZHL3h8P5safKt8nHs6dbbPnR
 fAiOXCXrEgkBTmk10Nr8+ez71u2FBW1orY+LaoCXjqBBj015gHQ/wG6AuRAJSnRNkHfA3QDDOA
 GQBVAa0FpBEfW3wNmDbxsAKYCyukYUJMh8wAIWAtqQxBQiSQRIwWPLjRrYp7nHzpQVWAUAgAA
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

  https://patch.msgid.link/20260906-submit-acx00-of-dynamic-v1-v10-0-dd272e03b547@gmail.com

The two series can be merged independently; AC200 Ethernet requires both.
This series is based on the MFD for-mfd-next branch.

The binding and MFD implementation adapt earlier work by Jernej Skrabec
and Andre Przywara, retaining their sign-off chain:

  https://github.com/jernejsk/linux-1/commits/opi3-eth/

Public documentation is linked from https://linux-sunxi.org/AC200.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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

