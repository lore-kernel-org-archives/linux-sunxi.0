Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792972720;
	b=Kj02BT9DhsnEl8Fpvb1NuL0Nri0u9mmC6SYS7XazunidNheK+M4Urj8cM3pcSP1voi62
	 TwagwnzX2VLMrfZXxNfo+YavDI1BuDPdcBLuIBdBCawBl2KfJp9tEfsIh8lV6hlff2rcy
	 DBxnDPgEvECKlThRDer6yZbg/s5Gw3i1qMFDzABZl1V6BqYqdnKXwXZFO/FPi0UWVbRjC
	 RZ8fBJwEf+Y7UDHq7zejYgB1AYMYQeql1qZ+NnilER31ODIBRTwH8s8HVRjbtEsIYDsGM
	 M8KU8Trl/9Eaev6teRnIKczP5UDj+fJgP3Ys1FxkKjLQC1GdxkGJwVhod4w17GfPTlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792972720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ikb9/V5iAlmy8zH9iEswyqh7X1ACy082GM3v+SCnybM=;
	b=QEX4RDnEY3AKK/NpaZ35oqMzU5XLigfUNOtWYg0Y580nID3dOpQJnRnvmXhsd6iGkw0L
	 /7iI30qAGaC72ZTDCELUZ71WDpvem/f6bdehiD25L3jXZv5ExJl7W2iVFxnBbjmPx8HE6
	 yUNyjjwhJN99l3GtAefwYccwT4O1ytmLtlpJaXMFjxHOJ664EmeK36IXvu6GuXtTxAVYM
	 VETcnGHOBur7/IyLok4IM4U6J/ga0uXRhFn//0bzJXCCizTNYe4bb3J6AdbFXxSK7WPc8
	 iUL4oTFALCAlPKPHNU7HmnSW2AYET9mOZjO5wAX/+psU7i6nTopcAWp7lh/xpJ8/H4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VAJGgr9V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62BC606A31E
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 23:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62BC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VAJGgr9V
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ec3561ad43so105147e0c.0
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 16:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792972719; cv=none;
        d=google.com; s=arc-20260327;
        b=VBOQFtUMZqSNrYysKU2rz2LkB5FDzDFLTlO9Gw69poXHwJIo2sFXnjZj+xy3J1MxO/
         CYgiXYn91JZ7W8eLSZz4tKXeI/xalDOmDrsk39FslzeYbaYsE0rGUEQWXrEEpGKWixX4
         FOimC/foDj6ULUKeEjr6bi0Yx3Pbi1lzYocAcMwz76K8PjWlEO+v1RRvIitQymnIP8Z8
         bDETSsh5q6PbyN0AMqSNGWvyId59kLrdtKUd/48lTnEzNmsEjkLG3JNh7u4Bvwkq5mN9
         uyVySM6HNHvsCQ79c3IJuEthazOg42b9EPUU0qDUk0u1O2T3uwCV1pEHvXqUDBh+Tnyf
         d9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ikb9/V5iAlmy8zH9iEswyqh7X1ACy082GM3v+SCnybM=;
        fh=L8i6B/dCB24fLx/a42XKRiEVHp7TlTGm4ewWYvowGCw=;
        b=euqMWd/eSYMl1cMMgRb2kFYjBw8O3kl3gnC+MykIjxMFXxS6il2fFrUp/5a1ui5htB
         wddwVW9ugPtQyopmXcxYUusYAm1gLgALR1M/vgD2Ggp3V/3fgxgBRIsJwX3hAS7LYzrp
         qbudUNagNwd2qFvxeqSzYfpZEF+LhsT6ceD8rHO85E/zScTCp0tEUBIqmhJXvNFXj2/9
         0qRVfljuQRK77t0Fe/p8sPtpV8aXSml4CRKKIOBJXfGttg3i4aPhL0tnUphUAAUxseNs
         9pg2FKh7l2VaSK32/MtoNwVd2Ctndx5pCuMdpXJkJYatJqmnOrO7ANlk20tmhHRCudwk
         QyZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792972719; x=1793577519; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ikb9/V5iAlmy8zH9iEswyqh7X1ACy082GM3v+SCnybM=;
        b=VAJGgr9V36J926LHT4gdVvWJySV4B4MbCLscUOca9SEPEeMuzKW4J6IiJpCa7zwC4x
         49/pcqV40TJX73pUsPCcltig3eTNrG/CdHd4FLK1nByA3dbM012UFpW8Iy84lp6l2rjE
         s4H7QGU5GRmeoemmSGhCwVGyuFk+d+JSxpZih85XkPoeaXcDBZN14IHalcnF51nzpDuV
         YObQE70nW7y0KSsBY9MXP3CbdcfYVyX4jQxf12t3U86ASRu52Mfwo5ZH1W5x/lyO2duw
         AKsGiWiN1hMwExLlh0IjketNQYtdiEreKwZqIWV1qjxvks0gVM8a0BYp536t/eMYMmgt
         Umrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792972719; x=1793577519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikb9/V5iAlmy8zH9iEswyqh7X1ACy082GM3v+SCnybM=;
        b=dYrqzva7Te4EhRB9M8H8Q5OhxYqh63KSVf/sc/qsMCNiViFo10U5b6LCrNBPiNTi8D
         f4rZGt6399z7cgRun38yFXaW0ua30Nk7ww8Mx4CJ3SgHo5ZBXk5uCupqY4RKrCdX0XoM
         5FNQf2fjP10fplr71KHAHHKlrbuP3tenlMZwJ+BxQCB7Pg6XEV+uLi6r1m1oQVkdD9A9
         yX957kJooDUFZlbUSAhaZKfseJXFhJr5rc6zWgOuajf3e/SKM7oIdk4CLzx/dMcKsGsm
         +CrPEhBnhvoBcMCynsZFG6obDgpIFaQIBDp6jimSfGIoYmcZAdHhuecgbs53ILh2B4+T
         V4TQ==
