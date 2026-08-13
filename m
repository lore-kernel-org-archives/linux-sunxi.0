Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DCE4457BD
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Aug 2026 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658062; cv=none; b=g4Cr8Sl7zfZ7PTFKc0o6KXQC92skC6D/TRl8YQTWCXtxGJ5CxW/uuLVEBBNKqB+aTAK4xkMZiDkfnj3CJ5WnJh5j6yUj7rGZPexddKQQeR0FVDmjz8n+s+f0C/MHVk9GaqtTKS8vrHA0ZaOVy07aEICIeluSLFqaD77YKcMEQcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658062; c=relaxed/simple;
	bh=4dRDfp/kyPwf0LgyQHpXbx4TCvBGI49n8pG+S2ph1zw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N8zpWhpUqxtnFNn26x2BLt7ZqEVwBgb33ChIJrJ10D9hwL11+4I1iqCwAJK6f8RPVCfLP0rE/KvBKYzzIFSTgv6qVyHpzpiVn6lvN9Z+QyeFmkithvGSsJvjo/TkU3XLxuAIvU9PCLnOOoL/VcduQxNoKM10+XxesptWuF9bTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyPCMnE8; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyPCMnE8"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-44caeb973b3so269919fac.1
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Aug 2026 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786658059; x=1787262859; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gd42AGplC+/Rht4wVTsbu7hNJIC1tcUERjT9kA+1fFg=;
        b=FyPCMnE8k7c8KYys3YjnzbMJaMZE/o9A2Fc/54+mw0bM+VJdpNP36SxBeMjXM+N4go
         uH2PX70gy+2ICcBMPxfP4cyc7WhmEyok3Ky30nSElfysAp+YD8PT8q0v9P52qH0J6p+Q
         W3Zp9bFixc8tNQxGRhEKXreYiMQV3/g3IwyiBM3XVtG4qcYI5J7yEqgmadax8gvz62mq
         yUAXUZRg1rLvMKGZHeiOM+0QzzD8fguqW/4d6KzDz05IJZK0R3uzmgpNqle6z46GleYi
         nVTnArdygzjqH20xPju9XLTyrhQV8JFjtgGpkdiMCrXrC8Jy568ej6Ne9yS36wWuz38j
         QJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786658059; x=1787262859;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gd42AGplC+/Rht4wVTsbu7hNJIC1tcUERjT9kA+1fFg=;
        b=CWDbIA/Hk7dsY0ispDJqhwsAFSRTsJDu1P/3joClQ5818cOtJVKUvVNgFT/r4cOvdd
         +OQCujFt/wYLjum7giDaHXYr5DHjYD29qhD0Mkj01ow8VmVfut6aF9gkXa/B0AySHxCr
         F+jmBc3VZWXBmr0PSy54imV0lQ1p/NzSld6s6p3toFilRP82X6d5rGSVqxnsGM1XCPuD
         WyCzGs0Vfu8jXW9YJXRK71+n2x7GrKivUijeF1hVeqf6LpTi+mEZ1/xbIbx0V2573E4F
         pU3k/alq0gPOURD35Ao2GsCEViS3F1soUnVPniAb/oyg0Y5SLCcbJhn2zdaslTaQcbGx
         CK0g==
X-Forwarded-Encrypted: i=1; AHgh+RowHWh1oRX1MzxXicem3Uuli9kwJfolhdCjXBOnmGR/Zo3w7l2zniJdYtYkLIHpKqOF6kFLgRTY25dCjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1Wo3fQ9eDpGUYRv3F76Q9Ys5DzzlCGEYrzdEwva2G/RKp/SJH
	Hg1c7F+dEDGLeZmWcmiC75GdAqt5WXNI9PmUYiWMrVIRuuy9OF8O19ey
