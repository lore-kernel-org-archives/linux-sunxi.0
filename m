Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ACF39F184
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 19:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377336; cv=none; b=X5ZByD4zmIj+eRc6qfXY5DkE1mVNinbr3C0KK3e3eN+ptZKqF1lbKlGPgyMAaIzWvN4mkOsOa+lhzFQIApRsqUR364Yh0e0adOyYsBBNEKqhktzDf9C8btXRhAn2MtbWcpqPlsNXyhww6fLl/b0K+/mqnCrhK1Ov216o7u3TMzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377336; c=relaxed/simple;
	bh=PN7g6f8q4rSe1aDYWdm44A7DdQCKh0cTB6fHIX0phH0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ca+/whOdmqdIuoNsqcKSHyGUi53pBiwLoIqKs/Ol5tsORiuiC53ho1X6/hrvzh5OU+AyFJAyZZyb7fXPjsDPwjz62YifqBKPol6BmT0ziWY1hy4TLApHi9zK/OOQ3P8Xeb0NDa47bpY3DGw2eOuG9p/oi8o270Y2nCREqkOayzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O99qMubz; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O99qMubz"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4ab47c40e7eso973416b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 12:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377317; x=1788982117; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BW8pn0cJ7xlLT4nbmLaz0pA0nlL+jRYhrPKHSPcS2Ws=;
        b=O99qMubzxMC9+pylVOFRfzDyn60cQigoeHOhM0q0vwnznWGX/XCUQldptK50fjREMZ
         A9nA9+FZ6Frd+ARHO1+DfqJb5p0BA/3Mqay7OsJW+U96CKrlIfgs5DhtMAiJ0SZsXstK
         bORfC5bxLZRt+AytbuzRBEB1PVg91/fZR/0gn9N26qw8X47aDvqArSRBCm4L6Zj04Tgi
         JZNs/jG7oYlbi3M8awSwOV6H4CqU8GM7T9OXzxBMqqDpXduiWcXF9dLE3ZpNWV0aVTMq
         XJaKfTlaYWM+UvmdUqikeekMh0nwJWM9AU0EMGXgACJcv9eFUPn6v6ilkUpxEySw53hm
         sbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377317; x=1788982117;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BW8pn0cJ7xlLT4nbmLaz0pA0nlL+jRYhrPKHSPcS2Ws=;
        b=qZMXetcTlYPUpEhI0+EJgUIlBSDWd26rnYqYAJU6JQTEiziJ7A88ZMDK3h60yMI8ks
         Hze0bQq07/2yNccMpVBeLc5URkruPeee0UrZtTsCn0PAj3DoZdT/QDSpXs1WHNDBGGFo
         IgGX6HtCcTgRIxkmtQsZgaSPwV4wBZgvylL7dSn1/a/v96nA6ID0HMQzILRsCOW9+m25
         xyIokhUwRFNyqJbadAvQBXEoyjC2BtQAGw9EI7Olk3Wt4vPTbOFssrIZIN9T/bxnNJ+1
         tDY8NDniULFxRZ5pvapWtP6NcqJf+gEdrwS2pRH7xKHgYimSPOijr+/fLOTqkx2I6OZS
         Elsg==
X-Forwarded-Encrypted: i=1; AHgh+RqQFWTBS46yy0PaggD/3If82+aUX6F+0XbCgSKKn4AyLtNylRlU9mJRiSeSCjmRf7Egpbi8j5Ue9Bxd2g==@lists.linux.dev
X-Gm-Message-State: AFuF++lsY8WF6S+heyNWm62CDiaIFowv63KaCHqZHRBNeVoIg4LQG1WL
	wXsCS6gxPqhefYv5o0QOtcYs8GAcWc1vvm/813MqZZulkbt9tfK8lm82