X-Gm-Message-State: AFq9FYJNsU3A1i8q2W6nKH2I6b8feu3IJbO5/RGOwkbgc8s2Q/SpNcmh
	CTs6ja4ipmpnC6xFE9V0zl3ajvpHd9SGeD8xSSjk5SCMeP1/BwTArck4gE+pTt9VSRhj1HJSSc7
	GlK7wSVt6KdrD2QhERnatQn5Dc513Wqc=
X-Gm-Gg: AYBFou2KOqgRu6qyTRWGJU3gfnDhzrexgap/n4/8WigqbVfS7L0bfszQhm5MudDloqH
	QL/r2jrpF8yUjhhKLRMp+GZTIi6/MZfEm2Ke7AJ/Qw4tBOax3IpLH6S6GIkgeinzEOrXukcN4xg
	rfUw+gF/5XcTVH5h07jdswQF4qLpdQDpJndn1qrfVXhTUzF3arw4xHIhOwO6EInJ3a4teo3kNNG
	ncJdX1KXsaTsCzIDqc0wncz4T7Ta6xIas3PXx0kfx0W2QVsve4PqZGVCTRWI4YqDmE+WmehXvm4
	ZYRBmRCnoWnHB9xYcGGbtiCZrzT5jTfVhRlRiQ68peuzyyYaQCIWeRLC3uhn3tW9Jz9KQ69EZCh
	afE3EvXQWAYI+oPVgbVAgK/csX4l9+mBF/MiHKImYuxMvirmg4qZUPZFh1zdZUlCU645a
X-Received: by 2002:a05:6122:4b08:b0:5ea:ea07:b119 with SMTP id
 71dfb90a1353d-5ec232ecafcmr1748107e0c.16.1792972718622; Sun, 25 Oct 2026
 16:58:38 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com>
 <20261022-sunxi-orangepi-3-lts-v2-2-70b899252c6a@gmail.com> <sashiko-outbox-181088@kernel.org>
In-Reply-To: <sashiko-outbox-181088@kernel.org>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Sun, 25 Oct 2026 16:58:27 -0700
X-Gm-Features: AclHuK8RB7C1lose4hGybdb-vlgT7R9BOK8Q4taPUha9OJ1M6_c3vVkZYCkcIoI
Message-ID: <CAH87RzS2HTqRS=JjYiU=dRfvJp4nTiZCih-jy9CFyFB=ZnanYA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the report. Both issues are addressed in my local v3 draft.

The LEDs now default to green power on and red status off. Both also
use drive-strength 10, verified on the board.

PHY reset is now on the MDIO bus, with the explicit YT8531C PHY ID.
Five interface down/up cycles and three MAC unbind/rebind cycles
passed DHCP and ping, retaining the configured 125 MHz clock output.

I also tested 1.8 V eMMC DDR52 at 50 MHz and HS200 at 150 MHz.
Repeated reads and patterned writes passed in both modes, with zero
reported MMC errors and the original data restored and verified.

I'll allow more time for review before posting v3.

Regards,
Cristian Filipescu
------------------------------------