X-Gm-Gg: AR+sD11OhwDqfimC3SGQ3Wau6QQjtcno5zI+63wcqNkdAjXGZQW/wUR2Vjaz89HMLEl
	hCycN2Ez+eiG2gjr4XDqb1miT9U+cnb3vz/6fj72AcyeenGdT3HAFamMGC2DjTH6SWy+tyVZwHO
	DhwelvvJgcW7G1mI3R1ASQ7Bu3OcLkyI5GIXQArtHVnAqpxUEugTHd504zcBmy7YGQnh3qFJom9
	7nU/4aW1t+rWBfelleirqHlQjliyNi7NdBpniNgcYVkM8CTK+1F82nsu01Anr92FMGeXdLGCy4V
	/0igDPiaXG0mCvQ68l7vr7rq51CscbaNiYDDrYxWdD/BuzcNm9NHIyLkv/zApyMRUMddSYwnb8G
	GSuDjhIFHwDPqaPsGgfUOwlGwg8L/aj5Gszd1GCzfrzvKWqFcc0pOr+WHvhsuCFKFA8Fv9NU+mL
	SWPiPQ4OKOixA/ckUukuADRcYoRPlb61uUx7+Qr3Z/b32UEj07bw1GYRetVwqwCcxMs3jEYE622
	aU3JDEmipPbsjEmvwCTKsFYJeQKfB7gkmWKl8wcy0A219s5vWVmkuYUmUXIlWbO3yCJk7XUeFyT
	DfZc1RuYE2w3ijIwq8gjY6KPJjITwvIChWzqE1kZ0qbo9DRFkPOsaIcL38UpmaNEwk91hTLc81I
	ZteLLFCrq8kJSRziF0g==
X-Received: by 2002:a05:6808:180b:b0:495:f85b:d08f with SMTP id 5614622812f47-4b241cf3cdfmr822588b6e.18.1786658059481;
        Thu, 13 Aug 2026 14:54:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b22ccbcca5sm2813956b6e.2.2026.08.13.14.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 14:54:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v8 0/2] net: phy: add X-Powers AC200/AC300 EPHY
 support
Date: Thu, 13 Aug 2026 15:53:42 -0600
Message-Id: <20260813-submit-acx00-of-dynamic-v1-v8-0-d2f1c52e87b4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43QzW6DMAwH8Fepcp6nxPkg6WnvMfWQhKTNNMIED
 FFVvHsD24FxQDtatn9/yw/Shy6FnpxPD9KFMfWpzaXQLyfibzZfA6S61AQpKqopQv/tmjSA9RO
 l0Eao79k2ycPIwAhLa89kRI2kAF9diGla8XeSwwA5TAO5/HSK8xH8sNjL7C31Q9vd1ztGvm78R
 sqjyJEDBY6eI6NWRZRv18amz1ffNmvQKLaUOqREoYyLGCshmOK4p+SWMoeULJSLlkUtmXao95T
 aUIwdUqpQFNE4YyzHqPZU9X+qWigepTOsqmT951fzPD8BPr89kQwCAAA=
X-Change-ID: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 linux-sunxi@lists.linux.dev, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

This submission contains only the networking binding and PHY driver and
is intended for net-next. The AC200 I2C register provider was submitted
separately for the MFD tree:

  https://patch.msgid.link/20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com

Neither series has a compile-time dependency or required merge order.
Their shared design point is the DT representation: the MDIO PHY-package
node references the separately described AC200 I2C node for access to
package-control registers.

The AC200 and AC300 contain compatible Fast Ethernet link PHYs which
report the same Clause 22 identifier and use the same link-side register
layout. The link endpoint is inaccessible until package-specific control
registers have powered and configured it.

Both variants are modeled as standard Ethernet PHY packages with one
forced-ID link-PHY child. The package reg value is the link address.
AC300's control range is a fixed package-relative offset of 16 and is
accessed with the PHY package helpers. AC200 reaches its control registers
through a phandle to the companion IC's I2C register interface.

For AC200, the driver resolves the referenced I2C device, establishes a
managed device link, and takes the supplier device lock before checking
that the provider is fully bound and retrieving the regmap attached to
that device. It waits for transient lock holders instead of treating lock
contention as a missing dependency. The link then keeps the provider bound
until the PHY consumer has unbound. This uses the generic device and
regmap interfaces and supports multiple AC200 instances without syscon or
a private cross-subsystem API.

Fixed hardware uses an AC200- or AC300-specific package compatible.
Systems which can contain either package use the ACx00 package compatible
and one packed SID configuration field. Bits 3 through 0 carry the analog
calibration, bit 8 selects AC300, and bit 9 selects its low-calibration
tuning. The driver chooses the backend before acquiring any
backend-specific resource.

