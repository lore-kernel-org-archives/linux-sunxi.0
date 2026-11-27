Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778757;
	b=2epB9/DQgoW8jd4abHRy9hxOK59RQ1omwLWYTLoWezQoUkwjfeAyzd1Q5XXl3To2Gom7
	 mXmiAtKyUmsZlTpmZkvIaX/p1aRFGGh4AeuPOitsrP46eFMYIUc5+uBI0brCz0cK8thtg
	 NblNUFIgsxsqSJB+JiUOFX6EQAbwDJJyxOrVwgXxS14821g4bCip/X9+LMpfRFg02zsx9
	 xjT3zLOJwKYdf3GkLYc6+IWEmx3FnTsW9JzXsmJPeTVCPfP2GEFHybzcL7/NdOvIuAwUS
	 1UY12stVMcQyZZQmj6UlRwVQqXLMxMHnq0foEsTnA+VQ3oOtWMTiWQRtqH7C300eO7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778757;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam;
	bh=hTyE3LnzTLDqbgOLfvdoME+kHOL31VN3477l6ugVUog=;
	b=cH2rKYW2lzUxJr6R8Ys98dtnUS80gM7l/ObPNGfibqEzEPog8VzJ+9YOeEW2nTdaZSYN
	 sXder4zsT4koJhsoRIQOcRqp0HUJIP6uXV3sD0VRoyhVRMJkQ0VHgEq8HCpxpCiBWSkgy
	 bWe0MRMznvcXQmdYbMHbf0Iy5XqZSlbN2BKZDQTfW6vV8DtQJGmg+EpJVg8pO0kxZN8/m
	 6NGiXlEGnjFkIbf9iSEaqLPJB+DazbhJhH5Zj+ISabzfSKWqv2/ebdFvRkft8HhcKWeTD
	 hoI8TFbx187xS0bE7VsG7fGDC4hPuGbe3eRTZnSgdrIUnKK1mW+TBFwm/ZTsHN71NSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=b30NtXRt;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C0E606A6A9;
	Fri, 27 Nov 2026 11:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C0E606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=b30NtXRt
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id BB8CF4C991;
	Fri, 27 Nov 2026 22:25:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795778751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hTyE3LnzTLDqbgOLfvdoME+kHOL31VN3477l6ugVUog=;
	b=b30NtXRtT4rkRO7ff21OAV+erGfWlvWSxI3APw99JustcuWRWxV6TjlOBo8sVVa6GEM6C8
	uhLWxbd/6b8oMPYLhzIan7HqdkNsCuHTPGC0hKsSoSpVfugGxzEuQZadFVjlIkrfsNb9NX
	eKj1rECaCqtCdItm+WnK24q+/rrb0bLFQWoKyVSZR6Tz5FOO4qHzrOQQdl3l0egBGfKO0T
	FxXCZBEUC35cQiftsY9paJhChGpp6Y81b614o8zNvhdEFTSJh6BMMBq93mAG94MEsAgpvW
	z9jFEWscnD5PrKq3VGnG7AAkod1Bz5DjcdPg75r+66h6o5Yn1eCHGtk51K4a3Q==
From: Alastair D'Silva <alastair@d-silva.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH v9 0/5] regulator: Add X-Powers AXP318W PMIC support
Date: Fri, 27 Nov 2026 22:25:51 +1100
Message-ID: <20261127112551.2584297-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
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
X-Spam: Yes