On Wed, Oct 21, 2026 at 11:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] arm64: dts: allwinner: per-PHY reset-gpios and c22 compatible br=
eak YT8531C
> - [Medium] arm64: dts: allwinner: orangepi-3-lts: swapped LED default-sta=
te values
> --
>
> commit e75611867d87d079b20765ad9c1ddf5482d2d71a
> Author: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
>
> This commit adds a device tree for the Allwinner H6-based Orange Pi 3 LTS
> board, describing its regulators, storage, wireless module, LEDs, USB por=
ts,
> HDMI, and Motorcomm YT8531C Gigabit Ethernet PHY.
>
> Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-jernej.s=
krabec@gmail.com/
>
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > new file mode 100644
> > index 0000000000000..e6aa0b2e17ebe
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> [ ... ]
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_RED>;
> > +                     gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 *=
/
> > +                     default-state =3D "on";
> > +             };
> > +
> > +             led-1 {
> > +                     function =3D LED_FUNCTION_POWER;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 *=
/
> > +                     default-state =3D "off";
> > +             };
> > +     };
>
> [Severity: Medium]
> The commit message notes that the green PL7 LED is used as the power
> indicator. When gpio_led_probe() -> create_gpio_led() in
> drivers/leds/leds-gpio.c parses the leds node, led-0 (red PL4,
> LED_FUNCTION_STATUS) is turned on and led-1 (green PL7, LED_FUNCTION_POWE=
R)
> is turned off.
>
> When the LED functions were swapped relative to sun50i-h6-orangepi-3.dts,
> were the default-state values on led-0 and led-1 accidentally left unswap=
ped?
>
> > +
> > +     reg_gmac_3v3: gmac-3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "gmac-3v3";
> > +             vin-supply =3D <&reg_vcc5v>;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             startup-delay-us =3D <150000>;
> > +             enable-active-high;
> > +             gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
> > +     };
> [ ... ]
> > +&mdio {
> > +     ext_rgmii_phy: ethernet-phy@1 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <1>;
> > +
> > +             motorcomm,clk-out-frequency-hz =3D <125000000>;
> > +             rx-internal-delay-ps =3D <1950>;
> > +             tx-internal-delay-ps =3D <1950>;
> > +
> > +             reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
> > +             reset-assert-us =3D <15000>;
> > +             reset-deassert-us =3D <100000>;
> > +     };
> > +};
>
> [Severity: High]
> Will the YT8531C PHY fail to probe or lose its 125 MHz clock output with
> compatible =3D "ethernet-phy-ieee802.3-c22" and reset-gpios placed on the
> ethernet-phy@1 node?
>
> First, during MDIO bus registration:
>
>   sun8i_dwmac_init()
>     regulator_enable(gmac->regulator) /* enables reg_gmac_3v3 (PD6) */
>   stmmac_mdio_register()
>     of_mdiobus_register()
>       __of_mdiobus_parse_phys()
>         fwnode_mdiobus_register_phy()
>
> In drivers/net/mdio/fwnode_mdio.c:fwnode_mdiobus_register_phy():
>
>         is_c45 =3D fwnode_device_is_compatible(child, "ethernet-phy-ieee8=
02.3-c45");
>         if (is_c45 || fwnode_get_phy_id(child, &phy_id))
>                 phy =3D get_phy_device(bus, addr, is_c45);
>         else
>                 phy =3D phy_device_create(bus, addr, phy_id, 0, NULL);
>         if (IS_ERR(phy)) {
>                 rc =3D PTR_ERR(phy);
>                 goto clean_mii_ts;
>         }
>         ...
>         } else if (is_of_node(child)) {
>                 rc =3D fwnode_mdiobus_phy_device_register(bus, phy, child=
, addr);
>
> Because compatible is not "ethernet-phy-id4f51.e91b" (which is also requi=
red
> by Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml),
> fwnode_get_phy_id() fails and get_phy_device() -> get_phy_c22_id() reads
> MII_PHYSID1 and MII_PHYSID2 over MDIO before
> fwnode_mdiobus_phy_device_register() -> phy_device_register() registers a=
nd
> deasserts the per-PHY reset-gpios (PD14):
>
>   phy_device_register()
>     mdiobus_register_device()
>       mdio_device_register_reset()
>     phy_device_reset(phydev, 0)
>
> If PD14 is low when the kernel boots (for example, when U-Boot has not
> initialized Ethernet) or on driver rebind after phy_device_remove() asser=
ts
> reset, the PHY is still held in reset during get_phy_c22_id(), causing MD=
IO
> reads to return 0xffff and PHY registration to fail with -ENODEV.
>
> Second, because reset-gpios is attached to the PHY node rather than the M=
DIO
> bus, bringing the network interface down calls:
>
>   stmmac_release()
>     phylink_disconnect_phy()
>       phy_disconnect()
>         phy_detach()
>           phy_device_reset(phydev, 1)
>
> This asserts hardware reset on PD14, resetting YTPHY_SYNCE_CFG_REG back t=
o
> its 25 MHz default. When the interface is brought back up via stmmac_open=
()
> -> stmmac_init_phy() -> phylink_fwnode_phy_connect() -> phy_attach_direct=
()
> -> phy_init_hw(), PD14 is deasserted and yt8531_config_init() runs, but
> motorcomm,clk-out-frequency-hz is only applied once in yt8531_probe() in
> drivers/net/phy/motorcomm.c:
>
>         if (device_property_read_u32(dev, "motorcomm,clk-out-frequency-hz=
", &freq))
>                 freq =3D YTPHY_DTS_OUTPUT_CLK_DIS;
>         ...
>         return ytphy_modify_ext_with_lock(phydev, YTPHY_SYNCE_CFG_REG, ma=
sk,
>                                           val);
>
> Should ethernet-phy@1 use compatible =3D "ethernet-phy-id4f51.e91b" (or m=
ove
> the reset handling so the PHY is out of reset before ID reads and not har=
d
> reset across interface down/up cycles)?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-sunxi-or=
angepi-3-lts-v2-0-70b899252c6a@gmail.com?part=3D2
