Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC40E509F1D
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Sep 2026 20:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466211; cv=none; b=hIplxdBBBoKlBUtzspe8oieS7OCo2qG1DGnPIog7iXZTiJslG/Kx4qkTou5UxbE6MzNonXWtcI8AcOadr3s4eYWYG2o5/435nQfJ8lVjMO1zIs3PZgkrYAu+DuOno7U11f7PJAiqgr+1R0wdU2/rulT0FV5CiZXwwZYUeUdgens=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466211; c=relaxed/simple;
	bh=33gmwnaoOgewiIfzCE3tR2Aa3m4ljb1ArNTdi+ongu8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lm902/YLYp+qpJ9F+/VhKigavH3/dltQ2LVmYfsqzSLXqR+W/JvhMXpN5Uj5FY+GB5yjDmEITbaepvahXO4EUlpj/QOLSaLfJu38C32haNGeZnJNyh2Xs+YUOL60l5gxtEqjpzJhUX6sr+5OqsMxfPz8WAjxh2iVHP+kiR6w8HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC+f8pST; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC+f8pST"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4a40bcc8d69so271642b6e.3
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Sep 2026 13:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788466193; x=1789070993; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JWJmyHh0/BVQQFMvbAXDDBvFjk+duepqeHP4tC9bWq8=;
        b=bC+f8pSTwnaB/8d6Oq1FhiVDjWY6GParV9yP8+Zek78NYDjg91cABzDArv6cWxALgH
         j/gSsMqK4Wx0jaJodUl7OfIcMfIkxB3CVFQk4/c2+oqFEuWM2z4V4OWYSVRnBRjgTzeG
         BA4w7KYYJo/QHt8NJF9V0RRM9Z3CCakwikMBirzfPCem1UOH6lDX9rFemHlcWt/UKi8m
         bP1UuyqvuE4NBXV68y7rd8tKdoRUXFlF8r9jkRQlOPcM9dmnYVtgQP99sqm7lDIpVEK/
         7TT0bu99+P2VKzcIKXRTNnHvz5dcat/F1MT7v1QAtKB98eDWhKRBEW0NQFs7ijht4Y7d
         sh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466193; x=1789070993;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JWJmyHh0/BVQQFMvbAXDDBvFjk+duepqeHP4tC9bWq8=;
        b=JG4uv+Cl1oE32Di9nIMUNwnrYnMyBle05gFk/qieUXSVq0aHyhUjwZksgfwOtX8P6M
         Ia5k4Rn14gx1R5PL7lW1PrYQdCTDFABS+/V9aiaQsR88k9vBVW7FodPBSU6W/AHSq67p
         w4F1A79xMG9cdVHmiWgrjxV3tZ5kgPUAnL9ELCizI9ySWkUMJZRxI1qYabXN0BsEZF+v
         FjqDFbgzQOSjiIWdwN+M1Ghd9ccDRGt5y/6G49HMUw33bcK78SfHWs95LEh0vTKEyTN3
         WhjmRCCT12whns1AYK7vX7+yj6ZXNnqAtFfc9eFnjBQQMDxkG6UeiKQLyJdkdyHJxLNp
         X/Lg==
X-Forwarded-Encrypted: i=1; AKwUvBx6TPyzN7YKPtQzkU4iqWugJ6FRk0QUpJBC5VbsW2J/nWqn2xEe4lLg4Bxs1FDleTA5TbDEg7EzwDhhrg==@lists.linux.dev
X-Gm-Message-State: AFuF++m0i6Hg0z1vrXPMdIP88pWFkjCYO+5HRfRTWk9j9wkBnbZIMeBw
	+5NffSUrzBsCnPm+dSGJ4jShSGo1239yCFxdBBLzuOf2Pw3gYWdjrhH0
X-Gm-Gg: AYBFou1kPy0Q5tBlg4ILZ/YVAyKYwiVwGd3VCfIpM3c33UPb8s+sSbuML1Vgu99BQGu
	4dyicdf++5l1JvoVOZfvLmrRl4nxSbIyy7E0lLGiCCKmFHIHo5HbREGtBwsL5FMaB77dK+tDgkm
	Ge3SnHLnWP4D3r0et+vn4+EeqjRZ4FO30niAJdJQZAgR/A3hbxucXjSWTMUduMuCQSqs595KNG9
	gp+bqoqtGfKu+7KnQnISsiPD8h9awOi8Q812DD2PLg+R4jAI0zYZb5Cle+VYvQFap00LsSxiRQO
	JoA3YQYcUw/irq6kgR9AwticU1KJd9mkUKCsa3BBOmbZdqpTMIt7b7wgtMWawR/+3VipIprIgFh
	drTVX6aFyrqt1wgOpjOSjEXrRNWvXD91IYTC9gM31enk3qQjXALB9O2vfChzMEwm6F4ujxZnkFy
	K7WGDe2l56tXvVK1tu5X8XY7hiLBGxPn1XK0F+n4NcOe/NftDZhHsxl4aXbDtCYj8HwhoM3WnOp
	MfF7kUeIsegS9FgVqjpv3eWiOafqxC9fVKk2vY3uNgLPl/naD0Svrdjwvtuk3ZQJIleh8h5A6qy
	XU4EX80yZ4AnapwbfmC2N6+S0HEvCEblqRXGxtgaF0U53gvxbN2g9RiCrTdIwHAbGseBhOa6FDp
	uf2fQtpl2g9Kzvhy5FjQ=