X-Gm-Gg: AR+sD10pDITSfvpSmCmTJMFgiXAho+XDrRBECcrb6uT6VnKTzgFv0Y7qH5Q2ZgTy14S
	U2ml5wku3iYLmFwQB1nJ3UxOnEH9m6pYWtIsfcUQ7G9zyI4vBVV8WiUJxQUcLsbaLp09kWc9OV7
	cbWE1LcWtU3ljuKuRpLjff6b0D5LHtHf9PZx4Apt2MxfxdmuVH0AHQeTn3M5Bti+YbxMg2bj9t+
	Z29+qGftFSqaQH+r7eTTm01pBLwMHXGcgmNqM1guyGKr6LFnnt7n5a2MqHBz2qy8qULy7uBMmxw
	Z+06gEBNLHVYvw/fX+jbdbmNnFe2xrjPeJW2buXzkDu/ZPactNvo+bu8xKdXfSotYvTTqlbORcA
	F4LWlRe82Pw6CnmSn94sYF5VH6z0SGhwO7FvWIcT5S/qDlI3Ur8gQXkyFDO25sjLBgeWKgziAIV
	OjElneF1B9VEJ2j6jkKyWkZwuL8iEJKKVnas2fZRxwy8oQIbNKlcoQc0iXWSWlh/nuZTyYSjHl0
	4TlAC1nJCnN1dEOvo7HlDVCLeYrgKy1RoHlwHh2jDv6H/0h31hzsaU579UtZTuqNlRiIJs7RA7H
	lwwCTPmT1R+tafaNUZKNQ0Tnfp5MKrSCFpe9wMskwPHN5wj+lW/2dqpbYTrtsqZol+z/dPQn3pR
	r/JjbsWXuZloacg7xpf0=
X-Received: by 2002:a05:6820:4c83:b0:6b1:be9f:ce6c with SMTP id 006d021491bc7-6b47ecca88cmr6183827eaf.4.1788377316798;
        Wed, 02 Sep 2026 12:28:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm4932181fac.6.2026.09.02.12.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v8 0/2] mfd: add X-Powers AC200 support
Date: Wed, 02 Sep 2026 13:28:23 -0600
Message-Id: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XO3YrCMBAF4FeRXDuSBJNOvfI9ZC/yqyOmlaYbF
 Om7b+oKCgpeHjjznbmxHAYKmW0WNzaEQpn6rgZcLpg7mG4fgHzNTHKpOQoB+dcmGsE4yTmk6AG
 t8drzNkhUrJ6dhxDpcid3P/+53hyDG2dnbhwoj/1wvW8WNfcePG+f/KXyfQR/7UwiB0VAUcDBR
 iMiKoFW4nafDJ1Wrk9sHir6hfr0adEVcMoK2UqH6/YNaL4BTQXQch2Vkmbtm1dgmqY/Bjsxtk4
 BAAA=
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
the shared input clock, initializes the paged regmap and controls the
common reset. Audio, video and RTC functions can be added as MFD
children.

The current regmap consumer is the separately submitted AC200/AC300
Ethernet PHY series:

  https://patch.msgid.link/20260818-submit-acx00-of-dynamic-v1-v9-0-b8c8d9ad0d83@gmail.com

The PHY remains enumerated on MDIO, its primary management bus. Its
AC200 package node follows the x-powers,ac200 phandle for ancillary I2C
register access, adds a managed device link and obtains the regmap with
dev_get_regmap(). This series and the PHY series can be merged in either
order; AC200 Ethernet support requires both.

This work builds on earlier AC200 work by Jernej Skrabec and Andre
Przywara:

  https://github.com/jernejsk/linux-1/commits/ac200-v4

Public AC200 documentation is linked from:

  https://linux-sunxi.org/AC200

Validation included an x86_64 W=1 object build, dt_binding_check, and a
combined W=1 build with the PHY series. On AC200 hardware, the provider
and PHY completed 100 overlapping bind cycles while preserving both
device links and recovering a 100 Mbps full-duplex link.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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

To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (2):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    |  49 ++++++++
 drivers/mfd/Kconfig                                |  11 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 136 +++++++++++++++++++++
 4 files changed, 197 insertions(+)
---
base-commit: 9d0e4b1ae5b045a2c92b0b9a1c3b268191c219d9
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