On Fri, 27 Nov 2026 11:37:34 +0100, Jerome Brunet <jbrunet@baylibre.com> wrote:
> This patch series adds support for the X-Powers AXP318W PMIC, which is
> used recently on new boards with Allwinner SoCs (the A733).
>
> The PMIC features 9 DCDC buck converters and 28 LDOs, plus the usual ADC,
> interrupts, and power key components.
> A datasheet can be found linked in this Wiki table:
> https://linux-sunxi.org/AXP_PMICs
>
> There was an unclosed topic regarding the handling of LDOs output
> voltage being limited to input voltage being provided by the supply.
> Chen-Yu noted the min_dropout_uV would be a good fit for that but
> the actual minimal dropout value was unknown. I've arbitrarily picked
> 1uV because it is the minimum the framework supports. Realistically a low
> dropout regulator is bound to have some dropout. This choice does the
> trick for now and is certain be less restrictive than what it is in
> reality.
>
> If anyone has problems because the dropout is actually higher
> * it is arguably an HW design error
> * it is a good time to let us know what the actual dropout is
>
> Changes in v9:
> - Resend rebased on v7.4-rc2
> - Link to v8: https://patch.msgid.link/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
>
> Changes in v8:
> - Fix interrupt optional in the binding (mis-understanding on my end)
>   Resent quickly to avoid wasting time on v7 over this
> - Link to v7: https://patch.msgid.link/20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com
>
> Changes in v7:
> - Rebased on v7.3-rc1.
> - Applied Chen-Yu change requests.
>   - More complete register definition all in the MFD change.
>   - Add writeable region holes.
>   - Fix invertion between short and long press IRQ.
>   - Drop confusing comment about DVM.
>   - Use MFD_CELL_NAME() for the regulator device.
> - Link to v6: https://patch.msgid.link/20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com
>
> Changes in v6:
> - Apply wording suggestions from Chen-Yu
> - Link to v5: https://patch.msgid.link/20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com
>
> Changes in v5:
> - Fix shutdown register offset
> - Re-order patches to put fixes first
> - Tighten DT regexp around swout
> - Other points raised by Sashiko on v4 are unrelated to the addition
>   of the AXP318 support and pre-exist the series. They are not
>   addressed ATM.
> - Link to v4: https://patch.msgid.link/20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com
>
> Changes in v4:
> - Capitalize patch 3 title
> - regulator: add support for workmode and poly-phase.
> - i2c: fix probe through i2c sysfs
> - Link to v3: https://patch.msgid.link/20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com
>
> Changes in v3:
> - Correct mess up v2 errors regarding ops and ids.
> - Correctly propagate errors when checking axp318 threshold.
> - Fix DT binding regex regarding dcdc max ids
> - Add missing RTCLDO.
> - Remove axp318 PEK MFD cell:
>   As pointed out by sashiko, the driver name did not match anything in the
>   pek driver. While the device does support some handling of the power
>   button, it does not seem to match the existing driver. Register 0x36
>   relates to DLDO3, not the power key, as expected by the misc driver.
>   Leave this out for now.
> - Constify axp313 and axp717 mfd_cells array for consistency.
> - Link to v2: https://patch.msgid.link/20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com
>
> Changes in v2:
> - Dropped _NUM_VOLTAGES macros
> - Use min_dropout_uV to limit LDO voltage to supplies
> - Add bypass mode for EDLO4/5
> - Prevent crossing 1.54V threshold for DCDC6/7/8/9
> - Link to v1: https://lore.kernel.org/r/20251021112013.2710903-1-andre.przywara@arm.com
>
> ---
> Andre Przywara (3):
>       dt-bindings: mfd: x-powers,axp152: Document AXP318W
>       mfd: axp20x: Add support for AXP318W PMIC
>       regulator: axp20x: add support for the AXP318W
>
> Jerome Brunet (2):
>       mfd: axp20x: Constify axp313 and axp717 cells
>       mfd: axp20x-i2c: Fix i2c instantiation
>
>  .../devicetree/bindings/mfd/x-powers,axp152.yaml   |  29 +-
>  drivers/mfd/axp20x-i2c.c                           |  26 +-
>  drivers/mfd/axp20x-rsb.c                           |   1 +
>  drivers/mfd/axp20x.c                               |  93 +++++-
>  drivers/regulator/axp20x-regulator.c               | 319 ++++++++++++++++++++-
>  include/linux/mfd/axp20x.h                         | 148 +++++++++-
>  6 files changed, 590 insertions(+), 26 deletions(-)
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> change-id: 20260710-axp318-regulator-43545ce3261f
>
> Best regards,
> --  
> Jerome
>

Tested on Xunlong OrangePi 4 Pro (Allwinner A733):
- AXP318W PMIC probes on R-I2C0 (0-0036) via axp20x-i2c.
- DLDO1 supplies MMC0 vmmc-supply and boots to shell.

Tested-by: Alastair D'Silva <alastair@d-silva.org> # OrangePi 4 Pro