X-Received: by 2002:a05:6808:159b:b0:497:da47:df5f with SMTP id 5614622812f47-4b9623ccb8emr868245b6e.17.1788466192869;
        Thu, 03 Sep 2026 13:09:52 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971246d9csm252885b6e.7.2026.09.03.13.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:09:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v9 0/4] mfd: add X-Powers AC200 support
Date: Thu, 03 Sep 2026 14:09:39 -0600
Message-Id: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTWrDMBAF4KsErTtlNETyqKveo3Sh30Qhtovli
 oTgu1dOCwltoMsHb743F1HilGMRL5uLmGLNJY9DC+ZpI/zeDrsIObQsCEkjSwnl0/V5BusJEfo
 UgJ0NOqCJxEq0s48ppny6km/v37ndHKKfV2dt7HOZx+l83axq7f3waG78qfFjgnAebJ89VAlVA
 YJLViZWkh3x6663+fjsx16sQ1XfUY8+rboBXjlJhjxvzR+g+w/oGsAOdVKK7DZ0vwG+AQbpAcA
 NIGtRd4SOrb8HlmX5AtPRB/SPAQAA
X-Change-ID: 20260811-submit-ac200-mfd-8bad6d09e285
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The X-Powers AC200 is an I2C-controlled mixed-signal companion IC with
a paged register map shared by its audio, video, RTC and Fast Ethernet
PHY functions.

Add the parent binding and an I2C provider which enables and rate-locks
the shared input clock, initializes the paged regmap and deasserts the
common reset without resetting state left by firmware. The common reset
remains deasserted during removal and shutdown, so unbinding the provider
does not disrupt independently enumerated functions or discard wake state.

Describe and instantiate the audio codec and TV encoder as MFD children,
and provide the shared regmap interrupt controller needed by the TV
encoder. Only enabled, DT-described function devices are instantiated;
PHY-only systems therefore acquire no unused platform devices. The ASoC
codec and DRM bridge drivers are separate subsystem work and are not part
of this MFD-only series.

The current regmap consumer is the separately submitted AC200/AC300
Ethernet PHY series:

  https://patch.msgid.link/20260818-submit-acx00-of-dynamic-v1-v9-0-b8c8d9ad0d83@gmail.com

The PHY remains enumerated on MDIO, its primary management bus. Its AC200
package node follows the x-powers,ac200 phandle for ancillary I2C register
access, adds a managed device link and obtains the regmap with
dev_get_regmap(). This series and the PHY series can be merged in either
order; AC200 Ethernet support requires both.

The child descriptions and MFD implementation are adapted from earlier
work by Jernej Skrabec and Andre Przywara, with their authorship and
sign-off chain retained:

  https://github.com/jernejsk/linux-1/commits/opi3-eth/

Public AC200 documentation is linked from:

  https://linux-sunxi.org/AC200

Validation included dt_binding_check with dtschema 2026.6, a W=1
x86_64 object build and strict checkpatch checks. On AC200 hardware, a
writable common-register marker survived supplier unbind and rebind. The
provider and PHY then completed 100 overlapping bind cycles; both MFD
cells were removed and recreated during every cycle while both device
links remained valid and the 100 Mbps full-duplex link recovered.
Afterward, 100 pings in each direction completed without loss and 8 MiB
transfers in both directions compared correctly.

The available board does not expose the codec, TV encoder or INTB pin, so
the functional audio, video and interrupt paths were not runtime-tested.
Temporary child nodes nevertheless instantiated both MFD devices, and a
temporary probe driver bound to each and read the parent common-control
register as 0x1.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v8 -> v9:
- deassert common reset without first resetting the entire chip
- leave common reset deasserted during removal and shutdown, preventing
  supplier unbind from disrupting the PHY or discarding RTC/WoL state
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

Jernej Skrabec (2):
      dt-bindings: mfd: x-powers: Describe AC200 functions
      mfd: ac200: Add codec and TV encoder cells

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 186 +++++++++++++++++
 MAINTAINERS                                        |   9 +
 drivers/mfd/Kconfig                                |  15 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 230 +++++++++++++++++++++
 include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
 6 files changed, 454 insertions(+)
---
base-commit: b07adc1a304c7ca9ac25a01051561538757363c9
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