One xpowers-acx00 module binds the link child, joins the parent package and
runs the selected backend. It manages the package supply, MII or RMII mode,
vendor analog initialization and package state across suspend and resume.
The common link implementation preserves automatic MDI/MDI-X and standard
MAC-managed EEE advertisement while disabling only the vendor
PHY-autonomous Intelligent EEE mode.

The two patches add the AC200/AC300 PHY-package binding and combined PHY
driver. Board Device Trees and optional PHY features remain outside this
initial series.

The AC200 portions build on earlier work by Jernej Skrabec and Andre
Przywara:

  https://github.com/jernejsk/linux-1/commits/ac200-v4

Public AC200 and AC300 documentation is linked from:

  https://linux-sunxi.org/AC200

Validation completed for v8:

  - dt_binding_check for the PHY-package schema;
  - an x86_64 allmodconfig composite-object build with W=1;
  - a built-in AC300-only configuration with I2C and MFD_SYSCON disabled,
    built with W=1; and
  - strict checkpatch checks with no errors and only the generic new-file
    MAINTAINERS prompts.

The final AC200 v8 path was hardware-tested on an H616 board through a
clean Buildroot kernel, FIT, rootfs and SWU build with source overrides
disabled. The resulting SWU was installed on the board. The provider
reported revision 0x101 in package 1, the PHY resolved its regmap after
establishing the supplier device link, and RMII negotiated a 100 Mbps
full-duplex link. Eight MiB passed in each direction and 100 consecutive
pings completed without loss both before and after the rebind stress
tests.

An administrative down/up cycle changed the package regulator consumer
count from one to zero and back to one, then restored the same link mode.
Five AC200 supplier unbind/rebind cycles each unbound the PHY consumer,
recreated the device link and recovered the 100 Mbps full-duplex link and
ping traffic.

A separate 100-iteration test started each PHY bind while the AC200
supplier was still inside its 40 ms probe delay and holding the supplier
device lock. Every PHY bind waited for the supplier, recovered with the
correct PHY ID and device-link relationships, and the final link came up
at 100 Mbps full duplex without new warnings or probe errors.

The AC300 results carry forward from v5. On the connected H616 board the
driver selected AC300 without accessing the AC200 I2C path, negotiated a
100 Mbps full-duplex RMII link, passed eight MiB in each direction and
restored the regulator, package state and link across an administrative
down/up cycle.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v8:
- replace the AC200 supplier trylock/defer path with a blocking device lock
- add Krzysztof's Reviewed-by tag to the PHY-package binding
- rebase onto current net-next
- Link to v7: https://patch.msgid.link/20260811-submit-acx00-of-dynamic-v1-v7-0-03f5b91775d5@gmail.com

Changes in v7:
- link to the separately submitted MFD v7 series:
  https://patch.msgid.link/20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com
- replace syscon publication and lookup with direct AC200 device/regmap lookup
- require the referenced AC200 provider to be fully bound under its device lock
- keep teardown ordered with the managed device link
- rebase onto current net-next
- Link to v6: https://patch.msgid.link/20260811-submit-acx00-of-dynamic-v1-v6-0-0229b99a32f6@gmail.com

Changes in v6:
- split the networking work from the independently mergeable MFD series
- add the posting link for the separately submitted MFD series
- remove the redundant explicit schema selector
- describe the AC200 phandle in hardware terms and state its purpose
- simplify the clock description and keep only the needed NVMEM dependency
- reduce the binding examples to one
- rebase onto current net-next
- Link to v5: https://patch.msgid.link/20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (2):
      dt-bindings: net: x-powers: add AC200/AC300 EPHY packages
      net: phy: add X-Powers AC200/AC300 EPHY driver

 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 154 ++++++
 drivers/net/phy/Kconfig                            |  11 +
 drivers/net/phy/Makefile                           |   1 +
 drivers/net/phy/xpowers/Makefile                   |   3 +
 drivers/net/phy/xpowers/ac200.c                    | 308 ++++++++++++
 drivers/net/phy/xpowers/ac300.c                    | 387 +++++++++++++++
 drivers/net/phy/xpowers/acx00.c                    | 536 +++++++++++++++++++++
 drivers/net/phy/xpowers/acx00.h                    |  28 ++
 8 files changed, 1428 insertions(+)
---
base-commit: 3da8c3c8b8fa99505624b65ef590482f48e766b6
change-id: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

